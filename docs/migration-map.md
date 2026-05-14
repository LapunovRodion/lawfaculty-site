# Migration Map

Status values follow `docs/content-migration-plan.md`.

## Rules
- Preserve every source URL in migration notes for audit and redirect planning.
- Use `ru` as the source locale for imported entries.
- Upload source media/files into Strapi/MinIO before publishing migrated entries.
- Keep target IDs as `TBD` until records are created in Strapi.
- Keep target routes as route patterns where final slugs depend on imported titles.

## News: First Import Batch

| Source URL | Source type | Target type | Target ID | Locale | Target route | Status | Notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `https://law.bsu.by/novosti/novosti-o-konferentsiyakh/17883-19-2026.html` | news | `News` | 16 | `ru` | `/ru/news/19-2026` | imported | Created as draft; no media. |
| `https://law.bsu.by/novosti/novosti-kafedry-ekologicheskogo-i-agrarnogo-prava/17882-15-2028.html` | news | `News` | 18 | `ru` | `/ru/news/15-2028` | imported | Created as draft; no media. |
| `https://law.bsu.by/novosti/novosti-kafedry-ekologicheskogo-i-agrarnogo-prava/17881-18-21-2026.html` | news | `News` | 20 | `ru` | `/ru/news/18-21-2026` | imported | Created as draft; no media. |
| `https://law.bsu.by/novosti/novosti-kafedry-gosudarstvennogo-upravleniya/17879-16-05-2026.html` | news | `News` | 22 | `ru` | `/ru/news/16-05-2026` | imported | Created as draft; no media. |
| `https://law.bsu.by/novosti/novosti-kafedry-konstitutsionnogo-prava/17878-18-maya-2026-g-zashchita-kursovykh-rabot-pod-rukovodstvom-dotsenta-sharshuna-v-a.html` | news | `News` | 24 | `ru` | `/ru/news/18-maya-2026-g-zashchita-kursovykh-rabot-pod-rukovodstvom-dotsenta-sharshuna-v-a` | imported | Created as draft; no media. |
| `https://law.bsu.by/novosti/novosti-kafedry-konstitutsionnogo-prava/17877-13-maya-2026-g-zashchita-kursovykh-rabot-pod-rukovodstvom-dotsenta-kondratovich-n-m.html` | news | `News` | 26 | `ru` | `/ru/news/13-maya-2026-g-zashchita-kursovykh-rabot-pod-rukovodstvom-dotsenta-kondratovich-n-m` | imported | Created as draft; no media. |
| `https://law.bsu.by/novosti/novosti-kafedry-konstitutsionnogo-prava/17876-12-maya-2026-g-zashchita-kursovykh-rabot-pod-rukovodstvom-dotsenta-maslovskoj-t-s.html` | news | `News` | 28 | `ru` | `/ru/news/12-maya-2026-g-zashchita-kursovykh-rabot-pod-rukovodstvom-dotsenta-maslovskoj-t-s` | imported | Created as draft; no media. |
| `https://law.bsu.by/novosti/novosti-nauchnykh-kruzhkov/17875-30-aprelya-2026-g-sostoyalos-sovmestnoe-zasedanie-studencheskikh-nauchnykh-kruzhkov-sovremennaya-tsivilistika-i-semejnoe-pravo-na-temu-chastnopravovye-dogovory-v-sfere-vspomogatelnykh-reproduktivnykh-tekhnologij.html` | news | `News` | 30 | `ru` | `/ru/news/30-aprelya-2026-g-sostoyalos-sovmestnoe-zasedanie-studencheskikh-nauchnykh-kruzhkov-sovremennaya-tsivilistika-i-semejnoe-pravo-na-temu-chastnopravovye-dogovory-v-sfere-vspomogateln` | imported | Created as draft; cover and gallery imported. |
| `https://law.bsu.by/novosti/novosti-o-konferentsiyakh/17873-otchet-o-zasedanii-nauchnogo-kruzhka-po-problemam-gosudarstvennogo-upravleniya.html` | news | `News` | 32 | `ru` | `/ru/news/otchet-o-zasedanii-nauchnogo-kruzhka-po-problemam-gosudarstvennogo-upravleniya` | imported | Created as draft; cover and gallery imported. |
| `https://law.bsu.by/novosti/novosti-o-konferentsiyakh/17872-torzhestvennoe-meropriyatie-posvyashchennoe-dnyu-gosudarstvennogo-flaga-gosudarstvennogo-gerba-i-gosudarstvennogo-gimna-respubliki-belarus.html` | news | `News` | 34 | `ru` | `/ru/news/torzhestvennoe-meropriyatie-posvyashchennoe-dnyu-gosudarstvennogo-flaga-gosudarstvennogo-gerba-i-gosudarstvennogo-gimna-respubliki-belarus` | imported | Created as draft; cover and gallery imported. |

## Departments

| Source URL | Source type | Target type | Target ID | Locale | Target route | Status | Notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `https://law.bsu.by/departments/department-of-theory-and-history-of-state-and-law.html` | department | `Department` | 6 | `ru` | `/ru/departments/department-of-theory-and-history-of-state-and-law` | imported | Created as draft; linked staff migration remains pending. |
| `https://law.bsu.by/departments/constitutional-law-department.html` | department | `Department` | 8 | `ru` | `/ru/departments/constitutional-law-department` | imported | Created as draft; linked staff migration remains pending. |
| `https://law.bsu.by/departments/department-of-criminalistics.html` | department | `Department` | 10 | `ru` | `/ru/departments/department-of-criminalistics` | imported | Created as draft; two old `.doc/.docx` files returned 404. |
| `https://law.bsu.by/departments/the-civil-law-department.html` | department | `Department` | 12 | `ru` | `/ru/departments/the-civil-law-department` | imported | Created as draft; linked staff migration remains pending. |
| `https://law.bsu.by/departments/environmental-and-ruralalaw-department.html` | department | `Department` | 14 | `ru` | `/ru/departments/environmental-and-ruralalaw-department` | imported | Created as draft; linked staff migration remains pending. |
| `https://law.bsu.by/departments/the-department-of-civil-procedure-labor-law.html` | department | `Department` | 16 | `ru` | `/ru/departments/the-department-of-civil-procedure-labor-law` | imported | Created as draft; linked staff migration remains pending. |
| `https://law.bsu.by/departments/department-of-criminal-law.html` | department | `Department` | 18 | `ru` | `/ru/departments/department-of-criminal-law` | imported | Created as draft; linked staff migration remains pending. |
| `https://law.bsu.by/departments/the-department-of-political-science.html` | department | `Department` | 20 | `ru` | `/ru/departments/the-department-of-political-science` | imported | Created as draft; linked staff migration remains pending. |
| `https://law.bsu.by/departments/department-of-criminal-procedure-and-directorate-of-public-prosecutions.html` | department | `Department` | 22 | `ru` | `/ru/departments/department-of-criminal-procedure-and-directorate-of-public-prosecutions` | imported | Created as draft; one old image returned 404. |
| `https://law.bsu.by/departments/department-of-public-administration.html` | department | `Department` | 24 | `ru` | `/ru/departments/department-of-public-administration` | imported | Created as draft; linked staff migration remains pending. |
| `https://law.bsu.by/departments/department-of-economic-law.html` | department | `Department` | 26 | `ru` | `/ru/departments/department-of-economic-law` | imported | Created as draft; linked staff migration remains pending. |
| `https://law.bsu.by/departments/kafedra-prava-intelektualnaj-ulasnastsi.html` | department | `Department` | 28 | `ru` | `/ru/departments/kafedra-prava-intelektualnaj-ulasnastsi` | imported | Created as draft; linked staff migration remains pending. |
| `https://law.bsu.by/departments/english-language-section.html` | department | `Department` | 30 | `ru` | `/ru/departments/english-language-section` | imported | Created as draft; linked staff migration remains pending. |
| `https://law.bsu.by/departments/laboratory-of-forensic-technology.html` | department | `Department` | 32 | `ru` | `/ru/departments/laboratory-of-forensic-technology` | imported | Created as draft; linked staff migration remains pending. |

## Launch-Scope Section Entries

| Source URL | Source type | Target type | Target ID | Locale | Target route | Status | Notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `https://law.bsu.by/student/uchebnye-materialy/metodicheskie-materialy.html` | materials index | `Material` | TBD | `ru` | `/ru/materials` | pending | Crawl selected files; each target material requires one department. |
| `https://law.bsu.by/student/rasklad-zanyatkau/dnevnoe-otdelenie.html` | schedule file page | `ScheduleEntry` | TBD | `ru` | `/ru/schedule` | pending | Use as evidence; convert to structured entries. |
| `https://law.bsu.by/student/rasklad-zanyatkau/pervoe-vysshee-i-parallelnoe-obrazovanie.html` | schedule file page | `ScheduleEntry` | TBD | `ru` | `/ru/schedule` | pending | Use as evidence; convert to structured entries. |
| `https://law.bsu.by/student/rasklad-zanyatkau/vtoroe-vysshee-obrazovanie.html` | schedule file page | `ScheduleEntry` | TBD | `ru` | `/ru/schedule` | pending | Use as evidence; convert to structured entries. |
| `https://law.bsu.by/search.html` | search page | none | n/a | n/a | `/ru/search` | skipped | Reference only; current project uses Meilisearch. |
