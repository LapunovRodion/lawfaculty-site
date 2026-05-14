BEGIN;

CREATE TEMP TABLE tmp_constitutional_department_components AS
SELECT dc.component_type, dc.cmp_id
FROM departments_cmps dc
JOIN departments d ON d.id = dc.entity_id
WHERE d.slug = 'constitutional-law-department'
  AND dc.component_type IN (
    'department.fact',
    'department.discipline',
    'department.link-item',
    'department.document-item',
    'department.rich-section'
  );

DELETE FROM departments_cmps
WHERE entity_id IN (SELECT id FROM departments WHERE slug = 'constitutional-law-department')
  AND component_type IN (
    'department.fact',
    'department.discipline',
    'department.link-item',
    'department.document-item',
    'department.rich-section'
  );

DELETE FROM components_department_facts
WHERE id IN (
  SELECT cmp_id FROM tmp_constitutional_department_components WHERE component_type = 'department.fact'
);

DELETE FROM components_department_disciplines
WHERE id IN (
  SELECT cmp_id FROM tmp_constitutional_department_components WHERE component_type = 'department.discipline'
);

DELETE FROM components_department_link_items
WHERE id IN (
  SELECT cmp_id FROM tmp_constitutional_department_components WHERE component_type = 'department.link-item'
);

DELETE FROM components_department_document_items
WHERE id IN (
  SELECT cmp_id FROM tmp_constitutional_department_components WHERE component_type = 'department.document-item'
);

DELETE FROM components_department_rich_sections
WHERE id IN (
  SELECT cmp_id FROM tmp_constitutional_department_components WHERE component_type = 'department.rich-section'
);

UPDATE departments
SET
  tagline = 'Одна из ведущих кафедр публично-правового профиля в Республике Беларусь',
  overview = 'Кафедра конституционного права юридического факультета БГУ является одной из ведущих в республике. Она организована в 1921 году одновременно с открытием университета и юридического факультета.',
  description = 'Кафедра конституционного права юридического факультета БГУ является одной из ведущих в республике. На кафедре работали выдающиеся ученые и педагоги: В.Н. Дурденевский, Н.А. Коноплин, А.В. Горбунов, Г.С. Гурвич, С.Р. Вихарев и другие.',
  history = $history$
<p>Кафедра конституционного права юридического факультета Белорусского государственного университета является одной из ведущих в республике. Кафедра организована в 1921 году одновременно с открытием университета и юридического факультета.</p>
<p>На кафедре работали выдающиеся ученые и педагоги: В.Н. Дурденевский, Н.А. Коноплин, А.В. Горбунов, Г.С. Гурвич, С.Р. Вихарев и другие. Первым заведующим был профессор В.Н. Дурденевский. С 1927 по 1937 год кафедру возглавлял профессор Н.А. Коноплин, а с 1938 по 1941 год и с 1945 по 1954 год - доцент Л.А. Рудзицкий.</p>
<p>Значительный вклад в развитие кафедры и подготовку специалистов внес профессор, Заслуженный юрист Республики Беларусь А.А. Головко, который возглавлял кафедру с 1965 по 1990 год. Им опубликовано более 400 научных работ и подготовлено 35 кандидатов и 5 докторов юридических наук.</p>
<p>С 1965 года кафедра называлась кафедрой государственного права и советского строительства. В 1991 году кафедра была переименована в кафедру конституционного права. С 1991 по 1998 год кафедру возглавлял профессор А.Н. Крамник, кандидат юридических наук, доцент.</p>
<p>С сентября 1998 года кафедру возглавляет профессор Г.А. Василевич, доктор юридических наук, профессор, Заслуженный юрист Республики Беларусь, член-корреспондент Национальной академии наук Беларуси. Он является автором и соавтором более тысячи научных публикаций, более ста книг и монографий, более 50 учебников и учебных пособий.</p>
$history$,
  teaching_summary = $teaching$
<p>Кафедра обеспечивает преподавание конституционного права, конституционного права зарубежных стран, права прав человека, административно-деликтного и процессуально-исполнительного права, информационного права, конституционного правосудия и других дисциплин.</p>
<p>Расширен круг специальных курсов, многие из которых являются авторскими курсами членов кафедры. За кафедрой закреплены дисциплины по специальностям «Правоведение», «Экономическое право», «Политология», а также дисциплины магистратуры и курсы на других факультетах.</p>
$teaching$,
  research_summary = $research$
<p>Кафедра поддерживает научные связи с Национальным центром законодательства и правовых исследований Республики Беларусь, Институтом законодательства и сравнительного правоведения при Правительстве Российской Федерации, родственными кафедрами Академии управления при Президенте Республики Беларусь, Брестского государственного университета имени А.С. Пушкина, Московского государственного университета имени М.В. Ломоносова, Санкт-Петербургского государственного университета, Люблинского университета имени Марии Кюри-Складовской и другими вузами.</p>
<p>Результаты научно-исследовательской работы кафедры используются в образовательном процессе, при подготовке учебников, учебно-методических пособий и экспертных материалов. Многие члены кафедры входили в составы рабочих групп Национального центра законодательства и правовых исследований Республики Беларусь.</p>
$research$,
  head_note = $head$
<p><strong>Заведующий кафедрой:</strong> Василевич Рыгор Аляксеевич - доктор юридических наук, профессор, Заслуженный юрист Республики Беларусь.</p>
$head$,
  contacts = 'Адрес: 220030, г. Минск, ул. Ленинградская, д. 8, к. 307
Телефон: +375 (17) 2095576
Email: constlaw.bsu@yandex.by',
  address = '220030, г. Минск, ул. Ленинградская, д. 8',
  office = '307',
  phone = '+375 (17) 2095576',
  email = 'constlaw.bsu@yandex.by',
  updated_at = now()
WHERE slug = 'constitutional-law-department';

DO $$
DECLARE
  dept_id integer;
  cmp_id integer;
  item_order integer;
BEGIN
  FOR dept_id IN SELECT id FROM departments WHERE slug = 'constitutional-law-department' ORDER BY id LOOP
    item_order := 0;
    FOR cmp_id IN
      INSERT INTO components_department_facts (label, value)
      VALUES
        ('Год основания', '1921'),
        ('Современное название', 'с 1991 года'),
        ('Научное наследие А.А. Головко', '400+ научных работ'),
        ('Публикации Г.А. Василевича', '1000+ публикаций')
      RETURNING id
    LOOP
      INSERT INTO departments_cmps (entity_id, cmp_id, component_type, field, "order")
      VALUES (dept_id, cmp_id, 'department.fact', 'keyFacts', item_order);
      item_order := item_order + 1;
    END LOOP;

    item_order := 0;
    FOR cmp_id IN
      INSERT INTO components_department_disciplines (title, details)
      VALUES
        ('Конституционное право', 'Базовая дисциплина публично-правового профиля.'),
        ('Конституционное право зарубежных стран', 'Сравнительное изучение конституционных систем.'),
        ('Право прав человека', 'Правовой статус личности и механизмы защиты прав.'),
        ('Административно-деликтное и процессуально-исполнительное право', 'Публично-правовая ответственность и процедурные вопросы.'),
        ('Информационное право', 'Правовое регулирование информационной сферы.'),
        ('Конституционное правосудие', 'Конституционный контроль и правовые позиции органов конституционного правосудия.')
      RETURNING id
    LOOP
      INSERT INTO departments_cmps (entity_id, cmp_id, component_type, field, "order")
      VALUES (dept_id, cmp_id, 'department.discipline', 'disciplines', item_order);
      item_order := item_order + 1;
    END LOOP;

    item_order := 0;
    FOR cmp_id IN
      INSERT INTO components_department_link_items (title, url, description)
      VALUES
        ('Наследие права: избранные труды А.А. Головко', 'https://union.by/files/00214/obj/110/2283/doc/golovko_izbrannie_trudi.pdf', 'PDF со старой страницы кафедры.'),
        ('Список дисциплин по специальности «Правоведение»', 'https://law.bsu.by/index.php?option=com_content&view=article&id=6798&Itemid=7', 'Дневная и заочная формы обучения.'),
        ('Список дисциплин по специальности «Экономическое право»', 'https://law.bsu.by/index.php?option=com_content&view=article&id=6799&Itemid=7', 'Дневная форма обучения.'),
        ('Список дисциплин по специальности «Политология»', 'https://law.bsu.by/index.php?option=com_content&view=article&id=6800&Itemid=7', 'Дневная форма обучения.'),
        ('Магистратура', 'https://law.bsu.by/index.php?option=com_content&view=article&id=6826&Itemid=7', 'Дисциплины и материалы для магистратуры.'),
        ('Тематика дипломных работ', 'http://minio:9000/law-site/26_d_2024_cd9284849e.docx', 'Документ со старой страницы кафедры.'),
        ('Тематика курсовых работ', 'http://minio:9000/law-site/26_k_2024_e153e7981b.docx', 'Документ со старой страницы кафедры.'),
        ('Вопросы в аспирантуру: 12.00.02', 'http://minio:9000/law-site/26_asp_12_00_02_2215e6cda0.docx', 'Конституционное право, конституционный процесс, муниципальное право.'),
        ('Вопросы в аспирантуру: 12.00.13', 'http://minio:9000/law-site/26_asp_12_00_13_1f6b657604.docx', 'Информационное право.'),
        ('Вопросы в аспирантуру: 12.00.14', 'http://minio:9000/law-site/26_asp_12_00_14_11be865fe3.docx', 'Административное право, административный процесс.'),
        ('Регистрация в системе «Антиплагиат»', 'https://docs.google.com/forms/d/19DTudSPy7m22vmEqLle63Di5YG78uvVJ8cVYMhwF0IU/edit', 'Форма сбора информации для регистрации на кафедре.')
      RETURNING id
    LOOP
      INSERT INTO departments_cmps (entity_id, cmp_id, component_type, field, "order")
      VALUES (dept_id, cmp_id, 'department.link-item', 'usefulLinks', item_order);
      item_order := item_order + 1;
    END LOOP;

    item_order := 0;
    FOR cmp_id IN
      INSERT INTO components_department_rich_sections (title, content)
      VALUES
        ('Аспирантура', $section$
<p>Кафедра ведет подготовку по специальностям аспирантуры:</p>
<ul>
  <li>12.00.02 - Конституционное право, конституционный процесс, муниципальное право;</li>
  <li>12.00.13 - Информационное право;</li>
  <li>12.00.14 - Административное право, административный процесс.</li>
</ul>
<p>Вопросы для вступительных экзаменов вынесены в блок полезных ссылок.</p>
$section$),
        ('Наследие права', $section$
<p>На старой странице кафедры выделен раздел «Наследие права» с материалами, посвященными научной школе кафедры и избранным трудам А.А. Головко.</p>
$section$)
      RETURNING id
    LOOP
      INSERT INTO departments_cmps (entity_id, cmp_id, component_type, field, "order")
      VALUES (dept_id, cmp_id, 'department.rich-section', 'extraSections', item_order);
      item_order := item_order + 1;
    END LOOP;
  END LOOP;
END $$;

COMMIT;
