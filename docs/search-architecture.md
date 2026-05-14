# Search Architecture

## Engine Choice
- Chosen engine: **Meilisearch** (`getmeili/meilisearch:v1.7`).
- Reason: simple operational model, typo tolerance, fast setup for MVP.

## Components
- `strapi` - source of truth for content.
- `law_pdf_indexer` - webhook worker + PDF extractor.
- `meilisearch` - search index storage and query API.
- `minio` - file storage for PDF/material files.

## Indexes
- `news` (includes `category`, `departmentTitle`, `departmentSlug`, `displayDate`, `isFeatured`)
- `pages`
- `materials` (includes `pdfText`, `departmentTitle`, `departmentSlug`)
- `persons`
- `departments`

Potential next index:
- `schedule` after structured schedule entities are implemented.

## Data Flow
1. Content is created/updated/published in Strapi.
2. Strapi sends webhook to `POST /webhooks/strapi` on worker.
3. Worker validates `x-webhook-secret`.
4. Worker fetches canonical entry from Strapi REST.
5. For `materials`, worker downloads PDF and extracts text.
6. Worker upserts/deletes document in the related Meilisearch index.

## Worker Endpoints
- `GET /health`
- `POST /webhooks/strapi`
- `POST /reindex` with optional `?types=api::material.material,api::news-item.news-item`

All mutating endpoints require:
- `x-webhook-secret: <PDF_INDEXER_WEBHOOK_SECRET>`

## Required Env Vars (Worker)
- `MEILI_HOST`
- `MEILI_MASTER_KEY`
- `STRAPI_URL`
- `STRAPI_PUBLIC_URL`
- `STRAPI_API_TOKEN` (recommended for private read access)
- `PDF_INDEXER_WEBHOOK_SECRET`

## Strapi Webhook Setup
Create webhook in Strapi Admin:
- URL: `http://pdf-indexer:8080/webhooks/strapi`
- Header: `x-webhook-secret: <PDF_INDEXER_WEBHOOK_SECRET>`
- Events:
  - Entry create
  - Entry update
  - Entry delete
  - Entry publish
  - Entry unpublish
- Models:
  - `News`
  - `Page`
  - `Material`
  - `Person`
  - `Department`

Add schedule models later when structured schedule is implemented.

## Manual Reindex
Reindex all:
```bash
curl -X POST \
  -H "x-webhook-secret: $PDF_INDEXER_WEBHOOK_SECRET" \
  http://localhost:18080/reindex
```

Reindex only materials:
```bash
curl -X POST \
  -H "x-webhook-secret: $PDF_INDEXER_WEBHOOK_SECRET" \
  "http://localhost:18080/reindex?types=api::material.material"
```

## Notes
- Current PDF extraction uses `pdf-parse` without OCR.
- OCR for scanned PDFs is deferred to backlog.
- Materials are searchable by department title after the material-department relation is populated.
