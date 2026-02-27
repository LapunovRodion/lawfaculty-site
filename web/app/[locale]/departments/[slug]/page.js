import Link from 'next/link';
import { notFound } from 'next/navigation';
import { getDepartmentBySlug } from '@/lib/content';
import { getLabels, normalizeLocale } from '@/lib/i18n';
import { getStrapiMediaUrl, normalizeRichTextMediaHtml } from '@/lib/strapi';

const looksLikeHtml = (value) => /<\/?[a-z][\s\S]*>/i.test(String(value || ''));

export default async function DepartmentDetailPage({ params }) {
  const locale = normalizeLocale(params.locale);
  const t = getLabels(locale);
  const department = await getDepartmentBySlug(locale, params.slug);

  if (!department) {
    notFound();
  }

  return (
    <article className="section-shell">
      <div className="breadcrumbs">
        <Link href={`/${locale}`}>{t.home}</Link>
        <span>{t.breadcrumbsSeparator}</span>
        <Link href={`/${locale}/departments`}>{t.departments}</Link>
        <span>{t.breadcrumbsSeparator}</span>
        <span>{department.title}</span>
      </div>

      <div className="page-intro">
        <p className="kicker">{t.departments}</p>
        <h1>{department.title}</h1>
      </div>

      {department.description ? (
        looksLikeHtml(department.description) ? (
          <div
            className="prose-content"
            dangerouslySetInnerHTML={{ __html: normalizeRichTextMediaHtml(department.description) }}
          />
        ) : (
          <div className="prose-content">
            {String(department.description)
              .split(/\r?\n/)
              .filter(Boolean)
              .map((line, index) => (
                <p key={`${department.id}-${index}`}>{line}</p>
              ))}
          </div>
        )
      ) : (
        <p className="empty-state">{t.noDescription}</p>
      )}

      <section className="info-panel">
        <h2>{t.footerContacts}</h2>
        <p className="pre-line">{department.contacts || t.noContacts}</p>
      </section>

      <section className="section-shell">
        <div className="section-header">
          <h2>{t.departmentEmployeesTitle}</h2>
        </div>
        {department.persons?.length ? (
          <div className="department-employees">
            {department.persons.map((person) => {
              const departments = Array.isArray(person.departments) ? person.departments : [];
              const otherDepartments = departments.filter((item) => item?.slug !== department.slug);

              return (
                <details key={person.id} className="employee-accordion">
                  <summary>
                    <span className="employee-summary-main">{person.fullName}</span>
                    <span className="employee-summary-meta">{person.position || t.noPosition}</span>
                  </summary>
                  <div className="employee-accordion-body">
                    {person.photo?.url ? (
                      <img
                        className="employee-photo"
                        src={getStrapiMediaUrl(person.photo.url)}
                        alt={person.photo.alternativeText || person.fullName}
                      />
                    ) : null}
                    <div className="employee-accordion-content">
                      {person.slug ? (
                        <p>
                          <Link className="inline-link" href={`/${locale}/persons/${person.slug}`}>
                            {t.personProfileOpen}
                          </Link>
                        </p>
                      ) : null}
                      {person.bio ? (
                        looksLikeHtml(person.bio) ? (
                          <div
                            className="prose-content compact-prose"
                            dangerouslySetInnerHTML={{ __html: normalizeRichTextMediaHtml(person.bio) }}
                          />
                        ) : (
                          <p>{person.bio}</p>
                        )
                      ) : (
                        <p className="meta-line">{t.noDescription}</p>
                      )}
                      <p className="meta-line">
                        {otherDepartments.length
                          ? `${t.employeeDepartmentsLabel}: ${otherDepartments.map((item) => item.title).join(', ')}`
                          : t.departmentEmployeesSingleOnly}
                      </p>
                    </div>
                  </div>
                </details>
              );
            })}
          </div>
        ) : (
          <p className="empty-state">{t.departmentEmployeesEmpty}</p>
        )}
      </section>
    </article>
  );
}
