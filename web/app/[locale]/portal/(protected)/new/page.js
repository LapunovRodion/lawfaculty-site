import Link from 'next/link';
import { redirect } from 'next/navigation';
import { getServerSession } from 'next-auth';
import { authOptions } from '@/lib/auth';
import { getLabels, getPortalTypeLabel, normalizeLocale } from '@/lib/i18n';
import { createEntry, uploadPortalFile, withOptionalSlug } from '@/lib/portal';

const TYPES = ['news', 'materials', 'schedules'];

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

export default async function PortalNewPage({ params, searchParams }) {
  const locale = normalizeLocale(params.locale);
  const t = getLabels(locale);
  const selectedType = TYPES.includes(searchParams.type) ? searchParams.type : 'news';
  const session = await getServerSession(authOptions);

  if (!session?.strapiJwt) {
    redirect(`/${locale}/portal/login?next=/${locale}/portal/new`);
  }

  async function createNewsAction(formData) {
    'use server';

    const actionSession = await getServerSession(authOptions);
    if (!actionSession?.strapiJwt) {
      redirect(`/${locale}/portal/login?next=/${locale}/portal/new?type=news`);
    }

    const title = String(formData.get('title') || '').trim();
    const excerpt = String(formData.get('excerpt') || '').trim();
    const content = String(formData.get('content') || '').trim();

    try {
      await createEntry(actionSession.strapiJwt, 'news', {
        title,
        ...withOptionalSlug(title),
        excerpt,
        content,
        locale,
      });
      redirect(`/${locale}/portal?ok=created`);
    } catch (error) {
      redirect(`/${locale}/portal/new?type=news&error=${encodeURIComponent(error.message)}`);
    }
  }

  async function createMaterialAction(formData) {
    'use server';

    const actionSession = await getServerSession(authOptions);
    if (!actionSession?.strapiJwt) {
      redirect(`/${locale}/portal/login?next=/${locale}/portal/new?type=materials`);
    }

    const title = String(formData.get('title') || '').trim();
    const description = String(formData.get('description') || '').trim();
    const file = formData.get('file');

    try {
      const fileId = await uploadPortalFile(actionSession.strapiJwt, file);
      await createEntry(actionSession.strapiJwt, 'materials', {
        title,
        ...withOptionalSlug(title),
        description,
        file: fileId,
        locale,
      });
      redirect(`/${locale}/portal?ok=created`);
    } catch (error) {
      redirect(`/${locale}/portal/new?type=materials&error=${encodeURIComponent(error.message)}`);
    }
  }

  async function createScheduleAction(formData) {
    'use server';

    const actionSession = await getServerSession(authOptions);
    if (!actionSession?.strapiJwt) {
      redirect(`/${locale}/portal/login?next=/${locale}/portal/new?type=schedules`);
    }

    const title = String(formData.get('title') || '').trim();
    const labelsRaw = String(formData.get('labels') || '');
    const file = formData.get('file');

    try {
      const fileId = await uploadPortalFile(actionSession.strapiJwt, file);
      await createEntry(actionSession.strapiJwt, 'schedules', {
        title,
        labels: parseLabels(labelsRaw),
        file: fileId,
        locale,
      });
      redirect(`/${locale}/portal?ok=created`);
    } catch (error) {
      redirect(`/${locale}/portal/new?type=schedules&error=${encodeURIComponent(error.message)}`);
    }
  }

  return (
    <section>
      <div className="portal-title-row">
        <h2>{t.portalCreateTitle}</h2>
        <Link href={`/${locale}/portal`}>{t.portalBackToList}</Link>
      </div>

      <div className="portal-type-tabs">
        {TYPES.map((item) => (
          <Link
            key={item}
            href={`/${locale}/portal/new?type=${item}`}
            className={item === selectedType ? 'active' : ''}
          >
            {getPortalTypeLabel(locale, item)}
          </Link>
        ))}
      </div>

      {searchParams.error ? <p className="form-error">{searchParams.error}</p> : null}

      {selectedType === 'news' ? (
        <form action={createNewsAction} className="portal-form">
          <label htmlFor="title">{t.portalLabelTitle}</label>
          <input id="title" name="title" required />

          <label htmlFor="excerpt">{t.portalLabelExcerpt}</label>
          <textarea id="excerpt" name="excerpt" rows={3} />

          <label htmlFor="content">{t.portalLabelContent}</label>
          <textarea id="content" name="content" rows={8} required />

          <button type="submit">{t.portalCreateNewsDraft}</button>
        </form>
      ) : null}

      {selectedType === 'materials' ? (
        <form action={createMaterialAction} className="portal-form">
          <label htmlFor="title">{t.portalLabelTitle}</label>
          <input id="title" name="title" required />

          <label htmlFor="description">{t.portalLabelDescription}</label>
          <textarea id="description" name="description" rows={5} />

          <label htmlFor="file">{t.portalLabelFile}</label>
          <input id="file" name="file" type="file" required />

          <button type="submit">{t.portalCreateMaterialDraft}</button>
        </form>
      ) : null}

      {selectedType === 'schedules' ? (
        <form action={createScheduleAction} className="portal-form">
          <label htmlFor="title">{t.portalLabelTitle}</label>
          <input id="title" name="title" required />

          <label htmlFor="labels">{t.portalLabelLabelsJson}</label>
          <textarea id="labels" name="labels" rows={4} placeholder='{"semester":"spring"}' />

          <label htmlFor="file">{t.portalLabelFile}</label>
          <input id="file" name="file" type="file" required />

          <button type="submit">{t.portalCreateScheduleDraft}</button>
        </form>
      ) : null}
    </section>
  );
}
