# Auto-Translation Strategy

## Goal
Generate `be` and `en` localizations from the source `ru` content while keeping human review before publication.

## Source And Target Locales
- Source locale: `ru`.
- Target locales: `be`, `en`.
- Translation output should be saved as draft/localized entries in Strapi.

## Provider
Provider is not selected yet.

Candidates:
- DeepL;
- Google Translate;
- Yandex Translate;
- OpenAI-compatible LLM.

Implementation should use a provider abstraction so the project can switch providers without changing content workflows.

## Non-Translatable Values
Do not translate:
- names and surnames;
- email addresses;
- phone numbers;
- URLs;
- file names;
- dates;
- room numbers;
- slugs unless explicitly regenerated;
- legal citations where translation would change meaning.

## Glossary
Maintain a glossary for university and legal terms.

Initial glossary examples:
- `юридический факультет` -> `юрыдычны факультэт` / `law faculty`;
- `кафедра` -> `кафедра` / `department`;
- `методические материалы` -> `метадычныя матэрыялы` / `methodological materials`;
- `расписание` -> `расклад` / `schedule`;
- `заведующий кафедрой` -> `загадчык кафедры` / `head of department`.

## Workflow
1. Editor creates or imports source `ru` content.
2. Auto-translation job generates `be` and `en` drafts.
3. Translator/moderator reviews generated localizations.
4. Moderator publishes reviewed localizations.
5. Search index is refreshed after publication.

## Content Types In Scope
- News.
- Page.
- Department.
- Person profile text fields.
- Material title/description.
- Subject and schedule labels.

## Safety Rules
- Never auto-publish generated translations.
- Keep source and translated entry IDs in logs.
- Log provider, timestamp, source locale, target locale, and translated fields.
- Allow field-level regeneration.
- Skip empty fields.
- Preserve rich text structure where possible.

## Technical Shape
Recommended module responsibilities:
- `TranslationProvider`: sends plain text/rich text chunks to the selected provider.
- `TranslationGlossary`: stores protected terms and replacements.
- `ContentTranslationJob`: reads Strapi entry, translates configured fields, writes target localization.
- `TranslationAuditLog`: records generated output metadata.

## Acceptance Criteria
- A source `ru` item can generate `be` and `en` drafts.
- Names, contacts, URLs, and file names remain unchanged.
- Generated translations are not public until reviewed.
- Provider can be swapped by configuration.
