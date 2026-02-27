import Link from 'next/link';
import { notFound } from 'next/navigation';
import { LOCALES, getLabels, normalizeLocale } from '@/lib/i18n';
import LocaleSwitcher from './locale-switcher';
import ThemeToggle from './theme-toggle';

export default function LocaleLayout({ children, params }) {
  const locale = normalizeLocale(params.locale);
  if (!LOCALES.includes(locale)) {
    notFound();
  }

  const t = getLabels(locale);
  const year = new Date().getFullYear();

  return (
    <div className="page-shell">
      <header className="site-header">
        <div className="header-utility">
          <div className="utility-links">
            <Link className="utility-link" href={`/${locale}/materials`}>
              {t.utilityApplicants}
            </Link>
            <Link className="utility-link" href={`/${locale}/search`}>
              {t.utilityStudents}
            </Link>
            <Link className="utility-link" href={`/${locale}/portal`}>
              {t.utilityStaff}
            </Link>
          </div>
          <div className="utility-actions">
            <ThemeToggle locale={locale} />
            <LocaleSwitcher locale={locale} />
          </div>
        </div>
        <div className="header-main">
          <Link href={`/${locale}`} className="brand">
            <img className="brand-logo" src="/main/logo-transparent.png" alt="" aria-hidden="true" />
            <span className="brand-text">
              <span className="brand-name">{t.brand}</span>
              <span className="brand-subtitle">{t.footerAbout}</span>
            </span>
          </Link>
          <nav className="main-nav">
            <Link href={`/${locale}`}>{t.home}</Link>
            <Link href={`/${locale}/news`}>{t.news}</Link>
            <Link href={`/${locale}/materials`}>{t.materials}</Link>
            <Link href={`/${locale}/departments`}>{t.departments}</Link>
            <Link href={`/${locale}/persons`}>{t.persons}</Link>
            <Link href={`/${locale}/search`}>{t.search}</Link>
            <Link href={`/${locale}/portal`}>{t.portal}</Link>
          </nav>
        </div>
      </header>
      <main className="page-main">{children}</main>
      <footer className="site-footer">
        <div className="footer-grid">
          <section className="footer-block">
            <h3>{t.footerAbout}</h3>
            <p>{t.heroSubtitle}</p>
          </section>
          <section className="footer-block">
            <h3>{t.footerNav}</h3>
            <Link href={`/${locale}/news`}>{t.news}</Link>
            <Link href={`/${locale}/materials`}>{t.materials}</Link>
            <Link href={`/${locale}/departments`}>{t.departments}</Link>
            <Link href={`/${locale}/persons`}>{t.persons}</Link>
          </section>
          <section className="footer-block">
            <h3>{t.footerContacts}</h3>
            <p>{t.footerAddress}</p>
            <p>{t.footerPhone}</p>
            <a href={`mailto:${t.footerEmail}`}>{t.footerEmail}</a>
          </section>
          <section className="footer-block">
            <h3>{t.footerInfo}</h3>
            <a href="#">{t.footerPolicy}</a>
            <a href="#">{t.footerAccessibility}</a>
          </section>
        </div>
        <p className="footer-copy">{year} {t.footerAbout}</p>
      </footer>
    </div>
  );
}
