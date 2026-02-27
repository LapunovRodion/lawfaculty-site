'use client';

import { useEffect, useState } from 'react';
import { getLabels, normalizeLocale } from '@/lib/i18n';

const THEME_KEY = 'law-theme';

const applyTheme = (theme) => {
  const root = document.documentElement;
  root.dataset.theme = theme;
  root.style.colorScheme = theme === 'dark' ? 'dark' : 'light';
};

const getPreferredTheme = () => {
  if (typeof window === 'undefined') {
    return 'light';
  }

  const saved = window.localStorage.getItem(THEME_KEY);
  if (saved === 'light' || saved === 'dark') {
    return saved;
  }

  return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
};

export default function ThemeToggle({ locale }) {
  const normalizedLocale = normalizeLocale(locale);
  const t = getLabels(normalizedLocale);
  const [theme, setTheme] = useState('light');

  useEffect(() => {
    const nextTheme = getPreferredTheme();
    setTheme(nextTheme);
    applyTheme(nextTheme);
  }, []);

  const toggleTheme = () => {
    const nextTheme = theme === 'dark' ? 'light' : 'dark';
    setTheme(nextTheme);
    applyTheme(nextTheme);
    window.localStorage.setItem(THEME_KEY, nextTheme);
  };

  const nextLabel = theme === 'dark' ? t.themeToLight : t.themeToDark;

  return (
    <button
      type="button"
      className="utility-link theme-toggle"
      onClick={toggleTheme}
      aria-label={`${t.themeToggle}: ${nextLabel}`}
      title={`${t.themeToggle}: ${nextLabel}`}
    >
      {t.themeToggle}: {nextLabel}
    </button>
  );
}
