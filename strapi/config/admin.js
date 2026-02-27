module.exports = ({ env }) => ({
  preview: {
    enabled: env.bool('PREVIEW_ENABLED', true),
    config: {
      allowedOrigins: env.array('PREVIEW_ALLOWED_ORIGINS', [env('PREVIEW_FRONTEND_URL', 'http://localhost:3000')]),
      handler: async (uid, params = {}) => {
        const frontendUrl = env('PREVIEW_FRONTEND_URL', 'http://localhost:3000').replace(/\/$/, '');
        const secret = env('PREVIEW_SECRET', '');

        if (!secret) {
          return null;
        }

        const locale = params.locale || 'ru';
        const status = params.status || 'draft';
        const documentId = params.documentId;

        if (!documentId) {
          return null;
        }

        const query = new URLSearchParams({
          secret,
          uid,
          documentId,
          locale,
          status,
        });

        return `${frontendUrl}/api/preview?${query.toString()}`;
      },
    },
  },
  auth: {
    secret: env('ADMIN_JWT_SECRET'),
  },
  apiToken: {
    salt: env('API_TOKEN_SALT'),
  },
  transfer: {
    token: {
      salt: env('TRANSFER_TOKEN_SALT'),
    },
  },
  secrets: {
    encryptionKey: env('ENCRYPTION_KEY'),
  },
  flags: {
    nps: env.bool('FLAG_NPS', true),
    promoteEE: env.bool('FLAG_PROMOTE_EE', true),
  },
});
