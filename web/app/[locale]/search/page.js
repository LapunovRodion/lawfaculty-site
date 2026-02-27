import { formatLabel, getLabels, getSearchTypeLabel, normalizeLocale } from '@/lib/i18n';
import { searchSite } from '@/lib/search';

const normalizeResultHref = (urlPath, locale) => {
  const value = String(urlPath || '').trim();
  if (!value) {
    return null;
  }
  if (value.startsWith('http://') || value.startsWith('https://')) {
    return value;
  }
  if (value.startsWith(`/${locale}/`)) {
    return value;
  }
  if (value.startsWith('/')) {
    return `/${locale}${value}`;
  }
  return `/${locale}/${value}`;
};

export default async function SearchPage({ params, searchParams }) {
  const locale = normalizeLocale(params.locale);
  const t = getLabels(locale);
  const q = String(searchParams?.q || '').trim();
  const hits = await searchSite(q, locale);

  return (
    <section className="section-shell">
      <div className="page-intro">
        <p className="kicker">{t.search}</p>
        <h1>{t.searchTitle}</h1>
        <p className="section-intro">{t.searchIntro}</p>
      </div>
      <form method="GET" className="search-form">
        <input
          defaultValue={q}
          name="q"
          placeholder={t.searchPlaceholder}
          aria-label={t.searchAria}
        />
        <button type="submit">{t.searchButton}</button>
      </form>

      {!q ? (
        <p className="empty-state">{t.searchEnterQuery}</p>
      ) : hits.length === 0 ? (
        <p className="empty-state">{formatLabel(t.searchNothingFound, { q })}</p>
      ) : (
        <div className="list-stack">
          {hits.map((item) => (
            <article key={item.id} className="list-item">
              <p className="type-badge">{getSearchTypeLabel(locale, item.type)}</p>
              <h2>{item.title}</h2>
              <p>{item.excerpt}</p>
              {item.urlPath ? (
                <a
                  className="meta-line"
                  href={normalizeResultHref(item.urlPath, locale) || item.urlPath}
                >
                  {item.urlPath}
                </a>
              ) : null}
            </article>
          ))}
        </div>
      )}
    </section>
  );
}
