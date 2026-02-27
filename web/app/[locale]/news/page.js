import Link from 'next/link';
import { getNewsList } from '@/lib/content';
import { getLabels, normalizeLocale } from '@/lib/i18n';
import { getStrapiMediaUrl } from '@/lib/strapi';

export async function generateMetadata({ params }) {
  const locale = normalizeLocale(params.locale);
  const t = getLabels(locale);
  return {
    title: t.newsTitle,
  };
}

export default async function NewsPage({ params, searchParams }) {
  const locale = normalizeLocale(params.locale);
  const t = getLabels(locale);
  const qRaw = String(searchParams?.q || '').trim();
  const q = qRaw.toLowerCase();
  const news = await getNewsList(locale, 80);
  const filtered = q
    ? news.filter((item) =>
        `${item.title || ''} ${item.excerpt || ''}`.toLowerCase().includes(q)
      )
    : news;

  return (
    <section className="section-shell">
      <div className="page-intro">
        <p className="kicker">{t.news}</p>
        <h1>{t.newsTitle}</h1>
        <p className="section-intro">{t.newsIntro}</p>
      </div>
      <div className="filter-row">
        <form method="GET">
          <input
            name="q"
            defaultValue={qRaw}
            placeholder={t.newsFilterPlaceholder}
            aria-label={t.newsFilterPlaceholder}
          />
          <button type="submit" className="button-primary">
            {t.searchButton}
          </button>
        </form>
        {q ? (
          <Link className="button-secondary" href={`/${locale}/news`}>
            {t.clearFilter}
          </Link>
        ) : null}
      </div>
      {filtered.length === 0 ? (
        <p className="empty-state">{t.newsEmpty}</p>
      ) : (
        <div className="list-stack">
          {filtered.map((item) => (
            <article key={item.id} className="list-item">
              {item.cover?.url ? (
                <img
                  className="news-cover"
                  src={getStrapiMediaUrl(item.cover.url)}
                  alt={item.cover.alternativeText || item.title}
                />
              ) : null}
              <p className="meta-line">
                {item.publishedAt ? new Date(item.publishedAt).toLocaleDateString(locale) : ''}
              </p>
              <h2>
                <Link href={`/${locale}/news/${item.slug}`}>{item.title}</Link>
              </h2>
              <p>{item.excerpt || t.noExcerpt}</p>
            </article>
          ))}
        </div>
      )}
    </section>
  );
}
