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
3. Запуск Strapi:
   ```bash
   cd strapi
   npm install
   npm run develop
   ```
4. Запуск Next.js фронта:
   ```bash
   cd web
   npm install
   npm run dev
   ```

Strapi Admin: http://localhost:1337/admin
Meilisearch: http://localhost:7700
MinIO Console: http://localhost:9001
PDF Indexer Health: http://localhost:8080/health
Web (Next.js): http://localhost:3000

## Ops docs
- Deploy/local infra: `infra/README-deploy.md`
- Security hardening: `docs/security-hardening.md`
- Git/release workflow: `docs/git-release-workflow.md`
- Changelog: `CHANGELOG.md`
- Restore procedure: `runbooks/restore.md`
- Release deploy procedure: `runbooks/release-deploy.md`
- Rollback procedure: `runbooks/rollback.md`
