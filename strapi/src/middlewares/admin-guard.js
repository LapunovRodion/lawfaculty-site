'use strict';

const { isIP } = require('node:net');

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

const ipv4ToInt = (ip) =>
  ip
    .split('.')
    .map((part) => Number(part))
    .reduce((acc, part) => (acc << 8) + part, 0) >>> 0;

const isIpv4InCidr = (ip, cidr) => {
  const [network, bitsRaw] = cidr.split('/');
  const bits = Number(bitsRaw);
  if (isIP(ip) !== 4 || isIP(network) !== 4 || Number.isNaN(bits) || bits < 0 || bits > 32) {
    return false;
  }

  const mask = bits === 0 ? 0 : (0xffffffff << (32 - bits)) >>> 0;
  return (ipv4ToInt(ip) & mask) === (ipv4ToInt(network) & mask);
};

const matchesRule = (ip, rule) => {
  if (!ip || !rule) {
    return false;
  }

  if (rule.includes('/')) {
    return isIpv4InCidr(ip, rule);
  }

  return ip === normalizeIp(rule);
};

module.exports = (config, { strapi }) => {
  const allowlist = Array.isArray(config.allowlist) ? config.allowlist : [];
  const accessHeader = config.accessHeader || 'x-admin-access-token';
  const accessToken = String(config.accessToken || '');

  return async (ctx, next) => {
    if (!ctx.path.startsWith('/admin')) {
      return next();
    }

    const requestIp = normalizeIp(ctx.request.ip || ctx.ip);
    const hasIpRule = allowlist.length > 0;
    const isAllowedByIp = hasIpRule ? allowlist.some((rule) => matchesRule(requestIp, rule)) : true;

    const providedToken = String(ctx.get(accessHeader) || '');
    const isAllowedByToken = Boolean(accessToken) && providedToken === accessToken;

    if (isAllowedByIp || isAllowedByToken) {
      return next();
    }

    strapi.log.warn(
      `[admin-guard] denied path=${ctx.path} ip=${requestIp || 'unknown'} method=${ctx.method}`
    );
    ctx.status = 403;
    ctx.body = { error: 'Forbidden' };
  };
};
