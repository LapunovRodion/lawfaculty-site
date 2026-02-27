'use client';

import Link from 'next/link';
import { usePathname, useSearchParams } from 'next/navigation';
import { LOCALES, LOCALE_NAMES, normalizeLocale } from '@/lib/i18n';

const getLocaleHref = (pathname, targetLocale, searchParams) => {
  const rawPath = pathname || '/';
  const segments = rawPath.split('/');
  if (segments.length > 1) {
    segments[1] = targetLocale;
  }

  const nextPath = segments.join('/') || `/${targetLocale}`;
  const query = searchParams.toString();
  return query ? `${nextPath}?${query}` : nextPath;
};

export default function LocaleSwitcher({ locale }) {
  const pathname = usePathname();
  const searchParams = useSearchParams();
  const current = normalizeLocale(locale);

  return (
    <div className="locale-switcher">
      {LOCALES.map((item) => (
        <Link
          key={item}
          href={getLocaleHref(pathname, item, searchParams)}
          className={item === current ? 'active' : ''}
        >
          {LOCALE_NAMES[item] || item.toUpperCase()}
        </Link>
      ))}
    </div>
  );
}
