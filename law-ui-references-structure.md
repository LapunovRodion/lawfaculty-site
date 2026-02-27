# Law UI References and Structure

## Summary
This document defines the visual and structural contract for the public website of the law faculty.
It is the source of truth for IA, page templates, component behavior, and UI tokens.

Scope of this version:
- public website only
- existing routing is preserved (`/[locale]/...`)
- visual direction: Academic Editorial
- visual preset: Light Academic Blue

Out of scope of this version:
- portal (personal cabinet) redesign
- Strapi admin redesign
- backend data model changes

---

## 1) Design Principles

1. Editorial hierarchy first
- each page starts with a clear page identity, then context, then actions
- long reading blocks are limited in width for readability

2. Institutional clarity
- navigation should expose key sections from any page in one click
- important links (news, materials, contacts, search) are always visible

3. Calm visual authority
- restrained palette with one strong accent
- minimal decorative noise, emphasis on typography and spacing

4. Content does the work
- cards and lists prioritize titles, dates, and short summaries
- empty states are explicit and styled, never raw text dumps

5. Multilingual parity
- RU/BE/EN layouts and interaction patterns are identical
- locale switch keeps the current route and query parameters

6. Accessible by default
- clear focus states
- sufficient contrast for text and controls
- forms and controls with labels and keyboard support

### Visual decisions (locked)
- palette: light academic, cool neutral surfaces
- accent: dark blue for actions and active states
- forbidden tones: beige/brown and warm sand backgrounds
- header: two-row layout (utility + main nav)
- background: light gradient, low visual noise
- density: medium

---

## 2) Reference Analysis

### Sources to borrow from
- Oxford Law: clean structural header and balanced typography
- Harvard Law: strong first-screen framing and quick actions
- UCL Laws: section rhythm and clear value blocks
- HSE Law: practical content density for RU-speaking audience
- Stanford Law: media-forward but controlled hero composition

### What to copy
- large but disciplined heading scale
- compact yet readable top navigation
- mixed blocks: quick links + recent news + key institutional info
- image-forward news cards with strong fallbacks when media is absent

### What not to copy
- oversized promotional hero sliders
- deep multi-level mega menus in MVP
- heavily animated layouts that reduce content legibility

### Derived UI rules
- avoid more than 2 primary actions per section header
- max line length for prose: 70-78 characters
- cards must support no-image mode without layout break
- first meaningful content must appear within initial viewport on desktop

---

## 3) Information Architecture (Current Route Contract)

### Route map
- `/<locale>`: Home
- `/<locale>/news`: News listing
- `/<locale>/news/[slug]`: News detail
- `/<locale>/materials`: Materials and documents
- `/<locale>/departments`: Departments listing
- `/<locale>/persons`: People listing
- `/<locale>/search`: Unified search

### Global header contract
- top utility row: audience shortcuts + locale switch
- primary navigation row: Home, News, Materials, Departments, People, Search, Portal
- sticky header on desktop; non-blocking on mobile

### Footer contract
- institutional block: faculty name and short descriptor
- navigation block: key public links
- contact block: address/phone/email placeholder
- utility block: legal/info links placeholder

---

## 4) Page Templates

### 4.1 Home (`/[locale]`)
1. Hero section
- kicker
- value proposition headline
- short supporting paragraph
- two CTAs: News and Materials

2. Quick access grid
- 6 tiles minimum: News, Materials, Departments, People, Search, Portal

3. Latest news section
- section title + link to full listing
- 3-6 cards
- each card: cover (optional), date, title, excerpt, open action

4. Academic tracks section
- static informational cards: Bachelor, Master, Postgraduate

5. Research directions section
- static directional cards: legal analytics, public law, business law

6. Contact strip
- short institution contact cluster + action link

### 4.2 News List (`/[locale]/news`)
- page intro block
- local filter bar:
  - query (`q`) filter
  - optional year hint (placeholder in MVP)
- vertical editorial list of cards
- each item: cover, date, title, excerpt, open link
- empty state with actionable hint

### 4.3 News Detail (`/[locale]/news/[slug]`)
- breadcrumb line
- category/date meta line
- title + excerpt
- cover (if present)
- article content body (HTML or text fallback)
- preview mode banner when draft mode is enabled

### 4.4 Materials (`/[locale]/materials`)
- intro block with usage hint
- card list with title, description, file action
- file metadata line if available
- explicit no-file state

### 4.5 Departments (`/[locale]/departments`)
- intro block
- grid of department cards
- each card: title, description, contacts

### 4.6 People (`/[locale]/persons`)
- intro block
- list of person cards
- each card: full name, position, department

### 4.7 Search (`/[locale]/search`)
- intro block
- search form with query persistence
- unified results list
- each result: type badge, title, excerpt, URL path link when available

---

## 5) Component System

### Header
- utility row (`audience links`, `locale switcher`)
- primary row (`brand`, `main navigation`)
- mobile: rows stack, nav wraps naturally

### Hero
- compact editorial block with highlighted accent border/background
- supports optional side panel with key facts

### Section header
- title + optional single CTA link
- aligned baseline for title and action

### Cards
- shared container tokens for all card-like content
- variants:
  - `news-card`
  - `info-card`
  - `document-card`
- states: default, hover, keyboard focus

### Lists and stacks
- `list-stack` for linear content pages
- `card-grid` for categorical collections

### Forms
- shared controls for search and portal-auth adjacent pages
- clear focus ring and border transitions

### Alerts and empty states
- `preview-banner` for draft mode
- `empty-state` with dashed boundary and explanatory text

### Footer
- four-column desktop layout, one-column mobile layout

---

## 6) Design Tokens (Implementation Contract)

### Colors
- `--color-bg`: page background
- `--color-surface`: elevated block background
- `--color-surface-strong`: stronger card background
- `--color-text`: primary text
- `--color-text-muted`: secondary text
- `--color-accent`: primary accent
- `--color-accent-soft`: subtle accent background
- `--color-border`: default border

### Typography
- heading family: `--font-heading`
- body family: `--font-body`
- scale:
  - h1: 2.1rem to 3.2rem (fluid)
  - h2: 1.5rem to 2.1rem
  - h3: 1.2rem to 1.5rem
  - body: 1rem
  - meta: 0.9rem

### Layout and spacing
- max content width: 1200px
- section gap: 2rem desktop, 1.2rem mobile
- radius scale: 10/14/20px
- shadow scale: subtle and medium elevations

### Motion
- transition 160-220ms for hover/focus interactions
- no heavy parallax or auto-running animation in MVP

---

## 7) Content Rules

### News
- title: 60-100 chars recommended
- excerpt: 120-260 chars recommended
- cover: 16:9 preferred, safe fallback to text-only card

### Materials
- title and description required for readability
- file action must always be visually obvious

### Departments and people
- avoid empty contact/position fields in published content
- if empty, show explicit fallback labels

### Search
- result title is mandatory
- excerpt optional, but should be present whenever possible

---

## 8) Responsive and Accessibility Rules

### Breakpoints
- desktop: >= 1024px
- tablet: 640-1023px
- mobile: < 640px

### Responsive behavior
- header rows stack on tablet/mobile
- grids collapse from 3/4 columns to 1 column progressively
- media elements keep consistent aspect ratio

### Accessibility baseline
- visible `:focus-visible` ring on links/buttons/inputs
- contrast target: WCAG AA for text and controls
- clickable targets at least ~40px in control height where relevant

---

## 9) Implementation Mapping (Current Repo)

### Core styling
- `web/app/globals.css`: tokens, base layout, shared components

### App shell
- `web/app/[locale]/layout.js`: header, utility links, nav, footer
- `web/app/[locale]/locale-switcher.js`: locale behavior and active state

### Public pages
- `web/app/[locale]/page.js`
- `web/app/[locale]/news/page.js`
- `web/app/[locale]/news/[slug]/page.js`
- `web/app/[locale]/materials/page.js`
- `web/app/[locale]/departments/page.js`
- `web/app/[locale]/persons/page.js`
- `web/app/[locale]/search/page.js`

### Data adapters
- `web/lib/content.js`: list/detail fetch contracts
- `web/lib/strapi.js`: media URL normalization and fetch strategy
- `web/lib/i18n.js`: all text labels for RU/BE/EN

---

## 10) Acceptance Checklist

### IA and navigation
- each public route has clear page intro and stable entry points
- header gives access to all key sections in one click

### Visual consistency
- all pages use shared tokens and component classes
- card/list styles are unified across content types

### Data resilience
- no runtime crash when cover/file/description is absent
- empty states are explicit and styled

### Localization
- RU/BE/EN labels are complete for updated public templates
- locale switching preserves path and query string

### Technical verification
- `npm run build` passes in `web/`
- critical routes render without hydration errors
