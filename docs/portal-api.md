# Portal API

Custom endpoints for submissions from the personal cabinet to Strapi moderation.

Base URL: `/api/portal`

## Auth
- All endpoints require JWT from `users-permissions`.
- Send header: `Authorization: Bearer <jwt>`.

## Workflow Rules
- Record owner is set automatically: `authorUser = current user`.
- On create, `submissionStatus = draft`.
- User can edit only own entries.
- User can edit only statuses: `draft`, `needs_changes`.
- Submit transition: `draft|needs_changes -> submitted`.
- User cannot publish.

## News Endpoints
- `POST /news` - create draft.
- `GET /news/:id` - get own draft.
- `PUT /news/:id` - update own draft.
- `POST /news/:id/submit` - send to moderation.

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

## Material Endpoints
- `POST /materials` - create draft.
- `GET /materials/:id` - get own draft.
- `PUT /materials/:id` - update own draft.
- `POST /materials/:id/submit` - send to moderation.

Payload:
```json
{
  "data": {
    "title": "Document title",
    "slug": "document-title",
    "description": "Description",
    "file": 321,
    "department": 12,
    "locale": "ru"
  }
}
```

Rules:
- `department` is required;
- `department` points to exactly one `Department`;
- uploaded files use Strapi upload and MinIO storage.

## Schedule Endpoints
Current code still exposes legacy schedule draft endpoints:
- `POST /schedules`
- `GET /schedules/:id`
- `PUT /schedules/:id`
- `POST /schedules/:id/submit`

These endpoints should be replaced or expanded when structured schedule entities are implemented.

Target structured schedule payload is defined in `docs/schedule-model.md`.

## My Entries
- `GET /my` - get my entries for all supported submission types.
- Optional query params:
  - `type`: `news`, `materials`, `schedules` (also accepts `material`, `schedule`).
  - `limit`: max `200` (default `50`).

Response:
```json
{
  "data": {
    "items": [
      {
        "type": "materials",
        "id": 1,
        "title": "Document title",
        "submissionStatus": "submitted",
        "moderatorComment": null,
        "locale": "ru",
        "department": {
          "id": 12,
          "title": "Department title",
          "slug": "department-title"
        },
        "publishedAt": null,
        "updatedAt": "2026-02-16T00:00:00.000Z"
      }
    ],
    "total": 1,
    "limit": 50
  }
}
```

## Role Setup (PortalUser)
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

If portal users upload media directly, also allow:
- `plugin::upload.content-api.upload`

When structured schedule endpoints are added, update this role checklist with the new handlers.
