import CredentialsProvider from 'next-auth/providers/credentials';

const STRAPI_URL = (process.env.STRAPI_URL || 'http://localhost:1337').replace(/\/$/, '');

export const authOptions = {
  session: {
    strategy: 'jwt',
    maxAge: 30 * 24 * 60 * 60,
  },
  secret: process.env.NEXTAUTH_SECRET || 'dev-nextauth-secret-change-me',
  providers: [
    CredentialsProvider({
      name: 'Portal Credentials',
      credentials: {
        identifier: { label: 'Email or username', type: 'text' },
        password: { label: 'Password', type: 'password' },
      },
      async authorize(credentials) {
        const identifier = String(credentials?.identifier || '').trim();
        const password = String(credentials?.password || '');

        if (!identifier || !password) {
          return null;
        }

        const response = await fetch(`${STRAPI_URL}/api/auth/local`, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({ identifier, password }),
        });

        if (!response.ok) {
          return null;
        }

        const payload = await response.json();
        if (!payload?.jwt || !payload?.user?.id) {
          return null;
        }

        return {
          id: String(payload.user.id),
          name: payload.user.username || payload.user.email,
          email: payload.user.email || null,
          strapiJwt: payload.jwt,
        };
      },
    }),
  ],
  callbacks: {
    async jwt({ token, user }) {
      if (user?.strapiJwt) {
        token.strapiJwt = user.strapiJwt;
      }
      if (user?.id) {
        token.userId = user.id;
      }
      return token;
    },
    async session({ session, token }) {
      if (token?.strapiJwt) {
        session.strapiJwt = token.strapiJwt;
      }
      if (token?.userId && session.user) {
        session.user.id = token.userId;
      }
      return session;
    },
  },
};
