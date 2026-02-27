# Search Architecture (Stage 4)

## Engine choice
- Chosen engine: **Meilisearch** (`getmeili/meilisearch:v1.7`).
- Reason: simple operational model, typo tolerance, fast setup for MVP.

## Components
- `strapi` - source of truth for content.
- `law_pdf_indexer` - webhook worker + PDF extractor.
- `meilisearch` - search index storage and query API.
- `minio` - file storage for PDF materials.

## Indexes
- `news`
- `pages`
- `materials` (includes `pdfText`)
- `persons`
- `departments`

## Data flow
1. Content is created/updated/published in Strapi.
2. Strapi sends webhook to `POST /webhooks/strapi` on worker.
3. Worker fetches canonical entry from Strapi REST.
4. For `materials`, worker downloads PDF and extracts text.
5. Worker upserts/deletes document in the related Meilisearch index.

## Worker endpoints
- `GET /health`
- `POST /webhooks/strapi`
- `POST /reindex` (optional `?types=api::material.material,api::news-item.news-item`)

## Required env vars (worker)
- `MEILI_HOST`
- `MEILI_MASTER_KEY`
- `STRAPI_URL`
- `STRAPI_PUBLIC_URL`
- `STRAPI_API_TOKEN` (recommended for private read access)
- `PDF_INDEXER_WEBHOOK_SECRET`

## Strapi webhook setup
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

## Manual reindex
Reindex all:
```bash
curl -X POST http://localhost:8080/reindex
```

Reindex only materials:
```bash
curl -X POST "http://localhost:8080/reindex?types=api::material.material"
```

## Notes
- Current PDF extraction uses `pdf-parse` without OCR.
- OCR for scanned PDFs is deferred to backlog.
