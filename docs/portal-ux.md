# Portal UX

## Goal
Personal cabinet for authenticated users to create and submit content for moderation.

Supported today:
- news;
- methodological materials with one required department;
- legacy schedule file submissions.

Target next phase:
- structured schedule entry submissions and change requests.

## Routes
- `/:locale/portal/login`
- `/:locale/portal`
- `/:locale/portal/new?type=news|materials|schedules`
- `/:locale/portal/:type/:id`

## Auth
- NextAuth Credentials provider delegates login to Strapi `/api/auth/local`.
- Strapi JWT is stored in the NextAuth session token and used by server actions.

## Main Scenarios
1. Login as portal user.
2. Open `My submissions` list.
3. Create draft (`news`, `materials`, `schedules`).
4. Edit own draft while status is `draft` or `needs_changes`.
5. Submit to moderation (`submitted`).
6. Read moderator comment in list/edit screens.

## Material Submission UX
Required fields:
- title;
- department;
- file.

Optional fields:
- description.

Rules:
- user must select exactly one department;
- department can be changed while draft is editable;
- file can be replaced while draft is editable;
- after submit, fields are disabled in the UI and locked by backend rules.

## Schedule Submission UX
Current state:
- schedule submissions use a legacy file + labels flow.

Target state:
- user creates structured schedule entries or proposed changes;
- form uses term, group, subject, teacher, classroom, weekday, time, lesson type, and notes;
- user submits to moderation;
- moderator publishes structured entries.

See `docs/schedule-model.md`.

## Status Behavior
- Editable: `draft`, `needs_changes`.
- Locked in UI: `submitted`, `approved`, `rejected`, `published`.
- Backend also enforces owner check and status transitions.

## Required Env For Web
- `STRAPI_URL`
- `NEXTAUTH_URL`
- `NEXTAUTH_SECRET`

## Required Role Permissions In Strapi (PortalUser)
- All `api::portal.portal.*` actions used by routes.
- `plugin::upload.content-api.upload` for file attachments.

## UX Improvements Backlog
- Better validation feedback for file upload failures.
- Inline status timeline for each submission.
- Department filter in personal submissions list.
- Structured schedule form once schedule entities are implemented.
