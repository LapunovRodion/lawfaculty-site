import { strapiFetch } from '@/lib/strapi';

const sortPersons = (items = []) =>
  [...items].sort((a, b) => {
    const orderDiff = Number(a?.sortOrder || 0) - Number(b?.sortOrder || 0);
    if (orderDiff !== 0) {
      return orderDiff;
    }
    return String(a?.fullName || '').localeCompare(String(b?.fullName || ''));
  });

export const getNewsList = async (locale, pageSize = 12) => {
  const payload = await strapiFetch('/api/news', {
    locale,
    status: 'published',
    sort: 'publishedAt:desc',
    'pagination[pageSize]': pageSize,
    'populate[cover][fields][0]': 'url',
    'populate[cover][fields][1]': 'alternativeText',
  });
  return payload.data || [];
};

export const getNewsBySlug = async (
  locale,
  slug,
  { status = 'published', cacheMode, revalidateSeconds = 30 } = {}
) => {
  const payload = await strapiFetch(
    '/api/news',
    {
      locale,
      status,
      'filters[slug][$eq]': slug,
      'pagination[pageSize]': 1,
      'populate[cover][fields][0]': 'url',
      'populate[cover][fields][1]': 'alternativeText',
    },
    { cacheMode, revalidateSeconds }
  );

  const list = payload.data || [];
  return list[0] || null;
};

export const getPageBySlug = async (
  locale,
  slug,
  { status = 'published', cacheMode, revalidateSeconds = 30 } = {}
) => {
  const payload = await strapiFetch(
    '/api/pages',
    {
      locale,
      status,
      'filters[slug][$eq]': slug,
      'pagination[pageSize]': 1,
      'fields[0]': 'title',
      'fields[1]': 'slug',
      'fields[2]': 'content',
    },
    { cacheMode, revalidateSeconds }
  );

  const list = payload.data || [];
  return list[0] || null;
};

export const getMaterials = async (locale, pageSize = 24) => {
  const payload = await strapiFetch('/api/materials', {
    locale,
    status: 'published',
    sort: 'updatedAt:desc',
    'pagination[pageSize]': pageSize,
  });
  return payload.data || [];
};

export const getDepartments = async (locale, pageSize = 50) => {
  const payload = await strapiFetch('/api/departments', {
    locale,
    status: 'published',
    sort: 'title:asc',
    'pagination[pageSize]': pageSize,
    'fields[0]': 'title',
    'fields[1]': 'slug',
    'fields[2]': 'description',
    'fields[3]': 'contacts',
  });
  return payload.data || [];
};

export const getDepartmentBySlug = async (locale, slug) => {
  const payload = await strapiFetch('/api/departments', {
    locale,
    status: 'published',
    'filters[slug][$eq]': slug,
    'pagination[pageSize]': 1,
    'populate[persons][fields][0]': 'fullName',
    'populate[persons][fields][1]': 'slug',
    'populate[persons][fields][2]': 'position',
    'populate[persons][fields][3]': 'bio',
    'populate[persons][fields][4]': 'email',
    'populate[persons][fields][5]': 'phone',
    'populate[persons][fields][6]': 'academicTitle',
    'populate[persons][fields][7]': 'academicDegree',
    'populate[persons][fields][8]': 'workplace',
    'populate[persons][fields][9]': 'roleInDepartment',
    'populate[persons][fields][10]': 'sortOrder',
    'populate[persons][fields][11]': 'isHead',
    'populate[persons][populate][photo][fields][0]': 'url',
    'populate[persons][populate][photo][fields][1]': 'alternativeText',
    'populate[persons][populate][departments][fields][0]': 'title',
    'populate[persons][populate][departments][fields][1]': 'slug',
    'populate[persons][populate][subjects][fields][0]': 'title',
    'populate[persons][populate][labels][fields][0]': 'label',
    'populate[persons][populate][labels][fields][1]': 'url',
    'populate[persons][populate][labels][fields][2]': 'kind',
  });

  const item = (payload.data || [])[0] || null;
  if (!item) {
    return null;
  }

  return {
    ...item,
    persons: sortPersons(item.persons || []),
  };
};

export const getPersons = async (locale, pageSize = 100) => {
  const payload = await strapiFetch('/api/persons', {
    locale,
    status: 'published',
    'sort[0]': 'sortOrder:asc',
    'sort[1]': 'fullName:asc',
    'pagination[pageSize]': pageSize,
    'fields[0]': 'fullName',
    'fields[1]': 'slug',
    'fields[2]': 'position',
    'fields[3]': 'email',
    'fields[4]': 'phone',
    'fields[5]': 'academicTitle',
    'fields[6]': 'academicDegree',
    'fields[7]': 'workplace',
    'fields[8]': 'roleInDepartment',
    'fields[9]': 'sortOrder',
    'fields[10]': 'isHead',
    'populate[photo][fields][0]': 'url',
    'populate[photo][fields][1]': 'alternativeText',
    'populate[departments][fields][0]': 'title',
    'populate[departments][fields][1]': 'slug',
    'populate[subjects][fields][0]': 'title',
    'populate[labels][fields][0]': 'label',
    'populate[labels][fields][1]': 'url',
    'populate[labels][fields][2]': 'kind',
  });
  return payload.data || [];
};

export const getPersonBySlug = async (locale, slug) => {
  const payload = await strapiFetch('/api/persons', {
    locale,
    status: 'published',
    'filters[slug][$eq]': slug,
    'pagination[pageSize]': 1,
    'fields[0]': 'fullName',
    'fields[1]': 'slug',
    'fields[2]': 'position',
    'fields[3]': 'email',
    'fields[4]': 'phone',
    'fields[5]': 'academicTitle',
    'fields[6]': 'academicDegree',
    'fields[7]': 'workplace',
    'fields[8]': 'roleInDepartment',
    'fields[9]': 'sortOrder',
    'fields[10]': 'isHead',
    'fields[11]': 'bio',
    'fields[12]': 'publicationsText',
    'populate[photo][fields][0]': 'url',
    'populate[photo][fields][1]': 'alternativeText',
    'populate[departments][fields][0]': 'title',
    'populate[departments][fields][1]': 'slug',
    'populate[subjects][fields][0]': 'title',
    'populate[labels][fields][0]': 'label',
    'populate[labels][fields][1]': 'url',
    'populate[labels][fields][2]': 'kind',
  });

  return (payload.data || [])[0] || null;
};
