# Portal UX (Stage 6)

## Goal
Personal cabinet for portal users to create and submit content for moderation.

## Routes
- `/:locale/portal/login`
- `/:locale/portal`
- `/:locale/portal/new?type=news|materials|schedules`
- `/:locale/portal/:type/:id`

## Auth
- NextAuth (Credentials provider) delegates login to Strapi `/api/auth/local`.
- Strapi JWT is stored in NextAuth session token and used for server actions.

## Main scenarios
1. Login as portal user.
2. Open `My submissions` list.
3. Create draft (`news`, `materials`, `schedules`).
4. Edit own draft while status is `draft` or `needs_changes`.
5. Submit to moderation (`submitted`).
6. Read moderator comment in list/edit screens.

## Status behavior
- Editable: `draft`, `needs_changes`.
- Locked in UI: `submitted`, `approved`, `rejected`, `published`.
- Backend also enforces owner check and status transitions.

## Required env for web
- `STRAPI_URL`
- `NEXTAUTH_URL`
- `NEXTAUTH_SECRET`

## Required role permissions in Strapi (PortalUser)
- All `api::portal.portal.*` actions used by routes.
- `plugin::upload.content-api.upload` for file attachments.
