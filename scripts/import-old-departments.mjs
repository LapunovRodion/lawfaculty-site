const OLD_SITE_URL = (process.env.OLD_SITE_URL || 'https://law.bsu.by').replace(/\/+$/, '');
const STRAPI_URL = (process.env.STRAPI_URL || 'http://localhost:1337').replace(/\/+$/, '');
const STRAPI_API_TOKEN = process.env.STRAPI_API_TOKEN || '';
const COMMIT = process.argv.includes('--commit');

if (process.env.OLD_SITE_INSECURE_TLS === '1') {
  process.env.NODE_TLS_REJECT_UNAUTHORIZED = '0';
}

const DEPARTMENT_URLS = [
  '/departments/department-of-theory-and-history-of-state-and-law.html',
  '/departments/constitutional-law-department.html',
  '/departments/department-of-criminalistics.html',
  '/departments/the-civil-law-department.html',
  '/departments/environmental-and-ruralalaw-department.html',
  '/departments/the-department-of-civil-procedure-labor-law.html',
  '/departments/department-of-criminal-law.html',
  '/departments/the-department-of-political-science.html',
  '/departments/department-of-criminal-procedure-and-directorate-of-public-prosecutions.html',
  '/departments/department-of-public-administration.html',
  '/departments/department-of-economic-law.html',
  '/departments/kafedra-prava-intelektualnaj-ulasnastsi.html',
  '/departments/english-language-section.html',
  '/departments/laboratory-of-forensic-technology.html',
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
  if (url.startsWith('http') || url.startsWith('mailto:')) {
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
    .replace(/&mdash;/g, '-')
    .replace(/&#(\d+);/g, (_match, code) => String.fromCharCode(Number(code)))
    .replace(/&#x([\da-f]+);/gi, (_match, code) => String.fromCharCode(Number.parseInt(code, 16)));

const stripTags = (value) =>
  decodeHtml(String(value || '').replace(/<[^>]*>/g, ' ')).replace(/\s+/g, ' ').trim();

const slugFromUrl = (sourceUrl) => sourceUrl.split('/').pop().replace(/\.html$/i, '').slice(0, 180);

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

const decodeJoomlaEmailScripts = (html) =>
  html.replace(/<span id="(cloak[^"]+)">[\s\S]*?<\/span>\s*<script type='text\/javascript'>([\s\S]*?)<\/script>/gi, (_match, _id, script) => {
    const expression = script.match(/var addy_text\w+\s*=\s*([\s\S]*?);\s*document\.getElementById/)?.[1];
    if (!expression) {
      return '';
    }
    const email = decodeHtml([...expression.matchAll(/'([^']*)'/g)].map((item) => item[1]).join(''));
    return email ? `<a href="mailto:${email}">${email}</a>` : '';
  });

const normalizeBodyHtml = (articleHtml) => {
  let body = decodeJoomlaEmailScripts(articleHtml)
    .replace(/<header[\s\S]*?<\/header>/i, '')
    .replace(/<aside[\s\S]*?<\/aside>/i, '')
    .replace(/<script[\s\S]*?<\/script>/gi, '')
    .replace(/<style[\s\S]*?<\/style>/gi, '')
    .trim();

  body = body.replace(/\s(src|href)=(['"])(\/[^'"]+)\2/gi, (_match, attr, quote, url) => {
    return ` ${attr}=${quote}${absoluteOldUrl(url)}${quote}`;
  });

  body = body.replace(/\s+/g, ' ').trim();

  if (!body) {
    throw new Error('Cannot extract department body');
  }

  return body;
};

const extractContacts = (body) => {
  const contactsHtml = body.match(/<p[^>]*>[\s\S]{0,1200}?Контакты[\s\S]*?<\/p>/i)?.[0] || '';
  const contacts = stripTags(contactsHtml);
  const email = contacts.match(/[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}/i)?.[0] || '';
  const phone = contacts.match(/\+?375\s*\(?17\)?[\d\s-]{5,}/)?.[0]?.replace(/\s+/g, ' ').trim() || '';
  const address = contacts.match(/(?:адрес|адрас):\s*([^;]+?)(?:телефон|Е-mail|Email|$)/i)?.[1]?.trim() || '';

  return { contacts, email, phone, address };
};

const uploadRemoteFile = async (url) => {
  const response = await fetch(url, {
    headers: {
      'user-agent': 'Mozilla/5.0 lawfaculty-site migration',
    },
  });

  if (!response.ok) {
    console.warn(`[department-import] Cannot download ${url}: HTTP ${response.status}`);
    return null;
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

const parseDepartment = async (sourcePath) => {
  const sourceUrl = absoluteOldUrl(sourcePath);
  const html = await fetchText(sourceUrl);
  const articleMatch = html.match(/<article\b[^>]*class=["'][^"']*item-page[^"']*["'][^>]*>([\s\S]*?)<\/article>/i);
  const article = articleMatch?.[1];

  if (!article) {
    throw new Error(`Cannot find department article markup in ${sourceUrl}`);
  }

  const titleMatch =
    article.match(/<header[\s\S]*?<h\d[^>]*>[\s\S]*?<a[^>]*>([\s\S]*?)<\/a>[\s\S]*?<\/h\d>/i) ||
    article.match(/<h\d[^>]*>([\s\S]*?)<\/h\d>/i);
  const title = stripTags(titleMatch?.[1]);
  const description = normalizeBodyHtml(article);
  const overview = stripTags(description).slice(0, 700);
  const imageUrls = extractUrls(description, 'src', /^https:\/\/law\.bsu\.by\/.+\.(png|jpe?g|gif|webp)(\?|$)/i);
  const fileUrls = extractUrls(description, 'href', /^https:\/\/law\.bsu\.by\/.+\.(pdf|docx?|xlsx?|pptx?|zip|rar)(\?|$)/i);
  const contacts = extractContacts(description);

  if (!title) {
    throw new Error(`Cannot extract department title from ${sourceUrl}`);
  }

  return {
    title,
    slug: slugFromUrl(sourceUrl),
    overview,
    description,
    sourceUrl,
    sourceCategory: '/departments.html',
    imageUrls,
    fileUrls,
    ...contacts,
  };
};

const findExistingBySourceUrl = async (sourceUrl) => {
  const query = new URLSearchParams({
    'filters[sourceUrl][$eq]': sourceUrl,
    'pagination[pageSize]': '1',
    status: 'draft',
  });
  const payload = await fetchJson(`${STRAPI_URL}/api/departments?${query}`, {
    headers: authHeaders(),
  });
  return payload?.data?.[0] || null;
};

const createDepartment = async (parsed) => {
  const existing = await findExistingBySourceUrl(parsed.sourceUrl);
  if (existing) {
    return { skipped: true, id: existing.id, title: parsed.title };
  }

  const uploadedImages = [];
  for (const url of parsed.imageUrls) {
    uploadedImages.push(await uploadRemoteFile(url));
  }

  const uploadedFiles = [];
  for (const url of parsed.fileUrls) {
    uploadedFiles.push(await uploadRemoteFile(url));
  }

  let description = parsed.description;
  uploadedImages.forEach((image, index) => {
    if (!image) {
      return;
    }
    description = description.split(parsed.imageUrls[index]).join(image.url);
  });
  uploadedFiles.forEach((file, index) => {
    if (!file) {
      return;
    }
    description = description.split(parsed.fileUrls[index]).join(file.url);
  });

  const data = {
    title: parsed.title,
    slug: parsed.slug,
    overview: parsed.overview,
    description,
    sourceUrl: parsed.sourceUrl,
    sourceCategory: parsed.sourceCategory,
    locale: 'ru',
  };

  if (parsed.contacts) {
    data.contacts = parsed.contacts;
  }
  if (parsed.address) {
    data.address = parsed.address;
  }
  if (parsed.phone) {
    data.phone = parsed.phone;
  }
  if (parsed.email) {
    data.email = parsed.email;
  }
  if (uploadedImages[0]?.id) {
    data.heroImage = uploadedImages[0].id;
  }

  const payload = {
    data,
  };

  const created = await fetchJson(`${STRAPI_URL}/api/departments`, {
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
for (const sourcePath of DEPARTMENT_URLS) {
  const parsed = await parseDepartment(sourcePath);

  if (!COMMIT) {
    results.push({
      title: parsed.title,
      slug: parsed.slug,
      sourceUrl: parsed.sourceUrl,
      imageCount: parsed.imageUrls.length,
      fileCount: parsed.fileUrls.length,
      hasContacts: Boolean(parsed.contacts),
    });
    continue;
  }

  results.push(await createDepartment(parsed));
}

console.log(JSON.stringify({ commit: COMMIT, count: results.length, results }, null, 2));
