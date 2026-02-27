import Link from 'next/link';
import { redirect } from 'next/navigation';
import { getServerSession } from 'next-auth';
import { authOptions } from '@/lib/auth';
import { getLabels, getPortalStatusLabel, getPortalTypeLabel, normalizeLocale } from '@/lib/i18n';
import { listMyEntries, submitEntry } from '@/lib/portal';

const canSubmit = (status) => status === 'draft' || status === 'needs_changes';

export default async function PortalListPage({ params, searchParams }) {
  const locale = normalizeLocale(params.locale);
  const t = getLabels(locale);
  const session = await getServerSession(authOptions);

  if (!session?.strapiJwt) {
    redirect(`/${locale}/portal/login?next=/${locale}/portal`);
  }

  async function submitAction(formData) {
    'use server';

    const actionSession = await getServerSession(authOptions);
    if (!actionSession?.strapiJwt) {
      redirect(`/${locale}/portal/login?next=/${locale}/portal`);
    }

    const type = String(formData.get('type') || '');
    const id = String(formData.get('id') || '');

    try {
      await submitEntry(actionSession.strapiJwt, type, id);
      redirect(`/${locale}/portal?ok=submitted`);
    } catch (error) {
      redirect(`/${locale}/portal?error=${encodeURIComponent(error.message)}`);
    }
  }

  const rows = await listMyEntries(session.strapiJwt, 200);

  return (
    <section>
      <div className="portal-title-row">
        <h2>{t.portalMySubmissions}</h2>
        <Link href={`/${locale}/portal/new`} className="primary-link">
          {t.portalCreateNew}
        </Link>
      </div>

      {searchParams.ok ? <p className="form-success">{t.portalActionDone}</p> : null}
      {searchParams.error ? <p className="form-error">{searchParams.error}</p> : null}

      {rows.length === 0 ? (
        <p className="empty-state">{t.portalNoSubmissions}</p>
      ) : (
        <div className="list-stack">
          {rows.map((item) => (
            <article key={`${item.type}-${item.id}`} className="list-item portal-item">
              <p className="meta-line">
                {getPortalTypeLabel(locale, item.type)} #{item.id}
              </p>
              <h3>{item.title || t.portalUntitled}</h3>
              <p className={`status-chip status-${item.submissionStatus}`}>
                {getPortalStatusLabel(locale, item.submissionStatus)}
              </p>
              {item.moderatorComment ? (
                <p>
                  {t.portalModerator}: {item.moderatorComment}
                </p>
              ) : null}
              <div className="portal-actions">
                <Link href={`/${locale}/portal/${item.type}/${item.id}`}>{t.portalEdit}</Link>
                {canSubmit(item.submissionStatus) ? (
                  <form action={submitAction}>
                    <input type="hidden" name="type" value={item.type} />
                    <input type="hidden" name="id" value={item.id} />
                    <button type="submit">{t.portalSubmit}</button>
                  </form>
                ) : (
                  <span className="meta-line">{t.portalLocked}</span>
                )}
              </div>
            </article>
          ))}
        </div>
      )}
    </section>
  );
}
