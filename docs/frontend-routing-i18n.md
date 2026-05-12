# Frontend Routing And i18n

## Base Routing
- Locale prefix is required: `/ru`, `/be`, `/en`.
- Root `/` redirects to `/ru`.
- Source/default locale is `ru`.

## Implemented Routes
- `/:locale` - home page.
- `/:locale/news` - news list.
- `/:locale/news/:slug` - news detail.
- `/:locale/materials` - materials list grouped by department.
- `/:locale/departments` - departments list.
- `/:locale/departments/:slug` - department detail.
- `/:locale/persons` - people list.
- `/:locale/persons/:slug` - person detail.
- `/:locale/search?q=...` - unified search page.
- `/:locale/portal/*` - personal cabinet.

## Planned Routes
- `/:locale/schedule` - structured schedule page.
- Optional later: `/:locale/schedule/groups/:slug`.
- Optional later: `/:locale/schedule/teachers/:slug`.

## Data Sources
- Content pages use Strapi REST (`STRAPI_URL`).
- Search page queries Meilisearch (`MEILI_URL`) on the server side.
- Material files are served from Strapi/MinIO media URLs.

## Environment Variables (`web/.env.local`)
- `STRAPI_URL` (default: `http://localhost:1337`).
- `MEILI_URL` (default: `http://localhost:7700`).
- `MEILI_SEARCH_KEY` (optional, for protected Meili).
- `NEXTAUTH_URL`.
- `NEXTAUTH_SECRET`.
- `PREVIEW_SECRET`.

## i18n Content Workflow
- Create/import source content in `ru`.
- Generate `be` and `en` drafts through the auto-translation workflow.
- Review translated drafts manually before publishing.
- Do not translate names, contacts, URLs, file names, or slugs unless explicitly required.

See `docs/i18n-autotranslation.md`.

## Notes
- Locale UI labels are defined in `web/lib/i18n.js`.
- If locale is invalid, app falls back to default locale (`ru`).
