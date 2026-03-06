import Link from 'next/link';
import { notFound } from 'next/navigation';
import { getPersonBySlug } from '@/lib/content';
import { getLabels, normalizeLocale } from '@/lib/i18n';
import { getStrapiMediaUrl, normalizeRichTextMediaHtml } from '@/lib/strapi';

const looksLikeHtml = (value) => /<\/?[a-z][\s\S]*>/i.test(String(value || ''));

const hasValue = (value) => value !== null && value !== undefined && String(value).trim() !== '';

const renderRichTextBlock = (value, keyPrefix) => {
  if (!hasValue(value)) {
    return null;
  }

  if (looksLikeHtml(value)) {
    return (
      <div
        className="prose-content"
        dangerouslySetInnerHTML={{ __html: normalizeRichTextMediaHtml(value) }}
      />
    );
  }

  return (
    <div className="prose-content">
      {String(value)
        .split(/\r?\n/)
        .filter(Boolean)
        .map((line, idx) => (
          <p key={`${keyPrefix}-${idx}`}>{line}</p>
        ))}
    </div>
  );
};

const PersonAccordionSection = ({ id, title, children }) => {
  if (!children) {
    return null;
  }

  return (
    <details id={id} className="person-accordion">
      <summary className="person-accordion-summary">
        <span>{title}</span>
      </summary>
      <div className="person-accordion-body">{children}</div>
    </details>
  );
};

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

          {person.email || person.phone ? (
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

      <div className="person-accordion-list">
        <PersonAccordionSection id="about" title={t.personSectionAbout}>
          {renderRichTextBlock(person.bio, 'bio')}
        </PersonAccordionSection>

        <PersonAccordionSection id="subjects" title={t.personSectionSubjects}>
          {subjects.length ? (
            <div className="chip-row">
              {subjects.map((subject, idx) => (
                <span key={`${subject.title}-${idx}`} className="type-badge">{subject.title}</span>
              ))}
            </div>
          ) : null}
        </PersonAccordionSection>

        <PersonAccordionSection id="publications" title={t.personSectionPublications}>
          {renderRichTextBlock(publicationsText, 'pub')}
        </PersonAccordionSection>
      </div>
    </article>
  );
}
