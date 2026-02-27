'use strict';

module.exports = {
  routes: [
    {
      method: 'POST',
      path: '/portal/news',
      handler: 'portal.createNews',
      config: {
        policies: ['api::portal.is-authenticated'],
      },
    },
    {
      method: 'GET',
      path: '/portal/news/:id',
      handler: 'portal.getNews',
      config: {
        policies: ['api::portal.is-authenticated'],
      },
    },
    {
      method: 'PUT',
      path: '/portal/news/:id',
      handler: 'portal.updateNews',
      config: {
        policies: ['api::portal.is-authenticated'],
      },
    },
    {
      method: 'POST',
      path: '/portal/news/:id/submit',
      handler: 'portal.submitNews',
      config: {
        policies: ['api::portal.is-authenticated'],
      },
    },
    {
      method: 'POST',
      path: '/portal/materials',
      handler: 'portal.createMaterial',
      config: {
        policies: ['api::portal.is-authenticated'],
      },
    },
    {
      method: 'GET',
      path: '/portal/materials/:id',
      handler: 'portal.getMaterial',
      config: {
        policies: ['api::portal.is-authenticated'],
      },
    },
    {
      method: 'PUT',
      path: '/portal/materials/:id',
      handler: 'portal.updateMaterial',
      config: {
        policies: ['api::portal.is-authenticated'],
      },
    },
    {
      method: 'POST',
      path: '/portal/materials/:id/submit',
      handler: 'portal.submitMaterial',
      config: {
        policies: ['api::portal.is-authenticated'],
      },
    },
    {
      method: 'POST',
      path: '/portal/schedules',
      handler: 'portal.createSchedule',
      config: {
        policies: ['api::portal.is-authenticated'],
      },
    },
    {
      method: 'GET',
      path: '/portal/schedules/:id',
      handler: 'portal.getSchedule',
      config: {
        policies: ['api::portal.is-authenticated'],
      },
    },
    {
      method: 'PUT',
      path: '/portal/schedules/:id',
      handler: 'portal.updateSchedule',
      config: {
        policies: ['api::portal.is-authenticated'],
      },
    },
    {
      method: 'POST',
      path: '/portal/schedules/:id/submit',
      handler: 'portal.submitSchedule',
      config: {
        policies: ['api::portal.is-authenticated'],
      },
    },
    {
      method: 'GET',
      path: '/portal/my',
      handler: 'portal.my',
      config: {
        policies: ['api::portal.is-authenticated'],
      },
    },
  ],
};
