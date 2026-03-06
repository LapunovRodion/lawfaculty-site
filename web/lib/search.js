const MEILI_URL = (process.env.MEILI_URL || 'http://localhost:7700').replace(/\/$/, '');
const MEILI_SEARCH_KEY = process.env.MEILI_SEARCH_KEY || process.env.MEILI_MASTER_KEY || '';

const SEARCH_INDEXES = ['news', 'pages', 'materials', 'persons', 'departments'];

const normalizeHits = (index, hits = []) =>
  hits.map((hit) => ({
    id: `${index}:${hit.id}`,
    type: index,
    title: hit.title || hit.fullName || hit.slug || hit.documentId || hit.id,
    excerpt: hit.excerpt || hit.description || hit.position || hit.departmentTitle || '',
    urlPath: hit.urlPath || null,
    locale: hit.locale || 'ru',
  }));

const searchIndex = async (index, q, locale, headers) => {
  const response = await fetch(`${MEILI_URL}/indexes/${index}/search`, {
    method: 'POST',
    headers,
    cache: 'no-store',
    body: JSON.stringify({
      q,
      limit: 5,
      filter: [`locale = \"${locale}\"`],
    }),
  });

  if (!response.ok) {
    return [];
  }

  const payload = await response.json();
  return normalizeHits(index, payload.hits || []);
};

export const searchSite = async (query, locale) => {
  const q = String(query || '').trim();
  if (!q) {
    return [];
  }

  const headers = { 'Content-Type': 'application/json' };
  if (MEILI_SEARCH_KEY) {
    headers.Authorization = `Bearer ${MEILI_SEARCH_KEY}`;
  }

  const results = await Promise.allSettled(
    SEARCH_INDEXES.map((index) => searchIndex(index, q, locale, headers))
  );

  return results.flatMap((result) => (result.status === 'fulfilled' ? result.value : []));
};
