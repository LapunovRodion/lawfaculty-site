# Strapi Content Model

## Locales
- Enabled: `ru`, `be`, `en`.
- Default/source locale: `ru`.
- `be` and `en` are generated or edited as localized entries and must be reviewed before publishing.

## Shared Moderation Fields
User-submitted content uses these fields:
- `submissionStatus`: `draft`, `submitted`, `needs_changes`, `approved`, `rejected`, `published`.
- `moderatorComment` (text).
- `authorUser` (relation -> users-permissions user).

## Content Types

### News
- `title` (string, i18n).
- `slug` (uid, i18n, from title).
- `excerpt` (text, i18n).
- `content` (richtext, i18n).
- `cover` (media: image).
- `gallery` (media: multiple images).
- `attachments` (media: multiple files).
- `displayDate` (datetime): editorial/public date shown on the website and used for sorting.
- `category` (enum): `faculty`, `department`, `education`, `science`, `student_life`, `event`, `announcement`, `other`.
- `department` (many-to-one -> Department, optional).
- `isFeatured` (boolean).
- `sourceUrl` (text): old site URL or external source for audit.
- `sourceCategory` (string): old site category/path label for migration notes.
- shared moderation fields.

Internal naming: singularName `news-item`, pluralName `news`.

Editorial template: `docs/news-content-template.md`.

### Page
- `title` (string, i18n).
- `slug` (uid, i18n, from title).
- `content` (richtext, i18n).

### Department
- `title` (string, i18n).
- `slug` (uid, i18n, from title).
- `tagline` (string, i18n).
- `overview` (text, i18n).
- `description` (richtext, i18n).
- `heroImage` (media: image).
- `history` (richtext, i18n).
- `teachingSummary` (richtext, i18n).
- `researchSummary` (richtext, i18n).
- `headNote` (richtext, i18n).
- `contacts` (text, i18n).
- `address` (string, i18n).
- `office` (string, i18n).
- `phone` (string).
- `email` (email).
- `keyFacts` (repeatable component: `department.fact`).
- `disciplines` (repeatable component: `department.discipline`).
- `usefulLinks` (repeatable component: `department.link-item`).
- `documents` (repeatable component: `department.document-item`).
- `extraSections` (dynamic zone: `department.rich-section`).
- `persons` (many-to-many -> Person, mapped by `departments`).
- `materials` (one-to-many -> Material, mapped by `department`).
- `news` (one-to-many -> News, mapped by `department`).
- `sourceUrl` (text): old site URL or external source for audit.
- `sourceCategory` (string): old site section/path label for migration notes.

### Person
- `fullName` (string, i18n).
- `slug` (uid, i18n, from fullName).
- `position` (string, i18n).
- `academicTitle` (string, i18n).
- `academicDegree` (string, i18n).
- `workplace` (string, i18n).
- `roleInDepartment` (string, i18n).
- `bio` (richtext, i18n).
- `publicationsText` (richtext/text, i18n).
- `photo` (media: image).
- `email` (email/string).
- `phone` (string).
- `sortOrder` (integer).
- `isHead` (boolean).
- `departments` (many-to-many -> Department).
- `subjects` (repeatable component: `person.subject`).
- `labels` (repeatable component: `person.link-label`).

### Material
- `title` (string, i18n).
- `slug` (uid, i18n, from title).
- `description` (text, i18n).
- `file` (media: file, required).
- `department` (many-to-one -> Department, required).
- shared moderation fields.

Rules:
- one material belongs to exactly one department;
- old imported materials without a detected department must be marked for review before publication;
- public materials page groups items by department.

### Structured Schedule
The current target is structured schedule data, not file-only schedules.

Core types:
- `ScheduleTerm` - academic term/period.
- `StudyGroup` - course/group/cohort.
- `Subject` - discipline, optionally linked to a department.
- `Classroom` - room/location.
- `ScheduleEntry` - one scheduled class/event.

See `docs/schedule-model.md` for the full field list and workflow.

### Legacy Schedule
The existing `Schedule` collection type may remain temporarily for compatibility while structured schedule entities are implemented.

Existing fields:
- `title` (string, i18n).
- `file` (media: file).
- `labels` (json).
- shared moderation fields.

Migration path:
- keep legacy file records until structured entries are ready;
- convert real launch data to structured schedule entries;
- hide legacy public UI when structured schedule becomes the source of truth.
