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
  const publicationsText = hasValue(person.publicationsText) ? person.publicationsText : '';
  const links = Array.isArray(person.labels) ? person.labels.filter((l) => hasValue(l?.label) && hasValue(l?.url)) : [];

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

          {(person.email || person.phone) ? (
            <div className="person-photo-contacts">
              {person.email ? (
                <a className="person-photo-contact" href={`mailto:${person.email}`}>{person.email}</a>
              ) : null}
              {person.phone ? (
                <a className="person-photo-contact" href={`tel:${String(person.phone).replace(/[^\d+]/g, '')}`}>{person.phone}</a>
              ) : null}
            </div>
          ) : null}
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

          {links.length ? (
            <div className="person-link-row">
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

      {hasValue(publicationsText) ? (
        <section id="publications" className="section-shell person-section">
          <div className="section-header"><h2>{t.personSectionPublications}</h2></div>
          {looksLikeHtml(publicationsText) ? (
            <div
              className="prose-content"
              dangerouslySetInnerHTML={{ __html: normalizeRichTextMediaHtml(publicationsText) }}
            />
          ) : (
            <div className="prose-content">
              {String(publicationsText).split(/\r?\n/).filter(Boolean).map((line, idx) => <p key={`pub-${idx}`}>{line}</p>)}
            </div>
          )}
        </section>
      ) : null}
    </article>
  );
}
