# News Content Template

This is the single editorial template for all future news created in Strapi and for migrated news from `law.bsu.by`.

## Required Fields

| Field | Purpose | Notes |
| --- | --- | --- |
| `title` | Public headline | Localized; used to generate `slug`. |
| `slug` | Public URL segment | Localized; keep stable after publication. |
| `content` | Main article body | Localized rich text. Use local media URLs only. |
| `displayDate` | Public date and sort key | Use original old-site date for migrated news. |
| `category` | Editorial grouping | Required for consistent filtering and future archive pages. |

## Recommended Fields

| Field | Purpose | Notes |
| --- | --- | --- |
| `excerpt` | Card/list summary | 1-2 sentences. If empty, the frontend shows a fallback. |
| `cover` | Main image | Upload to Strapi/MinIO; do not hotlink old-site images. |
| `department` | Department relation | Set for department-specific news. |
| `gallery` | Additional photos | Multiple images; shown after the article body. |
| `attachments` | Related files | Multiple files; shown after the article body. |
| `isFeatured` | Homepage/editorial promotion flag | Optional; future UI can use it for highlighted cards. |

## Migration Fields

| Field | Purpose | Notes |
| --- | --- | --- |
| `sourceUrl` | Source URL audit trail | Always fill for imported old-site news. |
| `sourceCategory` | Old site category/path | Example: `/novosti/novosti-o-konferentsiyakh.html`. |

## Category Values

| Value | Use for |
| --- | --- |
| `faculty` | Faculty-wide announcements and general news. |
| `department` | Department-specific news. Set `department` relation too. |
| `education` | Educational process, exams, coursework, schedules, study notices. |
| `science` | Conferences, research, scientific circles, grants. |
| `student_life` | Student council, sport, volunteering, events. |
| `event` | Public events and ceremonies. |
| `announcement` | Short official notices. |
| `other` | Only when the item does not fit the above categories. |

## Editorial Rules
- Create/import source content in `ru`; generate `be` and `en` drafts later through the translation workflow.
- Do not publish visible placeholders; hide empty optional blocks.
- Use `displayDate` for the date users should see, not Strapi `publishedAt`.
- Keep `cover`, `gallery`, and `attachments` in local Strapi/MinIO storage.
- Preserve `sourceUrl` for every migrated item.
- Keep generated translations as drafts until reviewed.
