'use client';

import { signOut } from 'next-auth/react';

export default function LogoutButton({ callbackUrl, label }) {
  return (
    <button
      type="button"
      className="logout-button"
      onClick={() => signOut({ callbackUrl })}
    >
      {label}
    </button>
  );
}
