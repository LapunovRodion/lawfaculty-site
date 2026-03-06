const parseCsv = (raw) =>
  String(raw || '')
    .split(',')
    .map((value) => value.trim())
    .filter(Boolean);

module.exports = ({ env }) => {
  const corsOrigins = parseCsv(env('CORS_ORIGINS'));
  const uploadMaxFileSize = env.int('UPLOAD_MAX_FILE_SIZE_BYTES', 10 * 1024 * 1024);
  const defaultAdminAllowlist = '127.0.0.1,::1,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16';

  return [
    'strapi::logger',
    'strapi::errors',
    {
      name: 'global::admin-guard',
      config: {
        allowlist: parseCsv(env('ADMIN_ALLOWLIST', defaultAdminAllowlist)),
        accessHeader: 'x-admin-access-token',
        accessToken: env('ADMIN_ACCESS_TOKEN', ''),
      },
    },
    {
      name: 'global::audit-log',
      config: {
        enabled: env.bool('AUDIT_LOG_ENABLED', true),
        slowMs: env.int('AUDIT_LOG_SLOW_MS', 1500),
      },
    },
    'strapi::security',
    {
      name: 'strapi::cors',
      config: {
        origin: corsOrigins,
        credentials: true,
        keepHeaderOnError: true,
      },
    },
    'strapi::poweredBy',
    'strapi::query',
    {
      name: 'strapi::body',
      config: {
        jsonLimit: env('BODY_JSON_LIMIT', '2mb'),
        formLimit: env('BODY_FORM_LIMIT', '2mb'),
        textLimit: env('BODY_TEXT_LIMIT', '2mb'),
        formidable: {
          maxFileSize: uploadMaxFileSize,
        },
      },
    },
    'strapi::session',
    'strapi::favicon',
    'strapi::public',
  ];
};
