import Link from 'next/link';
import { getNewsList } from '@/lib/content';
import { getLabels, normalizeLocale } from '@/lib/i18n';
import { getStrapiMediaUrl } from '@/lib/strapi';

export default async function LocaleHomePage({ params }) {
  const locale = normalizeLocale(params.locale);
  const t = getLabels(locale);
  const news = await getNewsList(locale, 6);
  const quickLinks = [
    { href: `/${locale}/news`, title: t.news, text: t.newsIntro },
    { href: `/${locale}/materials`, title: t.materials, text: t.materialsIntro },
    { href: `/${locale}/departments`, title: t.departments, text: t.departmentsIntro },
    { href: `/${locale}/persons`, title: t.persons, text: t.personsIntro },
    { href: `/${locale}/search`, title: t.search, text: t.searchIntro },
    { href: `/${locale}/portal`, title: t.portal, text: t.portalPersonal },
  ];
  const programs = [
    { title: t.homeProgramBachelorTitle, text: t.homeProgramBachelorText },
    { title: t.homeProgramMasterTitle, text: t.homeProgramMasterText },
    { title: t.homeProgramPostgradTitle, text: t.homeProgramPostgradText },
  ];
  const researchAreas = [t.homeResearchOne, t.homeResearchTwo, t.homeResearchThree];

  return (
    <>
      <section className="hero">
        <div className="hero-grid">
          <div className="section-shell">
            <p className="kicker">{t.heroKicker}</p>
            <h1>{t.heroTitle}</h1>
            <p>{t.heroSubtitle}</p>
            <div className="hero-actions">
              <Link className="button-primary" href={`/${locale}/news`}>
                {t.heroPrimaryCta}
              </Link>
              <Link className="button-secondary" href={`/${locale}/materials`}>
                {t.heroSecondaryCta}
              </Link>
            </div>
          </div>
        </div>
      </section>

      <section className="section-shell home-section home-section-news reveal-section delay-1">
        <div className="section-header">
          <h2>{t.latestNews}</h2>
          <Link href={`/${locale}/news`}>{t.viewAll}</Link>
        </div>
        {news.length === 0 ? (
          <p className="empty-state">{t.noData}</p>
        ) : (
          <div className="card-grid">
            {news.map((item, idx) => (
              <article
                className="card news-card reveal-card accent-blue"
                key={item.id}
                style={{ '--reveal-delay': `${idx * 55}ms` }}
              >
                {item.cover?.url ? (
                  <img
                    className="news-cover"
                    src={getStrapiMediaUrl(item.cover.url)}
                    alt={item.cover.alternativeText || item.title}
                  />
                ) : null}
                <p className="meta-line">{item.publishedAt ? new Date(item.publishedAt).toLocaleDateString(locale) : ''}</p>
                <h3>{item.title}</h3>
                <p>{item.excerpt || t.noExcerpt}</p>
                <Link href={`/${locale}/news/${item.slug}`}>{t.open}</Link>
              </article>
            ))}
          </div>
        )}
      </section>

      <section className="section-shell home-section home-section-quick reveal-section delay-2">
        <div className="section-header">
          <h2>{t.quickAccessTitle}</h2>
        </div>
        <p className="section-intro">{t.quickAccessIntro}</p>
        <div className="quick-grid">
          {quickLinks.map((item, idx) => (
            <Link
              key={item.href}
              href={item.href}
              className="quick-link reveal-card accent-cyan"
              style={{ '--reveal-delay': `${idx * 45}ms` }}
            >
              <h3>{item.title}</h3>
              <p>{item.text}</p>
            </Link>
          ))}
        </div>
      </section>

      <section className="section-shell home-section home-section-programs reveal-section delay-3">
        <div className="section-header">
          <h2>{t.homeProgramsTitle}</h2>
        </div>
        <div className="card-grid">
          {programs.map((item, idx) => (
            <article
              className="card program-card reveal-card accent-amber"
              key={item.title}
              style={{ '--reveal-delay': `${idx * 60}ms` }}
            >
              <h3>{item.title}</h3>
              <p>{item.text}</p>
            </article>
          ))}
        </div>
      </section>

      <section className="section-shell home-section home-section-research reveal-section delay-4">
        <div className="section-header">
          <h2>{t.homeResearchTitle}</h2>
        </div>
        <div className="quick-grid">
          {researchAreas.map((item, idx) => (
            <article
              className="quick-link research-card reveal-card accent-blue"
              key={item}
              style={{ '--reveal-delay': `${idx * 65}ms` }}
            >
              <h3>{item}</h3>
            </article>
          ))}
        </div>
      </section>

      <section className="info-panel reveal-section delay-5">
        <p className="kicker">{t.homeContactTitle}</p>
        <p>{t.homeContactBody}</p>
        <Link href={`/${locale}/portal`} className="button-secondary">
          {t.homeContactAction}
        </Link>
      </section>
    </>
  );
}
