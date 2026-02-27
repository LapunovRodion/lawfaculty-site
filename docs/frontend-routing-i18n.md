# Frontend Routing and i18n (Stage 5)

## Base routing
- Locale prefix is required: `/ru`, `/be`, `/en`.
- Root `/` redirects to `/ru`.

## Implemented routes
- `/:locale` - home page
- `/:locale/news` - news list
- `/:locale/news/:slug` - news detail
- `/:locale/materials` - materials list
- `/:locale/departments` - departments list
- `/:locale/persons` - people list
- `/:locale/search?q=...` - unified search page
- `/:locale/portal/*` - personal cabinet (stage 6)

## Data sources
- Content pages use Strapi REST (`STRAPI_URL`).
- Search page queries Meilisearch (`MEILI_URL`) on the server side.

## Environment variables (`web/.env.local`)
- `STRAPI_URL` (default: `http://localhost:1337`)
- `MEILI_URL` (default: `http://localhost:7700`)
- `MEILI_SEARCH_KEY` (optional, for protected Meili)

## Notes
- Locale labels are defined in `web/lib/i18n.js`.
- If locale is invalid, app falls back to default locale (`ru`).
