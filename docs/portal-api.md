# Portal API (Stage 3)

Custom endpoints for "suggestion flow" from personal cabinet to Strapi moderation.

Base URL: `/api/portal`

## Auth
- All endpoints require JWT from `users-permissions`.
- Send header: `Authorization: Bearer <jwt>`.

## Workflow rules
- Record owner is set automatically: `authorUser = current user`.
- On create, `submissionStatus = draft`.
- User can edit only own entries.
- User can edit only statuses: `draft`, `needs_changes`.
- Submit transition: `draft|needs_changes -> submitted`.
- User cannot publish.

## Endpoints

### News
- `POST /news` - create draft
- `GET /news/:id` - get own draft
- `PUT /news/:id` - update own draft
- `POST /news/:id/submit` - send to moderation

Payload:
```json
{
  "data": {
    "title": "My news",
    "slug": "my-news",
    "excerpt": "Short text",
    "content": "Long text",
    "cover": 123,
    "locale": "ru"
  }
}
```

### Materials
- `POST /materials` - create draft
- `GET /materials/:id` - get own draft
- `PUT /materials/:id` - update own draft
- `POST /materials/:id/submit` - send to moderation

Payload:
```json
{
  "data": {
    "title": "Document title",
    "slug": "document-title",
    "description": "Description",
    "file": 321,
    "locale": "ru"
  }
}
```

### Schedules
- `POST /schedules` - create draft
- `GET /schedules/:id` - get own draft
- `PUT /schedules/:id` - update own draft
- `POST /schedules/:id/submit` - send to moderation

Payload:
```json
{
  "data": {
    "title": "Schedule week 1",
    "file": 555,
    "labels": {
      "semester": "spring",
      "course": "1"
    },
    "locale": "ru"
  }
}
```

### My entries
- `GET /my` - get my entries for all supported types.
- Optional query params:
  - `type`: `news`, `materials`, `schedules` (also accepts `material`, `schedule`)
  - `limit`: max `200` (default `50`)

Response:
```json
{
  "data": {
    "items": [
      {
        "type": "news",
        "id": 1,
        "title": "My news",
        "submissionStatus": "submitted",
        "moderatorComment": null,
        "locale": "ru",
        "publishedAt": null,
        "updatedAt": "2026-02-16T00:00:00.000Z"
      }
    ],
    "total": 1,
    "limit": 50
  }
}
```

## Role setup (PortalUser)
In Strapi admin, allow these actions for role `PortalUser`:
- `api::portal.portal.createNews`
- `api::portal.portal.getNews`
- `api::portal.portal.updateNews`
- `api::portal.portal.submitNews`
- `api::portal.portal.createMaterial`
- `api::portal.portal.getMaterial`
- `api::portal.portal.updateMaterial`
- `api::portal.portal.submitMaterial`
- `api::portal.portal.createSchedule`
- `api::portal.portal.getSchedule`
- `api::portal.portal.updateSchedule`
- `api::portal.portal.submitSchedule`
- `api::portal.portal.my`

If portal users should upload media directly, also allow:
- `plugin::upload.content-api.upload`
