const BASE_URL = (process.env.STRAPI_URL || 'http://localhost:1337').replace(/\/$/, '');
const PUBLIC_MEDIA_ORIGIN = (process.env.MEDIA_PUBLIC_ORIGIN || 'http://127.0.0.1:9000').replace(
  /\/$/,
  ''
);
const INTERNAL_MEDIA_ORIGINS = String(
  process.env.MEDIA_INTERNAL_ORIGINS || 'http://minio:9000,http://law_minio:9000'
)
  .split(',')
  .map((value) => value.trim().replace(/\/$/, ''))
  .filter(Boolean);

const toSearchParams = (params = {}) => {
  const query = new URLSearchParams();
  Object.entries(params).forEach(([key, value]) => {
    if (value === undefined || value === null || value === '') {
      return;
    }
    query.set(key, String(value));
  });
  return query.toString();
};

export const getStrapiMediaUrl = (url) => {
  if (!url) {
    return null;
  }
  if (url.startsWith('http')) {
    return INTERNAL_MEDIA_ORIGINS.includes(url.split('/').slice(0, 3).join('/'))
      ? url.replace(url.split('/').slice(0, 3).join('/'), PUBLIC_MEDIA_ORIGIN)
      : url;
  }
  return `${BASE_URL}${url}`;
};

export const normalizeRichTextMediaHtml = (html) => {
  const value = String(html || '');
  if (!value) {
    return value;
  }

  return INTERNAL_MEDIA_ORIGINS.reduce((acc, origin) => {
    return acc.split(origin).join(PUBLIC_MEDIA_ORIGIN);
  }, value);
};

export const strapiFetch = async (path, params = {}, options = {}) => {
  const normalizedOptions =
    typeof options === 'number' ? { revalidateSeconds: options } : options || {};
  const { revalidateSeconds = 30, cacheMode } = normalizedOptions;
  const query = toSearchParams(params);
  const url = `${BASE_URL}${path}${query ? `?${query}` : ''}`;
  const fetchOptions = {};

  if (cacheMode) {
    fetchOptions.cache = cacheMode;
  }

  if (cacheMode !== 'no-store') {
    fetchOptions.next = { revalidate: revalidateSeconds };
  }

  const response = await fetch(url, fetchOptions);

  if (!response.ok) {
    throw new Error(`Content API request failed: ${response.status} ${path}`);
  }

  return response.json();
};
