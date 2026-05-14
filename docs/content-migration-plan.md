# Content Migration Plan

## Source
- Old site: `https://law.bsu.by`
- First migration scope:
  - 10 latest news items;
  - departments;
  - personal staff pages;
  - selected methodological materials;
  - schedule content after structured schedule model is implemented.

## Principles
- Use `ru` as the source locale.
- Import media into Strapi/MinIO; do not hotlink old site assets.
- Keep migrated records as drafts until reviewed, unless explicitly approved.
- Keep a migration log with source URL, target content type, target ID, and import status.
- Preserve publication dates for news where available.
- Generate stable slugs from titles, then manually adjust only when required.

## SSL Note
The current environment reports a TLS chain verification issue for `law.bsu.by`.

Migration tooling should use this order:
- normal HTTPS request with certificate validation;
- updated local CA bundle if validation fails;
- documented read-only insecure fetch fallback only for migration inventory/import, never for production runtime.

## Migration Map
Initial artifact: `docs/migration-map.md`.

Use this table format while importing:

| Source URL | Source Type | Target Type | Target ID | Locale | Status | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| `https://law.bsu.by/...` | news | `News` | TBD | `ru` | pending |  |

Statuses:
- `pending`
- `imported`
- `needs_review`
- `published`
- `skipped`
- `failed`

## News Import
Scope: 10 latest news items.

Import helper: `scripts/import-old-news.mjs`.

Dry run:
```bash
OLD_SITE_INSECURE_TLS=1 node scripts/import-old-news.mjs
```

Create Strapi drafts:
```bash
STRAPI_API_TOKEN=<token> OLD_SITE_INSECURE_TLS=1 node scripts/import-old-news.mjs --commit
```

`--commit` requires a Strapi API token with permissions to create `News` entries and upload media. Imported news are created as drafts with `submissionStatus = draft` for review.

Fields to import:
- title;
- slug;
- excerpt when available;
- content/body;
- cover/inline images;
- publication date into `displayDate`;
- category and department relation when applicable;
- gallery images and attachments when available;
- source URL in migration log.

Post-import checks:
- images render from local media storage;
- detail page opens at `/ru/news/:slug`;
- date is correct;
- rich text does not contain broken old-site URLs;
- Meilisearch `news` index is refreshed.

## Departments Import
Import helper: `scripts/import-old-departments.mjs`.

Dry run:
```bash
OLD_SITE_INSECURE_TLS=1 node scripts/import-old-departments.mjs
```

Create Strapi drafts:
```bash
STRAPI_API_TOKEN=<token> OLD_SITE_INSECURE_TLS=1 node scripts/import-old-departments.mjs --commit
```

Fields to import:
- title;
- slug;
- overview/description/history;
- contacts;
- address, office, phone, email where available;
- useful links and documents where available;
- head and staff links where available.

Post-import checks:
- `/ru/departments` lists the department;
- `/ru/departments/:slug` has no placeholder contact data;
- linked staff records exist or are marked for staff migration;
- department materials are grouped correctly after material import.

## Staff Pages Import
Fields to import:
- full name;
- slug;
- position;
- academic degree/title;
- workplace/role in department;
- email and phone where available;
- photo;
- biography;
- subjects/disciplines;
- publications text;
- department relations.

Post-import checks:
- `/ru/persons` lists the person;
- `/ru/persons/:slug` opens;
- photo is local media;
- person is linked to the correct department;
- no placeholder contacts are displayed.

## Methodological Materials Import
Fields to import:
- title;
- slug;
- description;
- file;
- department relation;
- source URL in migration log.

Rules:
- each material must belong to exactly one department;
- if department cannot be determined automatically, mark the item as `needs_review`;
- files must be uploaded to Strapi/MinIO;
- PDF text should be indexed after import.

Post-import checks:
- `/ru/materials` groups the material under the right department;
- file opens from local media URL;
- global search finds the material by title, department, and PDF text when extractable.

## Placeholder Cleanup
These rules are fixed for launch scope.

During migration, remove or replace:
- `#` links;
- fake phone/email/address values;
- demo descriptions;
- blocks that only exist to fill layout space;
- empty contact/action sections.

Fallback empty-state text is allowed only when a section is genuinely empty.

If a real value is unavailable, hide the field/block instead of publishing a visible placeholder.

## Acceptance Criteria
- 10 latest news items are imported and reviewed.
- Department pages have real content and contacts or intentionally hidden missing fields.
- Staff pages are linked to departments.
- Selected materials are grouped by department.
- No migrated public page returns 500.
- No public page hotlinks required old-site assets.
- Reindex has been run after import.
