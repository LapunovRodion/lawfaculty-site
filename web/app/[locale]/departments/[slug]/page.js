import Link from 'next/link';
import { notFound } from 'next/navigation';
import { getDepartmentBySlug } from '@/lib/content';
import { getLabels, normalizeLocale } from '@/lib/i18n';
import { getStrapiMediaUrl, normalizeRichTextMediaHtml } from '@/lib/strapi';

const looksLikeHtml = (value) => /<\/?[a-z][\s\S]*>/i.test(String(value || ''));
const hasValue = (value) => value !== null && value !== undefined && String(value).trim() !== '';

const stripHtml = (value) =>
  String(value || '')
    .replace(/<br\s*\/?>/gi, ' ')
    .replace(/<\/p>/gi, ' ')
    .replace(/<[^>]+>/g, ' ')
    .replace(/\s+/g, ' ')
    .trim();

const renderRichBlock = (value, emptyContent = null, className = 'prose-content') => {
  if (!hasValue(value)) {
    return emptyContent;
  }

  if (looksLikeHtml(value)) {
    return (
      <div
        className={className}
        dangerouslySetInnerHTML={{ __html: normalizeRichTextMediaHtml(value) }}
      />
    );
  }

  return (
    <div className={className}>
      {String(value)
        .split(/\r?\n/)
        .filter(Boolean)
        .map((line, index) => (
          <p key={`${line}-${index}`}>{line}</p>
        ))}
    </div>
  );
};

const buildFallbackFacts = (department, t, head) => {
  const facts = [];

  if (head?.fullName) {
    facts.push({ label: t.departmentFactHead, value: head.fullName });
  }

  if (department.persons?.length) {
    facts.push({ label: t.departmentFactStaffCount, value: String(department.persons.length) });
  }

  if (department.office) {
    facts.push({ label: t.departmentFactOffice, value: department.office });
  }

  return facts;
};

const buildContactItems = (department, t) => {
  const items = [];

  if (department.address) {
    items.push({ label: t.departmentContactAddress, value: department.address });
  }
  if (department.office) {
    items.push({ label: t.departmentContactOffice, value: department.office });
  }
  if (department.phone) {
    items.push({ label: t.departmentContactPhone, value: department.phone, href: `tel:${department.phone}` });
  }
  if (department.email) {
    items.push({ label: t.departmentContactEmail, value: department.email, href: `mailto:${department.email}` });
  }

  return items;
};

export default async function DepartmentDetailPage({ params }) {
  const locale = normalizeLocale(params.locale);
  const t = getLabels(locale);
  const department = await getDepartmentBySlug(locale, params.slug);

  if (!department) {
    notFound();
  }

  const head = (department.persons || []).find((person) => person?.isHead) || null;
  const staff = head
    ? department.persons.filter((person) => person?.id !== head.id)
    : department.persons || [];
  const heroImage = getStrapiMediaUrl(department.heroImage?.url);
  const contactItems = buildContactItems(department, t);
  const aboutContent = department.history || department.description;
  const extraSections = Array.isArray(department.extraSections) ? department.extraSections : [];
  const overview =
    department.overview ||
    stripHtml(department.history || department.description).slice(0, 260) ||
    t.departmentsIntro;
  const facts = department.keyFacts?.length
    ? department.keyFacts.filter((item) => hasValue(item?.label) && hasValue(item?.value))
    : buildFallbackFacts(department, t, head);

  return (
    <article className="department-page">
      <div className="breadcrumbs">
        <Link href={`/${locale}`}>{t.home}</Link>
        <span>{t.breadcrumbsSeparator}</span>
        <Link href={`/${locale}/departments`}>{t.departments}</Link>
        <span>{t.breadcrumbsSeparator}</span>
        <span>{department.title}</span>
      </div>

      <section className="department-hero department-hero-simple">
        <div className="department-hero-copy">
          <p className="kicker">{t.departments}</p>
          <h1>{department.title}</h1>
          {hasValue(department.tagline) ? <p className="department-tagline">{department.tagline}</p> : null}
          <p className="department-overview">{overview}</p>

          {facts.length ? (
            <div className="department-facts-grid">
              {facts.map((item, index) => (
                <div key={`${item.label}-${index}`} className="department-fact-card">
                  <span>{item.label}</span>
                  <strong>{item.value}</strong>
                </div>
              ))}
            </div>
          ) : null}

          <div className="department-hero-actions">
            {department.email ? (
              <a className="button-primary" href={`mailto:${department.email}`}>
                {t.departmentContactAction}
              </a>
            ) : null}
            {department.persons?.length ? (
              <a className="button-secondary" href="#department-staff">
                {t.departmentEmployeesTitle}
              </a>
            ) : null}
          </div>
        </div>

        <div className="department-hero-side">
          <div className="department-hero-visual department-hero-visual-compact">
            {heroImage ? (
              <img
                className="department-hero-image department-hero-image-compact"
                src={heroImage}
                alt={department.heroImage?.alternativeText || department.title}
              />
            ) : (
              <div className="department-hero-placeholder department-hero-image-compact">
                {department.title.slice(0, 1)}
              </div>
            )}
          </div>

          {contactItems.length || hasValue(department.contacts) ? (
            <aside className="department-contact-card">
              <div className="section-header">
                <h2>{t.footerContacts}</h2>
              </div>
              {contactItems.length ? (
                <div className="department-contact-list">
                  {contactItems.map((item) => (
                    <div key={item.label} className="department-contact-item">
                      <span>{item.label}</span>
                      {item.href ? <a href={item.href}>{item.value}</a> : <strong>{item.value}</strong>}
                    </div>
                  ))}
                </div>
              ) : (
                <p className="pre-line">{department.contacts}</p>
              )}
            </aside>
          ) : null}
        </div>
      </section>

      <div className="department-main-column">
        {hasValue(aboutContent) ? (
          <section className="department-section-card">
            <div className="section-header">
              <h2>{t.departmentSectionAbout}</h2>
            </div>
            {renderRichBlock(aboutContent)}
          </section>
        ) : null}

        {hasValue(department.teachingSummary) ? (
          <section className="department-section-card">
            <div className="section-header">
              <h2>{t.departmentSectionTeaching}</h2>
            </div>
            {renderRichBlock(department.teachingSummary)}
          </section>
        ) : null}

        {hasValue(department.researchSummary) ? (
          <section className="department-section-card">
            <div className="section-header">
              <h2>{t.departmentSectionResearch}</h2>
            </div>
            {renderRichBlock(department.researchSummary)}
          </section>
        ) : null}

        {department.disciplines?.length ? (
          <section className="department-section-card">
            <div className="section-header">
              <h2>{t.departmentSectionDisciplines}</h2>
            </div>
            <div className="department-discipline-grid">
              {department.disciplines.map((item, index) => (
                <article key={`${item.title}-${index}`} className="department-discipline-card">
                  <h3>{item.title}</h3>
                  {hasValue(item.details) ? <p>{item.details}</p> : null}
                </article>
              ))}
            </div>
          </section>
        ) : null}

        {head || hasValue(department.headNote) ? (
          <section className="department-section-card department-head-card">
            <div className="section-header">
              <h2>{t.departmentSectionHead}</h2>
            </div>

            {head ? (
              <div className="department-head-person">
                {head.photo?.url ? (
                  <img
                    className="department-head-photo"
                    src={getStrapiMediaUrl(head.photo.url)}
                    alt={head.photo.alternativeText || head.fullName}
                  />
                ) : (
                  <div className="department-head-photo department-head-photo-placeholder">
                    {head.fullName?.slice(0, 1)}
                  </div>
                )}
                <div className="department-head-copy">
                  <h3>{head.fullName}</h3>
                  <p className="meta-line">{head.position || head.roleInDepartment || t.noPosition}</p>
                  {head.slug ? (
                    <Link className="inline-link" href={`/${locale}/persons/${head.slug}`}>
                      {t.personProfileOpen}
                    </Link>
                  ) : null}
                </div>
              </div>
            ) : null}

            {hasValue(department.headNote)
              ? renderRichBlock(department.headNote, null, 'prose-content compact-prose')
              : null}
          </section>
        ) : null}

        {department.usefulLinks?.length ? (
          <section className="department-section-card">
            <div className="section-header">
              <h2>{t.departmentSectionLinks}</h2>
            </div>
            <div className="department-resource-list">
              {department.usefulLinks.map((item, index) => (
                <a
                  key={`${item.title}-${index}`}
                  className="department-resource-card"
                  href={item.url}
                  target="_blank"
                  rel="noreferrer"
                >
                  <h3>{item.title}</h3>
                  {hasValue(item.description) ? <p>{item.description}</p> : null}
                </a>
              ))}
            </div>
          </section>
        ) : null}

        {department.documents?.length ? (
          <section className="department-section-card">
            <div className="section-header">
              <h2>{t.departmentSectionDocuments}</h2>
            </div>
            <div className="department-resource-list">
              {department.documents.map((item, index) => {
                const fileUrl = getStrapiMediaUrl(item.file?.url);

                return (
                  <a
                    key={`${item.title}-${index}`}
                    className="department-resource-card"
                    href={fileUrl || '#'}
                    target={fileUrl ? '_blank' : undefined}
                    rel={fileUrl ? 'noreferrer' : undefined}
                  >
                    <h3>{item.title}</h3>
                    {hasValue(item.description) ? <p>{item.description}</p> : null}
                    <span className="inline-link">{fileUrl ? t.openFile : t.fileNotAttached}</span>
                  </a>
                );
              })}
            </div>
          </section>
        ) : null}

        {extraSections.length
          ? extraSections.map((section, index) => (
              <section key={`${section.__component}-${index}`} className="department-section-card">
                <div className="section-header">
                  <h2>{section.title}</h2>
                </div>
                {renderRichBlock(section.content)}
              </section>
            ))
          : null}
      </div>

      <section id="department-staff" className="department-section-card">
        <div className="section-header">
          <h2>{t.departmentEmployeesTitle}</h2>
        </div>
        {department.persons?.length ? (
          <div className="department-staff-grid">
            {(head ? [head, ...staff] : staff).map((person) => (
              <article
                key={person.id}
                className={`department-staff-card${person.isHead ? ' department-staff-card-head' : ''}`}
              >
                <div className="department-staff-top">
                  {person.photo?.url ? (
                    <img
                      className="department-staff-photo"
                      src={getStrapiMediaUrl(person.photo.url)}
                      alt={person.photo.alternativeText || person.fullName}
                    />
                  ) : (
                    <div className="department-staff-photo department-staff-photo-placeholder">
                      {person.fullName?.slice(0, 1)}
                    </div>
                  )}

                  <div className="department-staff-copy">
                    <h3>{person.fullName}</h3>
                    <p className="meta-line">{person.position || person.roleInDepartment || t.noPosition}</p>
                    <div className="chip-row">
                      {person.academicDegree ? <span className="type-badge">{person.academicDegree}</span> : null}
                      {person.academicTitle ? <span className="type-badge">{person.academicTitle}</span> : null}
                      {person.isHead ? <span className="type-badge">{t.departmentFactHead}</span> : null}
                    </div>
                  </div>
                </div>

                <div className="department-staff-actions">
                  {person.email ? (
                    <a className="inline-link" href={`mailto:${person.email}`}>
                      {person.email}
                    </a>
                  ) : null}
                  {person.slug ? (
                    <Link className="inline-link" href={`/${locale}/persons/${person.slug}`}>
                      {t.personProfileOpen}
                    </Link>
                  ) : null}
                </div>
              </article>
            ))}
          </div>
        ) : (
          <p className="empty-state">{t.departmentEmployeesEmpty}</p>
        )}
      </section>
    </article>
  );
}
