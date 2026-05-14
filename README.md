# Law Faculty Site (Next.js + Strapi 5)

Monorepo structure:
- `web/` — Next.js (public site + portal)
- `strapi/` — Strapi 5 CMS
- `infra/` — docker-compose + ops scripts
- `worker/` — PDF indexer
- `docs/` — documentation

## Requirements
- Node.js 20–24 (Strapi 5)
- Docker/Compose (for infra)

## Quick start (local)
1. Copy `.env.example` to `.env` and заполните значения.
2. Запуск инфраструктуры:
   ```bash
   cd infra
   docker compose --env-file ../.env -f compose.yml up -d
   ```
3. Запуск Next.js фронта:
   ```bash
   cd web
   npm install
   npm run dev
   ```

Strapi Admin: http://localhost:1337/admin
Meilisearch: http://localhost:7700
MinIO Console: http://localhost:9001
PDF Indexer Health: http://localhost:18080/health
Web (Next.js): http://localhost:3000

For local Docker bind-mount permissions, set `HOST_UID` and `HOST_GID` in `.env` to your user id/group id.

## Current Delivery Scope
- Migrate selected content from `https://law.bsu.by`.
- Import 10 latest news items first.
- Migrate departments and personal staff pages.
- Migrate selected methodological materials and bind each material to one department.
- Implement structured schedule entities and public schedule UI.
- Design provider-agnostic auto-translation from `ru` to `be` and `en`.
- Remove placeholders and polish public UI.

## Ops docs
- Deploy/local infra: `infra/README-deploy.md`
- Security hardening: `docs/security-hardening.md`
- Git/release workflow: `docs/git-release-workflow.md`
- Changelog: `CHANGELOG.md`
- Restore procedure: `runbooks/restore.md`
- Release deploy procedure: `runbooks/release-deploy.md`
- Rollback procedure: `runbooks/rollback.md`
- Content migration: `docs/content-migration-plan.md`
- News content template: `docs/news-content-template.md`
- Old site inventory: `docs/old-site-inventory.md`
- Migration map: `docs/migration-map.md`
- Old news import helper: `scripts/import-old-news.mjs`
- Old departments import helper: `scripts/import-old-departments.mjs`
- Structured schedule: `docs/schedule-model.md`
- Auto-translation: `docs/i18n-autotranslation.md`
