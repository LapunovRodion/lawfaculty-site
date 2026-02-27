import Link from 'next/link';
import { getDepartments } from '@/lib/content';
import { getLabels, normalizeLocale } from '@/lib/i18n';

export default async function DepartmentsPage({ params }) {
  const locale = normalizeLocale(params.locale);
  const t = getLabels(locale);
  const departments = await getDepartments(locale);

  return (
    <section className="section-shell">
      <div className="page-intro">
        <p className="kicker">{t.departments}</p>
        <h1>{t.departmentsTitle}</h1>
        <p className="section-intro">{t.departmentsIntro}</p>
      </div>
      {departments.length === 0 ? (
        <p className="empty-state">{t.departmentsEmpty}</p>
      ) : (
        <div className="card-grid">
          {departments.map((item) => (
            <article key={item.id} className="card">
              <h2>
                <Link className="card-title-link" href={`/${locale}/departments/${item.slug}`}>
                  {item.title}
                </Link>
              </h2>
              <p>{item.description || t.noDescription}</p>
              <p className="meta-line">{item.contacts || t.noContacts}</p>
              <Link className="inline-link" href={`/${locale}/departments/${item.slug}`}>
                {t.open}
              </Link>
            </article>
          ))}
        </div>
      )}
    </section>
  );
}
