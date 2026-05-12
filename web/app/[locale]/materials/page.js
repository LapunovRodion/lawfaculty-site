import { getMaterials } from '@/lib/content';
import { getLabels, normalizeLocale } from '@/lib/i18n';
import { getStrapiMediaUrl } from '@/lib/strapi';

const groupMaterialsByDepartment = (materials, fallbackTitle) => {
  const groups = new Map();

  for (const item of materials) {
    const department = item.department || null;
    const key = department?.id ? `department:${department.id}` : 'without-department';
    if (!groups.has(key)) {
      groups.set(key, {
        department,
        title: department?.title || fallbackTitle,
        items: [],
      });
    }
    groups.get(key).items.push(item);
  }

  return [...groups.values()];
};

export default async function MaterialsPage({ params }) {
  const locale = normalizeLocale(params.locale);
  const t = getLabels(locale);
  const materials = await getMaterials(locale, 100);
  const groups = groupMaterialsByDepartment(materials, t.materialsWithoutDepartment);

  return (
    <section className="section-shell">
      <div className="page-intro">
        <p className="kicker">{t.materials}</p>
        <h1>{t.materialsTitle}</h1>
        <p className="section-intro">{t.materialsIntro}</p>
      </div>
      {groups.length === 0 ? (
        <p className="empty-state">{t.materialsEmpty}</p>
      ) : (
        <div className="list-stack">
          {groups.map((group) => (
            <section key={group.department?.id || 'without-department'} className="list-item">
              <h2>{group.title}</h2>
              {group.department?.slug ? (
                <a className="meta-line" href={`/${locale}/departments/${group.department.slug}`}>
                  {t.materialsDepartmentLink}
                </a>
              ) : null}
              <div className="list-stack">
                {group.items.map((item) => {
                  const href = getStrapiMediaUrl(item.file?.url || item.file?.[0]?.url);
                  return (
                    <article key={item.id} className="list-item">
                      <h3>{item.title}</h3>
                      <p>{item.description || t.noDescription}</p>
                      {href ? (
                        <a className="button-secondary" href={href} target="_blank" rel="noreferrer">
                          {t.openFile}
                        </a>
                      ) : (
                        <span className="meta-line">{t.fileNotAttached}</span>
                      )}
                    </article>
                  );
                })}
              </div>
            </section>
          ))}
        </div>
      )}
    </section>
  );
}
