import { Manrope, Source_Serif_4 } from 'next/font/google';
import './globals.css';

const headingFont = Manrope({
  subsets: ['latin', 'cyrillic'],
  weight: ['500', '600', '700', '800'],
  variable: '--font-heading',
  display: 'swap',
});

const bodyFont = Source_Serif_4({
  subsets: ['latin', 'cyrillic'],
  weight: ['400', '500', '600', '700'],
  variable: '--font-body',
  display: 'swap',
});

export const metadata = {
  title: 'Law Faculty Portal',
  description: 'Public website for law faculty',
};

export default function RootLayout({ children }) {
  const themeBootScript = `
    (function () {
      try {
        var key = 'law-theme';
        var saved = localStorage.getItem(key);
        var isDark = saved ? saved === 'dark' : window.matchMedia('(prefers-color-scheme: dark)').matches;
        var theme = isDark ? 'dark' : 'light';
        document.documentElement.dataset.theme = theme;
        document.documentElement.style.colorScheme = theme;
      } catch (e) {}
    })();
  `;

  return (
    <html lang="ru" suppressHydrationWarning>
      <head>
        <script dangerouslySetInnerHTML={{ __html: themeBootScript }} />
      </head>
      <body className={`${headingFont.variable} ${bodyFont.variable}`}>{children}</body>
    </html>
  );
}
