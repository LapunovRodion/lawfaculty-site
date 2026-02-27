'use client';

import { useState } from 'react';
import { signIn } from 'next-auth/react';
import { getLabels, normalizeLocale } from '@/lib/i18n';

export default function PortalLoginPage({ params, searchParams }) {
  const locale = normalizeLocale(params.locale);
  const t = getLabels(locale);
  const callbackUrl = searchParams.next || `/${locale}/portal`;
  const [identifier, setIdentifier] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [pending, setPending] = useState(false);

  const handleSubmit = async (event) => {
    event.preventDefault();
    setPending(true);
    setError('');

    const result = await signIn('credentials', {
      identifier,
      password,
      redirect: false,
      callbackUrl,
    });

    if (!result || result.error) {
      setError(t.portalInvalidCredentials);
      setPending(false);
      return;
    }

    window.location.href = result.url || callbackUrl;
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
