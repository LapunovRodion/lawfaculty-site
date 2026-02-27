'use strict';

const normalizeIp = (value) => {
  const raw = String(value || '').trim();
  if (!raw) {
    return '';
  }

  const first = raw.split(',')[0].trim();
  if (first.startsWith('::ffff:')) {
    return first.slice(7);
  }

  return first;
};

const shouldLogRequest = (ctx, slowMs, elapsedMs) => {
  if (elapsedMs >= slowMs) {
    return true;
  }

  const path = ctx.path || '';
  if (path.startsWith('/api/auth/local')) {
    return true;
  }

  if (path.startsWith('/api/portal/')) {
    return true;
  }

  if (path.startsWith('/admin') || path.startsWith('/content-manager')) {
    return ctx.method !== 'GET';
  }

  return false;
};

module.exports = (config, { strapi }) => {
  const enabled = config.enabled !== false;
  const slowMs = Number(config.slowMs || 1500);

  return async (ctx, next) => {
    if (!enabled) {
      return next();
    }

    const start = Date.now();
    try {
      await next();
    } catch (error) {
      const elapsedMs = Date.now() - start;
      const ip = normalizeIp(ctx.request.ip || ctx.ip);
      const status = error.status || error.statusCode || ctx.status || 500;
      strapi.log.warn(
        `[audit] method=${ctx.method} path=${ctx.path} status=${status} ip=${
          ip || 'unknown'
        } ms=${elapsedMs} user=${ctx.state?.user?.id || ctx.state?.admin?.id || '-'}`
      );
      throw error;
    }

    const elapsedMs = Date.now() - start;
    if (!shouldLogRequest(ctx, slowMs, elapsedMs)) {
      return;
    }

    const ip = normalizeIp(ctx.request.ip || ctx.ip);
    strapi.log.info(
      `[audit] method=${ctx.method} path=${ctx.path} status=${ctx.status} ip=${ip || 'unknown'} ms=${
        elapsedMs
      } user=${ctx.state?.user?.id || ctx.state?.admin?.id || '-'}`
    );
  };
};
