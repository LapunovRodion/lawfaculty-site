'use client';

import { useState } from 'react';
import { signIn } from 'next-auth/react';
import { getLabels, normalizeLocale } from '@/lib/i18n';

const normalizeCallbackPath = (value, locale) => {
  const fallback = `/${locale}/portal`;
  const raw = String(value || '').trim();

  if (!raw || !raw.startsWith('/') || raw.startsWith('//')) {
    return fallback;
  }

  return raw;
};

const normalizeResultUrl = (value, fallback) => {
  const raw = String(value || '').trim();
  if (!raw) {
    return fallback;
  }

  try {
    const url = new URL(raw, window.location.origin);
    if (url.origin !== window.location.origin) {
      return fallback;
    }
    return `${url.pathname}${url.search}${url.hash}`;
  } catch {
    return fallback;
  }
};

export default function PortalLoginPage({ params, searchParams }) {
  const locale = normalizeLocale(params.locale);
  const t = getLabels(locale);
  const callbackUrl = normalizeCallbackPath(searchParams.next, locale);
  const [identifier, setIdentifier] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [pending, setPending] = useState(false);

  const handleSubmit = async (event) => {
    event.preventDefault();
    setPending(true);
    setError('');

    try {
      const result = await signIn('credentials', {
        identifier,
        password,
        redirect: false,
        callbackUrl,
      });

      if (!result || result.error) {
        setError(t.portalInvalidCredentials);
        return;
      }

      window.location.href = normalizeResultUrl(result.url, callbackUrl);
    } catch {
      setError(t.portalInvalidCredentials);
    } finally {
      setPending(false);
    }
  };

  return (
    <section className="portal-login">
      <h1>{t.portalLoginTitle}</h1>
      <p>{t.portalLoginHint}</p>

      <form className="portal-form" onSubmit={handleSubmit}>
        <label htmlFor="identifier">{t.portalIdentifier}</label>
        <input
          id="identifier"
          value={identifier}
          onChange={(event) => setIdentifier(event.target.value)}
          required
        />

        <label htmlFor="password">{t.portalPassword}</label>
        <input
          id="password"
          type="password"
          value={password}
          onChange={(event) => setPassword(event.target.value)}
          required
        />

        {error ? <p className="form-error">{error}</p> : null}

        <button type="submit" disabled={pending}>
          {pending ? t.portalSigningIn : t.portalSignIn}
        </button>
      </form>
    </section>
  );
}
