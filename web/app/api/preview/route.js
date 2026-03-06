import { draftMode } from 'next/headers';
import { NextResponse } from 'next/server';
import { DEFAULT_LOCALE, normalizeLocale } from '@/lib/i18n';
import { strapiFetch } from '@/lib/strapi';

const NEWS_UID = 'api::news-item.news-item';
const PAGE_UID = 'api::page.page';
const MATERIAL_UID = 'api::material.material';
const DEPARTMENT_UID = 'api::department.department';
const PERSON_UID = 'api::person.person';
const ALLOWED_STATUSES = new Set(['draft', 'published']);

const resolveNewsPath = async ({ documentId, locale, status }) => {
  const payload = await strapiFetch(
    '/api/news',
    {
      locale,
      status,
      'filters[documentId][$eq]': documentId,
      'pagination[pageSize]': 1,
      'fields[0]': 'slug',
    },
    { cacheMode: 'no-store' }
  );

  const item = payload.data?.[0];
  if (!item?.slug) {
    return `/${locale}`;
  }

  return `/${locale}/news/${item.slug}`;
};

const resolveSingleSlugPath = async ({ endpoint, documentId, locale, status, fields, toPath }) => {
  const payload = await strapiFetch(
    endpoint,
    {
      locale,
      status,
      'filters[documentId][$eq]': documentId,
      'pagination[pageSize]': 1,
      ...fields,
    },
    { cacheMode: 'no-store' }
  );

  const item = payload.data?.[0];
  if (!item) {
    return `/${locale}`;
  }

  return toPath(item, locale);
};

export async function GET(request) {
  const url = new URL(request.url);
  const secret = url.searchParams.get('secret') || '';
  const expectedSecret = process.env.PREVIEW_SECRET || 'change_me_preview';

  if (secret !== expectedSecret) {
    return NextResponse.json({ error: 'Invalid preview secret' }, { status: 401 });
  }

  const uid = url.searchParams.get('uid') || '';
  const documentId = url.searchParams.get('documentId') || '';
  const locale = normalizeLocale(url.searchParams.get('locale') || DEFAULT_LOCALE);
  const statusParam = url.searchParams.get('status') || 'draft';
  const status = ALLOWED_STATUSES.has(statusParam) ? statusParam : 'draft';

  if (!documentId) {
    return NextResponse.json({ error: 'documentId is required' }, { status: 400 });
  }

  let destination = `/${locale}`;
  if (uid === NEWS_UID) {
    destination = await resolveNewsPath({ documentId, locale, status });
  } else if (uid === PAGE_UID) {
    destination = await resolveSingleSlugPath({
      endpoint: '/api/pages',
      documentId,
      locale,
      status,
      fields: { 'fields[0]': 'slug' },
      toPath: (item, currentLocale) =>
        item?.slug ? `/${currentLocale}/${item.slug}` : `/${currentLocale}`,
    });
  } else if (uid === MATERIAL_UID) {
    destination = await resolveSingleSlugPath({
      endpoint: '/api/materials',
      documentId,
      locale,
      status,
      fields: { 'fields[0]': 'slug' },
      toPath: (item, currentLocale) =>
        item?.slug ? `/${currentLocale}/materials/${item.slug}` : `/${currentLocale}`,
    });
  } else if (uid === DEPARTMENT_UID) {
    destination = await resolveSingleSlugPath({
      endpoint: '/api/departments',
      documentId,
      locale,
      status,
      fields: { 'fields[0]': 'slug' },
      toPath: (item, currentLocale) =>
        item?.slug ? `/${currentLocale}/departments/${item.slug}` : `/${currentLocale}`,
    });
  } else if (uid === PERSON_UID) {
    destination = await resolveSingleSlugPath({
      endpoint: '/api/persons',
      documentId,
      locale,
      status,
      fields: { 'fields[0]': 'slug' },
      toPath: (item, currentLocale) =>
        item?.slug ? `/${currentLocale}/persons/${item.slug}` : `/${currentLocale}`,
    });
  }

  draftMode().enable();
  return NextResponse.redirect(new URL(destination, url.origin));
}
