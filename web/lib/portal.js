const STRAPI_URL = (process.env.STRAPI_URL || 'http://localhost:1337').replace(/\/$/, '');

const TYPE_MAP = {
  news: 'news',
  materials: 'materials',
  schedules: 'schedules',
};

const CYRILLIC_TO_LATIN = {
  а: 'a', б: 'b', в: 'v', г: 'g', д: 'd', е: 'e', ё: 'e', ж: 'zh', з: 'z', и: 'i', й: 'i',
  к: 'k', л: 'l', м: 'm', н: 'n', о: 'o', п: 'p', р: 'r', с: 's', т: 't', у: 'u', ф: 'f',
  х: 'h', ц: 'cz', ч: 'ch', ш: 'sh', щ: 'shh', ъ: '', ы: 'y', ь: '', э: 'e', ю: 'yu', я: 'ya',
  і: 'i', ї: 'i', є: 'e', ґ: 'g', ў: 'u'
};

const normalizeType = (value) => TYPE_MAP[value] || null;

const transliterate = (value) =>
  String(value || '')
    .split('')
    .map((char) => {
      const lower = char.toLowerCase();
      if (!Object.prototype.hasOwnProperty.call(CYRILLIC_TO_LATIN, lower)) {
        return char;
      }

      const mapped = CYRILLIC_TO_LATIN[lower];
      return char === lower ? mapped : mapped.toUpperCase();
    })
    .join('');

const readErrorText = async (response) => {
  try {
    const payload = await response.json();
    return payload?.error?.message || payload?.message || JSON.stringify(payload);
  } catch {
    return response.statusText || 'Request failed';
  }
};

const strapiPortalFetch = async (path, strapiJwt, options = {}) => {
  const headers = {
    Authorization: `Bearer ${strapiJwt}`,
    ...(options.headers || {}),
  };

  const response = await fetch(`${STRAPI_URL}${path}`, {
    method: options.method || 'GET',
    headers,
    body: options.body,
    cache: 'no-store',
  });

  if (!response.ok) {
    const message = await readErrorText(response);
    throw new Error(`${response.status} ${message}`);
  }

  return response.json();
};

export const slugify = (value) =>
  transliterate(value)
    .normalize('NFKD')
    .replace(/[\u0300-\u036f]/g, '')
    .trim()
    .toLowerCase()
    .replace(/[^a-z0-9\s-]/g, '')
    .replace(/\s+/g, '-')
    .replace(/-+/g, '-')
    .replace(/^-+|-+$/g, '');

export const withOptionalSlug = (title) => {
  const slug = slugify(title);
  return slug ? { slug } : {};
};

export const listMyEntries = async (strapiJwt, limit = 100) => {
  const payload = await strapiPortalFetch(`/api/portal/my?limit=${limit}`, strapiJwt);
  return payload?.data?.items || [];
};

export const getMyEntry = async (strapiJwt, type, id) => {
  const normalizedType = normalizeType(type);
  if (!normalizedType) {
    throw new Error('Unsupported entry type');
  }

  const payload = await strapiPortalFetch(`/api/portal/${normalizedType}/${id}`, strapiJwt);
  return payload?.data || null;
};

export const createEntry = async (strapiJwt, type, data) => {
  const normalizedType = normalizeType(type);
  if (!normalizedType) {
    throw new Error('Unsupported entry type');
  }

  const payload = await strapiPortalFetch(`/api/portal/${normalizedType}`, strapiJwt, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ data }),
  });

  return payload?.data || null;
};

export const updateEntry = async (strapiJwt, type, id, data) => {
  const normalizedType = normalizeType(type);
  if (!normalizedType) {
    throw new Error('Unsupported entry type');
  }

  const payload = await strapiPortalFetch(`/api/portal/${normalizedType}/${id}`, strapiJwt, {
    method: 'PUT',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ data }),
  });

  return payload?.data || null;
};

export const submitEntry = async (strapiJwt, type, id) => {
  const normalizedType = normalizeType(type);
  if (!normalizedType) {
    throw new Error('Unsupported entry type');
  }

  const payload = await strapiPortalFetch(`/api/portal/${normalizedType}/${id}/submit`, strapiJwt, {
    method: 'POST',
  });

  return payload?.data || null;
};

export const uploadPortalFile = async (strapiJwt, file) => {
  if (!file || typeof file.arrayBuffer !== 'function' || !file.size) {
    throw new Error('File is required');
  }

  const formData = new FormData();
  formData.append('files', file, file.name || 'upload.bin');

  const payload = await strapiPortalFetch('/api/upload', strapiJwt, {
    method: 'POST',
    body: formData,
  });

  const first = Array.isArray(payload) ? payload[0] : null;
  if (!first?.id) {
    throw new Error('Upload failed');
  }

  return first.id;
};
