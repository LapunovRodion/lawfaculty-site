import Link from 'next/link';
import { getPersons } from '@/lib/content';
import { getLabels, normalizeLocale } from '@/lib/i18n';

const getPersonDepartments = (item) => {
  if (Array.isArray(item.departments) && item.departments.length) {
    return item.departments;
  }
  return item.department ? [item.department] : [];
};

export default async function PersonsPage({ params }) {
  const locale = normalizeLocale(params.locale);
  const t = getLabels(locale);
  const persons = await getPersons(locale);

  return (
    <section className="section-shell">
      <div className="page-intro">
        <p className="kicker">{t.persons}</p>
        <h1>{t.personsTitle}</h1>
        <p className="section-intro">{t.personsIntro}</p>
      </div>
      {persons.length === 0 ? (
        <p className="empty-state">{t.personsEmpty}</p>
      ) : (
        <div className="list-stack">
          {persons.map((item) => (
            <article key={item.id} className="list-item">
              <h2>
                <Link className="card-title-link" href={`/${locale}/persons/${item.slug}`}>
                  {item.fullName}
                </Link>
              </h2>
              <p>{item.position || t.noPosition}</p>
              <p className="meta-line">
                {getPersonDepartments(item).map((department) => department?.title).filter(Boolean).join(', ')
                  || t.noDepartment}
              </p>
              <Link className="inline-link" href={`/${locale}/persons/${item.slug}`}>
                {t.open}
              </Link>
            </article>
          ))}
        </div>
      )}
    </section>
  );
}
