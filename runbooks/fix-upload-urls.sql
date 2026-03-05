-- Usage:
--   docker exec -i law_postgres psql -U law_site -d law_site \
--     -v old_host='10.153.1.86' -v new_host='10.153.1.4' \
--     -f - < runbooks/fix-upload-urls.sql
--
-- The script updates legacy absolute media URLs in Strapi upload_file records.

\set ON_ERROR_STOP on

begin;

update upload_file
set
  url = replace(url, :'old_host', :'new_host'),
  preview_url = case
    when preview_url is null then null
    else replace(preview_url, :'old_host', :'new_host')
  end,
  formats = case
    when formats is null then null
    else replace(formats::text, :'old_host', :'new_host')::jsonb
  end,
  provider_metadata = case
    when provider_metadata is null then null
    else replace(provider_metadata::text, :'old_host', :'new_host')::jsonb
  end
where
  url like '%' || :'old_host' || '%'
  or coalesce(preview_url, '') like '%' || :'old_host' || '%'
  or coalesce(formats::text, '') like '%' || :'old_host' || '%'
  or coalesce(provider_metadata::text, '') like '%' || :'old_host' || '%';

commit;
