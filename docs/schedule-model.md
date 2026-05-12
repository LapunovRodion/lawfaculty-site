# Structured Schedule Model

## Goal
Replace file-only schedules with structured schedule entities that can be filtered, moderated, displayed on public pages, and edited through the personal portal.

## Public Routes
- `/:locale/schedule` - schedule landing page and filters.
- Optional later: `/:locale/schedule/groups/:slug`.
- Optional later: `/:locale/schedule/teachers/:slug`.

## Content Types

### ScheduleTerm
Represents an academic period.

Fields:
- `title` (string, i18n): example `Весенний семестр 2026`.
- `slug` (uid, i18n).
- `startsAt` (date).
- `endsAt` (date).
- `isActive` (boolean).

### StudyGroup
Represents a student group/cohort.

Fields:
- `title` (string, i18n): example `1 курс, группа 3`.
- `slug` (uid, i18n).
- `course` (integer).
- `groupCode` (string).
- `educationForm` (enumeration): `full_time`, `part_time`, `distance`, `other`.
- `isActive` (boolean).

### Subject
Represents a course/discipline.

Fields:
- `title` (string, i18n).
- `slug` (uid, i18n).
- `department` (many-to-one -> Department, optional but recommended).

### Classroom
Represents a room or location.

Fields:
- `title` (string, i18n): example `ауд. 205`.
- `building` (string, i18n).
- `address` (string, i18n).
- `capacity` (integer, optional).

### ScheduleEntry
Represents one scheduled class/event.

Fields:
- `title` (string, i18n, optional override).
- `term` (many-to-one -> ScheduleTerm, required).
- `studyGroup` (many-to-one -> StudyGroup, required).
- `subject` (many-to-one -> Subject, required).
- `teacher` (many-to-one -> Person, optional).
- `teacherNameFallback` (string, optional).
- `classroom` (many-to-one -> Classroom, optional).
- `classroomFallback` (string, optional).
- `weekday` (enumeration): `monday`, `tuesday`, `wednesday`, `thursday`, `friday`, `saturday`, `sunday`.
- `startsAt` (time, required).
- `endsAt` (time, required).
- `lessonType` (enumeration): `lecture`, `seminar`, `practice`, `lab`, `exam`, `consultation`, `other`.
- `weekType` (enumeration): `all`, `odd`, `even`, `custom`.
- `dateFrom` (date, optional).
- `dateTo` (date, optional).
- `note` (text, i18n, optional).
- `submissionStatus` (enum): `draft`, `submitted`, `needs_changes`, `approved`, `rejected`, `published`.
- `moderatorComment` (text).
- `authorUser` (many-to-one -> users-permissions user).

## Portal Workflow
Authenticated users can submit schedule entries or schedule changes.

MVP portal fields:
- term;
- study group;
- subject;
- teacher or fallback teacher name;
- classroom or fallback classroom text;
- weekday;
- start/end time;
- lesson type;
- week type;
- note.

Workflow:
- create draft;
- edit while `draft` or `needs_changes`;
- submit to moderation;
- moderator reviews in Strapi;
- published entries appear on public schedule page.

## Public UI
Minimum filters:
- term;
- course;
- group;
- weekday;
- teacher;
- department.

Recommended views:
- mobile: grouped list by weekday;
- desktop: weekly table plus list fallback;
- empty state when filters return no entries.

## Search
Schedule entries can be added to Meilisearch later.

Searchable fields:
- subject title;
- teacher name;
- group title/code;
- classroom;
- note.

## Import
If old schedule data is only available as files, store original files as migration evidence but create structured `ScheduleEntry` records for the public site.

Bulk import from XLSX/CSV is backlog unless needed for initial launch.
