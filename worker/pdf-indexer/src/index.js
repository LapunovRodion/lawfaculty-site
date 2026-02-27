'use strict';

const express = require('express');
const pdfParse = require('pdf-parse');
const { MeiliSearch } = require('meilisearch');

const MODEL_CONFIG = {
  'api::news-item.news-item': { index: 'news', route: 'news' },
  'api::page.page': { index: 'pages', route: 'pages' },
  'api::material.material': { index: 'materials', route: 'materials' },
  'api::person.person': { index: 'persons', route: 'persons' },
  'api::department.department': { index: 'departments', route: 'departments' },
};

const INDEX_SETTINGS = {
  news: {
    searchableAttributes: ['title', 'excerpt', 'contentText'],
    filterableAttributes: ['locale', 'model', 'publishedAt'],
    sortableAttributes: ['updatedAt', 'publishedAt'],
  },
  pages: {
    searchableAttributes: ['title', 'contentText'],
    filterableAttributes: ['locale', 'model', 'publishedAt'],
    sortableAttributes: ['updatedAt', 'publishedAt'],
  },
  materials: {
    searchableAttributes: ['title', 'description', 'pdfText'],
    filterableAttributes: ['locale', 'model', 'publishedAt'],
    sortableAttributes: ['updatedAt', 'publishedAt'],
  },
  persons: {
    searchableAttributes: ['fullName', 'position', 'bioText', 'departmentTitle'],
    filterableAttributes: ['locale', 'model', 'publishedAt'],
    sortableAttributes: ['updatedAt', 'publishedAt'],
  },
  departments: {
    searchableAttributes: ['title', 'descriptionText', 'contacts'],
    filterableAttributes: ['locale', 'model', 'publishedAt'],
    sortableAttributes: ['updatedAt', 'publishedAt'],
  },
};

const env = (name, fallback = undefined) => {
  const value = process.env[name];
  if (value === undefined || value === null || value === '') {
    return fallback;
  }
  return value;
};

const requiredEnv = (name) => {
  const value = env(name);
  if (!value) {
    throw new Error(`Missing required env var: ${name}`);
  }
  return value;
};

const PORT = Number.parseInt(env('PORT', '8080'), 10);
const WEBHOOK_SECRET = env('PDF_INDEXER_WEBHOOK_SECRET', '');
const STRAPI_URL = requiredEnv('STRAPI_URL').replace(/\/+$/, '');
const STRAPI_API_TOKEN = env('STRAPI_API_TOKEN', '');
const STRAPI_PUBLIC_URL = env('STRAPI_PUBLIC_URL', STRAPI_URL).replace(/\/+$/, '');
const STRAPI_PAGE_SIZE = Number.parseInt(env('STRAPI_PAGE_SIZE', '100'), 10);
const PDF_TEXT_MAX_LENGTH = Number.parseInt(env('PDF_TEXT_MAX_LENGTH', '300000'), 10);
const MEILI_HOST = requiredEnv('MEILI_HOST');
const MEILI_MASTER_KEY = requiredEnv('MEILI_MASTER_KEY');

const meili = new MeiliSearch({
  host: MEILI_HOST,
  apiKey: MEILI_MASTER_KEY,
});

const app = express();
app.use(express.json({ limit: '2mb' }));

const toPlainText = (value) => {
  if (!value) {
    return '';
  }
  return String(value)
    .replace(/<[^>]*>/g, ' ')
    .replace(/\s+/g, ' ')
    .trim();
};

const getLocale = (entry) => entry.locale || 'ru';

const getDocumentKey = (entry) => {
  const stableId = entry.documentId || entry.id;
  return `${stableId}:${getLocale(entry)}`;
};

const getAuthHeaders = () => {
  if (!STRAPI_API_TOKEN) {
    return {};
  }
  return { Authorization: `Bearer ${STRAPI_API_TOKEN}` };
};

const createQueryString = (params) => {
  const query = new URLSearchParams();
  Object.entries(params).forEach(([key, value]) => {
    query.set(key, String(value));
  });
  return query.toString();
};

const fetchJson = async (url, options = {}) => {
  const response = await fetch(url, options);

  if (!response.ok) {
    const text = await response.text();
    throw new Error(`HTTP ${response.status} ${response.statusText}: ${text.slice(0, 300)}`);
  }

  return response.json();
};

const fetchStrapiCollectionPage = async (config, page) => {
  const queryString = createQueryString({
    'pagination[page]': page,
    'pagination[pageSize]': STRAPI_PAGE_SIZE,
    populate: '*',
    status: 'published',
  });
  const url = `${STRAPI_URL}/api/${config.route}?${queryString}`;
  const payload = await fetchJson(url, {
    headers: getAuthHeaders(),
  });

  return {
    data: payload.data || [],
    meta: payload.meta || {},
  };
};

const fetchEntryById = async (config, id) => {
  const queryString = createQueryString({
    'filters[id][$eq]': id,
    populate: '*',
    status: 'published',
  });
  const url = `${STRAPI_URL}/api/${config.route}?${queryString}`;
  const payload = await fetchJson(url, {
    headers: getAuthHeaders(),
  });

  const data = Array.isArray(payload.data) ? payload.data : [];
  if (!data.length) {
    return null;
  }

  return data[0];
};

const resolveFileUrl = (entry) => {
  const source = entry.file;
  const file = Array.isArray(source) ? source[0] : source;
  if (!file || !file.url) {
    return null;
  }

  if (String(file.url).startsWith('http')) {
    return file.url;
  }

  return `${STRAPI_PUBLIC_URL}${file.url}`;
};

const fetchPdfText = async (entry) => {
  const fileUrl = resolveFileUrl(entry);
  if (!fileUrl || !fileUrl.toLowerCase().endsWith('.pdf')) {
    return '';
  }

  try {
    const response = await fetch(fileUrl, {
      headers: getAuthHeaders(),
    });

    if (!response.ok) {
      console.warn(`[pdf-indexer] Cannot fetch PDF: ${response.status} ${fileUrl}`);
      return '';
    }

    const arrayBuffer = await response.arrayBuffer();
    const parsed = await pdfParse(Buffer.from(arrayBuffer));
    const text = (parsed.text || '').replace(/\s+/g, ' ').trim();

    if (text.length <= PDF_TEXT_MAX_LENGTH) {
      return text;
    }

    return text.slice(0, PDF_TEXT_MAX_LENGTH);
  } catch (error) {
    console.warn(`[pdf-indexer] PDF parse failed for ${fileUrl}: ${error.message}`);
    return '';
  }
};

const buildUrlPath = (indexName, entry) => {
  const locale = getLocale(entry);
  const slug = entry.slug || entry.id;
  const documentId = entry.documentId || entry.id;

  if (indexName === 'news') {
    return `/${locale}/news/${slug}`;
  }
  if (indexName === 'pages') {
    return `/${locale}/${slug}`;
  }
  if (indexName === 'materials') {
    return `/${locale}/materials/${slug}`;
  }
  if (indexName === 'persons') {
    return `/${locale}/persons/${documentId}`;
  }
  if (indexName === 'departments') {
    return `/${locale}/departments/${slug}`;
  }

  return `/${locale}`;
};

const buildDocument = async (model, entry) => {
  const config = MODEL_CONFIG[model];
  if (!config) {
    return null;
  }

  const common = {
    id: getDocumentKey(entry),
    model,
    sourceId: entry.id,
    documentId: entry.documentId || null,
    locale: getLocale(entry),
    publishedAt: entry.publishedAt || null,
    updatedAt: entry.updatedAt || null,
    urlPath: buildUrlPath(config.index, entry),
  };

  if (config.index === 'news') {
    return {
      ...common,
      title: entry.title || '',
      slug: entry.slug || '',
      excerpt: entry.excerpt || '',
      contentText: toPlainText(entry.content),
    };
  }

  if (config.index === 'pages') {
    return {
      ...common,
      title: entry.title || '',
      slug: entry.slug || '',
      contentText: toPlainText(entry.content),
    };
  }

  if (config.index === 'materials') {
    return {
      ...common,
      title: entry.title || '',
      slug: entry.slug || '',
      description: entry.description || '',
      fileUrl: resolveFileUrl(entry),
      pdfText: await fetchPdfText(entry),
    };
  }

  if (config.index === 'persons') {
    const department = entry.department || {};
    return {
      ...common,
      fullName: entry.fullName || '',
      position: entry.position || '',
      bioText: toPlainText(entry.bio),
      departmentTitle: department.title || '',
      departmentSlug: department.slug || '',
    };
  }

  if (config.index === 'departments') {
    return {
      ...common,
      title: entry.title || '',
      slug: entry.slug || '',
      contacts: entry.contacts || '',
      descriptionText: toPlainText(entry.description),
    };
  }

  return null;
};

const ensureIndexSettings = async (indexName) => {
  try {
    await meili.createIndex(indexName, { primaryKey: 'id' });
  } catch (error) {
    if (!String(error.message || '').includes('already exists')) {
      throw error;
    }
  }

  const index = meili.index(indexName);
  const settings = INDEX_SETTINGS[indexName];
  await index.updateSearchableAttributes(settings.searchableAttributes);
  await index.updateFilterableAttributes(settings.filterableAttributes);
  await index.updateSortableAttributes(settings.sortableAttributes);
};

const ensureAllIndexes = async () => {
  const names = Object.values(MODEL_CONFIG).map((item) => item.index);
  const uniqueNames = [...new Set(names)];

  for (const name of uniqueNames) {
    await ensureIndexSettings(name);
  }
};

const upsertEntry = async (model, payloadEntry) => {
  const config = MODEL_CONFIG[model];
  if (!config) {
    return;
  }

  const entry = await fetchEntryById(config, payloadEntry.id);
  const index = meili.index(config.index);

  if (!entry) {
    await index.deleteDocuments([getDocumentKey(payloadEntry)]);
    return;
  }

  const document = await buildDocument(model, entry);
  if (!document) {
    return;
  }

  await index.addDocuments([document]);
};

const deleteEntryByPayload = async (model, entry) => {
  const config = MODEL_CONFIG[model];
  if (!config || !entry) {
    return;
  }

  const index = meili.index(config.index);
  await index.deleteDocuments([getDocumentKey(entry)]);
};

const reindexModel = async (model) => {
  const config = MODEL_CONFIG[model];
  if (!config) {
    throw new Error(`Unsupported model: ${model}`);
  }

  const index = meili.index(config.index);
  await index.deleteAllDocuments();

  let page = 1;
  let pageCount = 1;
  do {
    const { data, meta } = await fetchStrapiCollectionPage(config, page);
    pageCount = meta.pagination ? meta.pagination.pageCount || 1 : 1;

    const docs = [];
    for (const entry of data) {
      const doc = await buildDocument(model, entry);
      if (doc) {
        docs.push(doc);
      }
    }

    if (docs.length) {
      await index.addDocuments(docs);
    }
    page += 1;
  } while (page <= pageCount);
};

const reindexAll = async () => {
  for (const model of Object.keys(MODEL_CONFIG)) {
    await reindexModel(model);
  }
};

app.get('/health', (_req, res) => {
  res.status(200).json({ ok: true });
});

app.post('/webhooks/strapi', async (req, res) => {
  try {
    if (WEBHOOK_SECRET) {
      const received = req.headers['x-webhook-secret'];
      if (received !== WEBHOOK_SECRET) {
        return res.status(401).json({ error: 'invalid webhook secret' });
      }
    }

    const payload = req.body || {};
    const event = payload.event;
    const model = payload.model;
    const entry = payload.entry || {};

    if (!MODEL_CONFIG[model]) {
      return res.status(202).json({ ignored: true });
    }

    if (!entry.id) {
      return res.status(400).json({ error: 'missing payload.entry.id' });
    }

    if (String(event).includes('delete') || String(event).includes('unpublish')) {
      await deleteEntryByPayload(model, entry);
    } else {
      await upsertEntry(model, entry);
    }

    return res.status(200).json({ ok: true });
  } catch (error) {
    console.error(`[pdf-indexer] webhook error: ${error.message}`);
    return res.status(500).json({ error: 'webhook failed' });
  }
});

app.post('/reindex', async (req, res) => {
  try {
    const types = String(req.query.types || '').trim();
    if (!types) {
      await reindexAll();
      return res.status(200).json({ ok: true, mode: 'all' });
    }

    const selected = types.split(',').map((item) => item.trim()).filter(Boolean);
    for (const model of selected) {
      await reindexModel(model);
    }
    return res.status(200).json({ ok: true, mode: 'selected', models: selected });
  } catch (error) {
    console.error(`[pdf-indexer] reindex error: ${error.message}`);
    return res.status(500).json({ error: 'reindex failed' });
  }
});

const start = async () => {
  await ensureAllIndexes();

  if (env('FULL_REINDEX_ON_START', 'false') === 'true') {
    await reindexAll();
  }

  app.listen(PORT, () => {
    console.log(`[pdf-indexer] listening on :${PORT}`);
  });
};

start().catch((error) => {
  console.error(`[pdf-indexer] startup failed: ${error.message}`);
  process.exit(1);
});
