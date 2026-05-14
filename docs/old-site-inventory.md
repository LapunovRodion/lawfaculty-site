# Old Site Inventory

Snapshot date: 2026-05-12.

Source: `https://law.bsu.by`.

## Fetch Notes
- Normal HTTPS verification fails locally: `unable to get local issuer certificate`.
- Read-only inventory was collected with `curl -k -L -A "Mozilla/5.0"`.
- `/robots.txt` is available and does not list disallow rules.
- `/sitemap.xml` returns a 404 page.
- Main navigation and news inventory therefore come from the home page and `/novosti.html`.

## Launch-Scope Sections

| Old section | Example source path | Target type/route | Migration relevance |
| --- | --- | --- | --- |
| News list | `/novosti.html` | `News`, `/ru/news` | Import first 10 latest items. |
| News categories | `/novosti/novosti-o-konferentsiyakh.html` | `News` category metadata or migration notes | Preserve source category in migration notes. |
| Departments | `/departments.html` | `Department`, `/ru/departments` | Import all department pages. |
| Department detail | `/departments/constitutional-law-department.html` | `Department`, `/ru/departments/:slug` | Import detail content, contacts, linked staff/materials. |
| Staff/person pages | linked from department/detail pages | `Person`, `/ru/persons/:slug` | Discover during department crawl. |
| Methodological materials | `/student/uchebnye-materialy/metodicheskie-materialy.html` | `Material`, `/ru/materials` | Import selected files and bind each to one department. |
| Schedule files | `/student/rasklad-zanyatkau/dnevnoe-otdelenie.html` | structured schedule, `/ru/schedule` | Use as source evidence, convert to structured entries. |
| Search | `/search.html` | `/ru/search` | Do not migrate content; use as parity reference. |

## Main Navigation Inventory

| Top-level section | Representative paths | Notes |
| --- | --- | --- |
| Student | `/student/rasklad-zanyatkau/dnevnoe-otdelenie.html`, `/student/uchebnye-materialy/metodicheskie-materialy.html`, `/student/educational-resources.html` | Contains schedule and materials in launch scope. |
| Masters | `/masters-courses/obuchayuschimsya-v-magistrature.html`, `/masters-courses/magistratura.html` | Not in first migration scope except schedule references if needed. |
| Faculty | `/faculty/presentation.html`, `/faculty/decanat.html`, `/faculty/library.html` | Useful for future page migration and footer/contact validation. |
| Departments | `/departments.html` | In launch scope. |
| Projects | `/proekty/yuridicheskie-kliniki-belarusi.html`, `/proekty/icc-lex-mercatoria.html` | Future page/content migration candidate. |
| Science | `/science.html`, `/science/scientific-conferences.html`, `/science/scientific-circles.html` | Future page/content migration candidate; some news categories point here. |
| Applicants | `/abiturientu.html`, `/abiturientu/magistratura.html` | Future page/content migration candidate. |

## Department Inventory

| Source path | Source title observed in navigation |
| --- | --- |
| `/departments/department-of-theory-and-history-of-state-and-law.html` | Кафедра тэорыі і гісторыі дзяржавы і права |
| `/departments/constitutional-law-department.html` | Кафедра канстытуцыйнага права |
| `/departments/department-of-criminalistics.html` | Кафедра крыміналістыкі |
| `/departments/the-civil-law-department.html` | Кафедра грамадзянскага права |
| `/departments/environmental-and-ruralalaw-department.html` | Кафедра экалагічнага і аграрнага права |
| `/departments/the-department-of-civil-procedure-labor-law.html` | Кафедра грамадзянскага працэсу і працоўнага права |
| `/departments/department-of-criminal-law.html` | Кафедра крымінальнага права |
| `/departments/the-department-of-political-science.html` | Кафедра паліталогіі |
| `/departments/department-of-criminal-procedure-and-directorate-of-public-prosecutions.html` | Кафедра крымінальнага працэсу і пракурорскага нагляду |
| `/departments/department-of-public-administration.html` | Кафедра дзяржаўнага кіравання |
| `/departments/department-of-economic-law.html` | Кафедра гаспадарчага права |
| `/departments/kafedra-prava-intelektualnaj-ulasnastsi.html` | Кафедра права інтэлектуальнай уласнасці |
| `/departments/english-language-section.html` | Секцыя англійскай мовы |
| `/departments/laboratory-of-forensic-technology.html` | Вучэбная лабараторыя крыміналістычнай тэхнікі і судовых экспертыз кафедры крыміналістыкі |

## Latest News Candidates

`/novosti.html` currently exposes these first-page item URLs. Verify exact titles, dates, and media during import before publishing.

| Source path | Initial target |
| --- | --- |
| `/novosti/novosti-o-konferentsiyakh/17883-19-2026.html` | `News` |
| `/novosti/novosti-kafedry-ekologicheskogo-i-agrarnogo-prava/17882-15-2028.html` | `News` |
| `/novosti/novosti-kafedry-ekologicheskogo-i-agrarnogo-prava/17881-18-21-2026.html` | `News` |
| `/novosti/novosti-kafedry-gosudarstvennogo-upravleniya/17879-16-05-2026.html` | `News` |
| `/novosti/novosti-kafedry-konstitutsionnogo-prava/17878-18-maya-2026-g-zashchita-kursovykh-rabot-pod-rukovodstvom-dotsenta-sharshuna-v-a.html` | `News` |
| `/novosti/novosti-kafedry-konstitutsionnogo-prava/17877-13-maya-2026-g-zashchita-kursovykh-rabot-pod-rukovodstvom-dotsenta-kondratovich-n-m.html` | `News` |
| `/novosti/novosti-kafedry-konstitutsionnogo-prava/17876-12-maya-2026-g-zashchita-kursovykh-rabot-pod-rukovodstvom-dotsenta-maslovskoj-t-s.html` | `News` |
| `/novosti/novosti-nauchnykh-kruzhkov/17875-30-aprelya-2026-g-sostoyalos-sovmestnoe-zasedanie-studencheskikh-nauchnykh-kruzhkov-sovremennaya-tsivilistika-i-semejnoe-pravo-na-temu-chastnopravovye-dogovory-v-sfere-vspomogatelnykh-reproduktivnykh-tekhnologij.html` | `News` |
| `/novosti/novosti-o-konferentsiyakh/17873-otchet-o-zasedanii-nauchnogo-kruzhka-po-problemam-gosudarstvennogo-upravleniya.html` | `News` |
| `/novosti/novosti-o-konferentsiyakh/17872-torzhestvennoe-meropriyatie-posvyashchennoe-dnyu-gosudarstvennogo-flaga-gosudarstvennogo-gerba-i-gosudarstvennogo-gimna-respubliki-belarus.html` | `News` |

## News Category Inventory

Categories discovered from `/novosti.html` include:
- `/novosti/novosti-kriminalisticheskoj-laboratorii.html`
- `/novosti/novosti-laboratorii-tso.html`
- `/novosti/novosti-razdela-metodicheskikh-materialov.html`
- `/novosti/novosti-yuridicheskoj-kliniki.html`
- `/novosti/novosti-profbyuro-yuridicheskogo-fakulteta.html`
- `/novosti/novosti-kafedry-finansovogo-prava-i-pravovogo-regulirovaniya-khozyajstvennoj-deyatelnosti.html`
- `/novosti/novosti-studencheskoj-yuridicheskoj-olimpiady.html`
- `/novosti/novosti-nauchnoj-zhizni.html`
- `/novosti/novosti-razdela-dissertatsii.html`
- `/novosti/novosti-magistratury.html`
- `/novosti/novosti-aspirantury.html`
- `/novosti/novosti-soveta-fakulteta.html`
- `/novosti/novosti-dekanata-dnevnogo-otdeleniya.html`
- `/novosti/novosti-dekanata-zaochnogo-otdeleniya.html`
- `/novosti/novosti-dekanata-2go-vysshego-obrazovaniya.html`
- `/novosti/novosti-razdela-vospitanie.html`
- `/novosti/novosti-yuridicheskikh-klinik-belarusi.html`
- `/novosti/novosti-nauchnykh-kruzhkov.html`
- `/novosti/novosti-uchebno-metodicheskoj-komissii-yuridicheskogo-fakulteta.html`
- `/novosti/novosti-razdela-elektronnaya-biblioteka.html`
- `/novosti/novosti-sporta.html`
- `/novosti/novosti-studencheskogo-soveta-po-kachestvu-obrazovaniya.html`
- `/novosti/novosti-gazety-ostrov-yuf.html`
- `/novosti/novosti-konkursa-icc-lex-mercatoria.html`
- `/novosti/novosti-sektsii-anglijskogo-yazyka.html`
- `/novosti/novosti-letnego-universiteta.html`
- `/novosti/novosti-kafedry-gosudarstvennogo-upravleniya.html`
- `/novosti/novosti-fakulteta.html`
- `/novosti/novosti-kafedr.html`
- `/novosti/novosti-dekanata.html`
- `/novosti/novosti-laboratorij.html`
- `/novosti/novosti-biblioteki.html`
- `/novosti/novosti-o-konferentsiyakh.html`
- `/novosti/novosti-dlya-abiturientov.html`
- `/novosti/novosti-razdela-ekopravo.html`
- `/novosti/novosti-razdela-mezhdunarodnye-svyazi.html`
- `/novosti/novosti-studencheskoj-zhizni.html`
- `/novosti/novosti-kafedry-kriminalistiki.html`
- `/novosti/novosti-kafedry-ekologicheskogo-i-agrarnogo-prava.html`
- `/novosti/novosti-kafedry-konstitutsionnogo-prava.html`
- `/novosti/novosti-kafedry-ugolovnogo-protsessa-i-prokurorskogo-nadzora.html`
- `/novosti/novosti-kafedry-grazhdanskogo-protsessa-i-trudovogo-prava.html`
- `/novosti/novosti-kafedry-grazhdanskogo-prava.html`
- `/novosti/novosti-kafedry-ugolovnogo-prava.html`
- `/novosti/novosti-kafedry-teorii-i-istorii-gosudarstva-i-prava.html`
- `/novosti/novosti-kafedry-politologii.html`
- `/novosti/novosti-goda-kachestva-2024.html`

## Next Inventory Work
- Crawl each department page and capture linked staff/person URLs.
- Crawl methodological materials and classify each selected file by department.
- Record a source URL to target type mapping in the migration map before import.
