# Strapi Content Model (MVP)

## Locales
- Enabled: ru, be, en
- Default locale: ru

## Content Types

### News
- `title` (string, i18n)
- `slug` (uid, i18n, from title)
- `excerpt` (text, i18n)
- `content` (richtext, i18n)
- `cover` (media: image)
- `submissionStatus` (enum)
- `moderatorComment` (text)
- `authorUser` (relation -> users-permissions user)
> Internal naming: singularName `news-item`, pluralName `news` (Strapi v5 requires uniqueness).

### Page
- `title` (string, i18n)
- `slug` (uid, i18n, from title)
- `content` (richtext, i18n)

### Department
- `title` (string, i18n)
- `slug` (uid, i18n, from title)
- `description` (richtext, i18n)
- `contacts` (text, i18n)
- `persons` (relation: one-to-many -> Person)

### Person
- `fullName` (string, i18n)
- `position` (string, i18n)
- `bio` (richtext, i18n)
- `photo` (media: image)
- `department` (relation: many-to-one -> Department)

### Material
- `title` (string, i18n)
- `slug` (uid, i18n, from title)
- `description` (text, i18n)
- `file` (media: file)
- `submissionStatus` (enum)
- `moderatorComment` (text)
- `authorUser` (relation -> users-permissions user)

### Schedule
- `title` (string, i18n)
- `file` (media: file)
- `labels` (json)
- `submissionStatus` (enum)
- `moderatorComment` (text)
- `authorUser` (relation -> users-permissions user)

## Submission Status enum
`draft / submitted / needs_changes / approved / rejected / published`
