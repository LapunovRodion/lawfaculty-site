'use strict';

module.exports = ({ strapi }) => {
  const portalService = () => strapi.service('api::portal.portal');

  return {
    async createNews(ctx) {
      const entry = await portalService().createDraft({
        type: 'news',
        body: ctx.request.body,
        userId: ctx.state.user.id,
      });

      ctx.body = { data: entry };
    },

    async updateNews(ctx) {
      const entry = await portalService().updateDraft({
        type: 'news',
        id: ctx.params.id,
        body: ctx.request.body,
        userId: ctx.state.user.id,
      });

      ctx.body = { data: entry };
    },

    async getNews(ctx) {
      const entry = await portalService().getMyEntry({
        type: 'news',
        id: ctx.params.id,
        userId: ctx.state.user.id,
      });

      ctx.body = { data: entry };
    },

    async submitNews(ctx) {
      const entry = await portalService().submit({
        type: 'news',
        id: ctx.params.id,
        userId: ctx.state.user.id,
      });

      ctx.body = { data: entry };
    },

    async createMaterial(ctx) {
      const entry = await portalService().createDraft({
        type: 'materials',
        body: ctx.request.body,
        userId: ctx.state.user.id,
      });

      ctx.body = { data: entry };
    },

    async updateMaterial(ctx) {
      const entry = await portalService().updateDraft({
        type: 'materials',
        id: ctx.params.id,
        body: ctx.request.body,
        userId: ctx.state.user.id,
      });

      ctx.body = { data: entry };
    },

    async getMaterial(ctx) {
      const entry = await portalService().getMyEntry({
        type: 'materials',
        id: ctx.params.id,
        userId: ctx.state.user.id,
      });

      ctx.body = { data: entry };
    },

    async submitMaterial(ctx) {
      const entry = await portalService().submit({
        type: 'materials',
        id: ctx.params.id,
        userId: ctx.state.user.id,
      });

      ctx.body = { data: entry };
    },

    async createSchedule(ctx) {
      const entry = await portalService().createDraft({
        type: 'schedules',
        body: ctx.request.body,
        userId: ctx.state.user.id,
      });

      ctx.body = { data: entry };
    },

    async updateSchedule(ctx) {
      const entry = await portalService().updateDraft({
        type: 'schedules',
        id: ctx.params.id,
        body: ctx.request.body,
        userId: ctx.state.user.id,
      });

      ctx.body = { data: entry };
    },

    async getSchedule(ctx) {
      const entry = await portalService().getMyEntry({
        type: 'schedules',
        id: ctx.params.id,
        userId: ctx.state.user.id,
      });

      ctx.body = { data: entry };
    },

    async submitSchedule(ctx) {
      const entry = await portalService().submit({
        type: 'schedules',
        id: ctx.params.id,
        userId: ctx.state.user.id,
      });

      ctx.body = { data: entry };
    },

    async my(ctx) {
      const result = await portalService().listMy({
        userId: ctx.state.user.id,
        type: ctx.query.type,
        limit: ctx.query.limit,
      });

      ctx.body = { data: result };
    },
  };
};
