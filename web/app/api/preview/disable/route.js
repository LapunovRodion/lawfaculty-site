import { draftMode } from 'next/headers';
import { NextResponse } from 'next/server';
import { DEFAULT_LOCALE, normalizeLocale } from '@/lib/i18n';

export async function GET(request) {
  const url = new URL(request.url);
  const locale = normalizeLocale(url.searchParams.get('locale') || DEFAULT_LOCALE);

  draftMode().disable();
  return NextResponse.redirect(new URL(`/${locale}`, url.origin));
}
