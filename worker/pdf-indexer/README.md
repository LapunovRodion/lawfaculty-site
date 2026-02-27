# PDF Indexer Worker

Worker receives Strapi webhooks and updates Meilisearch indexes.

## Features
- Indexes: `news`, `pages`, `materials`, `persons`, `departments`.
- Extracts text from PDF files for `materials`.
- Supports full reindex via `POST /reindex`.

## Endpoints
- `GET /health`
- `POST /webhooks/strapi`
- `POST /reindex`

## Webhook security
Set `PDF_INDEXER_WEBHOOK_SECRET` and send the same value in header:
- `x-webhook-secret: <secret>`

## Local run
```bash
cd worker/pdf-indexer
npm install
npm start
```
