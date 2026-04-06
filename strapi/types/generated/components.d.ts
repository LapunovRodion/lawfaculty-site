import type { Schema, Struct } from '@strapi/strapi';

export interface DepartmentDiscipline extends Struct.ComponentSchema {
  collectionName: 'components_department_disciplines';
  info: {
    displayName: 'Department discipline';
    icon: 'book';
  };
  attributes: {
    details: Schema.Attribute.Text &
      Schema.Attribute.SetPluginOptions<{
        i18n: {
          localized: true;
        };
      }>;
    title: Schema.Attribute.String &
      Schema.Attribute.Required &
      Schema.Attribute.SetPluginOptions<{
        i18n: {
          localized: true;
        };
      }>;
  };
}

export interface DepartmentDocumentItem extends Struct.ComponentSchema {
  collectionName: 'components_department_document_items';
  info: {
    displayName: 'Department document';
    icon: 'file';
  };
  attributes: {
    description: Schema.Attribute.Text &
      Schema.Attribute.SetPluginOptions<{
        i18n: {
          localized: true;
        };
      }>;
    file: Schema.Attribute.Media<'files'> & Schema.Attribute.Required;
    title: Schema.Attribute.String &
      Schema.Attribute.Required &
      Schema.Attribute.SetPluginOptions<{
        i18n: {
          localized: true;
        };
      }>;
  };
}

export interface DepartmentFact extends Struct.ComponentSchema {
  collectionName: 'components_department_facts';
  info: {
    displayName: 'Department fact';
    icon: 'bulletList';
  };
  attributes: {
    label: Schema.Attribute.String &
      Schema.Attribute.Required &
      Schema.Attribute.SetPluginOptions<{
        i18n: {
          localized: true;
        };
      }>;
    value: Schema.Attribute.String &
      Schema.Attribute.Required &
      Schema.Attribute.SetPluginOptions<{
        i18n: {
          localized: true;
        };
      }>;
  };
}

export interface DepartmentLinkItem extends Struct.ComponentSchema {
  collectionName: 'components_department_link_items';
  info: {
    displayName: 'Department link';
    icon: 'link';
  };
  attributes: {
    description: Schema.Attribute.Text &
      Schema.Attribute.SetPluginOptions<{
        i18n: {
          localized: true;
        };
      }>;
    title: Schema.Attribute.String &
      Schema.Attribute.Required &
      Schema.Attribute.SetPluginOptions<{
        i18n: {
          localized: true;
        };
      }>;
    url: Schema.Attribute.String & Schema.Attribute.Required;
  };
}

export interface DepartmentRichSection extends Struct.ComponentSchema {
  collectionName: 'components_department_rich_sections';
  info: {
    displayName: 'Department rich section';
    icon: 'layout';
  };
  attributes: {
    content: Schema.Attribute.RichText &
      Schema.Attribute.SetPluginOptions<{
        i18n: {
          localized: true;
        };
      }>;
    title: Schema.Attribute.String &
      Schema.Attribute.Required &
      Schema.Attribute.SetPluginOptions<{
        i18n: {
          localized: true;
        };
      }>;
  };
}

export interface PersonLinkLabel extends Struct.ComponentSchema {
  collectionName: 'components_person_link_labels';
  info: {
    displayName: 'Link label';
    icon: 'link';
  };
  attributes: {
    kind: Schema.Attribute.Enumeration<
      ['scholar', 'orcid', 'elibrary', 'scopus', 'wos', 'website', 'other']
    > &
      Schema.Attribute.DefaultTo<'other'>;
    label: Schema.Attribute.String &
      Schema.Attribute.Required &
      Schema.Attribute.SetPluginOptions<{
        i18n: {
          localized: true;
        };
      }>;
    url: Schema.Attribute.String & Schema.Attribute.Required;
  };
}

export interface PersonSubject extends Struct.ComponentSchema {
  collectionName: 'components_person_subjects';
  info: {
    displayName: 'Subject';
    icon: 'book';
  };
  attributes: {
    title: Schema.Attribute.String &
      Schema.Attribute.Required &
      Schema.Attribute.SetPluginOptions<{
        i18n: {
          localized: true;
        };
      }>;
  };
}

declare module '@strapi/strapi' {
  export module Public {
    export interface ComponentSchemas {
      'department.discipline': DepartmentDiscipline;
      'department.document-item': DepartmentDocumentItem;
      'department.fact': DepartmentFact;
      'department.link-item': DepartmentLinkItem;
      'department.rich-section': DepartmentRichSection;
      'person.link-label': PersonLinkLabel;
      'person.subject': PersonSubject;
    }
  }
}
