'use strict';

const { errors } = require('@strapi/utils');

const TYPE_CONFIG = {
  news: {
    uid: 'api::news-item.news-item',
    editableFields: ['title', 'slug', 'excerpt', 'content', 'cover', 'locale'],
    mediaFields: ['cover'],
    summaryField: 'title',
  },
  materials: {
    uid: 'api::material.material',
    editableFields: ['title', 'slug', 'description', 'file', 'locale'],
    mediaFields: ['file'],
    summaryField: 'title',
  },
  schedules: {
    uid: 'api::schedule.schedule',
    editableFields: ['title', 'file', 'labels', 'locale'],
    mediaFields: ['file'],
    summaryField: 'title',
  },
};

const TYPE_ALIASES = {
  material: 'materials',
  schedule: 'schedules',
};

const EDITABLE_STATUSES = new Set(['draft', 'needs_changes']);
const SUBMITTABLE_STATUSES = new Set(['draft', 'needs_changes']);

const toPositiveInt = (value, fieldName) => {
  const parsed = Number.parseInt(value, 10);

  if (!Number.isInteger(parsed) || parsed <= 0) {
    throw new errors.ValidationError(`${fieldName} must be a positive integer`);
  }

  return parsed;
};

const normalizeType = (type) => {
  if (!type) {
    return type;
  }

  return TYPE_ALIASES[type] || type;
};

const getTypeConfig = (type) => {
  const normalized = normalizeType(type);
  const config = TYPE_CONFIG[normalized];

  if (!config) {
    throw new errors.ValidationError(`Unsupported content type: ${type}`);
  }

  return { normalized, config };
};

const getPayloadData = (body) => {
  if (!body || typeof body !== 'object') {
    return {};
  }

  if (body.data && typeof body.data === 'object') {
    return body.data;
  }

  return body;
};

const pickEditablePayload = (payload, editableFields) => {
  const picked = {};

  for (const key of editableFields) {
    if (Object.prototype.hasOwnProperty.call(payload, key)) {
      picked[key] = payload[key];
    }
  }

  return picked;
};

const normalizeDraftData = (data) => {
  if (!data || typeof data !== 'object') {
    return data;
  }

  if (typeof data.slug === 'string' && !data.slug.trim()) {
    delete data.slug;
  }

  return data;
};

const ownerIdFromEntry = (entry) => {
  if (!entry || !entry.authorUser) {
    return null;
  }

  if (typeof entry.authorUser === 'object') {
    return entry.authorUser.id || null;
  }

  return entry.authorUser;
};

const ensureOwnedEntry = async ({
  strapi,
  config,
  id,
  userId,
  fields = ['id', 'submissionStatus'],
  populate = {},
}) => {
  const existing = await strapi.entityService.findOne(config.uid, id, {
    fields,
    populate: {
      authorUser: {
        fields: ['id'],
      },
      ...populate,
    },
    publicationState: 'preview',
  });

  if (!existing) {
    throw new errors.NotFoundError('Entry not found');
  }

  if (Number(ownerIdFromEntry(existing)) !== userId) {
    throw new errors.ForbiddenError('You can access only your own entries');
  }

  return existing;
};

module.exports = ({ strapi }) => ({
  async createDraft({ type, body, userId }) {
    const parsedUserId = toPositiveInt(userId, 'userId');
    const { config } = getTypeConfig(type);
    const payload = getPayloadData(body);
    const data = normalizeDraftData(pickEditablePayload(payload, config.editableFields));

    data.authorUser = parsedUserId;
    data.submissionStatus = 'draft';

    return strapi.entityService.create(config.uid, {
      data,
    });
  },

  async updateDraft({ type, id, body, userId }) {
    const parsedId = toPositiveInt(id, 'id');
    const parsedUserId = toPositiveInt(userId, 'userId');
    const { config } = getTypeConfig(type);
    const payload = getPayloadData(body);
    const data = normalizeDraftData(pickEditablePayload(payload, config.editableFields));

    const existing = await ensureOwnedEntry({
      strapi,
      config,
      id: parsedId,
      userId: parsedUserId,
      fields: ['id', 'submissionStatus'],
    });

    if (!EDITABLE_STATUSES.has(existing.submissionStatus || 'draft')) {
      throw new errors.ForbiddenError('Entry is locked after submit');
    }

    return strapi.entityService.update(config.uid, parsedId, {
      data,
    });
  },

  async submit({ type, id, userId }) {
    const parsedId = toPositiveInt(id, 'id');
    const parsedUserId = toPositiveInt(userId, 'userId');
    const { config } = getTypeConfig(type);

    const existing = await ensureOwnedEntry({
      strapi,
      config,
      id: parsedId,
      userId: parsedUserId,
      fields: ['id', 'submissionStatus'],
    });

    if (!SUBMITTABLE_STATUSES.has(existing.submissionStatus || 'draft')) {
      throw new errors.ForbiddenError(
        `Cannot submit entry with status "${existing.submissionStatus || 'draft'}"`
      );
    }

    return strapi.entityService.update(config.uid, parsedId, {
      data: {
        submissionStatus: 'submitted',
      },
    });
  },

  async getMyEntry({ type, id, userId }) {
    const parsedId = toPositiveInt(id, 'id');
    const parsedUserId = toPositiveInt(userId, 'userId');
    const { config } = getTypeConfig(type);

    const scalarEditableFields = config.editableFields.filter(
      (field) => !(config.mediaFields || []).includes(field)
    );
    const fields = [
      ...new Set([...scalarEditableFields, 'id', 'submissionStatus', 'moderatorComment', 'locale']),
    ];
    const mediaPopulate = {};
    for (const mediaField of config.mediaFields || []) {
      mediaPopulate[mediaField] = {
        fields: ['id', 'name', 'url', 'mime', 'ext'],
      };
    }

    return ensureOwnedEntry({
      strapi,
      config,
      id: parsedId,
      userId: parsedUserId,
      fields,
      populate: mediaPopulate,
    });
  },

  async listMy({ userId, type, limit }) {
    const parsedUserId = toPositiveInt(userId, 'userId');
    const parsedLimit =
      Number.isInteger(Number.parseInt(limit, 10)) && Number.parseInt(limit, 10) > 0
        ? Math.min(Number.parseInt(limit, 10), 200)
        : 50;

    const requestedType = normalizeType(type);
    const typesToFetch = requestedType
      ? [getTypeConfig(requestedType).normalized]
      : Object.keys(TYPE_CONFIG);
    const items = [];

    for (const currentType of typesToFetch) {
      const currentConfig = TYPE_CONFIG[currentType];
      const entries = await strapi.entityService.findMany(currentConfig.uid, {
        filters: {
          authorUser: {
            id: parsedUserId,
          },
        },
        fields: [
          'id',
          currentConfig.summaryField,
          'submissionStatus',
          'moderatorComment',
          'updatedAt',
          'locale',
          'publishedAt',
        ],
        sort: {
          updatedAt: 'desc',
        },
        publicationState: 'preview',
        limit: parsedLimit,
      });

      for (const entry of entries) {
        items.push({
          type: currentType,
          id: entry.id,
          title: entry[currentConfig.summaryField] || null,
          submissionStatus: entry.submissionStatus,
          moderatorComment: entry.moderatorComment || null,
          locale: entry.locale || null,
          publishedAt: entry.publishedAt || null,
          updatedAt: entry.updatedAt || null,
        });
      }
    }

    items.sort((a, b) => {
      const left = new Date(a.updatedAt || 0).getTime();
      const right = new Date(b.updatedAt || 0).getTime();

      return right - left;
    });

    return {
      items: items.slice(0, parsedLimit),
      total: items.length,
      limit: parsedLimit,
    };
  },
});
