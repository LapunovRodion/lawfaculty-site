import Link from 'next/link';
import { notFound } from 'next/navigation';
import { getPageBySlug } from '@/lib/content';
import { getLabels, normalizeLocale } from '@/lib/i18n';
import { normalizeRichTextMediaHtml } from '@/lib/strapi';

const looksLikeHtml = (value) => /<\/?[a-z][\s\S]*>/i.test(String(value || ''));

export default async function GenericPage({ params }) {
  const locale = normalizeLocale(params.locale);
  const t = getLabels(locale);
  const page = await getPageBySlug(locale, params.slug);

  if (!page) {
    notFound();
  }

  return (
    <article className="section-shell prose-block">
      <div className="breadcrumbs">
        <Link href={`/${locale}`}>{t.home}</Link>
        <span>{t.breadcrumbsSeparator}</span>
        <span>{page.title}</span>
      </div>

      <h1>{page.title}</h1>

      {looksLikeHtml(page.content) ? (
        <div
          className="prose-content"
          dangerouslySetInnerHTML={{ __html: normalizeRichTextMediaHtml(page.content) }}
        />
      ) : (
        <div className="prose-content">
          {String(page.content || '')
            .split(/\r?\n/)
            .filter(Boolean)
            .map((line, index) => (
              <p key={`${page.slug || page.id}-${index}`}>{line}</p>
            ))}
        </div>
      )}
    </article>
  );
}
