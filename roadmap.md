# Roadmap: Law Faculty Site

## Current Goal
Prepare the site for real content and the next feature phase before public launch.

Primary goals:
- migrate selected content from `https://law.bsu.by`;
- move 10 latest news items first;
- migrate departments and personal staff pages;
- migrate selected methodological materials and bind each material to one department;
- replace placeholders with real content or hide incomplete blocks;
- add full schedule entities instead of file-only schedules;
- design auto-translation for `be` and `en` from the `ru` source locale;
- improve public UI for content-heavy pages.

## Fixed Decisions
- Stack: Next.js + Strapi 5 + PostgreSQL + MinIO + Meilisearch.
- Default/source locale: `ru`.
- Target locales: `ru`, `be`, `en`.
- Old site source: `https://law.bsu.by`.
- News migration scope: 10 latest news items.
- Methodological material belongs to exactly one department.
- Schedule must be modeled as structured entities, not just uploaded files.
- Portal remains the place for authenticated users to submit news, materials, and schedule changes for moderation.

## Phase 1 - Documentation And Model Freeze
- [ ] Update documentation for current architecture and launch scope.
- [ ] Define structured schedule entities and relations.
- [ ] Define content migration workflow from the old site.
- [ ] Define auto-translation workflow and provider abstraction.
- [ ] Confirm placeholder cleanup rules.

Artifacts:
- `docs/content-migration-plan.md`
- `docs/schedule-model.md`
- `docs/i18n-autotranslation.md`
- `docs/strapi-content-model.md`
- `docs/portal-api.md`

## Phase 2 - Content Migration From Old Site
- [ ] Build a read-only inventory of old site sections.
- [ ] Create migration map: old URL -> Strapi content type -> new route.
- [ ] Migrate 10 latest news items.
- [ ] Migrate departments.
- [ ] Migrate personal staff pages.
- [ ] Migrate selected methodological materials.
- [ ] Upload remote images/files into Strapi/MinIO instead of hotlinking.
- [ ] Preserve source URLs in migration notes for audit and redirect planning.
- [ ] Reindex migrated content in Meilisearch.

Notes:
- Current environment reports an SSL chain issue for `law.bsu.by`; migration tooling should first try normal TLS and allow a documented local fallback for read-only import if CA trust is unavailable.
- Imported content starts in `ru`; generated translations stay draft until reviewed.

## Phase 3 - Structured Schedule
- [ ] Replace file-only schedule workflow with structured entities.
- [ ] Add public schedule routes and filters.
- [ ] Add portal workflow for schedule submissions/changes.
- [ ] Add moderation workflow for schedule entries.
- [ ] Index schedule entries if needed for global search.

Minimum entities:
- `ScheduleTerm`
- `StudyGroup`
- `Subject`
- `Classroom`
- `ScheduleEntry`

Optional later entities:
- `ScheduleChangeRequest`
- `ScheduleImportBatch`

## Phase 4 - Auto-Translation
- [ ] Implement provider-agnostic translation service interface.
- [ ] Add glossary for university/legal terms.
- [ ] Protect non-translatable tokens: names, emails, phones, URLs, file names.
- [ ] Generate `be` and `en` localizations from `ru` as drafts.
- [ ] Add moderation/review checklist before publishing translations.

Provider is not selected yet. Candidate providers:
- DeepL
- Google Translate
- Yandex Translate
- OpenAI-compatible LLM

## Phase 5 - Placeholder Cleanup
- [ ] Replace footer contacts and links with real values.
- [ ] Replace placeholder department contacts.
- [ ] Remove `#` links or hide incomplete actions.
- [ ] Remove example/test text from public pages.
- [ ] Keep empty-state messages only for legitimately empty content sections.

## Phase 6 - UI Improvement
- [ ] Improve materials page: department filter, file metadata, clearer cards.
- [ ] Improve departments page: contacts, staff, materials, visual hierarchy.
- [ ] Improve staff pages: profile layout, publications, linked departments.
- [ ] Add schedule UI: weekly/table view, filters, mobile layout.
- [ ] Improve home page with real news, schedule, departments, and materials entry points.
- [ ] Verify responsive behavior on mobile and desktop.

## Phase 7 - Verification And Launch Readiness
- [ ] `npm run build` for `web`.
- [ ] Syntax checks for worker and Strapi custom code.
- [ ] Docker compose health checks.
- [ ] Smoke test public routes:
  - `/ru`
  - `/ru/news`
  - `/ru/departments`
  - `/ru/persons`
  - `/ru/materials`
  - `/ru/schedule`
  - `/ru/search`
  - `/ru/portal`
- [ ] Smoke test portal create/edit/submit flows.
- [ ] Run manual reindex for migrated content.
- [ ] Check for public 404/500 errors.

## Backlog
- OCR for scanned PDFs.
- SSO/2FA via Keycloak or another identity provider.
- Bulk schedule import from XLSX/CSV.
- Redirect map from old URLs to new routes.
- Analytics and content freshness dashboards.
