const OLD_SITE_URL = (process.env.OLD_SITE_URL || 'https://law.bsu.by').replace(/\/+$/, '');
const STRAPI_URL = (process.env.STRAPI_URL || 'http://localhost:1337').replace(/\/+$/, '');
const STRAPI_API_TOKEN = process.env.STRAPI_API_TOKEN || '';
const COMMIT = process.argv.includes('--commit');

if (process.env.OLD_SITE_INSECURE_TLS === '1') {
  process.env.NODE_TLS_REJECT_UNAUTHORIZED = '0';
}

const NEWS_URLS = [
  '/novosti/novosti-o-konferentsiyakh/17883-19-2026.html',
  '/novosti/novosti-kafedry-ekologicheskogo-i-agrarnogo-prava/17882-15-2028.html',
  '/novosti/novosti-kafedry-ekologicheskogo-i-agrarnogo-prava/17881-18-21-2026.html',
  '/novosti/novosti-kafedry-gosudarstvennogo-upravleniya/17879-16-05-2026.html',
  '/novosti/novosti-kafedry-konstitutsionnogo-prava/17878-18-maya-2026-g-zashchita-kursovykh-rabot-pod-rukovodstvom-dotsenta-sharshuna-v-a.html',
  '/novosti/novosti-kafedry-konstitutsionnogo-prava/17877-13-maya-2026-g-zashchita-kursovykh-rabot-pod-rukovodstvom-dotsenta-kondratovich-n-m.html',
  '/novosti/novosti-kafedry-konstitutsionnogo-prava/17876-12-maya-2026-g-zashchita-kursovykh-rabot-pod-rukovodstvom-dotsenta-maslovskoj-t-s.html',
  '/novosti/novosti-nauchnykh-kruzhkov/17875-30-aprelya-2026-g-sostoyalos-sovmestnoe-zasedanie-studencheskikh-nauchnykh-kruzhkov-sovremennaya-tsivilistika-i-semejnoe-pravo-na-temu-chastnopravovye-dogovory-v-sfere-vspomogatelnykh-reproduktivnykh-tekhnologij.html',
  '/novosti/novosti-o-konferentsiyakh/17873-otchet-o-zasedanii-nauchnogo-kruzhka-po-problemam-gosudarstvennogo-upravleniya.html',
  '/novosti/novosti-o-konferentsiyakh/17872-torzhestvennoe-meropriyatie-posvyashchennoe-dnyu-gosudarstvennogo-flaga-gosudarstvennogo-gerba-i-gosudarstvennogo-gimna-respubliki-belarus.html',
];

const authHeaders = () => {
  if (!STRAPI_API_TOKEN) {
    return {};
  }
  return { Authorization: `Bearer ${STRAPI_API_TOKEN}` };
};

const absoluteOldUrl = (url) => {
  if (!url) {
    return null;
  }
  if (url.startsWith('http')) {
    return url;
  }
  return `${OLD_SITE_URL}${url.startsWith('/') ? '' : '/'}${url}`;
};

const decodeHtml = (value) =>
  String(value || '')
    .replace(/&nbsp;/g, ' ')
    .replace(/&amp;/g, '&')
    .replace(/&quot;/g, '"')
    .replace(/&#039;/g, "'")
    .replace(/&laquo;/g, '"')
    .replace(/&raquo;/g, '"')
    .replace(/&ndash;/g, '-')
    .replace(/&mdash;/g, '-');

const stripTags = (value) =>
  decodeHtml(String(value || '').replace(/<[^>]*>/g, ' ')).replace(/\s+/g, ' ').trim();

const slugFromUrl = (sourceUrl) => {
  const last = sourceUrl.split('/').pop().replace(/\.html$/i, '');
  return last.replace(/^\d+-/, '').slice(0, 180);
};

const sourceCategoryFromUrl = (sourceUrl) => {
  const url = new URL(sourceUrl);
  const parts = url.pathname.split('/').filter(Boolean);
  return parts.length > 2 ? `/${parts.slice(0, -1).join('/')}.html` : '/novosti.html';
};

const inferCategory = ({ title, sourceUrl }) => {
  const haystack = `${title} ${sourceUrl}`.toLowerCase();
  if (haystack.includes('zashchita-kursovykh') || haystack.includes('защита курсовых')) {
    return 'education';
  }
  if (haystack.includes('kafedry')) {
    return 'department';
  }
  if (haystack.includes('meropriyatie') || haystack.includes('мероприятие')) {
    return 'event';
  }
  if (haystack.includes('nauchn') || haystack.includes('konferents')) {
    return 'science';
  }
  if (haystack.includes('student')) {
    return 'student_life';
  }
  return 'faculty';
};

const normalizeBodyHtml = (articleHtml, sourceUrl) => {
  let body = articleHtml
    .replace(/<header[\s\S]*?<\/header>/i, '')
    .replace(/<aside[\s\S]*?<\/aside>/i, '')
    .replace(/<div[^>]*class=["'][^"']*tags[^"']*["'][\s\S]*?<\/div>/i, '')
    .replace(/<script[\s\S]*?<\/script>/gi, '')
    .replace(/<style[\s\S]*?<\/style>/gi, '')
    .trim();

  body = body.replace(/\s(src|href)=(['"])(\/[^'"]+)\2/gi, (_match, attr, quote, url) => {
    return ` ${attr}=${quote}${absoluteOldUrl(url)}${quote}`;
  });

  body = body.replace(/\s+/g, ' ').trim();

  if (!body) {
    throw new Error(`Cannot extract article body from ${sourceUrl}`);
  }

  return body;
};

const extractUrls = (html, attr, pattern) => {
  const urls = [];
  const re = new RegExp(`${attr}=["']([^"']+)["']`, 'gi');
  let match;
  while ((match = re.exec(html))) {
    const url = absoluteOldUrl(match[1]);
    if (url && pattern.test(url) && !urls.includes(url)) {
      urls.push(url);
    }
  }
  return urls;
};

const fetchText = async (url) => {
  const response = await fetch(url, {
    headers: {
      'user-agent': 'Mozilla/5.0 lawfaculty-site migration',
    },
  });

  if (!response.ok) {
    throw new Error(`Cannot fetch ${url}: HTTP ${response.status}`);
  }

  return response.text();
};

const fetchJson = async (url, options = {}) => {
  const response = await fetch(url, options);
  const text = await response.text();
  if (!response.ok) {
    throw new Error(`HTTP ${response.status} ${url}: ${text.slice(0, 300)}`);
  }
  return text ? JSON.parse(text) : null;
};

const parseArticle = async (sourcePath) => {
  const sourceUrl = absoluteOldUrl(sourcePath);
  const html = await fetchText(sourceUrl);
  const articleMatch = html.match(/<article\b[^>]*class=["'][^"']*item-page[^"']*["'][^>]*>([\s\S]*?)<\/article>/i);
  const article = articleMatch?.[1];

  if (!article) {
    throw new Error(`Cannot find article markup in ${sourceUrl}`);
  }

  const titleMatch =
    article.match(/<header[\s\S]*?<h\d[^>]*>[\s\S]*?<a[^>]*>([\s\S]*?)<\/a>[\s\S]*?<\/h\d>/i) ||
    article.match(/<h\d[^>]*>([\s\S]*?)<\/h\d>/i);
  const title = stripTags(titleMatch?.[1]);
  const displayDate = article.match(/<time[^>]*datetime=["']([^"']+)["']/i)?.[1] || null;
  const content = normalizeBodyHtml(article, sourceUrl);
  const imageUrls = extractUrls(content, 'src', /\.(png|jpe?g|gif|webp)(\?|$)/i);
  const attachmentUrls = extractUrls(content, 'href', /\.(pdf|docx?|xlsx?|pptx?|zip|rar)(\?|$)/i);

  if (!title) {
    throw new Error(`Cannot extract title from ${sourceUrl}`);
  }

  return {
    title,
    slug: slugFromUrl(sourceUrl),
    excerpt: stripTags(content).slice(0, 260),
    content,
    displayDate,
    category: inferCategory({ title, sourceUrl }),
    sourceUrl,
    sourceCategory: sourceCategoryFromUrl(sourceUrl),
    imageUrls,
    attachmentUrls,
  };
};

const uploadRemoteFile = async (url) => {
  const response = await fetch(url, {
    headers: {
      'user-agent': 'Mozilla/5.0 lawfaculty-site migration',
    },
  });

  if (!response.ok) {
    throw new Error(`Cannot download media ${url}: HTTP ${response.status}`);
  }

  const bytes = await response.arrayBuffer();
  const contentType = response.headers.get('content-type') || 'application/octet-stream';
  const pathname = new URL(url).pathname;
  const filename = decodeURIComponent(pathname.split('/').pop() || 'old-site-file');
  const formData = new FormData();
  formData.append('files', new Blob([bytes], { type: contentType }), filename);

  const uploaded = await fetchJson(`${STRAPI_URL}/api/upload`, {
    method: 'POST',
    headers: authHeaders(),
    body: formData,
  });

  return uploaded?.[0] || null;
};

const findExistingBySourceUrl = async (sourceUrl) => {
  const query = new URLSearchParams({
    'filters[sourceUrl][$eq]': sourceUrl,
    'pagination[pageSize]': '1',
    status: 'draft',
  });
  const payload = await fetchJson(`${STRAPI_URL}/api/news?${query}`, {
    headers: authHeaders(),
  });
  return payload?.data?.[0] || null;
};

const createNews = async (parsed) => {
  const existing = await findExistingBySourceUrl(parsed.sourceUrl);
  if (existing) {
    return { skipped: true, id: existing.id, title: parsed.title };
  }

  const uploadedImages = [];
  for (const url of parsed.imageUrls) {
    uploadedImages.push(await uploadRemoteFile(url));
  }

  const uploadedAttachments = [];
  for (const url of parsed.attachmentUrls) {
    uploadedAttachments.push(await uploadRemoteFile(url));
  }

  let content = parsed.content;
  uploadedImages.forEach((image, index) => {
    if (!image) {
      return;
    }
    const source = parsed.imageUrls[index];
    content = content.split(source).join(image.url);
  });
  uploadedAttachments.forEach((file, index) => {
    if (!file) {
      return;
    }
    const source = parsed.attachmentUrls[index];
    content = content.split(source).join(file.url);
  });

  const payload = {
    data: {
      title: parsed.title,
      slug: parsed.slug,
      excerpt: parsed.excerpt,
      content,
      displayDate: parsed.displayDate,
      category: parsed.category,
      cover: uploadedImages[0]?.id || null,
      gallery: uploadedImages.slice(1).map((item) => item?.id).filter(Boolean),
      attachments: uploadedAttachments.map((item) => item?.id).filter(Boolean),
      sourceUrl: parsed.sourceUrl,
      sourceCategory: parsed.sourceCategory,
      submissionStatus: 'draft',
      locale: 'ru',
    },
  };

  const created = await fetchJson(`${STRAPI_URL}/api/news`, {
    method: 'POST',
    headers: {
      ...authHeaders(),
      'content-type': 'application/json',
    },
    body: JSON.stringify(payload),
  });

  return { id: created?.data?.id, title: parsed.title };
};

if (COMMIT && !STRAPI_API_TOKEN) {
  throw new Error('STRAPI_API_TOKEN is required when running with --commit');
}

const results = [];
for (const sourcePath of NEWS_URLS) {
  const parsed = await parseArticle(sourcePath);

  if (!COMMIT) {
    results.push({
      title: parsed.title,
      slug: parsed.slug,
      displayDate: parsed.displayDate,
      category: parsed.category,
      sourceUrl: parsed.sourceUrl,
      imageCount: parsed.imageUrls.length,
      attachmentCount: parsed.attachmentUrls.length,
    });
    continue;
  }

  results.push(await createNews(parsed));
}

console.log(JSON.stringify({ commit: COMMIT, count: results.length, results }, null, 2));
