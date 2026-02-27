'use strict';

const { errors } = require('@strapi/utils');

module.exports = (policyContext) => {
  if (!policyContext.state || !policyContext.state.user) {
    throw new errors.UnauthorizedError('Authentication required');
  }

  return true;
};
