BEGIN;

CREATE TEMP TABLE tmp_civil_law_department_components AS
SELECT dc.component_type, dc.cmp_id
FROM departments_cmps dc
JOIN departments d ON d.id = dc.entity_id
WHERE d.slug = 'the-civil-law-department'
  AND dc.component_type IN (
    'department.fact',
    'department.discipline',
    'department.link-item',
    'department.document-item',
    'department.rich-section'
  );

DELETE FROM departments_cmps
WHERE entity_id IN (SELECT id FROM departments WHERE slug = 'the-civil-law-department')
  AND component_type IN (
    'department.fact',
    'department.discipline',
    'department.link-item',
    'department.document-item',
    'department.rich-section'
  );

DELETE FROM components_department_facts
WHERE id IN (SELECT cmp_id FROM tmp_civil_law_department_components WHERE component_type = 'department.fact');

DELETE FROM components_department_disciplines
WHERE id IN (SELECT cmp_id FROM tmp_civil_law_department_components WHERE component_type = 'department.discipline');

DELETE FROM components_department_link_items
WHERE id IN (SELECT cmp_id FROM tmp_civil_law_department_components WHERE component_type = 'department.link-item');

DELETE FROM components_department_document_items
WHERE id IN (SELECT cmp_id FROM tmp_civil_law_department_components WHERE component_type = 'department.document-item');

DELETE FROM components_department_rich_sections
WHERE id IN (SELECT cmp_id FROM tmp_civil_law_department_components WHERE component_type = 'department.rich-section');

UPDATE departments
SET
  title = 'Кафедра гражданского права',
  tagline = 'Крупнейшая кафедра гражданско-правового профиля в Республике Беларусь',
  overview = 'Кафедра гражданского права юридического факультета БГУ является крупнейшей кафедрой этого профиля в республике. Ее история начинается в 1921 году, а современное название кафедра получила в 1991 году.',
  description = 'Кафедра гражданского права юридического факультета БГУ является крупнейшей кафедрой гражданско-правового профиля в Республике Беларусь. Кафедра обеспечивает преподавание ключевых дисциплин частного права и ведет научные исследования по гражданскому, семейному и международному частному праву.',
  history = $history$
<p>Кафедра гражданского права юридического факультета Белорусского государственного университета является крупнейшей кафедрой этого профиля в республике. С момента образования в 1921 году она называлась кафедрой гражданского права, с 1937 года - кафедрой гражданского права и процесса, а в июле 1974 года была преобразована в две самостоятельные кафедры: гражданского и семейного права; гражданского процесса и трудового права.</p>
<p>В 1991 году кафедра получила современное название. В разные годы кафедру возглавляли известные ученые: профессор Г.М. Марков, академик М.О. Гредингер, кандидат юридических наук И.С. Андрейчик, доктор юридических наук, профессор Ф.И. Гаузе, кандидат юридических наук, доцент Г.А. Поветьев, доктор юридических наук, профессор В.Ф. Чигир, доктор юридических наук, профессор В.М. Годунов.</p>
<p>С 2017 года кафедру возглавляет М.В. Мещанова. На кафедре работают кандидаты юридических наук, доценты, старшие преподаватели, преподаватели и преподаватели-стажеры.</p>
$history$,
  teaching_summary = $teaching$
<p>Кафедра обеспечивает преподавание основных учебных дисциплин: «Гражданское право, часть первая», «Гражданское право, часть вторая», «Международное частное право», «Римское частное право», «Семейное право».</p>
<p>К дисциплинам специализации относятся гражданское и торговое право зарубежных стран, договор в гражданском праве, жилищное право, правовое регулирование отношений собственности, правовой режим недвижимости. Значительную часть работы кафедры составляет преподавание дисциплин магистерской подготовки.</p>
<p>С 2021 года кафедра реализует международную совместную образовательную программу Белорусского государственного университета и Российского университета дружбы народов с выдачей двух дипломов магистра по профилизации «Гражданское право, семейное право, международное частное право».</p>
$teaching$,
  research_summary = $research$
<p>На кафедре ведутся научные исследования по гражданскому, семейному и международному частному праву. Большой вклад в развитие гражданско-правовых наук внес доктор юридических наук, профессор, заслуженный юрист Республики Беларусь В.Ф. Чигир. В 1970 году он защитил докторскую диссертацию на тему «Жилищные правоотношения» и создал на кафедре научную школу по жилищному праву.</p>
<p>В настоящее время на кафедре работает научная школа «Юридические лица и граждане как субъекты гражданско-правовых отношений: проблемы теории и практики». Ее руководитель - профессор В.М. Годунов. В рамках научной школы защищено более 25 кандидатских диссертаций.</p>
<p>Члены кафедры участвуют в государственных научно-исследовательских работах, организуют республиканские и международные научные конференции, готовят учебники, учебные пособия, учебно-методические материалы и экспертные заключения по проектам нормативных правовых актов.</p>
$research$,
  head_note = $head$
<p><strong>Заведующая кафедрой:</strong> Мещанова Мария Валентиновна - доктор юридических наук, доцент.</p>
$head$,
  contacts = 'Адрес: 220030, г. Минск, ул. Ленинградская, д. 8, кабинет 213
Телефон: +375 (17) 2095574
Email: civillaw@bsu.by',
  address = '220030, г. Минск, ул. Ленинградская, д. 8',
  office = '213',
  phone = '+375 (17) 2095574',
  email = 'civillaw@bsu.by',
  updated_at = now()
WHERE slug = 'the-civil-law-department';

DO $$
DECLARE
  dept_id integer;
  cmp_id integer;
  item_order integer;
BEGIN
  FOR dept_id IN SELECT id FROM departments WHERE slug = 'the-civil-law-department' ORDER BY id LOOP
    item_order := 0;
    FOR cmp_id IN
      INSERT INTO components_department_facts (label, value)
      VALUES
        ('Год основания', '1921'),
        ('Современное название', 'с 1991 года'),
        ('Совместная магистратура', 'с 2021 года'),
        ('Научная школа', '25+ кандидатских диссертаций')
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
        ('Гражданское право, часть первая', 'Базовый курс частноправовой подготовки.'),
        ('Гражданское право, часть вторая', 'Обязательственное, договорное и иное частноправовое регулирование.'),
        ('Международное частное право', 'Частноправовые отношения с иностранным элементом.'),
        ('Римское частное право', 'Историческая и теоретическая основа частного права.'),
        ('Семейное право', 'Правовое регулирование семейных отношений.'),
        ('Гражданское и торговое право зарубежных стран', 'Сравнительное изучение частноправовых систем.'),
        ('Договор в гражданском праве', 'Договорные конструкции и практика их применения.'),
        ('Жилищное право', 'Правовое регулирование жилищных отношений.'),
        ('Правовое регулирование отношений собственности', 'Вещные права и режим имущества.'),
        ('Правовой режим недвижимости', 'Правовой статус и оборот недвижимого имущества.')
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
        ('Банк творческих заданий', 'https://law.bsu.by/novosti/novosti-kafedry-grazhdanskogo-prava/12359-bank-tvorcheskikh-zadanij.html', 'Материалы, подготовленные с использованием эвристических, проблемных и иных инновационных методик преподавания.'),
        ('Список дисциплин по специальности «Правоведение»', 'https://law.bsu.by/index.php?option=com_content&view=article&id=6811&Itemid=7', 'Дневная и заочная формы обучения.'),
        ('Список дисциплин по специальности «Экономическое право»', 'https://law.bsu.by/index.php?option=com_content&view=article&id=6812&Itemid=7', 'Дневная форма обучения.'),
        ('Список дисциплин по специальности «Политология»', 'https://law.bsu.by/index.php?option=com_content&view=article&id=6813&Itemid=7', 'Дневная форма обучения.'),
        ('Магистратура', 'https://law.bsu.by/index.php?option=com_content&view=article&id=6827&Itemid=7', 'Дисциплины и материалы магистерской подготовки.'),
        ('Дисциплины на других факультетах', 'https://law.bsu.by/index.php?option=com_content&view=article&id=6814&Itemid=7', 'Список дисциплин, закрепленных за кафедрой на других факультетах.'),
        ('Вопросы в аспирантуру: 12.00.03', 'http://minio:9000/law-site/29_asp_12_00_03_8e3d70c5aa.docx', 'Гражданское право, предпринимательское право, семейное право, международное частное право.')
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
        ('Учебно-методическая работа', $section$
<p>Коллективом кафедры подготовлены первые в Беларуси пособия и учебники по гражданскому, жилищному и семейному праву, первый комментарий к Гражданскому кодексу, а также первый практикум по европейскому праву.</p>
<p>Кафедра готовит типовые учебные программы по римскому частному и гражданскому праву, электронные учебно-методические комплексы по дисциплинам кафедры и другие материалы для образовательного процесса.</p>
$section$),
        ('Аспирантура', $section$
<p>Кафедра ведет подготовку по специальности 12.00.03 - гражданское право; предпринимательское право; семейное право; международное частное право.</p>
<p>Примерный перечень вопросов к вступительному экзамену вынесен в блок аспирантуры справа.</p>
$section$),
        ('Научная школа', $section$
<p>На кафедре работает научная школа «Юридические лица и граждане как субъекты гражданско-правовых отношений: проблемы теории и практики». В рамках этой школы защищено более 25 кандидатских диссертаций.</p>
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
