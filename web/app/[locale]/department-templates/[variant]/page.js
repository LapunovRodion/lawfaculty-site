import Link from 'next/link';
import { notFound } from 'next/navigation';
import { normalizeLocale } from '@/lib/i18n';

const variants = {
  academic: {
    label: 'Вариант 1',
    title: 'Академический',
    description: 'Строгая университетская страница с акцентом на содержание, историю и доверие.',
  },
  landing: {
    label: 'Вариант 2',
    title: 'Современный лендинг',
    description: 'Выразительный hero, крупные смысловые блоки и быстрые действия.',
  },
  editorial: {
    label: 'Вариант 3',
    title: 'Редакционный гибрид',
    description: 'Сильный блок “О кафедре”, удобная навигация и карточки для фактов.',
  },
};

const department = {
  title: 'Кафедра конституционного права',
  subtitle: 'Одна из ведущих кафедр публично-правового профиля в Республике Беларусь',
  intro:
    'Кафедра конституционного права юридического факультета Белорусского государственного университета является одной из ведущих в республике. Она организована в 1921 году, одновременно с открытием университета и юридического факультета.',
  about:
    'На кафедре работали выдающиеся ученые и педагоги: В.Н. Дурденевский, Н.А. Коноплин, А.В. Горбунов, Г.С. Гурвич, С.Р. Вихарев и другие. Первым заведующим был профессор В.Н. Дурденевский. С 1927 по 1937 год кафедру возглавлял профессор Н.А. Коноплин, а с 1938 по 1941 год и с 1945 по 1954 год - доцент Л.А. Рудзицкий.',
  history:
    'Значительный вклад в развитие кафедры и подготовку специалистов внес профессор, Заслуженный юрист Республики Беларусь А.А. Головко, который возглавлял кафедру с 1965 по 1990 год. В 1991 году кафедра была переименована в кафедру конституционного права. С сентября 1998 года кафедру возглавляет профессор Г.А. Василевич.',
  teaching:
    'Кафедра обеспечивает преподавание конституционного права, конституционного права зарубежных стран, права прав человека, административно-деликтного и процессуально-исполнительного права, информационного права, конституционного правосудия и других дисциплин. Расширен круг специальных курсов, многие из которых являются авторскими курсами членов кафедры.',
  research:
    'Кафедра поддерживает научные связи с Национальным центром законодательства и правовых исследований Республики Беларусь, Институтом законодательства и сравнительного правоведения при Правительстве Российской Федерации, родственными кафедрами вузов Беларуси, России, Польши и других стран. Результаты научно-исследовательской работы используются в образовательном процессе и при подготовке учебников и учебно-методических пособий.',
  head: 'Василевич Рыгор Аляксеевич',
  headRole: 'Заведующий кафедрой, доктор юридических наук, профессор, Заслуженный юрист Республики Беларусь',
  contacts: [
    ['Адрес', '220030, г. Минск, ул. Ленинградская, д. 8'],
    ['Кабинет', '307'],
    ['Телефон', '+375 (17) 2095576'],
    ['Email', 'constlaw.bsu@yandex.by'],
  ],
  facts: [
    ['1921', 'год организации кафедры'],
    ['1991', 'переименование в кафедру конституционного права'],
    ['400+', 'научных работ А.А. Головко'],
    ['1000+', 'публикаций Г.А. Василевича'],
  ],
  disciplines: [
    'Конституционное право',
    'Конституционное право зарубежных стран',
    'Права человека',
    'Административно-деликтное и процессуально-исполнительное право',
    'Информационное право',
    'Конституционное правосудие',
  ],
  staff: [
    ['Василевич Рыгор Аляксеевич', 'Заведующий кафедрой'],
    ['Головко А.А.', 'Профессор, Заслуженный юрист Республики Беларусь, заведующий кафедрой в 1965-1990 гг.'],
    ['Крамник А.Н.', 'Профессор, кандидат юридических наук, доцент, заведующий кафедрой в 1991-1998 гг.'],
  ],
  materials: [
    'Список дисциплин по специальности "Правоведение"',
    'Список дисциплин по специальности "Экономическое право"',
    'Тематика дипломных работ',
    'Тематика курсовых работ',
    'Вопросы для вступительных экзаменов в аспирантуру по специальности 12.00.02',
    'Вопросы для вступительных экзаменов в аспирантуру по специальности 12.00.13',
    'Вопросы для вступительных экзаменов в аспирантуру по специальности 12.00.14',
  ],
};

export function generateStaticParams() {
  return Object.keys(variants).map((variant) => ({ variant }));
}

const TemplateSwitcher = ({ locale, active }) => (
  <nav className="template-switcher" aria-label="Выбор тестового шаблона">
    {Object.entries(variants).map(([key, item]) => (
      <Link key={key} className={key === active ? 'active' : ''} href={`/${locale}/department-templates/${key}`}>
        <span>{item.label}</span>
        <strong>{item.title}</strong>
      </Link>
    ))}
  </nav>
);

const ContactCard = ({ compact = false }) => (
  <aside className={compact ? 'concept-contact-card compact' : 'concept-contact-card'}>
    <p className="kicker">Контакты</p>
    {department.contacts.map(([label, value]) => (
      <div key={label} className="concept-contact-row">
        <span>{label}</span>
        <strong>{value}</strong>
      </div>
    ))}
  </aside>
);

const FactsGrid = ({ className = '' }) => (
  <div className={`concept-facts ${className}`.trim()}>
    {department.facts.map(([value, label]) => (
      <div key={label} className="concept-fact">
        <strong>{value}</strong>
        <span>{label}</span>
      </div>
    ))}
  </div>
);

const StaffCards = () => (
  <div className="concept-staff-grid">
    {department.staff.map(([name, role]) => (
      <article key={name} className="concept-person-card">
        <div className="concept-avatar">{name.slice(0, 1)}</div>
        <div>
          <h3>{name}</h3>
          <p>{role}</p>
        </div>
      </article>
    ))}
  </div>
);

const AcademicTemplate = ({ locale }) => (
  <article className="dept-concept concept-academic">
    <div className="concept-academic-hero">
      <div>
        <p className="kicker">Юридический факультет БГУ</p>
        <h1>{department.title}</h1>
        <p className="concept-lead">{department.intro}</p>
      </div>
      <ContactCard compact />
    </div>

    <FactsGrid />

    <div className="concept-two-column">
      <main className="concept-content-stack">
        <section className="concept-paper-section">
          <p className="kicker">О кафедре</p>
          <h2>Одна из ведущих кафедр публичного права</h2>
          <p>{department.about}</p>
          <p>{department.history}</p>
        </section>
        <section className="concept-paper-section">
          <h2>Учебная и научная работа</h2>
          <p>{department.teaching}</p>
          <p>{department.research}</p>
        </section>
      </main>

      <aside className="concept-side-stack">
        <section className="concept-portrait-card">
          <div className="concept-avatar large">{department.head.slice(0, 1)}</div>
          <h2>{department.head}</h2>
          <p>{department.headRole}</p>
        </section>
        <section className="concept-paper-section slim">
          <h2>Дисциплины</h2>
          <ul className="concept-clean-list">
            {department.disciplines.slice(0, 5).map((item) => (
              <li key={item}>{item}</li>
            ))}
          </ul>
        </section>
      </aside>
    </div>

    <section className="concept-bottom-actions">
      <Link className="button-primary" href={`/${locale}/departments`}>Вернуться к кафедрам</Link>
      <a className="button-secondary" href="#concept-staff-academic">Люди кафедры</a>
    </section>

    <section id="concept-staff-academic" className="concept-paper-section">
      <h2>Люди кафедры</h2>
      <StaffCards />
    </section>
  </article>
);

const LandingTemplate = ({ locale }) => (
  <article className="dept-concept concept-landing">
    <section className="concept-landing-hero">
      <div className="concept-landing-copy">
        <p className="kicker">Тестовый шаблон кафедры</p>
        <h1>{department.title}</h1>
        <p>{department.intro}</p>
        <div className="hero-actions">
          <a className="button-primary" href="#concept-about-landing">О кафедре</a>
          <a className="button-secondary" href="#concept-contacts-landing">Контакты</a>
        </div>
      </div>
      <div className="concept-landing-panel">
        <span>Public Law</span>
        <strong>{department.subtitle}</strong>
      </div>
    </section>

    <FactsGrid className="floating" />

    <section id="concept-about-landing" className="concept-feature-section">
      <div>
        <p className="kicker">О кафедре</p>
        <h2>Реальная история кафедры без ощущения старого переноса</h2>
      </div>
      <p>{department.about}</p>
      <p>{department.history}</p>
    </section>

    <div className="concept-card-mosaic">
      <section className="concept-glass-card wide">
        <h2>Учебная работа</h2>
        <p>{department.teaching}</p>
      </section>
      <section className="concept-glass-card">
        <h2>Наука</h2>
        <p>{department.research}</p>
      </section>
      <section className="concept-glass-card dark" id="concept-contacts-landing">
        <h2>Быстрая связь</h2>
        <p>{department.contacts[3][1]}</p>
        <p>{department.contacts[2][1]}</p>
      </section>
    </div>

    <section className="concept-split-band">
      <div>
        <p className="kicker">Заведующий</p>
        <h2>{department.head}</h2>
        <p>{department.headRole}</p>
      </div>
      <div className="concept-discipline-cloud">
        {department.disciplines.map((item) => (
          <span key={item}>{item}</span>
        ))}
      </div>
    </section>

    <section className="concept-section-heading">
      <h2>Люди кафедры и материалы</h2>
      <Link className="inline-link" href={`/${locale}/departments`}>Вернуться к списку кафедр</Link>
    </section>
    <div className="concept-two-column compact">
      <StaffCards />
      <div className="concept-material-list">
        {department.materials.map((item) => (
          <a key={item} href="#">{item}</a>
        ))}
      </div>
    </div>
  </article>
);

const EditorialTemplate = ({ locale }) => (
  <article className="dept-concept concept-editorial">
    <section className="concept-editorial-hero">
      <div className="concept-editorial-index">
        <span>01</span>
        <strong>Кафедра</strong>
      </div>
      <div>
        <p className="kicker">Юридический факультет</p>
        <h1>{department.title}</h1>
        <p className="concept-lead">{department.intro}</p>
      </div>
    </section>

    <nav className="concept-anchor-nav" aria-label="Разделы шаблона">
      <a href="#editorial-about">О кафедре</a>
      <a href="#editorial-work">Учеба и наука</a>
      <a href="#editorial-people">Люди кафедры</a>
      <a href="#editorial-contact">Контакты</a>
    </nav>

    <section id="editorial-about" className="concept-editorial-about">
      <div className="concept-editorial-label">
        <span>Главный акцент</span>
        <strong>О кафедре</strong>
      </div>
      <div className="concept-editorial-text">
        <h2>Смысловой центр страницы без ощущения старого переноса</h2>
        <p>{department.about}</p>
        <p>{department.history}</p>
      </div>
    </section>

    <FactsGrid />

    <div id="editorial-work" className="concept-editorial-grid">
      <section className="concept-editorial-card">
        <h2>Учебная работа</h2>
        <p>{department.teaching}</p>
      </section>
      <section className="concept-editorial-card">
        <h2>Научная работа</h2>
        <p>{department.research}</p>
      </section>
      <section className="concept-editorial-card strong">
        <h2>Дисциплины</h2>
        <div className="concept-discipline-cloud">
          {department.disciplines.map((item) => (
            <span key={item}>{item}</span>
          ))}
        </div>
      </section>
    </div>

    <div className="concept-editorial-split">
      <section id="editorial-people" className="concept-paper-section">
        <p className="kicker">Люди кафедры</p>
        <h2>{department.head}</h2>
        <p>{department.headRole}</p>
        <StaffCards />
      </section>
      <section id="editorial-contact">
        <ContactCard />
      </section>
    </div>

    <section className="concept-bottom-actions">
      <Link className="button-primary" href={`/${locale}/departments`}>Вернуться к кафедрам</Link>
      <a className="button-secondary" href={`mailto:${department.contacts[3][1]}`}>Написать на кафедру</a>
    </section>
  </article>
);

export default function DepartmentTemplatePreviewPage({ params }) {
  const locale = normalizeLocale(params.locale);
  const variant = params.variant;
  const current = variants[variant];

  if (!current) {
    notFound();
  }

  return (
    <div className="template-preview-page">
      <div className="breadcrumbs">
        <Link href={`/${locale}`}>Главная</Link>
        <span>/</span>
        <Link href={`/${locale}/departments`}>Кафедры</Link>
        <span>/</span>
        <span>Тест шаблона</span>
      </div>

      <section className="template-preview-intro">
        <div>
          <p className="kicker">Preview без влияния на прод</p>
          <h1>{current.label}: {current.title}</h1>
          <p>{current.description}</p>
        </div>
        <TemplateSwitcher locale={locale} active={variant} />
      </section>

      {variant === 'academic' ? <AcademicTemplate locale={locale} /> : null}
      {variant === 'landing' ? <LandingTemplate locale={locale} /> : null}
      {variant === 'editorial' ? <EditorialTemplate locale={locale} /> : null}
    </div>
  );
}
