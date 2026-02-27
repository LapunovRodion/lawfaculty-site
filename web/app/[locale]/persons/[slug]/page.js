import Link from 'next/link';
import { notFound } from 'next/navigation';
import { getPersonBySlug } from '@/lib/content';
import { getLabels, normalizeLocale } from '@/lib/i18n';
import { getStrapiMediaUrl, normalizeRichTextMediaHtml } from '@/lib/strapi';

const looksLikeHtml = (value) => /<\/?[a-z][\s\S]*>/i.test(String(value || ''));

const hasValue = (value) => value !== null && value !== undefined && String(value).trim() !== '';

export default async function PersonDetailPage({ params }) {
  const locale = normalizeLocale(params.locale);
  const t = getLabels(locale);
  const person = await getPersonBySlug(locale, params.slug);

  if (!person) {
    notFound();
  }

  const departments = Array.isArray(person.departments) ? person.departments.filter(Boolean) : [];
  const subjects = Array.isArray(person.subjects) ? person.subjects.filter((s) => hasValue(s?.title)) : [];
  const publications = Array.isArray(person.publications)
    ? [...person.publications].filter((p) => hasValue(p?.title)).sort((a, b) => Number(b?.year || 0) - Number(a?.year || 0))
    : [];
  const links = Array.isArray(person.labels) ? person.labels.filter((l) => hasValue(l?.label) && hasValue(l?.url)) : [];

  const sections = [
    hasValue(person.bio) && { id: 'about', label: t.personSectionAbout },
    subjects.length > 0 && { id: 'subjects', label: t.personSectionSubjects },
    publications.length > 0 && { id: 'publications', label: t.personSectionPublications },
    (hasValue(person.email) || hasValue(person.phone) || links.length > 0) && { id: 'contacts', label: t.personSectionContacts },
  ].filter(Boolean);

  return (
    <article className="section-shell person-profile-shell">
      <div className="breadcrumbs">
        <Link href={`/${locale}`}>{t.home}</Link>
        <span>{t.breadcrumbsSeparator}</span>
        <Link href={`/${locale}/persons`}>{t.persons}</Link>
        <span>{t.breadcrumbsSeparator}</span>
        <span>{person.fullName}</span>
      </div>

      <section className="person-hero">
        <div className="person-hero-photo-wrap">
          {person.photo?.url ? (
            <img
              className="person-hero-photo"
              src={getStrapiMediaUrl(person.photo.url)}
              alt={person.photo.alternativeText || person.fullName}
            />
          ) : (
            <div className="person-photo-placeholder" aria-hidden="true">
              {String(person.fullName || '?')
                .split(/\s+/)
                .filter(Boolean)
                .slice(0, 2)
                .map((part) => part[0])
                .join('')}
            </div>
          )}
        </div>
        <div className="person-hero-content">
          <p className="kicker">{t.persons}</p>
          <h1>{person.fullName}</h1>
          <p className="person-role-line">{person.roleInDepartment || person.position || t.noPosition}</p>

          {departments.length ? (
            <div className="chip-row">
              {departments.map((department) => (
                <Link
                  key={`${person.id}-${department.slug || department.title}`}
                  className="type-badge"
                  href={department.slug ? `/${locale}/departments/${department.slug}` : `/${locale}/departments`}
                >
                  {department.title}
                </Link>
              ))}
            </div>
          ) : null}

          <div className="person-facts-grid">
            {person.position ? (
              <div className="person-fact-item">
                <span>{t.personFactPosition}</span>
                <strong>{person.position}</strong>
              </div>
            ) : null}
            {person.workplace ? (
              <div className="person-fact-item">
                <span>{t.personFactWorkplace}</span>
                <strong>{person.workplace}</strong>
              </div>
            ) : null}
            {person.academicTitle ? (
              <div className="person-fact-item">
                <span>{t.personFactAcademicTitle}</span>
                <strong>{person.academicTitle}</strong>
              </div>
            ) : null}
            {person.academicDegree ? (
              <div className="person-fact-item">
                <span>{t.personFactAcademicDegree}</span>
                <strong>{person.academicDegree}</strong>
              </div>
            ) : null}
            {person.isHead ? (
              <div className="person-fact-item">
                <span>{t.personFactStatus}</span>
                <strong>{t.personFactIsHead}</strong>
              </div>
            ) : null}
          </div>

          {(person.email || person.phone || links.length) ? (
            <div className="person-link-row">
              {person.email ? (
                <a className="utility-link" href={`mailto:${person.email}`}>{person.email}</a>
              ) : null}
              {person.phone ? (
                <a className="utility-link" href={`tel:${String(person.phone).replace(/[^\d+]/g, '')}`}>{person.phone}</a>
              ) : null}
              {links.map((link) => (
                <a
                  key={`${person.id}-${link.url}`}
                  className="utility-link"
                  href={link.url}
                  target="_blank"
                  rel="noreferrer"
                >
                  {link.label}
                </a>
              ))}
            </div>
          ) : null}
        </div>
      </section>

      {sections.length ? (
        <nav className="person-anchor-nav" aria-label={t.personSectionsNav}>
          {sections.map((section) => (
            <a key={section.id} href={`#${section.id}`}>{section.label}</a>
          ))}
        </nav>
      ) : null}

      {hasValue(person.bio) ? (
        <section id="about" className="section-shell person-section">
          <div className="section-header"><h2>{t.personSectionAbout}</h2></div>
          {looksLikeHtml(person.bio) ? (
            <div
              className="prose-content"
              dangerouslySetInnerHTML={{ __html: normalizeRichTextMediaHtml(person.bio) }}
            />
          ) : (
            <div className="prose-content">
              {String(person.bio).split(/\r?\n/).filter(Boolean).map((line, idx) => <p key={`bio-${idx}`}>{line}</p>)}
            </div>
          )}
        </section>
      ) : null}

      {subjects.length ? (
        <section id="subjects" className="section-shell person-section">
          <div className="section-header"><h2>{t.personSectionSubjects}</h2></div>
          <div className="chip-row">
            {subjects.map((subject, idx) => (
              <span key={`${subject.title}-${idx}`} className="type-badge">{subject.title}</span>
            ))}
          </div>
        </section>
      ) : null}

      {publications.length ? (
        <section id="publications" className="section-shell person-section">
          <div className="section-header"><h2>{t.personSectionPublications}</h2></div>
          <div className="list-stack">
            {publications.map((pub, idx) => (
              <article key={`${pub.title}-${idx}`} className="list-item publication-item">
                <h3>{pub.title}</h3>
                <p className="meta-line">
                  {[pub.source, pub.year].filter(Boolean).join(' • ') || t.noDescription}
                </p>
                {pub.url ? (
                  <a className="inline-link" href={pub.url} target="_blank" rel="noreferrer">
                    {t.open}
                  </a>
                ) : null}
              </article>
            ))}
          </div>
        </section>
      ) : null}

      {(person.email || person.phone || links.length) ? (
        <section id="contacts" className="section-shell person-section">
          <div className="section-header"><h2>{t.personSectionContacts}</h2></div>
          <div className="person-contacts-grid">
            {person.email ? (
              <div className="person-fact-item">
                <span>Email</span>
                <a href={`mailto:${person.email}`}>{person.email}</a>
              </div>
            ) : null}
            {person.phone ? (
              <div className="person-fact-item">
                <span>{t.personFactPhone}</span>
                <a href={`tel:${String(person.phone).replace(/[^\d+]/g, '')}`}>{person.phone}</a>
              </div>
            ) : null}
          </div>
          {links.length ? (
            <div className="list-stack">
              {links.map((link, idx) => (
                <article key={`${link.url}-${idx}`} className="list-item">
                  <h3>{link.label}</h3>
                  <p className="meta-line">{link.kind}</p>
                  <a className="inline-link" href={link.url} target="_blank" rel="noreferrer">
                    {t.open}
                  </a>
                </article>
              ))}
            </div>
          ) : null}
        </section>
      ) : null}
    </article>
  );
}
