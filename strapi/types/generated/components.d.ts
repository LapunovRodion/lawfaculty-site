import type { Schema, Struct } from '@strapi/strapi';

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
      'person.link-label': PersonLinkLabel;
      'person.subject': PersonSubject;
    }
  }
}
