import Link from 'next/link';
import { draftMode } from 'next/headers';
import { notFound } from 'next/navigation';
import { getNewsBySlug } from '@/lib/content';
import { getLabels, normalizeLocale } from '@/lib/i18n';
import { getStrapiMediaUrl, normalizeRichTextMediaHtml } from '@/lib/strapi';

const looksLikeHtml = (value) => /<\/?[a-z][\s\S]*>/i.test(String(value || ''));
const MARKDOWN_IMAGE_RE = /^!\[([^\]]*)\]\(([^)]+)\)$/;
const getNewsDate = (item) => item.displayDate || item.publishedAt || item.updatedAt;

const renderTextContent = (raw, fallbackAlt) => {
  const lines = String(raw || '').split(/\r?\n/);
  const blocks = [];
  let listItems = [];

  const flushList = () => {
    if (listItems.length) {
      blocks.push(
        <ul key={`list-${blocks.length}`}>
          {listItems.map((item, idx) => (
            <li key={`${blocks.length}-${idx}`}>{item}</li>
          ))}
        </ul>
      );
      listItems = [];
    }
  };

  lines.forEach((line, idx) => {
    const trimmed = line.trim();
    if (!trimmed) {
      flushList();
      return;
    }

    const imageMatch = trimmed.match(MARKDOWN_IMAGE_RE);
    if (imageMatch) {
      flushList();
      blocks.push(
        <img
          key={`img-${idx}`}
          className="news-cover news-cover-large"
          src={getStrapiMediaUrl(imageMatch[2])}
          alt={imageMatch[1] || fallbackAlt}
        />
      );
      return;
    }

    if (trimmed.startsWith('- ')) {
      listItems.push(trimmed.slice(2).trim());
      return;
    }

    flushList();
    blocks.push(<p key={`p-${idx}`}>{trimmed}</p>);
  });

  flushList();
  return blocks;
};

export default async function NewsDetailPage({ params }) {
  const locale = normalizeLocale(params.locale);
  const t = getLabels(locale);
  const { isEnabled: isPreview } = draftMode();
  const item = await getNewsBySlug(locale, params.slug, {
    status: isPreview ? 'draft' : 'published',
    cacheMode: isPreview ? 'no-store' : undefined,
  });

  if (!item) {
    notFound();
  }
  const publishedLabel = getNewsDate(item) ? new Date(getNewsDate(item)).toLocaleDateString(locale) : '';

  return (
    <article className="prose-block">
      {isPreview ? (
        <p className="preview-banner">
          {t.previewMode}.{' '}
          <Link href={`/api/preview/disable?locale=${locale}`}>{t.leavePreview}</Link>
        </p>
      ) : null}
      <div className="breadcrumbs">
        <Link href={`/${locale}`}>{t.home}</Link>
        <span>{t.breadcrumbsSeparator}</span>
        <Link href={`/${locale}/news`}>{t.news}</Link>
        <span>{t.breadcrumbsSeparator}</span>
        <span>{item.title}</span>
      </div>
      <p className="meta-line">
        {t.newsMeta}
        {publishedLabel ? ` • ${publishedLabel}` : ''}
        {item.department?.title ? ` • ${t.newsDepartment}: ${item.department.title}` : ''}
      </p>
      <h1>{item.title}</h1>
      {item.cover?.url ? (
        <img
          className="news-cover news-cover-large"
          src={getStrapiMediaUrl(item.cover.url)}
          alt={item.cover.alternativeText || item.title}
        />
      ) : null}
      <p>{item.excerpt || t.noExcerpt}</p>
      {looksLikeHtml(item.content) ? (
        <div
          className="prose-content"
          dangerouslySetInnerHTML={{ __html: normalizeRichTextMediaHtml(item.content) }}
        />
      ) : (
        <div className="prose-content">{renderTextContent(item.content, item.title)}</div>
      )}
      {item.gallery?.length ? (
        <section className="news-extra-section">
          <h2>{t.newsGallery}</h2>
          <div className="news-gallery-grid">
            {item.gallery.map((image) => (
              <img
                key={image.id || image.url}
                className="news-cover"
                src={getStrapiMediaUrl(image.url)}
                alt={image.alternativeText || item.title}
              />
            ))}
          </div>
        </section>
      ) : null}
      {item.attachments?.length ? (
        <section className="news-extra-section">
          <h2>{t.newsAttachments}</h2>
          <ul>
            {item.attachments.map((file) => (
              <li key={file.id || file.url}>
                <a href={getStrapiMediaUrl(file.url)}>{file.name || file.alternativeText || file.url}</a>
              </li>
            ))}
          </ul>
        </section>
      ) : null}
    </article>
  );
}
