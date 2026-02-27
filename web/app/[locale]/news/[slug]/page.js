import Link from 'next/link';
import { draftMode } from 'next/headers';
import { notFound } from 'next/navigation';
import { getNewsBySlug } from '@/lib/content';
import { getLabels, normalizeLocale } from '@/lib/i18n';
import { getStrapiMediaUrl, normalizeRichTextMediaHtml } from '@/lib/strapi';

const looksLikeHtml = (value) => /<\/?[a-z][\s\S]*>/i.test(String(value || ''));
const MARKDOWN_IMAGE_RE = /^!\[([^\]]*)\]\(([^)]+)\)$/;

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
  const publishedLabel = item.publishedAt || item.updatedAt
    ? new Date(item.publishedAt || item.updatedAt).toLocaleDateString(locale)
    : '';

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
    </article>
  );
}
