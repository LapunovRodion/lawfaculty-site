import Link from 'next/link';
import { redirect } from 'next/navigation';
import { getServerSession } from 'next-auth';
import { authOptions } from '@/lib/auth';
import { getLabels, normalizeLocale } from '@/lib/i18n';
import LogoutButton from './logout-button';

export default async function PortalProtectedLayout({ params, children }) {
  const locale = normalizeLocale(params.locale);
  const t = getLabels(locale);
  const session = await getServerSession(authOptions);
  if (!session?.strapiJwt) {
    redirect(`/${locale}/portal/login?next=/${locale}/portal`);
  }

  return (
    <div className="portal-shell">
      <header className="portal-header">
        <h1>{t.portalPersonal}</h1>
        <nav>
          <Link href={`/${locale}/portal`}>{t.portalMySubmissions}</Link>
          <Link href={`/${locale}/portal/new`}>{t.portalNewSubmission}</Link>
        </nav>
        <LogoutButton callbackUrl={`/${locale}`} label={t.portalLogout} />
      </header>
      {children}
    </div>
  );
}
