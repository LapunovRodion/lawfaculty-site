import Link from 'next/link';
import { notFound, redirect } from 'next/navigation';
import { getServerSession } from 'next-auth';
import { authOptions } from '@/lib/auth';
import {
  getLabels,
  getPortalStatusLabel,
  getPortalTypeLabel,
  normalizeLocale,
} from '@/lib/i18n';
import { getMyEntry, submitEntry, updateEntry, uploadPortalFile, withOptionalSlug } from '@/lib/portal';

const TYPES = ['news', 'materials', 'schedules'];
const LOCKED_STATUSES = new Set(['submitted', 'approved', 'rejected', 'published']);

const parseLabels = (raw) => {
  const value = String(raw || '').trim();
  if (!value) {
    return {};
  }

  try {
    return JSON.parse(value);
  } catch {
    return { note: value };
  }
};

export default async function PortalEditPage({ params, searchParams }) {
  const locale = normalizeLocale(params.locale);
  const t = getLabels(locale);
  const type = params.type;
  const id = params.id;

  if (!TYPES.includes(type)) {
    notFound();
  }

  const session = await getServerSession(authOptions);
  if (!session?.strapiJwt) {
    redirect(`/${locale}/portal/login?next=/${locale}/portal/${type}/${id}`);
  }

  let entry;
  try {
    entry = await getMyEntry(session.strapiJwt, type, id);
  } catch {
    notFound();
  }

  const locked = LOCKED_STATUSES.has(entry.submissionStatus);

  async function updateAction(formData) {
    'use server';

    const actionSession = await getServerSession(authOptions);
    if (!actionSession?.strapiJwt) {
      redirect(`/${locale}/portal/login?next=/${locale}/portal/${type}/${id}`);
    }

    try {
      if (type === 'news') {
        const title = String(formData.get('title') || '').trim();
        await updateEntry(actionSession.strapiJwt, type, id, {
          title,
          ...withOptionalSlug(title),
          excerpt: String(formData.get('excerpt') || '').trim(),
          content: String(formData.get('content') || '').trim(),
          locale,
        });
      }

      if (type === 'materials') {
        const title = String(formData.get('title') || '').trim();
        const payload = {
          title,
          ...withOptionalSlug(title),
          description: String(formData.get('description') || '').trim(),
          locale,
        };

        const file = formData.get('file');
        if (file && file.size) {
          payload.file = await uploadPortalFile(actionSession.strapiJwt, file);
        } else if (entry.file?.id) {
          payload.file = entry.file.id;
        }

        await updateEntry(actionSession.strapiJwt, type, id, payload);
      }

      if (type === 'schedules') {
        const payload = {
          title: String(formData.get('title') || '').trim(),
          labels: parseLabels(formData.get('labels')),
          locale,
        };

        const file = formData.get('file');
        if (file && file.size) {
          payload.file = await uploadPortalFile(actionSession.strapiJwt, file);
        } else if (entry.file?.id) {
          payload.file = entry.file.id;
        }

        await updateEntry(actionSession.strapiJwt, type, id, payload);
      }

      redirect(`/${locale}/portal/${type}/${id}?ok=saved`);
    } catch (error) {
      redirect(`/${locale}/portal/${type}/${id}?error=${encodeURIComponent(error.message)}`);
    }
  }

  async function submitAction() {
    'use server';

    const actionSession = await getServerSession(authOptions);
    if (!actionSession?.strapiJwt) {
      redirect(`/${locale}/portal/login?next=/${locale}/portal/${type}/${id}`);
    }

    try {
      await submitEntry(actionSession.strapiJwt, type, id);
      redirect(`/${locale}/portal?ok=submitted`);
    } catch (error) {
      redirect(`/${locale}/portal/${type}/${id}?error=${encodeURIComponent(error.message)}`);
    }
  }

  return (
    <section>
      <div className="portal-title-row">
        <h2>
          {t.portalEditTitle} {getPortalTypeLabel(locale, type)} #{entry.id}
        </h2>
        <Link href={`/${locale}/portal`}>{t.portalBack}</Link>
      </div>

      <p className={`status-chip status-${entry.submissionStatus}`}>
        {getPortalStatusLabel(locale, entry.submissionStatus)}
      </p>
      {entry.moderatorComment ? (
        <p>
          {t.portalModeratorComment}: {entry.moderatorComment}
        </p>
      ) : null}
      {searchParams.ok ? <p className="form-success">{t.portalSaved}</p> : null}
      {searchParams.error ? <p className="form-error">{searchParams.error}</p> : null}

      <form action={updateAction} className="portal-form">
        {type === 'news' ? (
          <>
            <label htmlFor="title">{t.portalLabelTitle}</label>
            <input id="title" name="title" defaultValue={entry.title || ''} required disabled={locked} />

            <label htmlFor="excerpt">{t.portalLabelExcerpt}</label>
            <textarea
              id="excerpt"
              name="excerpt"
              rows={3}
              defaultValue={entry.excerpt || ''}
              disabled={locked}
            />

            <label htmlFor="content">{t.portalLabelContent}</label>
            <textarea
              id="content"
              name="content"
              rows={8}
              defaultValue={entry.content || ''}
              required
              disabled={locked}
            />
          </>
        ) : null}

        {type === 'materials' ? (
          <>
            <label htmlFor="title">{t.portalLabelTitle}</label>
            <input id="title" name="title" defaultValue={entry.title || ''} required disabled={locked} />

            <label htmlFor="description">{t.portalLabelDescription}</label>
            <textarea
              id="description"
              name="description"
              rows={5}
              defaultValue={entry.description || ''}
              disabled={locked}
            />

            <label htmlFor="file">{t.portalLabelReplaceFile}</label>
            <input id="file" name="file" type="file" disabled={locked} />
            {entry.file?.name ? (
              <p className="meta-line">
                {t.portalCurrentFile}: {entry.file.name}
              </p>
            ) : null}
          </>
        ) : null}

        {type === 'schedules' ? (
          <>
            <label htmlFor="title">{t.portalLabelTitle}</label>
            <input id="title" name="title" defaultValue={entry.title || ''} required disabled={locked} />

            <label htmlFor="labels">{t.portalLabelLabelsJson}</label>
            <textarea
              id="labels"
              name="labels"
              rows={4}
              defaultValue={entry.labels ? JSON.stringify(entry.labels, null, 2) : ''}
              disabled={locked}
            />

            <label htmlFor="file">{t.portalLabelReplaceFile}</label>
            <input id="file" name="file" type="file" disabled={locked} />
            {entry.file?.name ? (
              <p className="meta-line">
                {t.portalCurrentFile}: {entry.file.name}
              </p>
            ) : null}
          </>
        ) : null}

        <button type="submit" disabled={locked}>
          {t.portalSaveChanges}
        </button>
      </form>

      <form action={submitAction} className="portal-submit-form">
        <button type="submit" disabled={locked || entry.submissionStatus === 'submitted'}>
          {t.portalSubmitModeration}
        </button>
      </form>
    </section>
  );
}
