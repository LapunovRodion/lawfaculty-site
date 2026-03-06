const ensureBucketBaseUrl = (value, bucket, forcePathStyle) => {
  const raw = String(value || '').trim();
  if (!raw) {
    return raw;
  }

  const normalized = raw.replace(/\/+$/, '');
  if (!forcePathStyle || !bucket) {
    return normalized;
  }

  try {
    const url = new URL(normalized);
    const bucketPath = `/${bucket}`;

    if (url.pathname === bucketPath || url.pathname.startsWith(`${bucketPath}/`)) {
      return normalized;
    }

    url.pathname = `${url.pathname.replace(/\/+$/, '')}${bucketPath}`.replace(/\/{2,}/g, '/');
    return url.toString().replace(/\/+$/, '');
  } catch {
    return normalized;
  }
};

module.exports = ({ env }) => {
  const bucket = env('S3_BUCKET');
  const forcePathStyle = env.bool('S3_FORCE_PATH_STYLE', true);
  const baseUrl = ensureBucketBaseUrl(env('S3_PUBLIC_URL') || env('S3_ENDPOINT'), bucket, forcePathStyle);

  return ({
  i18n: {
    enabled: true,
    config: {
      locales: ['ru', 'be', 'en'],
      defaultLocale: 'ru',
    },
  },
  upload: {
    config: {
      sizeLimit: env.int('UPLOAD_MAX_FILE_SIZE_BYTES', 10 * 1024 * 1024),
      provider: 'aws-s3',
      providerOptions: {
        baseUrl,
        s3Options: {
          credentials: {
            accessKeyId: env('S3_ACCESS_KEY_ID'),
            secretAccessKey: env('S3_SECRET_ACCESS_KEY'),
          },
          region: env('S3_REGION', 'us-east-1'),
          endpoint: env('S3_ENDPOINT'),
          forcePathStyle,
          params: {
            Bucket: bucket,
          },
        },
      },
      actionOptions: {
        upload: {},
        uploadStream: {},
        delete: {},
      },
    },
  },
});
};
