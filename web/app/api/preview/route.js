import { draftMode } from 'next/headers';
import { NextResponse } from 'next/server';
import { DEFAULT_LOCALE, normalizeLocale } from '@/lib/i18n';
import { strapiFetch } from '@/lib/strapi';

const NEWS_UID = 'api::news-item.news-item';
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
  }

  draftMode().enable();
  return NextResponse.redirect(new URL(destination, url.origin));
}
