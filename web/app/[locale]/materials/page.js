import { getMaterials } from '@/lib/content';
import { getLabels, normalizeLocale } from '@/lib/i18n';
import { getStrapiMediaUrl } from '@/lib/strapi';

export default async function MaterialsPage({ params }) {
  const locale = normalizeLocale(params.locale);
  const t = getLabels(locale);
  const materials = await getMaterials(locale, 100);

  return (
    <section className="section-shell">
      <div className="page-intro">
        <p className="kicker">{t.materials}</p>
        <h1>{t.materialsTitle}</h1>
        <p className="section-intro">{t.materialsIntro}</p>
      </div>
      {materials.length === 0 ? (
        <p className="empty-state">{t.materialsEmpty}</p>
      ) : (
        <div className="list-stack">
          {materials.map((item) => {
            const href = getStrapiMediaUrl(item.file?.url || item.file?.[0]?.url);
            return (
              <article key={item.id} className="list-item">
                <h2>{item.title}</h2>
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
      )}
    </section>
  );
}
