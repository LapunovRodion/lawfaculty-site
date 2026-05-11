--
-- PostgreSQL database dump
--

\restrict 1b6RUXIzILMKkLjOwTR9AIBvJuIIZXCchvLDM9fpaFJ2gkgZntGBddyictncsAZ

-- Dumped from database version 16.11 (Debian 16.11-1.pgdg13+1)
-- Dumped by pg_dump version 16.11 (Debian 16.11-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    action_parameters jsonb,
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.admin_permissions OWNER TO law_site;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_permissions_id_seq OWNER TO law_site;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- Name: admin_permissions_role_lnk; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.admin_permissions_role_lnk (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_ord double precision
);


ALTER TABLE public.admin_permissions_role_lnk OWNER TO law_site;

--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.admin_permissions_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_permissions_role_lnk_id_seq OWNER TO law_site;

--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.admin_permissions_role_lnk_id_seq OWNED BY public.admin_permissions_role_lnk.id;


--
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.admin_roles OWNER TO law_site;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_roles_id_seq OWNER TO law_site;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    document_id character varying(255),
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.admin_users OWNER TO law_site;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_users_id_seq OWNER TO law_site;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: admin_users_roles_lnk; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.admin_users_roles_lnk (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    role_ord double precision,
    user_ord double precision
);


ALTER TABLE public.admin_users_roles_lnk OWNER TO law_site;

--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.admin_users_roles_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_users_roles_lnk_id_seq OWNER TO law_site;

--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.admin_users_roles_lnk_id_seq OWNED BY public.admin_users_roles_lnk.id;


--
-- Name: components_person_link_labels; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.components_person_link_labels (
    id integer NOT NULL,
    label character varying(255),
    url character varying(255),
    kind character varying(255)
);


ALTER TABLE public.components_person_link_labels OWNER TO law_site;

--
-- Name: components_person_link_labels_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.components_person_link_labels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_person_link_labels_id_seq OWNER TO law_site;

--
-- Name: components_person_link_labels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.components_person_link_labels_id_seq OWNED BY public.components_person_link_labels.id;


--
-- Name: components_person_publications; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.components_person_publications (
    id integer NOT NULL,
    title character varying(255),
    year integer,
    source character varying(255),
    url character varying(255)
);


ALTER TABLE public.components_person_publications OWNER TO law_site;

--
-- Name: components_person_publications_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.components_person_publications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_person_publications_id_seq OWNER TO law_site;

--
-- Name: components_person_publications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.components_person_publications_id_seq OWNED BY public.components_person_publications.id;


--
-- Name: components_person_subjects; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.components_person_subjects (
    id integer NOT NULL,
    title character varying(255)
);


ALTER TABLE public.components_person_subjects OWNER TO law_site;

--
-- Name: components_person_subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.components_person_subjects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.components_person_subjects_id_seq OWNER TO law_site;

--
-- Name: components_person_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.components_person_subjects_id_seq OWNED BY public.components_person_subjects.id;


--
-- Name: departments; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.departments (
    id integer NOT NULL,
    document_id character varying(255),
    title character varying(255),
    slug character varying(255),
    description text,
    contacts text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.departments OWNER TO law_site;

--
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.departments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.departments_id_seq OWNER TO law_site;

--
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.files (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    alternative_text text,
    caption text,
    focal_point jsonb,
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url text,
    preview_url text,
    provider character varying(255),
    provider_metadata jsonb,
    folder_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.files OWNER TO law_site;

--
-- Name: files_folder_lnk; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.files_folder_lnk (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_ord double precision
);


ALTER TABLE public.files_folder_lnk OWNER TO law_site;

--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.files_folder_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_folder_lnk_id_seq OWNER TO law_site;

--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.files_folder_lnk_id_seq OWNED BY public.files_folder_lnk.id;


--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_id_seq OWNER TO law_site;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: files_related_mph; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.files_related_mph (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.files_related_mph OWNER TO law_site;

--
-- Name: files_related_mph_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.files_related_mph_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_related_mph_id_seq OWNER TO law_site;

--
-- Name: files_related_mph_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.files_related_mph_id_seq OWNED BY public.files_related_mph.id;


--
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.i18n_locale OWNER TO law_site;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.i18n_locale_id_seq OWNER TO law_site;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- Name: materials; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.materials (
    id integer NOT NULL,
    document_id character varying(255),
    title character varying(255),
    slug character varying(255),
    description text,
    submission_status character varying(255),
    moderator_comment text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.materials OWNER TO law_site;

--
-- Name: materials_author_user_lnk; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.materials_author_user_lnk (
    id integer NOT NULL,
    material_id integer,
    user_id integer
);


ALTER TABLE public.materials_author_user_lnk OWNER TO law_site;

--
-- Name: materials_author_user_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.materials_author_user_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.materials_author_user_lnk_id_seq OWNER TO law_site;

--
-- Name: materials_author_user_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.materials_author_user_lnk_id_seq OWNED BY public.materials_author_user_lnk.id;


--
-- Name: materials_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.materials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.materials_id_seq OWNER TO law_site;

--
-- Name: materials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.materials_id_seq OWNED BY public.materials.id;


--
-- Name: news; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.news (
    id integer NOT NULL,
    document_id character varying(255),
    title character varying(255),
    slug character varying(255),
    excerpt text,
    content text,
    submission_status character varying(255),
    moderator_comment text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.news OWNER TO law_site;

--
-- Name: news_author_user_lnk; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.news_author_user_lnk (
    id integer NOT NULL,
    news_item_id integer,
    user_id integer
);


ALTER TABLE public.news_author_user_lnk OWNER TO law_site;

--
-- Name: news_author_user_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.news_author_user_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.news_author_user_lnk_id_seq OWNER TO law_site;

--
-- Name: news_author_user_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.news_author_user_lnk_id_seq OWNED BY public.news_author_user_lnk.id;


--
-- Name: news_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.news_id_seq OWNER TO law_site;

--
-- Name: news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.pages (
    id integer NOT NULL,
    document_id character varying(255),
    title character varying(255),
    slug character varying(255),
    content text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.pages OWNER TO law_site;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pages_id_seq OWNER TO law_site;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: persons; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.persons (
    id integer NOT NULL,
    document_id character varying(255),
    full_name character varying(255),
    "position" character varying(255),
    bio text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255),
    email character varying(255),
    phone character varying(255),
    academic_title character varying(255),
    academic_degree character varying(255),
    workplace character varying(255),
    sort_order integer,
    is_head boolean,
    role_in_department character varying(255),
    slug character varying(255)
);


ALTER TABLE public.persons OWNER TO law_site;

--
-- Name: persons_cmps; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.persons_cmps (
    id integer NOT NULL,
    entity_id integer,
    cmp_id integer,
    component_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.persons_cmps OWNER TO law_site;

--
-- Name: persons_cmps_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.persons_cmps_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.persons_cmps_id_seq OWNER TO law_site;

--
-- Name: persons_cmps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.persons_cmps_id_seq OWNED BY public.persons_cmps.id;


--
-- Name: persons_departments_lnk; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.persons_departments_lnk (
    id integer NOT NULL,
    person_id integer,
    department_id integer,
    department_ord double precision,
    person_ord double precision
);


ALTER TABLE public.persons_departments_lnk OWNER TO law_site;

--
-- Name: persons_departments_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.persons_departments_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.persons_departments_lnk_id_seq OWNER TO law_site;

--
-- Name: persons_departments_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.persons_departments_lnk_id_seq OWNED BY public.persons_departments_lnk.id;


--
-- Name: persons_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.persons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.persons_id_seq OWNER TO law_site;

--
-- Name: persons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.persons_id_seq OWNED BY public.persons.id;


--
-- Name: schedules; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.schedules (
    id integer NOT NULL,
    document_id character varying(255),
    title character varying(255),
    labels jsonb,
    submission_status character varying(255),
    moderator_comment text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.schedules OWNER TO law_site;

--
-- Name: schedules_author_user_lnk; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.schedules_author_user_lnk (
    id integer NOT NULL,
    schedule_id integer,
    user_id integer
);


ALTER TABLE public.schedules_author_user_lnk OWNER TO law_site;

--
-- Name: schedules_author_user_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.schedules_author_user_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.schedules_author_user_lnk_id_seq OWNER TO law_site;

--
-- Name: schedules_author_user_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.schedules_author_user_lnk_id_seq OWNED BY public.schedules_author_user_lnk.id;


--
-- Name: schedules_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.schedules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.schedules_id_seq OWNER TO law_site;

--
-- Name: schedules_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.schedules_id_seq OWNED BY public.schedules.id;


--
-- Name: strapi_ai_localization_jobs; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.strapi_ai_localization_jobs (
    id integer NOT NULL,
    content_type character varying(255) NOT NULL,
    related_document_id character varying(255) NOT NULL,
    source_locale character varying(255) NOT NULL,
    target_locales jsonb NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone
);


ALTER TABLE public.strapi_ai_localization_jobs OWNER TO law_site;

--
-- Name: strapi_ai_localization_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.strapi_ai_localization_jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_ai_localization_jobs_id_seq OWNER TO law_site;

--
-- Name: strapi_ai_localization_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.strapi_ai_localization_jobs_id_seq OWNED BY public.strapi_ai_localization_jobs.id;


--
-- Name: strapi_ai_metadata_jobs; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.strapi_ai_metadata_jobs (
    id integer NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp(6) without time zone,
    completed_at timestamp(6) without time zone
);


ALTER TABLE public.strapi_ai_metadata_jobs OWNER TO law_site;

--
-- Name: strapi_ai_metadata_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.strapi_ai_metadata_jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_ai_metadata_jobs_id_seq OWNER TO law_site;

--
-- Name: strapi_ai_metadata_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.strapi_ai_metadata_jobs_id_seq OWNED BY public.strapi_ai_metadata_jobs.id;


--
-- Name: strapi_api_token_permissions; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_api_token_permissions OWNER TO law_site;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNER TO law_site;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;


--
-- Name: strapi_api_token_permissions_token_lnk; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.strapi_api_token_permissions_token_lnk (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_ord double precision
);


ALTER TABLE public.strapi_api_token_permissions_token_lnk OWNER TO law_site;

--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq OWNER TO law_site;

--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.strapi_api_token_permissions_token_lnk_id_seq OWNED BY public.strapi_api_token_permissions_token_lnk.id;


--
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    encrypted_key text,
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_api_tokens OWNER TO law_site;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNER TO law_site;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.strapi_core_store_settings OWNER TO law_site;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNER TO law_site;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


ALTER TABLE public.strapi_database_schema OWNER TO law_site;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_database_schema_id_seq OWNER TO law_site;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- Name: strapi_history_versions; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.strapi_history_versions (
    id integer NOT NULL,
    content_type character varying(255) NOT NULL,
    related_document_id character varying(255),
    locale character varying(255),
    status character varying(255),
    data jsonb,
    schema jsonb,
    created_at timestamp(6) without time zone,
    created_by_id integer
);


ALTER TABLE public.strapi_history_versions OWNER TO law_site;

--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.strapi_history_versions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_history_versions_id_seq OWNER TO law_site;

--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.strapi_history_versions_id_seq OWNED BY public.strapi_history_versions.id;


--
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations OWNER TO law_site;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_migrations_id_seq OWNER TO law_site;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- Name: strapi_migrations_internal; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.strapi_migrations_internal (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations_internal OWNER TO law_site;

--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.strapi_migrations_internal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_migrations_internal_id_seq OWNER TO law_site;

--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.strapi_migrations_internal_id_seq OWNED BY public.strapi_migrations_internal.id;


--
-- Name: strapi_release_actions; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.strapi_release_actions (
    id integer NOT NULL,
    document_id character varying(255),
    type character varying(255),
    content_type character varying(255),
    entry_document_id character varying(255),
    locale character varying(255),
    is_entry_valid boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_release_actions OWNER TO law_site;

--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.strapi_release_actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_release_actions_id_seq OWNER TO law_site;

--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.strapi_release_actions_id_seq OWNED BY public.strapi_release_actions.id;


--
-- Name: strapi_release_actions_release_lnk; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.strapi_release_actions_release_lnk (
    id integer NOT NULL,
    release_action_id integer,
    release_id integer,
    release_action_ord double precision
);


ALTER TABLE public.strapi_release_actions_release_lnk OWNER TO law_site;

--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.strapi_release_actions_release_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_release_actions_release_lnk_id_seq OWNER TO law_site;

--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.strapi_release_actions_release_lnk_id_seq OWNED BY public.strapi_release_actions_release_lnk.id;


--
-- Name: strapi_releases; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.strapi_releases (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    released_at timestamp(6) without time zone,
    scheduled_at timestamp(6) without time zone,
    timezone character varying(255),
    status character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_releases OWNER TO law_site;

--
-- Name: strapi_releases_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.strapi_releases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_releases_id_seq OWNER TO law_site;

--
-- Name: strapi_releases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.strapi_releases_id_seq OWNED BY public.strapi_releases.id;


--
-- Name: strapi_sessions; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.strapi_sessions (
    id integer NOT NULL,
    document_id character varying(255),
    user_id character varying(255),
    session_id character varying(255),
    child_id character varying(255),
    device_id character varying(255),
    origin character varying(255),
    expires_at timestamp(6) without time zone,
    absolute_expires_at timestamp(6) without time zone,
    status character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_sessions OWNER TO law_site;

--
-- Name: strapi_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.strapi_sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_sessions_id_seq OWNER TO law_site;

--
-- Name: strapi_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.strapi_sessions_id_seq OWNED BY public.strapi_sessions.id;


--
-- Name: strapi_transfer_token_permissions; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.strapi_transfer_token_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_transfer_token_permissions OWNER TO law_site;

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNER TO law_site;

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNED BY public.strapi_transfer_token_permissions.id;


--
-- Name: strapi_transfer_token_permissions_token_lnk; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.strapi_transfer_token_permissions_token_lnk (
    id integer NOT NULL,
    transfer_token_permission_id integer,
    transfer_token_id integer,
    transfer_token_permission_ord double precision
);


ALTER TABLE public.strapi_transfer_token_permissions_token_lnk OWNER TO law_site;

--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq OWNER TO law_site;

--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_token_lnk_id_seq OWNED BY public.strapi_transfer_token_permissions_token_lnk.id;


--
-- Name: strapi_transfer_tokens; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.strapi_transfer_tokens (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_transfer_tokens OWNER TO law_site;

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.strapi_transfer_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNER TO law_site;

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNED BY public.strapi_transfer_tokens.id;


--
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE public.strapi_webhooks OWNER TO law_site;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_webhooks_id_seq OWNER TO law_site;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- Name: strapi_workflows; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.strapi_workflows (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    content_types jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_workflows OWNER TO law_site;

--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.strapi_workflows_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_id_seq OWNER TO law_site;

--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.strapi_workflows_id_seq OWNED BY public.strapi_workflows.id;


--
-- Name: strapi_workflows_stage_required_to_publish_lnk; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.strapi_workflows_stage_required_to_publish_lnk (
    id integer NOT NULL,
    workflow_id integer,
    workflow_stage_id integer
);


ALTER TABLE public.strapi_workflows_stage_required_to_publish_lnk OWNER TO law_site;

--
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq OWNER TO law_site;

--
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.strapi_workflows_stage_required_to_publish_lnk_id_seq OWNED BY public.strapi_workflows_stage_required_to_publish_lnk.id;


--
-- Name: strapi_workflows_stages; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.strapi_workflows_stages (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    color character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.strapi_workflows_stages OWNER TO law_site;

--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.strapi_workflows_stages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_stages_id_seq OWNER TO law_site;

--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.strapi_workflows_stages_id_seq OWNED BY public.strapi_workflows_stages.id;


--
-- Name: strapi_workflows_stages_permissions_lnk; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.strapi_workflows_stages_permissions_lnk (
    id integer NOT NULL,
    workflow_stage_id integer,
    permission_id integer,
    permission_ord double precision
);


ALTER TABLE public.strapi_workflows_stages_permissions_lnk OWNER TO law_site;

--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq OWNER TO law_site;

--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.strapi_workflows_stages_permissions_lnk_id_seq OWNED BY public.strapi_workflows_stages_permissions_lnk.id;


--
-- Name: strapi_workflows_stages_workflow_lnk; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.strapi_workflows_stages_workflow_lnk (
    id integer NOT NULL,
    workflow_stage_id integer,
    workflow_id integer,
    workflow_stage_ord double precision
);


ALTER TABLE public.strapi_workflows_stages_workflow_lnk OWNER TO law_site;

--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq OWNER TO law_site;

--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.strapi_workflows_stages_workflow_lnk_id_seq OWNED BY public.strapi_workflows_stages_workflow_lnk.id;


--
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    document_id character varying(255),
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.up_permissions OWNER TO law_site;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_permissions_id_seq OWNER TO law_site;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- Name: up_permissions_role_lnk; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.up_permissions_role_lnk (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_ord double precision
);


ALTER TABLE public.up_permissions_role_lnk OWNER TO law_site;

--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.up_permissions_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_permissions_role_lnk_id_seq OWNER TO law_site;

--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.up_permissions_role_lnk_id_seq OWNED BY public.up_permissions_role_lnk.id;


--
-- Name: up_roles; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.up_roles OWNER TO law_site;

--
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_roles_id_seq OWNER TO law_site;

--
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- Name: up_users; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    document_id character varying(255),
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.up_users OWNER TO law_site;

--
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_users_id_seq OWNER TO law_site;

--
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- Name: up_users_role_lnk; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.up_users_role_lnk (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    user_ord double precision
);


ALTER TABLE public.up_users_role_lnk OWNER TO law_site;

--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.up_users_role_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_users_role_lnk_id_seq OWNER TO law_site;

--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.up_users_role_lnk_id_seq OWNED BY public.up_users_role_lnk.id;


--
-- Name: upload_folders; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    document_id character varying(255),
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    locale character varying(255)
);


ALTER TABLE public.upload_folders OWNER TO law_site;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.upload_folders_id_seq OWNER TO law_site;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;


--
-- Name: upload_folders_parent_lnk; Type: TABLE; Schema: public; Owner: law_site
--

CREATE TABLE public.upload_folders_parent_lnk (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_ord double precision
);


ALTER TABLE public.upload_folders_parent_lnk OWNER TO law_site;

--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE; Schema: public; Owner: law_site
--

CREATE SEQUENCE public.upload_folders_parent_lnk_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.upload_folders_parent_lnk_id_seq OWNER TO law_site;

--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: law_site
--

ALTER SEQUENCE public.upload_folders_parent_lnk_id_seq OWNED BY public.upload_folders_parent_lnk.id;


--
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- Name: admin_permissions_role_lnk id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.admin_permissions_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_lnk_id_seq'::regclass);


--
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: admin_users_roles_lnk id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.admin_users_roles_lnk ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_lnk_id_seq'::regclass);


--
-- Name: components_person_link_labels id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.components_person_link_labels ALTER COLUMN id SET DEFAULT nextval('public.components_person_link_labels_id_seq'::regclass);


--
-- Name: components_person_publications id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.components_person_publications ALTER COLUMN id SET DEFAULT nextval('public.components_person_publications_id_seq'::regclass);


--
-- Name: components_person_subjects id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.components_person_subjects ALTER COLUMN id SET DEFAULT nextval('public.components_person_subjects_id_seq'::regclass);


--
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: files_folder_lnk id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.files_folder_lnk ALTER COLUMN id SET DEFAULT nextval('public.files_folder_lnk_id_seq'::regclass);


--
-- Name: files_related_mph id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.files_related_mph ALTER COLUMN id SET DEFAULT nextval('public.files_related_mph_id_seq'::regclass);


--
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- Name: materials id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.materials ALTER COLUMN id SET DEFAULT nextval('public.materials_id_seq'::regclass);


--
-- Name: materials_author_user_lnk id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.materials_author_user_lnk ALTER COLUMN id SET DEFAULT nextval('public.materials_author_user_lnk_id_seq'::regclass);


--
-- Name: news id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);


--
-- Name: news_author_user_lnk id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.news_author_user_lnk ALTER COLUMN id SET DEFAULT nextval('public.news_author_user_lnk_id_seq'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: persons id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.persons ALTER COLUMN id SET DEFAULT nextval('public.persons_id_seq'::regclass);


--
-- Name: persons_cmps id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.persons_cmps ALTER COLUMN id SET DEFAULT nextval('public.persons_cmps_id_seq'::regclass);


--
-- Name: persons_departments_lnk id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.persons_departments_lnk ALTER COLUMN id SET DEFAULT nextval('public.persons_departments_lnk_id_seq'::regclass);


--
-- Name: schedules id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.schedules ALTER COLUMN id SET DEFAULT nextval('public.schedules_id_seq'::regclass);


--
-- Name: schedules_author_user_lnk id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.schedules_author_user_lnk ALTER COLUMN id SET DEFAULT nextval('public.schedules_author_user_lnk_id_seq'::regclass);


--
-- Name: strapi_ai_localization_jobs id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_ai_localization_jobs ALTER COLUMN id SET DEFAULT nextval('public.strapi_ai_localization_jobs_id_seq'::regclass);


--
-- Name: strapi_ai_metadata_jobs id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_ai_metadata_jobs ALTER COLUMN id SET DEFAULT nextval('public.strapi_ai_metadata_jobs_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions_token_lnk id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_lnk_id_seq'::regclass);


--
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- Name: strapi_history_versions id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_history_versions ALTER COLUMN id SET DEFAULT nextval('public.strapi_history_versions_id_seq'::regclass);


--
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- Name: strapi_migrations_internal id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_migrations_internal ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_internal_id_seq'::regclass);


--
-- Name: strapi_release_actions id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_release_actions ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_id_seq'::regclass);


--
-- Name: strapi_release_actions_release_lnk id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_release_lnk_id_seq'::regclass);


--
-- Name: strapi_releases id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_releases ALTER COLUMN id SET DEFAULT nextval('public.strapi_releases_id_seq'::regclass);


--
-- Name: strapi_sessions id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_sessions ALTER COLUMN id SET DEFAULT nextval('public.strapi_sessions_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions_token_lnk id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_token_lnk_id_seq'::regclass);


--
-- Name: strapi_transfer_tokens id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_transfer_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_tokens_id_seq'::regclass);


--
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- Name: strapi_workflows id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_workflows ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_id_seq'::regclass);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stage_required_to_publish_lnk_id_seq'::regclass);


--
-- Name: strapi_workflows_stages id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_workflows_stages ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_id_seq'::regclass);


--
-- Name: strapi_workflows_stages_permissions_lnk id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_permissions_lnk_id_seq'::regclass);


--
-- Name: strapi_workflows_stages_workflow_lnk id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk ALTER COLUMN id SET DEFAULT nextval('public.strapi_workflows_stages_workflow_lnk_id_seq'::regclass);


--
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- Name: up_permissions_role_lnk id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.up_permissions_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_lnk_id_seq'::regclass);


--
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- Name: up_users_role_lnk id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.up_users_role_lnk ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_lnk_id_seq'::regclass);


--
-- Name: upload_folders id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);


--
-- Name: upload_folders_parent_lnk id; Type: DEFAULT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.upload_folders_parent_lnk ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_lnk_id_seq'::regclass);


--
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.admin_permissions (id, document_id, action, action_parameters, subject, properties, conditions, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	p8ebqdhrc7xvg4gqn9w0ma06	plugin::content-manager.explorer.create	{}	api::department.department	{"fields": ["title", "slug", "description", "contacts", "persons"]}	[]	2026-02-12 15:07:51.448	2026-02-12 15:07:51.448	2026-02-12 15:07:51.448	\N	\N	\N
2	wbz1w5g02zejocu2pfqf9qf7	plugin::content-manager.explorer.create	{}	api::material.material	{"fields": ["title", "slug", "description", "file", "submissionStatus", "moderatorComment", "authorUser"]}	[]	2026-02-12 15:07:51.454	2026-02-12 15:07:51.454	2026-02-12 15:07:51.454	\N	\N	\N
3	n8fn1pin86df3h85d79el2kw	plugin::content-manager.explorer.create	{}	api::news-item.news-item	{"fields": ["title", "slug", "excerpt", "content", "cover", "submissionStatus", "moderatorComment", "authorUser"]}	[]	2026-02-12 15:07:51.458	2026-02-12 15:07:51.458	2026-02-12 15:07:51.458	\N	\N	\N
4	sv5awjyok323ozzt8bccs93x	plugin::content-manager.explorer.create	{}	api::page.page	{"fields": ["title", "slug", "content"]}	[]	2026-02-12 15:07:51.462	2026-02-12 15:07:51.462	2026-02-12 15:07:51.462	\N	\N	\N
6	mi3aphqxxqfnyq9af3hysu5z	plugin::content-manager.explorer.create	{}	api::schedule.schedule	{"fields": ["title", "file", "labels", "submissionStatus", "moderatorComment", "authorUser"]}	[]	2026-02-12 15:07:51.482	2026-02-12 15:07:51.482	2026-02-12 15:07:51.483	\N	\N	\N
7	zmting99h5eoacsc0v0c0opz	plugin::content-manager.explorer.read	{}	api::department.department	{"fields": ["title", "slug", "description", "contacts", "persons"]}	[]	2026-02-12 15:07:51.488	2026-02-12 15:07:51.488	2026-02-12 15:07:51.488	\N	\N	\N
8	pngewq3l0cej5zp3q6t7ev56	plugin::content-manager.explorer.read	{}	api::material.material	{"fields": ["title", "slug", "description", "file", "submissionStatus", "moderatorComment", "authorUser"]}	[]	2026-02-12 15:07:51.495	2026-02-12 15:07:51.495	2026-02-12 15:07:51.495	\N	\N	\N
9	bpxoc7besryan8038ztjpbvc	plugin::content-manager.explorer.read	{}	api::news-item.news-item	{"fields": ["title", "slug", "excerpt", "content", "cover", "submissionStatus", "moderatorComment", "authorUser"]}	[]	2026-02-12 15:07:51.499	2026-02-12 15:07:51.499	2026-02-12 15:07:51.5	\N	\N	\N
10	cmmygdep5705ifmxu2wwfj7e	plugin::content-manager.explorer.read	{}	api::page.page	{"fields": ["title", "slug", "content"]}	[]	2026-02-12 15:07:51.503	2026-02-12 15:07:51.503	2026-02-12 15:07:51.504	\N	\N	\N
12	ud1i4hc7ke6u2ios05hiyz9j	plugin::content-manager.explorer.read	{}	api::schedule.schedule	{"fields": ["title", "file", "labels", "submissionStatus", "moderatorComment", "authorUser"]}	[]	2026-02-12 15:07:51.51	2026-02-12 15:07:51.51	2026-02-12 15:07:51.51	\N	\N	\N
13	yswos5mpnlg8mibrfy13py5b	plugin::content-manager.explorer.update	{}	api::department.department	{"fields": ["title", "slug", "description", "contacts", "persons"]}	[]	2026-02-12 15:07:51.513	2026-02-12 15:07:51.513	2026-02-12 15:07:51.513	\N	\N	\N
14	gncobgakbywnze2v1d2g0clk	plugin::content-manager.explorer.update	{}	api::material.material	{"fields": ["title", "slug", "description", "file", "submissionStatus", "moderatorComment", "authorUser"]}	[]	2026-02-12 15:07:51.516	2026-02-12 15:07:51.516	2026-02-12 15:07:51.516	\N	\N	\N
15	akckflabxwktbku53n4tikxu	plugin::content-manager.explorer.update	{}	api::news-item.news-item	{"fields": ["title", "slug", "excerpt", "content", "cover", "submissionStatus", "moderatorComment", "authorUser"]}	[]	2026-02-12 15:07:51.522	2026-02-12 15:07:51.522	2026-02-12 15:07:51.522	\N	\N	\N
16	zs9yxkve4ly6pek1bl3og8p0	plugin::content-manager.explorer.update	{}	api::page.page	{"fields": ["title", "slug", "content"]}	[]	2026-02-12 15:07:51.526	2026-02-12 15:07:51.526	2026-02-12 15:07:51.526	\N	\N	\N
18	t1b9fkp9z3mdogo0yckpdhgl	plugin::content-manager.explorer.update	{}	api::schedule.schedule	{"fields": ["title", "file", "labels", "submissionStatus", "moderatorComment", "authorUser"]}	[]	2026-02-12 15:07:51.534	2026-02-12 15:07:51.534	2026-02-12 15:07:51.534	\N	\N	\N
5	pihp5wj3h8fk8fsvgh5kall0	plugin::content-manager.explorer.create	{}	api::person.person	{"fields": ["fullName", "position", "bio", "photo"]}	[]	2026-02-12 15:07:51.466	2026-02-25 11:47:34.232	2026-02-12 15:07:51.466	\N	\N	\N
11	sqv6ohb5ze2bkjyelvz1c3nr	plugin::content-manager.explorer.read	{}	api::person.person	{"fields": ["fullName", "position", "bio", "photo"]}	[]	2026-02-12 15:07:51.507	2026-02-25 11:47:34.232	2026-02-12 15:07:51.507	\N	\N	\N
17	hf7tu6ywcrir353yms4jlyh1	plugin::content-manager.explorer.update	{}	api::person.person	{"fields": ["fullName", "position", "bio", "photo"]}	[]	2026-02-12 15:07:51.53	2026-02-25 11:47:34.232	2026-02-12 15:07:51.53	\N	\N	\N
31	v9p6umbfew3jlv53qiwlz96h	plugin::upload.read	{}	\N	{}	[]	2026-02-12 15:07:51.577	2026-02-12 15:07:51.577	2026-02-12 15:07:51.577	\N	\N	\N
32	fmlw21m5y0roa3pz072c1ji4	plugin::upload.configure-view	{}	\N	{}	[]	2026-02-12 15:07:51.58	2026-02-12 15:07:51.58	2026-02-12 15:07:51.58	\N	\N	\N
33	yotc9eetga99iqutp6brngxp	plugin::upload.assets.create	{}	\N	{}	[]	2026-02-12 15:07:51.583	2026-02-12 15:07:51.583	2026-02-12 15:07:51.583	\N	\N	\N
34	x2jtmu4gkh7lhsz34kmvtjau	plugin::upload.assets.update	{}	\N	{}	[]	2026-02-12 15:07:51.586	2026-02-12 15:07:51.586	2026-02-12 15:07:51.586	\N	\N	\N
35	b1rptdndfcb4yxxd88n1iuux	plugin::upload.assets.download	{}	\N	{}	[]	2026-02-12 15:07:51.589	2026-02-12 15:07:51.589	2026-02-12 15:07:51.589	\N	\N	\N
36	h95037pli0jr4eel0y3f2wx2	plugin::upload.assets.copy-link	{}	\N	{}	[]	2026-02-12 15:07:51.592	2026-02-12 15:07:51.592	2026-02-12 15:07:51.592	\N	\N	\N
37	st52ubr0qeftx2oaepwvy4u3	plugin::content-manager.explorer.create	{}	api::department.department	{"fields": ["title", "slug", "description", "contacts", "persons"]}	["admin::is-creator"]	2026-02-12 15:07:51.597	2026-02-12 15:07:51.597	2026-02-12 15:07:51.597	\N	\N	\N
38	mp613dcutc27mic6c5acb0c6	plugin::content-manager.explorer.create	{}	api::material.material	{"fields": ["title", "slug", "description", "file", "submissionStatus", "moderatorComment", "authorUser"]}	["admin::is-creator"]	2026-02-12 15:07:51.6	2026-02-12 15:07:51.6	2026-02-12 15:07:51.6	\N	\N	\N
39	hwti6lrc1ysdxk1ta434ncod	plugin::content-manager.explorer.create	{}	api::news-item.news-item	{"fields": ["title", "slug", "excerpt", "content", "cover", "submissionStatus", "moderatorComment", "authorUser"]}	["admin::is-creator"]	2026-02-12 15:07:51.603	2026-02-12 15:07:51.603	2026-02-12 15:07:51.604	\N	\N	\N
40	h05wm9fm5gl9ckkzkv1om5jr	plugin::content-manager.explorer.create	{}	api::page.page	{"fields": ["title", "slug", "content"]}	["admin::is-creator"]	2026-02-12 15:07:51.606	2026-02-12 15:07:51.606	2026-02-12 15:07:51.606	\N	\N	\N
42	twcjzd9hgfek7y8td8ohw95i	plugin::content-manager.explorer.create	{}	api::schedule.schedule	{"fields": ["title", "file", "labels", "submissionStatus", "moderatorComment", "authorUser"]}	["admin::is-creator"]	2026-02-12 15:07:51.612	2026-02-12 15:07:51.612	2026-02-12 15:07:51.612	\N	\N	\N
43	pinpwqamn6oq41xmmrvmg1k6	plugin::content-manager.explorer.read	{}	api::department.department	{"fields": ["title", "slug", "description", "contacts", "persons"]}	["admin::is-creator"]	2026-02-12 15:07:51.615	2026-02-12 15:07:51.615	2026-02-12 15:07:51.615	\N	\N	\N
44	e2f7ifhjpxjst4863rreabfh	plugin::content-manager.explorer.read	{}	api::material.material	{"fields": ["title", "slug", "description", "file", "submissionStatus", "moderatorComment", "authorUser"]}	["admin::is-creator"]	2026-02-12 15:07:51.618	2026-02-12 15:07:51.618	2026-02-12 15:07:51.618	\N	\N	\N
45	o9skawirfhxrcmy83yv6in9y	plugin::content-manager.explorer.read	{}	api::news-item.news-item	{"fields": ["title", "slug", "excerpt", "content", "cover", "submissionStatus", "moderatorComment", "authorUser"]}	["admin::is-creator"]	2026-02-12 15:07:51.621	2026-02-12 15:07:51.621	2026-02-12 15:07:51.621	\N	\N	\N
46	tfjb3fhfps04ih2a3v1s9qn6	plugin::content-manager.explorer.read	{}	api::page.page	{"fields": ["title", "slug", "content"]}	["admin::is-creator"]	2026-02-12 15:07:51.625	2026-02-12 15:07:51.625	2026-02-12 15:07:51.625	\N	\N	\N
48	uvqnw2ftdu4a84cmxem3h9qn	plugin::content-manager.explorer.read	{}	api::schedule.schedule	{"fields": ["title", "file", "labels", "submissionStatus", "moderatorComment", "authorUser"]}	["admin::is-creator"]	2026-02-12 15:07:51.631	2026-02-12 15:07:51.631	2026-02-12 15:07:51.631	\N	\N	\N
49	l6ytnkc7e3mnm19bz1j2fkk9	plugin::content-manager.explorer.update	{}	api::department.department	{"fields": ["title", "slug", "description", "contacts", "persons"]}	["admin::is-creator"]	2026-02-12 15:07:51.634	2026-02-12 15:07:51.634	2026-02-12 15:07:51.634	\N	\N	\N
50	b11dcbr3pbkb59tq40md08gp	plugin::content-manager.explorer.update	{}	api::material.material	{"fields": ["title", "slug", "description", "file", "submissionStatus", "moderatorComment", "authorUser"]}	["admin::is-creator"]	2026-02-12 15:07:51.637	2026-02-12 15:07:51.637	2026-02-12 15:07:51.637	\N	\N	\N
51	f26xmy538n4goat15vxtq2au	plugin::content-manager.explorer.update	{}	api::news-item.news-item	{"fields": ["title", "slug", "excerpt", "content", "cover", "submissionStatus", "moderatorComment", "authorUser"]}	["admin::is-creator"]	2026-02-12 15:07:51.641	2026-02-12 15:07:51.641	2026-02-12 15:07:51.641	\N	\N	\N
52	iuvtjg1famv9xy7othqhl9ci	plugin::content-manager.explorer.update	{}	api::page.page	{"fields": ["title", "slug", "content"]}	["admin::is-creator"]	2026-02-12 15:07:51.644	2026-02-12 15:07:51.644	2026-02-12 15:07:51.644	\N	\N	\N
54	fbje7r5pyxtow0hm1pod0s05	plugin::content-manager.explorer.update	{}	api::schedule.schedule	{"fields": ["title", "file", "labels", "submissionStatus", "moderatorComment", "authorUser"]}	["admin::is-creator"]	2026-02-12 15:07:51.651	2026-02-12 15:07:51.651	2026-02-12 15:07:51.651	\N	\N	\N
41	h5pjjhwvui9ws3nifca63wfy	plugin::content-manager.explorer.create	{}	api::person.person	{"fields": ["fullName", "position", "bio", "photo"]}	["admin::is-creator"]	2026-02-12 15:07:51.609	2026-02-25 11:47:34.232	2026-02-12 15:07:51.609	\N	\N	\N
47	ptvnabr2csh10u1rehdmu25g	plugin::content-manager.explorer.read	{}	api::person.person	{"fields": ["fullName", "position", "bio", "photo"]}	["admin::is-creator"]	2026-02-12 15:07:51.628	2026-02-25 11:47:34.232	2026-02-12 15:07:51.628	\N	\N	\N
53	a0px6i5xg79eq7f256k6e1t2	plugin::content-manager.explorer.update	{}	api::person.person	{"fields": ["fullName", "position", "bio", "photo"]}	["admin::is-creator"]	2026-02-12 15:07:51.647	2026-02-25 11:47:34.232	2026-02-12 15:07:51.648	\N	\N	\N
61	szn1k3ax6r9ytewt0zb1ixu2	plugin::upload.read	{}	\N	{}	["admin::is-creator"]	2026-02-12 15:07:51.673	2026-02-12 15:07:51.673	2026-02-12 15:07:51.673	\N	\N	\N
62	epgjvr0gwk41atqbuy6e5c9s	plugin::upload.configure-view	{}	\N	{}	[]	2026-02-12 15:07:51.676	2026-02-12 15:07:51.676	2026-02-12 15:07:51.676	\N	\N	\N
63	sukwgrmc2o5yuksiz9kdkixf	plugin::upload.assets.create	{}	\N	{}	[]	2026-02-12 15:07:51.678	2026-02-12 15:07:51.678	2026-02-12 15:07:51.678	\N	\N	\N
64	g1landc92asjklfeakdd2q7f	plugin::upload.assets.update	{}	\N	{}	["admin::is-creator"]	2026-02-12 15:07:51.681	2026-02-12 15:07:51.681	2026-02-12 15:07:51.681	\N	\N	\N
65	q8o5bs5rn9n59jgtux9iu2h9	plugin::upload.assets.download	{}	\N	{}	[]	2026-02-12 15:07:51.683	2026-02-12 15:07:51.683	2026-02-12 15:07:51.684	\N	\N	\N
66	uylv4kgq4k30lg1l5ycawgim	plugin::upload.assets.copy-link	{}	\N	{}	[]	2026-02-12 15:07:51.688	2026-02-12 15:07:51.688	2026-02-12 15:07:51.688	\N	\N	\N
67	hs7ig4dl7f45d9lkej6mp297	plugin::content-manager.explorer.create	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2026-02-12 15:07:51.703	2026-02-12 15:07:51.703	2026-02-12 15:07:51.703	\N	\N	\N
107	vf38i9tlnjqqrk2n706pu6n5	plugin::upload.read	{}	\N	{}	[]	2026-02-12 15:07:51.828	2026-02-12 15:07:51.828	2026-02-12 15:07:51.828	\N	\N	\N
161	s7tm870pxr3rmmxurtmfn3n4	plugin::content-manager.explorer.create	{}	api::person.person	{"fields": ["fullName", "slug", "position", "email", "phone", "academicTitle", "academicDegree", "workplace", "sortOrder", "isHead", "roleInDepartment", "bio", "photo", "subjects.title", "publications.title", "publications.year", "publications.source", "publications.url", "labels.label", "labels.url", "labels.kind", "departments"], "locales": ["en", "be", "ru"]}	[]	2026-02-25 15:29:27.121	2026-02-25 15:29:27.121	2026-02-25 15:29:27.122	\N	\N	\N
162	t5c5qelbbb28r6rka0yk741y	plugin::content-manager.explorer.read	{}	api::person.person	{"fields": ["fullName", "slug", "position", "email", "phone", "academicTitle", "academicDegree", "workplace", "sortOrder", "isHead", "roleInDepartment", "bio", "photo", "subjects.title", "publications.title", "publications.year", "publications.source", "publications.url", "labels.label", "labels.url", "labels.kind", "departments"], "locales": ["en", "be", "ru"]}	[]	2026-02-25 15:29:27.134	2026-02-25 15:29:27.134	2026-02-25 15:29:27.134	\N	\N	\N
74	p5fk0oxw33l7scf3j86nadoy	plugin::content-manager.explorer.read	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2026-02-12 15:07:51.726	2026-02-12 15:07:51.726	2026-02-12 15:07:51.726	\N	\N	\N
163	e1v9baucijccn4t14wsgsa6x	plugin::content-manager.explorer.update	{}	api::person.person	{"fields": ["fullName", "slug", "position", "email", "phone", "academicTitle", "academicDegree", "workplace", "sortOrder", "isHead", "roleInDepartment", "bio", "photo", "subjects.title", "publications.title", "publications.year", "publications.source", "publications.url", "labels.label", "labels.url", "labels.kind", "departments"], "locales": ["en", "be", "ru"]}	[]	2026-02-25 15:29:27.144	2026-02-25 15:29:27.144	2026-02-25 15:29:27.144	\N	\N	\N
81	inzg50cg8r55fjlyja4y1o9i	plugin::content-manager.explorer.update	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role"]}	[]	2026-02-12 15:07:51.75	2026-02-12 15:07:51.75	2026-02-12 15:07:51.75	\N	\N	\N
88	sr6dfkakv7lrkl2x7uqlumr6	plugin::content-manager.explorer.delete	{}	plugin::users-permissions.user	{}	[]	2026-02-12 15:07:51.773	2026-02-12 15:07:51.773	2026-02-12 15:07:51.773	\N	\N	\N
95	e9l11ljahn43x5woxesl6c3p	plugin::content-manager.explorer.publish	{}	plugin::users-permissions.user	{}	[]	2026-02-12 15:07:51.792	2026-02-12 15:07:51.792	2026-02-12 15:07:51.792	\N	\N	\N
102	di75w1at7n45g4tbgtu4w2zj	plugin::content-manager.single-types.configure-view	{}	\N	{}	[]	2026-02-12 15:07:51.814	2026-02-12 15:07:51.814	2026-02-12 15:07:51.814	\N	\N	\N
103	o2f40tr4vtzg966h26p8tq1l	plugin::content-manager.collection-types.configure-view	{}	\N	{}	[]	2026-02-12 15:07:51.818	2026-02-12 15:07:51.818	2026-02-12 15:07:51.818	\N	\N	\N
104	e4d18d823ero0e62onr0zybl	plugin::content-manager.components.configure-layout	{}	\N	{}	[]	2026-02-12 15:07:51.82	2026-02-12 15:07:51.82	2026-02-12 15:07:51.82	\N	\N	\N
105	mfrte6ar9c4b66whnn96jes8	plugin::content-type-builder.read	{}	\N	{}	[]	2026-02-12 15:07:51.823	2026-02-12 15:07:51.823	2026-02-12 15:07:51.823	\N	\N	\N
106	itlo2t8szz3e40y18egt5eoy	plugin::email.settings.read	{}	\N	{}	[]	2026-02-12 15:07:51.826	2026-02-12 15:07:51.826	2026-02-12 15:07:51.826	\N	\N	\N
108	p1fr6vpaj95sogi09t5kgx48	plugin::upload.assets.create	{}	\N	{}	[]	2026-02-12 15:07:51.83	2026-02-12 15:07:51.83	2026-02-12 15:07:51.831	\N	\N	\N
109	rpajgv6ofpgjeeti0h5ix3dd	plugin::upload.assets.update	{}	\N	{}	[]	2026-02-12 15:07:51.834	2026-02-12 15:07:51.834	2026-02-12 15:07:51.834	\N	\N	\N
110	v0inc4ohzohel50eac9qp56q	plugin::upload.assets.download	{}	\N	{}	[]	2026-02-12 15:07:51.837	2026-02-12 15:07:51.837	2026-02-12 15:07:51.837	\N	\N	\N
111	houeiwi7h9qefpjtt1jirham	plugin::upload.assets.copy-link	{}	\N	{}	[]	2026-02-12 15:07:51.84	2026-02-12 15:07:51.84	2026-02-12 15:07:51.84	\N	\N	\N
112	u0ogttb5gxrcidyghwgoqsww	plugin::upload.configure-view	{}	\N	{}	[]	2026-02-12 15:07:51.843	2026-02-12 15:07:51.843	2026-02-12 15:07:51.843	\N	\N	\N
113	aidxhoe8m3dkk7wehins9qq8	plugin::upload.settings.read	{}	\N	{}	[]	2026-02-12 15:07:51.845	2026-02-12 15:07:51.845	2026-02-12 15:07:51.845	\N	\N	\N
114	fuv5gezzkbfri2e9ypmqhtlm	plugin::i18n.locale.create	{}	\N	{}	[]	2026-02-12 15:07:51.848	2026-02-12 15:07:51.848	2026-02-12 15:07:51.848	\N	\N	\N
115	iegvb65sherdw655ark72rsi	plugin::i18n.locale.read	{}	\N	{}	[]	2026-02-12 15:07:51.851	2026-02-12 15:07:51.851	2026-02-12 15:07:51.851	\N	\N	\N
116	das6sj6ctvqcc004aod34blm	plugin::i18n.locale.update	{}	\N	{}	[]	2026-02-12 15:07:51.854	2026-02-12 15:07:51.854	2026-02-12 15:07:51.854	\N	\N	\N
117	axje5rk7lmrumuinpb3hi4gp	plugin::i18n.locale.delete	{}	\N	{}	[]	2026-02-12 15:07:51.858	2026-02-12 15:07:51.858	2026-02-12 15:07:51.859	\N	\N	\N
118	h1fp87zid4xo5il4rols6lq4	plugin::users-permissions.roles.create	{}	\N	{}	[]	2026-02-12 15:07:51.862	2026-02-12 15:07:51.862	2026-02-12 15:07:51.862	\N	\N	\N
119	cjirt9lnctosisa1r9xkx2xb	plugin::users-permissions.roles.read	{}	\N	{}	[]	2026-02-12 15:07:51.865	2026-02-12 15:07:51.865	2026-02-12 15:07:51.865	\N	\N	\N
120	s8srr25e9otesrs584mmid64	plugin::users-permissions.roles.update	{}	\N	{}	[]	2026-02-12 15:07:51.869	2026-02-12 15:07:51.869	2026-02-12 15:07:51.869	\N	\N	\N
121	d4yrwrt4bu7xp67wfpacsb8v	plugin::users-permissions.roles.delete	{}	\N	{}	[]	2026-02-12 15:07:51.872	2026-02-12 15:07:51.872	2026-02-12 15:07:51.872	\N	\N	\N
122	b9luns3sxjv9oyc1c27cun1s	plugin::users-permissions.providers.read	{}	\N	{}	[]	2026-02-12 15:07:51.874	2026-02-12 15:07:51.874	2026-02-12 15:07:51.874	\N	\N	\N
123	o7gp2alrupg9vkd2amgtgf5j	plugin::users-permissions.providers.update	{}	\N	{}	[]	2026-02-12 15:07:51.877	2026-02-12 15:07:51.877	2026-02-12 15:07:51.877	\N	\N	\N
124	z2q3ie43hsqdeihcgqqv79c6	plugin::users-permissions.email-templates.read	{}	\N	{}	[]	2026-02-12 15:07:51.88	2026-02-12 15:07:51.88	2026-02-12 15:07:51.88	\N	\N	\N
125	x686f2k7sx5bky8v6vlhlpvt	plugin::users-permissions.email-templates.update	{}	\N	{}	[]	2026-02-12 15:07:51.882	2026-02-12 15:07:51.882	2026-02-12 15:07:51.882	\N	\N	\N
126	kzozg0zjtpddidfyewx42b86	plugin::users-permissions.advanced-settings.read	{}	\N	{}	[]	2026-02-12 15:07:51.885	2026-02-12 15:07:51.885	2026-02-12 15:07:51.885	\N	\N	\N
127	sd7c29tgfin31r0go0kjirt9	plugin::users-permissions.advanced-settings.update	{}	\N	{}	[]	2026-02-12 15:07:51.888	2026-02-12 15:07:51.888	2026-02-12 15:07:51.888	\N	\N	\N
128	pdstarvxic11h27snyc11xjm	admin::marketplace.read	{}	\N	{}	[]	2026-02-12 15:07:51.891	2026-02-12 15:07:51.891	2026-02-12 15:07:51.891	\N	\N	\N
129	lhyi57q6styisqa1i2b713mr	admin::webhooks.create	{}	\N	{}	[]	2026-02-12 15:07:51.894	2026-02-12 15:07:51.894	2026-02-12 15:07:51.895	\N	\N	\N
130	ei1axjhikvg4rsk78h7z8cq6	admin::webhooks.read	{}	\N	{}	[]	2026-02-12 15:07:51.898	2026-02-12 15:07:51.898	2026-02-12 15:07:51.898	\N	\N	\N
131	irv3h98lgj0z7itnlurc9isf	admin::webhooks.update	{}	\N	{}	[]	2026-02-12 15:07:51.902	2026-02-12 15:07:51.902	2026-02-12 15:07:51.902	\N	\N	\N
132	f6tmyc2o1soa9mty9h1sd9ul	admin::webhooks.delete	{}	\N	{}	[]	2026-02-12 15:07:51.904	2026-02-12 15:07:51.904	2026-02-12 15:07:51.904	\N	\N	\N
133	wwh1cnqhpgvxoprdzkt4f6f6	admin::users.create	{}	\N	{}	[]	2026-02-12 15:07:51.907	2026-02-12 15:07:51.907	2026-02-12 15:07:51.907	\N	\N	\N
134	qjk3tltb1sx47vklhgo8o379	admin::users.read	{}	\N	{}	[]	2026-02-12 15:07:51.91	2026-02-12 15:07:51.91	2026-02-12 15:07:51.91	\N	\N	\N
135	xzgizi55kqld6w3gfi52vfka	admin::users.update	{}	\N	{}	[]	2026-02-12 15:07:51.914	2026-02-12 15:07:51.914	2026-02-12 15:07:51.914	\N	\N	\N
136	j4aba05xz9k8izjwxswry4bt	admin::users.delete	{}	\N	{}	[]	2026-02-12 15:07:51.918	2026-02-12 15:07:51.918	2026-02-12 15:07:51.918	\N	\N	\N
137	sd94g3jjb5bp54vb2zgveyp2	admin::roles.create	{}	\N	{}	[]	2026-02-12 15:07:51.921	2026-02-12 15:07:51.921	2026-02-12 15:07:51.921	\N	\N	\N
138	qt3u5yqvsngpqdegye6ijc6v	admin::roles.read	{}	\N	{}	[]	2026-02-12 15:07:51.925	2026-02-12 15:07:51.925	2026-02-12 15:07:51.925	\N	\N	\N
139	wllsyx95qu3ljm3hiinmfxdi	admin::roles.update	{}	\N	{}	[]	2026-02-12 15:07:51.928	2026-02-12 15:07:51.928	2026-02-12 15:07:51.928	\N	\N	\N
140	lvvfeejq0t1yxidrahwrtnh0	admin::roles.delete	{}	\N	{}	[]	2026-02-12 15:07:51.93	2026-02-12 15:07:51.93	2026-02-12 15:07:51.931	\N	\N	\N
141	v8mrvx2xxnnodrlnw8cviejh	admin::api-tokens.access	{}	\N	{}	[]	2026-02-12 15:07:51.933	2026-02-12 15:07:51.933	2026-02-12 15:07:51.933	\N	\N	\N
142	bs6ol4qiw1nu0zvdwaptv1qf	admin::api-tokens.create	{}	\N	{}	[]	2026-02-12 15:07:51.937	2026-02-12 15:07:51.937	2026-02-12 15:07:51.937	\N	\N	\N
143	t6wijhz0tjx5nexzhz8ohc0g	admin::api-tokens.read	{}	\N	{}	[]	2026-02-12 15:07:51.939	2026-02-12 15:07:51.939	2026-02-12 15:07:51.939	\N	\N	\N
144	hxfgzgunfgt0gak1avsw3ac4	admin::api-tokens.update	{}	\N	{}	[]	2026-02-12 15:07:51.942	2026-02-12 15:07:51.942	2026-02-12 15:07:51.942	\N	\N	\N
145	s3v0x0jgk6kls9yi2vr0mh8m	admin::api-tokens.regenerate	{}	\N	{}	[]	2026-02-12 15:07:51.945	2026-02-12 15:07:51.945	2026-02-12 15:07:51.945	\N	\N	\N
146	mp9jxul3qfv1egvlxgsju6su	admin::api-tokens.delete	{}	\N	{}	[]	2026-02-12 15:07:51.948	2026-02-12 15:07:51.948	2026-02-12 15:07:51.948	\N	\N	\N
147	zsn34ouva54pe7v7i1wy9vte	admin::project-settings.update	{}	\N	{}	[]	2026-02-12 15:07:51.951	2026-02-12 15:07:51.951	2026-02-12 15:07:51.951	\N	\N	\N
148	ttpn3unhxo3eo31nem69n4r4	admin::project-settings.read	{}	\N	{}	[]	2026-02-12 15:07:51.953	2026-02-12 15:07:51.953	2026-02-12 15:07:51.953	\N	\N	\N
149	y3evvp7abct8djozzjw6asaf	admin::transfer.tokens.access	{}	\N	{}	[]	2026-02-12 15:07:51.956	2026-02-12 15:07:51.956	2026-02-12 15:07:51.956	\N	\N	\N
150	jokzv3cyk84lblobj9y7ilxr	admin::transfer.tokens.create	{}	\N	{}	[]	2026-02-12 15:07:51.96	2026-02-12 15:07:51.96	2026-02-12 15:07:51.96	\N	\N	\N
151	fshxa15rjsaa60ho4emtpdg2	admin::transfer.tokens.read	{}	\N	{}	[]	2026-02-12 15:07:51.963	2026-02-12 15:07:51.963	2026-02-12 15:07:51.963	\N	\N	\N
152	y38famh14qguvxp7tpnbfbdn	admin::transfer.tokens.update	{}	\N	{}	[]	2026-02-12 15:07:51.965	2026-02-12 15:07:51.965	2026-02-12 15:07:51.965	\N	\N	\N
153	bcj9k2wyca5o8fjrbwh67gnf	admin::transfer.tokens.regenerate	{}	\N	{}	[]	2026-02-12 15:07:51.968	2026-02-12 15:07:51.968	2026-02-12 15:07:51.968	\N	\N	\N
154	nn4m3wyi4athitl5m7nockux	admin::transfer.tokens.delete	{}	\N	{}	[]	2026-02-12 15:07:51.971	2026-02-12 15:07:51.971	2026-02-12 15:07:51.971	\N	\N	\N
68	ehoq0l8f1x1br5zewyna7rkm	plugin::content-manager.explorer.create	{}	api::department.department	{"fields": ["title", "slug", "description", "contacts", "persons"], "locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:57.872	2026-02-13 14:26:57.872	2026-02-13 14:26:57.873	\N	\N	\N
80	vd0gk6pswm6trqs5072w89kt	plugin::content-manager.explorer.read	{}	api::schedule.schedule	{"fields": ["title", "file", "labels", "submissionStatus", "moderatorComment", "authorUser"], "locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:57.882	2026-02-13 14:26:57.882	2026-02-13 14:26:57.882	\N	\N	\N
100	jgy8cgpl4qis8viza7oo14sh	plugin::content-manager.explorer.publish	{}	api::person.person	{"locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:57.89	2026-02-13 14:26:57.89	2026-02-13 14:26:57.891	\N	\N	\N
69	bo145c5gxd6yueeahx3jd58e	plugin::content-manager.explorer.create	{}	api::material.material	{"fields": ["title", "slug", "description", "file", "submissionStatus", "moderatorComment", "authorUser"], "locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:57.899	2026-02-13 14:26:57.899	2026-02-13 14:26:57.9	\N	\N	\N
87	rucdy4yk9f1q9fus28awrhl4	plugin::content-manager.explorer.update	{}	api::schedule.schedule	{"fields": ["title", "file", "labels", "submissionStatus", "moderatorComment", "authorUser"], "locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:57.908	2026-02-13 14:26:57.908	2026-02-13 14:26:57.909	\N	\N	\N
82	byc8xyp4nkqcj2vp5smdxzac	plugin::content-manager.explorer.update	{}	api::department.department	{"fields": ["title", "slug", "description", "contacts", "persons"], "locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:57.918	2026-02-13 14:26:57.918	2026-02-13 14:26:57.918	\N	\N	\N
96	jq69tqw0c9wzqpr7zmbjp40i	plugin::content-manager.explorer.publish	{}	api::department.department	{"locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:57.927	2026-02-13 14:26:57.927	2026-02-13 14:26:57.928	\N	\N	\N
76	f5d0421dgnqtmc8m1la0au7t	plugin::content-manager.explorer.read	{}	api::material.material	{"fields": ["title", "slug", "description", "file", "submissionStatus", "moderatorComment", "authorUser"], "locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:57.936	2026-02-13 14:26:57.936	2026-02-13 14:26:57.936	\N	\N	\N
71	ultu1e3iqn6e8gaockhiuhtq	plugin::content-manager.explorer.create	{}	api::page.page	{"fields": ["title", "slug", "content"], "locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:57.944	2026-02-13 14:26:57.944	2026-02-13 14:26:57.944	\N	\N	\N
84	d28yqeyk7gwmg981qoux957z	plugin::content-manager.explorer.update	{}	api::news-item.news-item	{"fields": ["title", "slug", "excerpt", "content", "cover", "submissionStatus", "moderatorComment", "authorUser"], "locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:57.951	2026-02-13 14:26:57.951	2026-02-13 14:26:57.951	\N	\N	\N
78	nbejnmq5apvlmfp6j13uc3lm	plugin::content-manager.explorer.read	{}	api::page.page	{"fields": ["title", "slug", "content"], "locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:57.958	2026-02-13 14:26:57.958	2026-02-13 14:26:57.958	\N	\N	\N
98	jtx3qjwdzxmeinvvayn4flno	plugin::content-manager.explorer.publish	{}	api::news-item.news-item	{"locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:57.967	2026-02-13 14:26:57.967	2026-02-13 14:26:57.968	\N	\N	\N
75	knwnq5bh2e5q4monal2hfd7h	plugin::content-manager.explorer.read	{}	api::department.department	{"fields": ["title", "slug", "description", "contacts", "persons"], "locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:57.976	2026-02-13 14:26:57.976	2026-02-13 14:26:57.976	\N	\N	\N
99	gswyv8o813wa1xcsymvswtia	plugin::content-manager.explorer.publish	{}	api::page.page	{"locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:57.984	2026-02-13 14:26:57.984	2026-02-13 14:26:57.984	\N	\N	\N
92	i96pc0891d1v464nkxwvgoiy	plugin::content-manager.explorer.delete	{}	api::page.page	{"locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:57.992	2026-02-13 14:26:57.992	2026-02-13 14:26:57.992	\N	\N	\N
94	kiespk558bhj6n9809mnx0k8	plugin::content-manager.explorer.delete	{}	api::schedule.schedule	{"locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:58	2026-02-13 14:26:58	2026-02-13 14:26:58	\N	\N	\N
77	mghwvkyjxxg6g7g88ggdp2wi	plugin::content-manager.explorer.read	{}	api::news-item.news-item	{"fields": ["title", "slug", "excerpt", "content", "cover", "submissionStatus", "moderatorComment", "authorUser"], "locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:58.008	2026-02-13 14:26:58.008	2026-02-13 14:26:58.008	\N	\N	\N
93	nw7ict6s6tz358sye4b9shyz	plugin::content-manager.explorer.delete	{}	api::person.person	{"locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:58.017	2026-02-13 14:26:58.017	2026-02-13 14:26:58.018	\N	\N	\N
70	tptp1igem3c10cvgpaoi1mtg	plugin::content-manager.explorer.create	{}	api::news-item.news-item	{"fields": ["title", "slug", "excerpt", "content", "cover", "submissionStatus", "moderatorComment", "authorUser"], "locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:58.025	2026-02-13 14:26:58.025	2026-02-13 14:26:58.025	\N	\N	\N
73	ipo29r4bidtxtolhhh1p2asw	plugin::content-manager.explorer.create	{}	api::schedule.schedule	{"fields": ["title", "file", "labels", "submissionStatus", "moderatorComment", "authorUser"], "locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:58.041	2026-02-13 14:26:58.041	2026-02-13 14:26:58.041	\N	\N	\N
97	m5fj3w01g28getrvkkrog74f	plugin::content-manager.explorer.publish	{}	api::material.material	{"locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:58.05	2026-02-13 14:26:58.05	2026-02-13 14:26:58.05	\N	\N	\N
83	v2vm0zqdtucrndg1vmhppcgy	plugin::content-manager.explorer.update	{}	api::material.material	{"fields": ["title", "slug", "description", "file", "submissionStatus", "moderatorComment", "authorUser"], "locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:58.058	2026-02-13 14:26:58.058	2026-02-13 14:26:58.058	\N	\N	\N
89	jhpw5qmkfzssv2d7fd85lsnm	plugin::content-manager.explorer.delete	{}	api::department.department	{"locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:58.067	2026-02-13 14:26:58.067	2026-02-13 14:26:58.067	\N	\N	\N
91	r3p2h7sr7dcl0lco9f31o3br	plugin::content-manager.explorer.delete	{}	api::news-item.news-item	{"locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:58.074	2026-02-13 14:26:58.074	2026-02-13 14:26:58.074	\N	\N	\N
85	bkk5v4r0srjwt0gzxkqtcyov	plugin::content-manager.explorer.update	{}	api::page.page	{"fields": ["title", "slug", "content"], "locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:58.091	2026-02-13 14:26:58.091	2026-02-13 14:26:58.091	\N	\N	\N
101	wxw7r5af0fy3ea9te3edx79q	plugin::content-manager.explorer.publish	{}	api::schedule.schedule	{"locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:58.109	2026-02-13 14:26:58.109	2026-02-13 14:26:58.109	\N	\N	\N
90	ssa9kzt4i45ueozq1am95iwi	plugin::content-manager.explorer.delete	{}	api::material.material	{"locales": ["en", "be", "ru"]}	[]	2026-02-13 14:26:58.118	2026-02-13 14:26:58.118	2026-02-13 14:26:58.118	\N	\N	\N
\.


--
-- Data for Name: admin_permissions_role_lnk; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.admin_permissions_role_lnk (id, permission_id, role_id, permission_ord) FROM stdin;
1	1	2	1
2	2	2	2
3	3	2	3
4	4	2	4
5	5	2	5
6	6	2	6
7	7	2	7
8	8	2	8
9	9	2	9
10	10	2	10
11	11	2	11
12	12	2	12
13	13	2	13
14	14	2	14
15	15	2	15
16	16	2	16
17	17	2	17
18	18	2	18
221	161	1	119
222	162	1	120
223	163	1	121
31	31	2	31
32	32	2	32
33	33	2	33
34	34	2	34
35	35	2	35
36	36	2	36
37	37	3	1
38	38	3	2
39	39	3	3
40	40	3	4
41	41	3	5
42	42	3	6
43	43	3	7
44	44	3	8
45	45	3	9
46	46	3	10
47	47	3	11
48	48	3	12
49	49	3	13
50	50	3	14
51	51	3	15
52	52	3	16
53	53	3	17
54	54	3	18
61	61	3	25
62	62	3	26
63	63	3	27
64	64	3	28
65	65	3	29
66	66	3	30
67	67	1	1
74	74	1	8
81	81	1	15
88	88	1	22
95	95	1	29
102	102	1	36
103	103	1	37
104	104	1	38
105	105	1	39
106	106	1	40
107	107	1	41
108	108	1	42
109	109	1	43
110	110	1	44
111	111	1	45
112	112	1	46
113	113	1	47
114	114	1	48
115	115	1	49
116	116	1	50
117	117	1	51
118	118	1	52
119	119	1	53
120	120	1	54
121	121	1	55
122	122	1	56
123	123	1	57
124	124	1	58
125	125	1	59
126	126	1	60
127	127	1	61
128	128	1	62
129	129	1	63
130	130	1	64
131	131	1	65
132	132	1	66
133	133	1	67
134	134	1	68
135	135	1	69
136	136	1	70
137	137	1	71
138	138	1	72
139	139	1	73
140	140	1	74
141	141	1	75
142	142	1	76
143	143	1	77
144	144	1	78
145	145	1	79
146	146	1	80
147	147	1	81
148	148	1	82
149	149	1	83
150	150	1	84
151	151	1	85
152	152	1	86
153	153	1	87
154	154	1	88
185	68	1	89
186	80	1	90
187	100	1	91
188	69	1	92
189	87	1	93
190	82	1	94
191	96	1	95
192	76	1	96
193	71	1	97
194	84	1	98
195	78	1	99
196	98	1	100
197	75	1	101
198	99	1	102
199	92	1	103
200	94	1	104
201	77	1	105
202	93	1	106
203	70	1	107
205	73	1	109
206	97	1	110
207	83	1	111
208	89	1	112
209	91	1	113
211	85	1	115
213	101	1	117
214	90	1	118
\.


--
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.admin_roles (id, document_id, name, code, description, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	yfsoh9pfo603vcwlm07m606p	Super Admin	strapi-super-admin	Super Admins can access and manage all features and settings.	2026-02-12 15:07:51.429	2026-02-12 15:07:51.429	2026-02-12 15:07:51.429	\N	\N	\N
2	fl4vhrrgmbr9km8hyc00iv12	Editor	strapi-editor	Editors can manage and publish contents including those of other users.	2026-02-12 15:07:51.434	2026-02-12 15:07:51.434	2026-02-12 15:07:51.434	\N	\N	\N
3	sfpd8j4x4ew88tiyz92lsuzk	Author	strapi-author	Authors can manage the content they have created.	2026-02-12 15:07:51.438	2026-02-12 15:07:51.438	2026-02-12 15:07:51.438	\N	\N	\N
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.admin_users (id, document_id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	j5suhsvyiogo8ys1g17hlzhr	Rodion	\N	\N	threedots65@gmail.com	$2a$10$nJ8sXsV/BYkBdjBUj28h7ub1TKrph6iRpgnbkWsE71mf8d/0sgtFW	\N	\N	t	f	\N	2026-02-12 15:54:25.425	2026-02-12 15:54:25.425	2026-02-12 15:54:25.426	\N	\N	\N
\.


--
-- Data for Name: admin_users_roles_lnk; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.admin_users_roles_lnk (id, user_id, role_id, role_ord, user_ord) FROM stdin;
1	1	1	1	1
\.


--
-- Data for Name: components_person_link_labels; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.components_person_link_labels (id, label, url, kind) FROM stdin;
1	Google Scholar	https://scholar.google.com/	scholar
2	ORCID	https://orcid.org/0000-0000-0000-0000	orcid
\.


--
-- Data for Name: components_person_publications; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.components_person_publications (id, title, year, source, url) FROM stdin;
1	Конституционные основы правового государства	2024	Юридический журнал	https://example.org/publication-1
2	Практика конституционного контроля	2023	Сборник научных трудов	https://example.org/publication-2
\.


--
-- Data for Name: components_person_subjects; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.components_person_subjects (id, title) FROM stdin;
1	Конституционное право
2	Муниципальное право
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.departments (id, document_id, title, slug, description, contacts, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	do24ie0rtjy4xrvfnqae8ld7	Тестовая кафедра	testovaya-kafedra	Тестовый текст 	Тестовые контакты 	2026-02-25 12:11:32.532	2026-02-25 12:11:32.532	\N	1	1	ru
2	do24ie0rtjy4xrvfnqae8ld7	Тестовая кафедра	testovaya-kafedra	Тестовый текст 	Тестовые контакты 	2026-02-25 12:11:32.532	2026-02-25 12:11:32.532	2026-02-25 12:11:32.566	1	1	ru
3	p99gio1mkjv6v1vyzc7iv42o	test 2 kaf	test-2-kaf	\N	\N	2026-02-25 13:29:42.064	2026-02-25 13:29:42.064	\N	1	1	ru
4	p99gio1mkjv6v1vyzc7iv42o	test 2 kaf	test-2-kaf	\N	\N	2026-02-25 13:29:42.064	2026-02-25 13:29:42.064	2026-02-25 13:29:42.098	1	1	ru
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.files (id, document_id, name, alternative_text, caption, focal_point, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
2	f4e6x6a68dd093wop7e2l9md	Enchanted_Forest.jpg	\N	\N	\N	1900	964	{"large": {"ext": ".jpg", "url": "http://minio:9000/law-site/large_Enchanted_Forest_fdf6afc655.jpg", "etag": "5d58e156944444b2bd3a27b0e7db2b77", "hash": "large_Enchanted_Forest_fdf6afc655", "mime": "image/jpeg", "name": "large_Enchanted_Forest.jpg", "path": null, "size": 58.22, "width": 1000, "height": 507, "sizeInBytes": 58222}, "small": {"ext": ".jpg", "url": "http://minio:9000/law-site/small_Enchanted_Forest_fdf6afc655.jpg", "etag": "0ac53f435f547e1f21dd899c34831859", "hash": "small_Enchanted_Forest_fdf6afc655", "mime": "image/jpeg", "name": "small_Enchanted_Forest.jpg", "path": null, "size": 17.64, "width": 500, "height": 254, "sizeInBytes": 17635}, "medium": {"ext": ".jpg", "url": "http://minio:9000/law-site/medium_Enchanted_Forest_fdf6afc655.jpg", "etag": "d8e15b57110da3e6829dbd2688603295", "hash": "medium_Enchanted_Forest_fdf6afc655", "mime": "image/jpeg", "name": "medium_Enchanted_Forest.jpg", "path": null, "size": 35.35, "width": 750, "height": 381, "sizeInBytes": 35348}, "thumbnail": {"ext": ".jpg", "url": "http://minio:9000/law-site/thumbnail_Enchanted_Forest_fdf6afc655.jpg", "etag": "34c592ea116d910a42c09c98e83600f0", "hash": "thumbnail_Enchanted_Forest_fdf6afc655", "mime": "image/jpeg", "name": "thumbnail_Enchanted_Forest.jpg", "path": null, "size": 5.4, "width": 245, "height": 124, "sizeInBytes": 5403}}	Enchanted_Forest_fdf6afc655	.jpg	image/jpeg	177.35	http://minio:9000/law-site/Enchanted_Forest_fdf6afc655.jpg	\N	aws-s3	\N	/1	2026-02-17 15:41:40.714	2026-02-17 15:41:40.714	2026-02-17 15:41:40.715	1	1	\N
3	xdxqk2yqex8fj40vwfyh28jq	Beholder.jpg	\N	\N	\N	2000	800	{"large": {"ext": ".jpg", "url": "http://minio:9000/law-site/large_Beholder_d565c8dd56.jpg", "etag": "ec82198a79a619f7620be3862c9e44ce", "hash": "large_Beholder_d565c8dd56", "mime": "image/jpeg", "name": "large_Beholder.jpg", "path": null, "size": 36.92, "width": 1000, "height": 400, "sizeInBytes": 36915}, "small": {"ext": ".jpg", "url": "http://minio:9000/law-site/small_Beholder_d565c8dd56.jpg", "etag": "4d79a7edf83b01370b9f25f550790788", "hash": "small_Beholder_d565c8dd56", "mime": "image/jpeg", "name": "small_Beholder.jpg", "path": null, "size": 12.18, "width": 500, "height": 200, "sizeInBytes": 12183}, "medium": {"ext": ".jpg", "url": "http://minio:9000/law-site/medium_Beholder_d565c8dd56.jpg", "etag": "849b99463407913c3c982ee6c2974f2b", "hash": "medium_Beholder_d565c8dd56", "mime": "image/jpeg", "name": "medium_Beholder.jpg", "path": null, "size": 23.13, "width": 750, "height": 300, "sizeInBytes": 23125}, "thumbnail": {"ext": ".jpg", "url": "http://minio:9000/law-site/thumbnail_Beholder_d565c8dd56.jpg", "etag": "dc6a8f8fcc96d70e3aa7fdf5b1fc4da2", "hash": "thumbnail_Beholder_d565c8dd56", "mime": "image/jpeg", "name": "thumbnail_Beholder.jpg", "path": null, "size": 4.2, "width": 245, "height": 98, "sizeInBytes": 4204}}	Beholder_d565c8dd56	.jpg	image/jpeg	100.54	http://minio:9000/law-site/Beholder_d565c8dd56.jpg	\N	aws-s3	\N	/	2026-02-17 15:45:31.457	2026-02-17 15:45:38.684	2026-02-17 15:45:31.458	1	1	\N
4	winz6zl27z0q8c6k5p7jagoh	Beholder.jpg	\N	\N	\N	4642	2611	{"large": {"ext": ".jpg", "url": "http://minio:9000/law-site/large_Beholder_0152cbd3fa.jpg", "etag": "073f89fd8d0ef2e843c0a0b9f5a8b8d4", "hash": "large_Beholder_0152cbd3fa", "mime": "image/jpeg", "name": "large_Beholder.jpg", "path": null, "size": 40.02, "width": 1000, "height": 562, "sizeInBytes": 40019}, "small": {"ext": ".jpg", "url": "http://minio:9000/law-site/small_Beholder_0152cbd3fa.jpg", "etag": "6dda0b42cbfc816bfd4319efcc592e8f", "hash": "small_Beholder_0152cbd3fa", "mime": "image/jpeg", "name": "small_Beholder.jpg", "path": null, "size": 13.56, "width": 500, "height": 281, "sizeInBytes": 13555}, "medium": {"ext": ".jpg", "url": "http://minio:9000/law-site/medium_Beholder_0152cbd3fa.jpg", "etag": "a442a95796614e5b2f325e0f79fd5476", "hash": "medium_Beholder_0152cbd3fa", "mime": "image/jpeg", "name": "medium_Beholder.jpg", "path": null, "size": 25.04, "width": 750, "height": 422, "sizeInBytes": 25039}, "thumbnail": {"ext": ".jpg", "url": "http://minio:9000/law-site/thumbnail_Beholder_0152cbd3fa.jpg", "etag": "94c5b7c2dc779b83e1992532b2ef79b8", "hash": "thumbnail_Beholder_0152cbd3fa", "mime": "image/jpeg", "name": "thumbnail_Beholder.jpg", "path": null, "size": 4.94, "width": 245, "height": 138, "sizeInBytes": 4944}}	Beholder_0152cbd3fa	.jpg	image/jpeg	500.55	http://minio:9000/law-site/Beholder_0152cbd3fa.jpg	\N	aws-s3	\N	/	2026-02-17 15:50:23.553	2026-02-17 15:50:23.553	2026-02-17 15:50:23.554	1	1	\N
5	dooau4896lku3k4tzdxqe5xm	Ultron.png	\N	\N	\N	3840	2160	{"large": {"ext": ".png", "url": "http://minio:9000/law-site/large_Ultron_671e56aef5.png", "etag": "da3c5c32449504e85c040bdc640c541c", "hash": "large_Ultron_671e56aef5", "mime": "image/png", "name": "large_Ultron.png", "path": null, "size": 1043.34, "width": 1000, "height": 563, "sizeInBytes": 1043340}, "small": {"ext": ".png", "url": "http://minio:9000/law-site/small_Ultron_671e56aef5.png", "etag": "24aa1431b4dd7e8ed81db5a8d24ec576", "hash": "small_Ultron_671e56aef5", "mime": "image/png", "name": "small_Ultron.png", "path": null, "size": 298.12, "width": 500, "height": 281, "sizeInBytes": 298124}, "medium": {"ext": ".png", "url": "http://minio:9000/law-site/medium_Ultron_671e56aef5.png", "etag": "e05d0ec8c808dca007754de4c95e0ad1", "hash": "medium_Ultron_671e56aef5", "mime": "image/png", "name": "medium_Ultron.png", "path": null, "size": 624.42, "width": 750, "height": 422, "sizeInBytes": 624422}, "thumbnail": {"ext": ".png", "url": "http://minio:9000/law-site/thumbnail_Ultron_671e56aef5.png", "etag": "ccee945b8cdf238022c834fcf8c06668", "hash": "thumbnail_Ultron_671e56aef5", "mime": "image/png", "name": "thumbnail_Ultron.png", "path": null, "size": 80.39, "width": 245, "height": 138, "sizeInBytes": 80392}}	Ultron_671e56aef5	.png	image/png	2631.78	http://minio:9000/law-site/Ultron_671e56aef5.png	\N	aws-s3	\N	/	2026-02-25 13:36:43.818	2026-02-25 13:36:43.818	2026-02-25 13:36:43.818	1	1	\N
\.


--
-- Data for Name: files_folder_lnk; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.files_folder_lnk (id, file_id, folder_id, file_ord) FROM stdin;
2	2	1	1
\.


--
-- Data for Name: files_related_mph; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.files_related_mph (id, file_id, related_id, related_type, field, "order") FROM stdin;
\.


--
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.i18n_locale (id, document_id, name, code, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	hyfgfjamhtrmphz25x84avf0	English (en)	en	2026-02-12 15:07:51.337	2026-02-12 15:07:51.337	2026-02-12 15:07:51.338	\N	\N	\N
2	wubhpah7j2lszhtd0lqcbinz	Belarusian (be)	be	2026-02-13 14:26:25.955	2026-02-13 14:26:25.955	2026-02-13 14:26:25.956	1	1	\N
3	hjwzwt7oio2e0wwp7tdf4fad	Russian (ru)	ru	2026-02-13 14:26:57.62	2026-02-13 14:26:57.62	2026-02-13 14:26:57.62	1	1	\N
\.


--
-- Data for Name: materials; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.materials (id, document_id, title, slug, description, submission_status, moderator_comment, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: materials_author_user_lnk; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.materials_author_user_lnk (id, material_id, user_id) FROM stdin;
\.


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.news (id, document_id, title, slug, excerpt, content, submission_status, moderator_comment, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: news_author_user_lnk; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.news_author_user_lnk (id, news_item_id, user_id) FROM stdin;
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.pages (id, document_id, title, slug, content, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: persons; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.persons (id, document_id, full_name, "position", bio, created_at, updated_at, published_at, created_by_id, updated_by_id, locale, email, phone, academic_title, academic_degree, workplace, sort_order, is_head, role_in_department, slug) FROM stdin;
1	y034t5xlmqcl7lpopo42mau2	Антон	Преподователь 	Тестовое био 	2026-02-25 12:12:02.007	2026-02-25 13:30:48.551	\N	1	1	ru	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	y034t5xlmqcl7lpopo42mau2	Антон	Преподователь 	Тестовое био 	2026-02-25 12:12:02.007	2026-02-25 13:30:48.551	2026-02-25 13:30:48.605	1	1	ru	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	94c2af6f5a5e8c62fff4c3ea	Иванов Иван Иванович	Доцент	Тестовый профиль сотрудника для проверки личной страницы.\\n\\nЗанимается учебной и научной работой по публично-правовой тематике.	2026-02-25 15:34:19.447595	2026-02-25 15:34:19.447595	2026-02-25 15:34:19.447595	\N	\N	ru	ivanov.test@bsu.by	+375 (29) 111-22-33	доцент	кандидат юридических наук	Кафедра конституционного права	10	f	Доцент кафедры конституционного права	ivanov-ivan-ivanovich-test
\.


--
-- Data for Name: persons_cmps; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.persons_cmps (id, entity_id, cmp_id, component_type, field, "order") FROM stdin;
1	5	1	person.subject	subjects	\N
2	5	2	person.subject	subjects	\N
3	5	1	person.publication	publications	\N
4	5	2	person.publication	publications	\N
5	5	1	person.link-label	labels	\N
6	5	2	person.link-label	labels	\N
\.


--
-- Data for Name: persons_departments_lnk; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.persons_departments_lnk (id, person_id, department_id, department_ord, person_ord) FROM stdin;
1	1	1	1	1
7	4	2	1	1
8	5	2	1	1
\.


--
-- Data for Name: schedules; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.schedules (id, document_id, title, labels, submission_status, moderator_comment, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: schedules_author_user_lnk; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.schedules_author_user_lnk (id, schedule_id, user_id) FROM stdin;
\.


--
-- Data for Name: strapi_ai_localization_jobs; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.strapi_ai_localization_jobs (id, content_type, related_document_id, source_locale, target_locales, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: strapi_ai_metadata_jobs; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.strapi_ai_metadata_jobs (id, status, created_at, completed_at) FROM stdin;
\.


--
-- Data for Name: strapi_api_token_permissions; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.strapi_api_token_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_api_token_permissions_token_lnk; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.strapi_api_token_permissions_token_lnk (id, api_token_permission_id, api_token_id, api_token_permission_ord) FROM stdin;
\.


--
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.strapi_api_tokens (id, document_id, name, description, type, access_key, encrypted_key, last_used_at, expires_at, lifespan, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	juq812dimq57dmmq4aa5qo6i	Read Only	A default API token with read-only permissions, only used for accessing resources	read-only	13fbe697b48ea4d2ec5a3915b9b176a5cab37c66d153a420dd922f3bd077db89970c8f236938a45ddda95ca9d8233e2db327f749f3d11633c135eccbd53733ad	v1:627a01a52c8621372d3bfae689a96195:f8818d2d2b5053afea0fcd1678821d08ff61fcfaeb7721f8907f86500e009109763e867618a28f9443418a63ad1a25411ef89ca3a12cb30d3d23aaf1c3daff9cb468b0dcbb9609df0126de2a5808d0caf421fd5a0ae7f21833c14eb3756915a8155b442c51314ad59663762d502506d5734a4c08ad7e7ee69998990a58c84181c3f949b5877bca33151d4274e7b5a64da35b58e446d12ac0d691aa21bddc9ba4b08989408ad0a8f8c25c537a01c9f9886035d3ef6bc7a859d54ff9b61630fddfd9b275e82f7b1e33fc36d4b76feb7ac5d0c99fd6d2e44fe1fb3dd851fa7184605d4e761fc4800a6abdb2751992c2376ec06c7773270a0b364cebef7d7559a2b2:f0318fdf310a56c6769e7ef4a767bfee	\N	\N	\N	2026-02-12 15:07:52.037	2026-02-12 15:07:52.037	2026-02-12 15:07:52.037	\N	\N	\N
2	bxbs65fpjnotiygd0pgvvfdx	Full Access	A default API token with full access permissions, used for accessing or modifying resources	full-access	220eebc7f87772858078e29cbc26227ecafdaea20b78ff43e5ccb60ad2dd861fa22623652e1baa8662afeff6d51ac56b441f2601df3b0f97047fc6cfe0c1222c	v1:d45b1e5f0ff158e13aa8b9182c9b5874:ad241e0d3e13d85eee3f64c2b4f53673e14df5794e2e3e2db1da0b865d5ee34e2c6ffd4986d0f7f42a3f579d890475f90d06df540a4d28d8ae66707e42ef67661e0864b08c31159021e24f23283f0ade961bef68b21c615761d1d4101d8c9cac232e1c684c7903ff16ff03db8ef9879e7099ff0a968da233b658e2b917438aa4bb298ef008a1714654c8d22c5559778b761320778f8a66fba1337e26f57eddd3db5af6f317aa5f2d5a41cbcd8d841f84d61db0e7c831a7b6f5fe45907e2728735ace0f81f83229dd8e02b5882c44f4f0d041cda7232350d893a9ee31ace4fb89aece48ac44c470c55e5644b874c4cf1cb8df2000353e63dd1927913fbfbe143e:c4cb8108347491e9a67f7960989b2e30	\N	\N	\N	2026-02-12 15:07:52.041	2026-02-12 15:07:52.041	2026-02-12 15:07:52.042	\N	\N	\N
\.


--
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
1	strapi_unidirectional-join-table-repair-ran	true	boolean	\N	\N
2	strapi_content_types_schema	{"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"text","configurable":false},"caption":{"type":"text","configurable":false},"focalPoint":{"type":"json","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"text","configurable":false,"required":true},"previewUrl":{"type":"text","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","minLength":1,"required":true,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"files"}}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null}],"plugin":"upload","globalId":"UploadFile","uid":"plugin::upload.file","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"text","configurable":false},"caption":{"type":"text","configurable":false},"focalPoint":{"type":"json","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"text","configurable":false,"required":true},"previewUrl":{"type":"text","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","minLength":1,"required":true,"private":true,"searchable":false}},"kind":"collectionType"},"modelName":"file"},"plugin::upload.folder":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","minLength":1,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"upload_folders"}}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"plugin":"upload","globalId":"UploadFolder","uid":"plugin::upload.folder","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","minLength":1,"required":true}},"kind":"collectionType"},"modelName":"folder"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::i18n.locale","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"i18n_locale"}}},"plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale","uid":"plugin::i18n.locale","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"i18n_locale","info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelName":"locale"},"plugin::content-releases.release":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_releases"}}},"plugin":"content-releases","globalId":"ContentReleasesRelease","uid":"plugin::content-releases.release","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"}},"kind":"collectionType"},"modelName":"release"},"plugin::content-releases.release-action":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"contentType":{"type":"string","required":true},"entryDocumentId":{"type":"string"},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_release_actions"}}},"plugin":"content-releases","globalId":"ContentReleasesReleaseAction","uid":"plugin::content-releases.release-action","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"contentType":{"type":"string","required":true},"entryDocumentId":{"type":"string"},"locale":{"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"}},"kind":"collectionType"},"modelName":"release-action"},"plugin::review-workflows.workflow":{"collectionName":"strapi_workflows","info":{"name":"Workflow","description":"","singularName":"workflow","pluralName":"workflows","displayName":"Workflow"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true,"unique":true},"stages":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToMany","mappedBy":"workflow"},"stageRequiredToPublish":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToOne","required":false},"contentTypes":{"type":"json","required":true,"default":"[]"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::review-workflows.workflow","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_workflows"}}},"plugin":"review-workflows","globalId":"ReviewWorkflowsWorkflow","uid":"plugin::review-workflows.workflow","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_workflows","info":{"name":"Workflow","description":"","singularName":"workflow","pluralName":"workflows","displayName":"Workflow"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true,"unique":true},"stages":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToMany","mappedBy":"workflow"},"stageRequiredToPublish":{"type":"relation","target":"plugin::review-workflows.workflow-stage","relation":"oneToOne","required":false},"contentTypes":{"type":"json","required":true,"default":"[]"}},"kind":"collectionType"},"modelName":"workflow"},"plugin::review-workflows.workflow-stage":{"collectionName":"strapi_workflows_stages","info":{"name":"Workflow Stage","description":"","singularName":"workflow-stage","pluralName":"workflow-stages","displayName":"Stages"},"options":{"version":"1.1.0","draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false},"color":{"type":"string","configurable":false,"default":"#4945FF"},"workflow":{"type":"relation","target":"plugin::review-workflows.workflow","relation":"manyToOne","inversedBy":"stages","configurable":false},"permissions":{"type":"relation","target":"admin::permission","relation":"manyToMany","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::review-workflows.workflow-stage","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_workflows_stages"}}},"plugin":"review-workflows","globalId":"ReviewWorkflowsWorkflowStage","uid":"plugin::review-workflows.workflow-stage","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_workflows_stages","info":{"name":"Workflow Stage","description":"","singularName":"workflow-stage","pluralName":"workflow-stages","displayName":"Stages"},"options":{"version":"1.1.0"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false},"color":{"type":"string","configurable":false,"default":"#4945FF"},"workflow":{"type":"relation","target":"plugin::review-workflows.workflow","relation":"manyToOne","inversedBy":"stages","configurable":false},"permissions":{"type":"relation","target":"admin::permission","relation":"manyToMany","configurable":false}},"kind":"collectionType"},"modelName":"workflow-stage"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_permissions"}}},"plugin":"users-permissions","globalId":"UsersPermissionsPermission","uid":"plugin::users-permissions.permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelName":"permission","options":{"draftAndPublish":false}},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.role","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_roles"}}},"plugin":"users-permissions","globalId":"UsersPermissionsRole","uid":"plugin::users-permissions.role","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelName":"role","options":{"draftAndPublish":false}},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"timestamps":true,"draftAndPublish":false},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"up_users"}}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"plugin":"users-permissions","globalId":"UsersPermissionsUser","uid":"plugin::users-permissions.user","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"timestamps":true},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false}},"kind":"collectionType"},"modelName":"user"},"api::department.department":{"kind":"collectionType","collectionName":"departments","info":{"singularName":"department","pluralName":"departments","displayName":"Department","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"type":"string","required":true,"pluginOptions":{"i18n":{"localized":true}}},"slug":{"type":"uid","targetField":"title","required":true,"pluginOptions":{"i18n":{"localized":true}}},"description":{"type":"richtext","pluginOptions":{"i18n":{"localized":true}}},"contacts":{"type":"text","pluginOptions":{"i18n":{"localized":true}}},"persons":{"type":"relation","relation":"manyToMany","target":"api::person.person","mappedBy":"departments"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::department.department","writable":false,"private":false,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"departments"}}},"apiName":"department","globalId":"Department","uid":"api::department.department","modelType":"contentType","__schema__":{"collectionName":"departments","info":{"singularName":"department","pluralName":"departments","displayName":"Department","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"type":"string","required":true,"pluginOptions":{"i18n":{"localized":true}}},"slug":{"type":"uid","targetField":"title","required":true,"pluginOptions":{"i18n":{"localized":true}}},"description":{"type":"richtext","pluginOptions":{"i18n":{"localized":true}}},"contacts":{"type":"text","pluginOptions":{"i18n":{"localized":true}}},"persons":{"type":"relation","relation":"manyToMany","target":"api::person.person","mappedBy":"departments"}},"kind":"collectionType"},"modelName":"department","actions":{},"lifecycles":{}},"api::material.material":{"kind":"collectionType","collectionName":"materials","info":{"singularName":"material","pluralName":"materials","displayName":"Material","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"type":"string","required":true,"pluginOptions":{"i18n":{"localized":true}}},"slug":{"type":"uid","targetField":"title","required":true,"pluginOptions":{"i18n":{"localized":true}}},"description":{"type":"text","pluginOptions":{"i18n":{"localized":true}}},"file":{"type":"media","multiple":false,"required":true,"allowedTypes":["files"]},"submissionStatus":{"type":"enumeration","enum":["draft","submitted","needs_changes","approved","rejected","published"],"default":"draft"},"moderatorComment":{"type":"text"},"authorUser":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.user"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::material.material","writable":false,"private":false,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"materials"}}},"apiName":"material","globalId":"Material","uid":"api::material.material","modelType":"contentType","__schema__":{"collectionName":"materials","info":{"singularName":"material","pluralName":"materials","displayName":"Material","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"type":"string","required":true,"pluginOptions":{"i18n":{"localized":true}}},"slug":{"type":"uid","targetField":"title","required":true,"pluginOptions":{"i18n":{"localized":true}}},"description":{"type":"text","pluginOptions":{"i18n":{"localized":true}}},"file":{"type":"media","multiple":false,"required":true,"allowedTypes":["files"]},"submissionStatus":{"type":"enumeration","enum":["draft","submitted","needs_changes","approved","rejected","published"],"default":"draft"},"moderatorComment":{"type":"text"},"authorUser":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.user"}},"kind":"collectionType"},"modelName":"material","actions":{},"lifecycles":{}},"api::news-item.news-item":{"kind":"collectionType","collectionName":"news","info":{"singularName":"news-item","pluralName":"news","displayName":"News","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"type":"string","required":true,"pluginOptions":{"i18n":{"localized":true}}},"slug":{"type":"uid","targetField":"title","required":true,"pluginOptions":{"i18n":{"localized":true}}},"excerpt":{"type":"text","pluginOptions":{"i18n":{"localized":true}}},"content":{"type":"richtext","pluginOptions":{"i18n":{"localized":true}}},"cover":{"type":"media","multiple":false,"required":false,"allowedTypes":["images"]},"submissionStatus":{"type":"enumeration","enum":["draft","submitted","needs_changes","approved","rejected","published"],"default":"draft"},"moderatorComment":{"type":"text"},"authorUser":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.user"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::news-item.news-item","writable":false,"private":false,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"news"}}},"apiName":"news-item","globalId":"NewsItem","uid":"api::news-item.news-item","modelType":"contentType","__schema__":{"collectionName":"news","info":{"singularName":"news-item","pluralName":"news","displayName":"News","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"type":"string","required":true,"pluginOptions":{"i18n":{"localized":true}}},"slug":{"type":"uid","targetField":"title","required":true,"pluginOptions":{"i18n":{"localized":true}}},"excerpt":{"type":"text","pluginOptions":{"i18n":{"localized":true}}},"content":{"type":"richtext","pluginOptions":{"i18n":{"localized":true}}},"cover":{"type":"media","multiple":false,"required":false,"allowedTypes":["images"]},"submissionStatus":{"type":"enumeration","enum":["draft","submitted","needs_changes","approved","rejected","published"],"default":"draft"},"moderatorComment":{"type":"text"},"authorUser":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.user"}},"kind":"collectionType"},"modelName":"news-item","actions":{},"lifecycles":{}},"api::page.page":{"kind":"collectionType","collectionName":"pages","info":{"singularName":"page","pluralName":"pages","displayName":"Page","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"type":"string","required":true,"pluginOptions":{"i18n":{"localized":true}}},"slug":{"type":"uid","targetField":"title","required":true,"pluginOptions":{"i18n":{"localized":true}}},"content":{"type":"richtext","pluginOptions":{"i18n":{"localized":true}}},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::page.page","writable":false,"private":false,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"pages"}}},"apiName":"page","globalId":"Page","uid":"api::page.page","modelType":"contentType","__schema__":{"collectionName":"pages","info":{"singularName":"page","pluralName":"pages","displayName":"Page","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"type":"string","required":true,"pluginOptions":{"i18n":{"localized":true}}},"slug":{"type":"uid","targetField":"title","required":true,"pluginOptions":{"i18n":{"localized":true}}},"content":{"type":"richtext","pluginOptions":{"i18n":{"localized":true}}}},"kind":"collectionType"},"modelName":"page","actions":{},"lifecycles":{}},"api::person.person":{"kind":"collectionType","collectionName":"persons","info":{"singularName":"person","pluralName":"persons","displayName":"Person","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"fullName":{"type":"string","required":true,"pluginOptions":{"i18n":{"localized":true}}},"slug":{"type":"uid","targetField":"fullName","required":true,"pluginOptions":{"i18n":{"localized":true}}},"position":{"type":"string","pluginOptions":{"i18n":{"localized":true}}},"email":{"type":"email"},"phone":{"type":"string"},"academicTitle":{"type":"string","pluginOptions":{"i18n":{"localized":true}}},"academicDegree":{"type":"string","pluginOptions":{"i18n":{"localized":true}}},"workplace":{"type":"string","pluginOptions":{"i18n":{"localized":true}}},"sortOrder":{"type":"integer","default":0},"isHead":{"type":"boolean","default":false},"roleInDepartment":{"type":"string","pluginOptions":{"i18n":{"localized":true}}},"bio":{"type":"richtext","pluginOptions":{"i18n":{"localized":true}}},"photo":{"type":"media","multiple":false,"required":false,"allowedTypes":["images"]},"subjects":{"type":"component","repeatable":true,"component":"person.subject","pluginOptions":{"i18n":{"localized":true}}},"publications":{"type":"component","repeatable":true,"component":"person.publication","pluginOptions":{"i18n":{"localized":true}}},"labels":{"type":"component","repeatable":true,"component":"person.link-label","pluginOptions":{"i18n":{"localized":true}}},"departments":{"type":"relation","relation":"manyToMany","target":"api::department.department","inversedBy":"persons"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::person.person","writable":false,"private":false,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"persons"}}},"apiName":"person","globalId":"Person","uid":"api::person.person","modelType":"contentType","__schema__":{"collectionName":"persons","info":{"singularName":"person","pluralName":"persons","displayName":"Person","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"fullName":{"type":"string","required":true,"pluginOptions":{"i18n":{"localized":true}}},"slug":{"type":"uid","targetField":"fullName","required":true,"pluginOptions":{"i18n":{"localized":true}}},"position":{"type":"string","pluginOptions":{"i18n":{"localized":true}}},"email":{"type":"email"},"phone":{"type":"string"},"academicTitle":{"type":"string","pluginOptions":{"i18n":{"localized":true}}},"academicDegree":{"type":"string","pluginOptions":{"i18n":{"localized":true}}},"workplace":{"type":"string","pluginOptions":{"i18n":{"localized":true}}},"sortOrder":{"type":"integer","default":0},"isHead":{"type":"boolean","default":false},"roleInDepartment":{"type":"string","pluginOptions":{"i18n":{"localized":true}}},"bio":{"type":"richtext","pluginOptions":{"i18n":{"localized":true}}},"photo":{"type":"media","multiple":false,"required":false,"allowedTypes":["images"]},"subjects":{"type":"component","repeatable":true,"component":"person.subject","pluginOptions":{"i18n":{"localized":true}}},"publications":{"type":"component","repeatable":true,"component":"person.publication","pluginOptions":{"i18n":{"localized":true}}},"labels":{"type":"component","repeatable":true,"component":"person.link-label","pluginOptions":{"i18n":{"localized":true}}},"departments":{"type":"relation","relation":"manyToMany","target":"api::department.department","inversedBy":"persons"}},"kind":"collectionType"},"modelName":"person","actions":{},"lifecycles":{}},"api::schedule.schedule":{"kind":"collectionType","collectionName":"schedules","info":{"singularName":"schedule","pluralName":"schedules","displayName":"Schedule","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"type":"string","required":true,"pluginOptions":{"i18n":{"localized":true}}},"file":{"type":"media","multiple":false,"required":true,"allowedTypes":["files"]},"labels":{"type":"json"},"submissionStatus":{"type":"enumeration","enum":["draft","submitted","needs_changes","approved","rejected","published"],"default":"draft"},"moderatorComment":{"type":"text"},"authorUser":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.user"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":false,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"api::schedule.schedule","writable":false,"private":false,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"schedules"}}},"apiName":"schedule","globalId":"Schedule","uid":"api::schedule.schedule","modelType":"contentType","__schema__":{"collectionName":"schedules","info":{"singularName":"schedule","pluralName":"schedules","displayName":"Schedule","description":""},"options":{"draftAndPublish":true},"pluginOptions":{"i18n":{"localized":true}},"attributes":{"title":{"type":"string","required":true,"pluginOptions":{"i18n":{"localized":true}}},"file":{"type":"media","multiple":false,"required":true,"allowedTypes":["files"]},"labels":{"type":"json"},"submissionStatus":{"type":"enumeration","enum":["draft","submitted","needs_changes","approved","rejected","published"],"default":"draft"},"moderatorComment":{"type":"text"},"authorUser":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.user"}},"kind":"collectionType"},"modelName":"schedule","actions":{},"lifecycles":{}},"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_permissions"}}},"plugin":"admin","globalId":"AdminPermission","uid":"admin::permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelName":"permission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::user","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_users"}}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"registrationToken":{"hidden":true}}},"plugin":"admin","globalId":"AdminUser","uid":"admin::user","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false}},"kind":"collectionType"},"modelName":"user","options":{"draftAndPublish":false}},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::role","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"admin_roles"}}},"plugin":"admin","globalId":"AdminRole","uid":"admin::role","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelName":"role"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"encryptedKey":{"type":"text","minLength":1,"configurable":false,"required":false,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::api-token","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_api_tokens"}}},"plugin":"admin","globalId":"AdminApiToken","uid":"admin::api-token","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"encryptedKey":{"type":"text","minLength":1,"configurable":false,"required":false,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelName":"api-token"},"admin::api-token-permission":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::api-token-permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_api_token_permissions"}}},"plugin":"admin","globalId":"AdminApiTokenPermission","uid":"admin::api-token-permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"}},"kind":"collectionType"},"modelName":"api-token-permission"},"admin::transfer-token":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::transfer-token","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_transfer_tokens"}}},"plugin":"admin","globalId":"AdminTransferToken","uid":"admin::transfer-token","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelName":"transfer-token"},"admin::transfer-token-permission":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::transfer-token-permission","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_transfer_token_permissions"}}},"plugin":"admin","globalId":"AdminTransferTokenPermission","uid":"admin::transfer-token-permission","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"}},"kind":"collectionType"},"modelName":"transfer-token-permission"},"admin::session":{"collectionName":"strapi_sessions","info":{"name":"Session","description":"Session Manager storage","singularName":"session","pluralName":"sessions","displayName":"Session"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false},"i18n":{"localized":false}},"attributes":{"userId":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"sessionId":{"type":"string","unique":true,"required":true,"configurable":false,"private":true,"searchable":false},"childId":{"type":"string","configurable":false,"private":true,"searchable":false},"deviceId":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"origin":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"expiresAt":{"type":"datetime","required":true,"configurable":false,"private":true,"searchable":false},"absoluteExpiresAt":{"type":"datetime","configurable":false,"private":true,"searchable":false},"status":{"type":"string","configurable":false,"private":true,"searchable":false},"type":{"type":"string","configurable":false,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":true},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"locale":{"writable":true,"private":true,"configurable":false,"visible":false,"type":"string"},"localizations":{"type":"relation","relation":"oneToMany","target":"admin::session","writable":false,"private":true,"configurable":false,"visible":false,"unstable_virtual":true,"joinColumn":{"name":"document_id","referencedColumn":"document_id","referencedTable":"strapi_sessions"}}},"plugin":"admin","globalId":"AdminSession","uid":"admin::session","modelType":"contentType","kind":"collectionType","__schema__":{"collectionName":"strapi_sessions","info":{"name":"Session","description":"Session Manager storage","singularName":"session","pluralName":"sessions","displayName":"Session"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false},"i18n":{"localized":false}},"attributes":{"userId":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"sessionId":{"type":"string","unique":true,"required":true,"configurable":false,"private":true,"searchable":false},"childId":{"type":"string","configurable":false,"private":true,"searchable":false},"deviceId":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"origin":{"type":"string","required":true,"configurable":false,"private":true,"searchable":false},"expiresAt":{"type":"datetime","required":true,"configurable":false,"private":true,"searchable":false},"absoluteExpiresAt":{"type":"datetime","configurable":false,"private":true,"searchable":false},"status":{"type":"string","configurable":false,"private":true,"searchable":false},"type":{"type":"string","configurable":false,"private":true,"searchable":false}},"kind":"collectionType"},"modelName":"session"}}	object	\N	\N
3	plugin_content_manager_configuration_content_types::plugin::upload.file	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"focalPoint":{"edit":{"label":"focalPoint","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"focalPoint","searchable":false,"sortable":false}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"folder":{"edit":{"label":"folder","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"folder","searchable":true,"sortable":true}},"folderPath":{"edit":{"label":"folderPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"folderPath","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6}],[{"name":"focalPoint","size":12}],[{"name":"width","size":4},{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}],[{"name":"folder","size":6},{"name":"folderPath","size":6}]]},"uid":"plugin::upload.file"}	object	\N	\N
4	plugin_content_manager_configuration_content_types::plugin::i18n.locale	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]},"uid":"plugin::i18n.locale"}	object	\N	\N
5	plugin_content_manager_configuration_content_types::plugin::upload.folder	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"pathId":{"edit":{"label":"pathId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pathId","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"parent","searchable":true,"sortable":true}},"children":{"edit":{"label":"children","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"children","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"files","searchable":false,"sortable":false}},"path":{"edit":{"label":"path","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"path","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","pathId","parent"],"edit":[[{"name":"name","size":6},{"name":"pathId","size":4}],[{"name":"parent","size":6},{"name":"children","size":6}],[{"name":"files","size":6},{"name":"path","size":6}]]},"uid":"plugin::upload.folder"}	object	\N	\N
6	plugin_content_manager_configuration_content_types::plugin::content-releases.release	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"releasedAt":{"edit":{"label":"releasedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"releasedAt","searchable":true,"sortable":true}},"scheduledAt":{"edit":{"label":"scheduledAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"scheduledAt","searchable":true,"sortable":true}},"timezone":{"edit":{"label":"timezone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"timezone","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"actions":{"edit":{"label":"actions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"contentType"},"list":{"label":"actions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","releasedAt","scheduledAt"],"edit":[[{"name":"name","size":6},{"name":"releasedAt","size":6}],[{"name":"scheduledAt","size":6},{"name":"timezone","size":6}],[{"name":"status","size":6},{"name":"actions","size":6}]]},"uid":"plugin::content-releases.release"}	object	\N	\N
7	plugin_content_manager_configuration_content_types::plugin::content-releases.release-action	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"contentType","defaultSortBy":"contentType","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"contentType":{"edit":{"label":"contentType","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contentType","searchable":true,"sortable":true}},"entryDocumentId":{"edit":{"label":"entryDocumentId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"entryDocumentId","searchable":true,"sortable":true}},"release":{"edit":{"label":"release","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"release","searchable":true,"sortable":true}},"isEntryValid":{"edit":{"label":"isEntryValid","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isEntryValid","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","type","contentType","entryDocumentId"],"edit":[[{"name":"type","size":6},{"name":"contentType","size":6}],[{"name":"entryDocumentId","size":6},{"name":"release","size":6}],[{"name":"isEntryValid","size":4}]]},"uid":"plugin::content-releases.release-action"}	object	\N	\N
8	plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"stages":{"edit":{"label":"stages","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"stages","searchable":false,"sortable":false}},"stageRequiredToPublish":{"edit":{"label":"stageRequiredToPublish","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"stageRequiredToPublish","searchable":true,"sortable":true}},"contentTypes":{"edit":{"label":"contentTypes","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contentTypes","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","stages","stageRequiredToPublish"],"edit":[[{"name":"name","size":6},{"name":"stages","size":6}],[{"name":"stageRequiredToPublish","size":6}],[{"name":"contentTypes","size":12}]]},"uid":"plugin::review-workflows.workflow"}	object	\N	\N
9	plugin_content_manager_configuration_content_types::plugin::review-workflows.workflow-stage	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"color":{"edit":{"label":"color","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"color","searchable":true,"sortable":true}},"workflow":{"edit":{"label":"workflow","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"workflow","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","color","workflow"],"edit":[[{"name":"name","size":6},{"name":"color","size":6}],[{"name":"workflow","size":6},{"name":"permissions","size":6}]]},"uid":"plugin::review-workflows.workflow-stage"}	object	\N	\N
10	plugin_content_manager_configuration_content_types::plugin::users-permissions.user	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"role","size":6}]]},"uid":"plugin::users-permissions.user"}	object	\N	\N
11	plugin_content_manager_configuration_content_types::api::department.department	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":false,"sortable":false}},"contacts":{"edit":{"label":"contacts","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contacts","searchable":true,"sortable":true}},"persons":{"edit":{"label":"persons","description":"","placeholder":"","visible":true,"editable":true,"mainField":"fullName"},"list":{"label":"persons","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","slug","contacts"],"edit":[[{"name":"title","size":6},{"name":"slug","size":6}],[{"name":"description","size":12}],[{"name":"contacts","size":6},{"name":"persons","size":6}]]},"uid":"api::department.department"}	object	\N	\N
17	plugin_content_manager_configuration_content_types::plugin::users-permissions.role	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"permissions","size":6}],[{"name":"users","size":6}]]},"uid":"plugin::users-permissions.role"}	object	\N	\N
26	plugin_content_manager_configuration_content_types::api::schedule.schedule	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"file":{"edit":{"label":"file","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"file","searchable":false,"sortable":false}},"labels":{"edit":{"label":"labels","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"labels","searchable":false,"sortable":false}},"submissionStatus":{"edit":{"label":"submissionStatus","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"submissionStatus","searchable":true,"sortable":true}},"moderatorComment":{"edit":{"label":"moderatorComment","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"moderatorComment","searchable":true,"sortable":true}},"authorUser":{"edit":{"label":"authorUser","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"authorUser","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","file","submissionStatus"],"edit":[[{"name":"title","size":6},{"name":"file","size":6}],[{"name":"labels","size":12}],[{"name":"submissionStatus","size":6},{"name":"moderatorComment","size":6}],[{"name":"authorUser","size":6}]]},"uid":"api::schedule.schedule"}	object	\N	\N
12	plugin_content_manager_configuration_content_types::api::material.material	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"file":{"edit":{"label":"file","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"file","searchable":false,"sortable":false}},"submissionStatus":{"edit":{"label":"submissionStatus","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"submissionStatus","searchable":true,"sortable":true}},"moderatorComment":{"edit":{"label":"moderatorComment","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"moderatorComment","searchable":true,"sortable":true}},"authorUser":{"edit":{"label":"authorUser","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"authorUser","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","slug","description"],"edit":[[{"name":"title","size":6},{"name":"slug","size":6}],[{"name":"description","size":6},{"name":"file","size":6}],[{"name":"submissionStatus","size":6},{"name":"moderatorComment","size":6}],[{"name":"authorUser","size":6}]]},"uid":"api::material.material"}	object	\N	\N
14	plugin_content_manager_configuration_content_types::api::page.page	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"content":{"edit":{"label":"content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","slug","createdAt"],"edit":[[{"name":"title","size":6},{"name":"slug","size":6}],[{"name":"content","size":12}]]},"uid":"api::page.page"}	object	\N	\N
24	plugin_content_manager_configuration_content_types::admin::transfer-token-permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::transfer-token-permission"}	object	\N	\N
13	plugin_content_manager_configuration_content_types::api::news-item.news-item	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"excerpt":{"edit":{"label":"excerpt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"excerpt","searchable":true,"sortable":true}},"content":{"edit":{"label":"content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content","searchable":false,"sortable":false}},"cover":{"edit":{"label":"cover","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"cover","searchable":false,"sortable":false}},"submissionStatus":{"edit":{"label":"submissionStatus","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"submissionStatus","searchable":true,"sortable":true}},"moderatorComment":{"edit":{"label":"moderatorComment","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"moderatorComment","searchable":true,"sortable":true}},"authorUser":{"edit":{"label":"authorUser","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"authorUser","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","slug","excerpt"],"edit":[[{"name":"title","size":6},{"name":"slug","size":6}],[{"name":"excerpt","size":6}],[{"name":"content","size":12}],[{"name":"cover","size":6},{"name":"submissionStatus","size":6}],[{"name":"moderatorComment","size":6},{"name":"authorUser","size":6}]]},"uid":"api::news-item.news-item"}	object	\N	\N
23	plugin_content_manager_configuration_content_types::admin::transfer-token	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","accessKey"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"accessKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]},"uid":"admin::transfer-token"}	object	\N	\N
27	plugin_upload_settings	{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false,"aiMetadata":true}	object	\N	\N
28	plugin_upload_view_configuration	{"pageSize":10,"sort":"createdAt:DESC"}	object	\N	\N
29	plugin_upload_metrics	{"weeklySchedule":"46 48 12 * * 5","lastWeeklyUpdate":1772196536540}	object	\N	\N
15	plugin_content_manager_configuration_content_types::api::person.person	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"fullName","defaultSortBy":"fullName","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"fullName":{"edit":{"label":"fullName","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"fullName","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"position":{"edit":{"label":"position","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"position","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"phone":{"edit":{"label":"phone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"phone","searchable":true,"sortable":true}},"academicTitle":{"edit":{"label":"academicTitle","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"academicTitle","searchable":true,"sortable":true}},"academicDegree":{"edit":{"label":"academicDegree","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"academicDegree","searchable":true,"sortable":true}},"workplace":{"edit":{"label":"workplace","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"workplace","searchable":true,"sortable":true}},"sortOrder":{"edit":{"label":"sortOrder","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"sortOrder","searchable":true,"sortable":true}},"isHead":{"edit":{"label":"isHead","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isHead","searchable":true,"sortable":true}},"roleInDepartment":{"edit":{"label":"roleInDepartment","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"roleInDepartment","searchable":true,"sortable":true}},"bio":{"edit":{"label":"bio","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"bio","searchable":false,"sortable":false}},"photo":{"edit":{"label":"photo","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"photo","searchable":false,"sortable":false}},"subjects":{"edit":{"label":"subjects","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subjects","searchable":false,"sortable":false}},"publications":{"edit":{"label":"publications","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"publications","searchable":false,"sortable":false}},"labels":{"edit":{"label":"labels","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"labels","searchable":false,"sortable":false}},"departments":{"edit":{"label":"departments","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"departments","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","fullName","position","photo"],"edit":[[{"name":"fullName","size":6},{"name":"position","size":6}],[{"name":"bio","size":12}],[{"name":"photo","size":6},{"name":"departments","size":6}],[{"name":"email","size":6},{"name":"phone","size":6}],[{"name":"academicTitle","size":6},{"name":"academicDegree","size":6}],[{"name":"workplace","size":6},{"name":"sortOrder","size":4}],[{"name":"isHead","size":4},{"name":"roleInDepartment","size":6}],[{"name":"subjects","size":12}],[{"name":"publications","size":12}],[{"name":"labels","size":12}],[{"name":"slug","size":6}]]},"uid":"api::person.person"}	object	\N	\N
16	plugin_content_manager_configuration_content_types::plugin::users-permissions.permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"edit":[[{"name":"action","size":6},{"name":"role","size":6}]]},"uid":"plugin::users-permissions.permission"}	object	\N	\N
25	plugin_content_manager_configuration_content_types::admin::session	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"userId","defaultSortBy":"userId","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"userId":{"edit":{"label":"userId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"userId","searchable":true,"sortable":true}},"sessionId":{"edit":{"label":"sessionId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"sessionId","searchable":true,"sortable":true}},"childId":{"edit":{"label":"childId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"childId","searchable":true,"sortable":true}},"deviceId":{"edit":{"label":"deviceId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"deviceId","searchable":true,"sortable":true}},"origin":{"edit":{"label":"origin","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"origin","searchable":true,"sortable":true}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"absoluteExpiresAt":{"edit":{"label":"absoluteExpiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"absoluteExpiresAt","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","userId","sessionId","childId"],"edit":[[{"name":"userId","size":6},{"name":"sessionId","size":6}],[{"name":"childId","size":6},{"name":"deviceId","size":6}],[{"name":"origin","size":6},{"name":"expiresAt","size":6}],[{"name":"absoluteExpiresAt","size":6},{"name":"status","size":6}],[{"name":"type","size":6}]]},"uid":"admin::session"}	object	\N	\N
31	plugin_users-permissions_grant	{"email":{"icon":"envelope","enabled":true},"discord":{"icon":"discord","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/discord/callback","scope":["identify","email"]},"facebook":{"icon":"facebook-square","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/facebook/callback","scope":["email"]},"google":{"icon":"google","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/google/callback","scope":["email"]},"github":{"icon":"github","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"icon":"windows","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"icon":"twitter","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/twitter/callback"},"instagram":{"icon":"instagram","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/instagram/callback","scope":["user_profile"]},"vk":{"icon":"vk","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/vk/callback","scope":["email"]},"twitch":{"icon":"twitch","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"icon":"linkedin","enabled":false,"key":"","secret":"","callbackUrl":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"icon":"aws","enabled":false,"key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"icon":"reddit","enabled":false,"key":"","secret":"","callback":"api/auth/reddit/callback","scope":["identity"]},"auth0":{"icon":"","enabled":false,"key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"icon":"book","enabled":false,"key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"},"patreon":{"icon":"","enabled":false,"key":"","secret":"","callback":"api/auth/patreon/callback","scope":["identity","identity[email]"]},"keycloak":{"icon":"","enabled":false,"key":"","secret":"","subdomain":"myKeycloakProvider.com/realms/myrealm","callback":"api/auth/keycloak/callback","scope":["openid","email","profile"]}}	object	\N	\N
32	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But don’t worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object	\N	\N
33	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}	object	\N	\N
30	plugin_i18n_default_locale	"ru"	string	\N	\N
18	plugin_content_manager_configuration_content_types::admin::permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"actionParameters":{"edit":{"label":"actionParameters","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"actionParameters","searchable":false,"sortable":false}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"edit":[[{"name":"action","size":6}],[{"name":"actionParameters","size":12}],[{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}],[{"name":"role","size":6}]]},"uid":"admin::permission"}	object	\N	\N
19	plugin_content_manager_configuration_content_types::admin::user	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"isActive","size":4}],[{"name":"roles","size":6},{"name":"blocked","size":4}],[{"name":"preferedLanguage","size":6}]]},"uid":"admin::user"}	object	\N	\N
34	core_admin_auth	{"providers":{"autoRegister":false,"defaultRole":null,"ssoLockedRoles":null}}	object	\N	\N
20	plugin_content_manager_configuration_content_types::admin::role	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6},{"name":"users","size":6}],[{"name":"permissions","size":6}]]},"uid":"admin::role"}	object	\N	\N
21	plugin_content_manager_configuration_content_types::admin::api-token	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"encryptedKey":{"edit":{"label":"encryptedKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"encryptedKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}],[{"name":"encryptedKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]},"uid":"admin::api-token"}	object	\N	\N
22	plugin_content_manager_configuration_content_types::admin::api-token-permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::api-token-permission"}	object	\N	\N
35	plugin_upload_api-folder	{"id":1}	object	\N	\N
36	plugin_content_manager_configuration_components::person.publication	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"year":{"edit":{"label":"year","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"year","searchable":true,"sortable":true}},"source":{"edit":{"label":"source","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"source","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","year","source"],"edit":[[{"name":"title","size":6},{"name":"year","size":4}],[{"name":"source","size":6},{"name":"url","size":6}]]},"uid":"person.publication","isComponent":true}	object	\N	\N
37	plugin_content_manager_configuration_components::person.subject	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","title"],"edit":[[{"name":"title","size":6}]]},"uid":"person.subject","isComponent":true}	object	\N	\N
38	plugin_content_manager_configuration_components::person.link-label	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"label","defaultSortBy":"label","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":false,"sortable":false}},"label":{"edit":{"label":"label","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"label","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"kind":{"edit":{"label":"kind","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"kind","searchable":true,"sortable":true}},"documentId":{"edit":{},"list":{"label":"documentId","searchable":true,"sortable":true}}},"layouts":{"list":["id","label","url","kind"],"edit":[[{"name":"label","size":6},{"name":"url","size":6}],[{"name":"kind","size":6}]]},"uid":"person.link-label","isComponent":true}	object	\N	\N
\.


--
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
4	{"tables":[{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null},{"name":"files_documents_idx","columns":["document_id","locale","published_at"]},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"focal_point","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_documents_idx","columns":["document_id","locale","published_at"]},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_documents_idx","columns":["document_id","locale","published_at"]},{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_releases","indexes":[{"name":"strapi_releases_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"released_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"scheduled_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"timezone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_release_actions","indexes":[{"name":"strapi_release_actions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"entry_document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_entry_valid","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows","indexes":[{"name":"strapi_workflows_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_workflows_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_workflows_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_workflows_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_workflows_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_types","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_workflows_stages","indexes":[{"name":"strapi_workflows_stages_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_workflows_stages_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_workflows_stages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_workflows_stages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_workflows_stages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"color","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_roles","indexes":[{"name":"up_roles_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"up_users","indexes":[{"name":"up_users_documents_idx","columns":["document_id","locale","published_at"]},{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"departments","indexes":[{"name":"departments_documents_idx","columns":["document_id","locale","published_at"]},{"name":"departments_created_by_id_fk","columns":["created_by_id"]},{"name":"departments_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"departments_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"departments_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"contacts","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"materials","indexes":[{"name":"materials_documents_idx","columns":["document_id","locale","published_at"]},{"name":"materials_created_by_id_fk","columns":["created_by_id"]},{"name":"materials_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"materials_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"materials_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"submission_status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"moderator_comment","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"news","indexes":[{"name":"news_documents_idx","columns":["document_id","locale","published_at"]},{"name":"news_created_by_id_fk","columns":["created_by_id"]},{"name":"news_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"news_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"news_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"excerpt","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"submission_status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"moderator_comment","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"pages","indexes":[{"name":"pages_documents_idx","columns":["document_id","locale","published_at"]},{"name":"pages_created_by_id_fk","columns":["created_by_id"]},{"name":"pages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"pages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"pages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"persons_cmps","indexes":[{"name":"persons_field_idx","columns":["field"]},{"name":"persons_component_type_idx","columns":["component_type"]},{"name":"persons_entity_fk","columns":["entity_id"]},{"name":"persons_uq","columns":["entity_id","cmp_id","field","component_type"],"type":"unique"}],"foreignKeys":[{"name":"persons_entity_fk","columns":["entity_id"],"referencedColumns":["id"],"referencedTable":"persons","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"entity_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"cmp_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"component_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"persons","indexes":[{"name":"persons_documents_idx","columns":["document_id","locale","published_at"]},{"name":"persons_created_by_id_fk","columns":["created_by_id"]},{"name":"persons_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"persons_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"persons_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"full_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"position","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"phone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"academic_title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"academic_degree","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"workplace","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"sort_order","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_head","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"role_in_department","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"bio","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"schedules","indexes":[{"name":"schedules_documents_idx","columns":["document_id","locale","published_at"]},{"name":"schedules_created_by_id_fk","columns":["created_by_id"]},{"name":"schedules_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"schedules_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"schedules_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"labels","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"submission_status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"moderator_comment","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action_parameters","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_users","indexes":[{"name":"admin_users_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_documents_idx","columns":["document_id","locale","published_at"]},{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"encrypted_key","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_transfer_tokens","indexes":[{"name":"strapi_transfer_tokens_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_transfer_token_permissions","indexes":[{"name":"strapi_transfer_token_permissions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_sessions","indexes":[{"name":"strapi_sessions_documents_idx","columns":["document_id","locale","published_at"]},{"name":"strapi_sessions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_sessions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_sessions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_sessions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"user_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"session_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"child_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"device_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"origin","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"absolute_expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_person_subjects","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_person_publications","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"year","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"source","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"components_person_link_labels","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"label","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"kind","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_history_versions","indexes":[{"name":"strapi_history_versions_created_by_id_fk","columns":["created_by_id"]}],"foreignKeys":[{"name":"strapi_history_versions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"related_document_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"data","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"schema","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_ai_metadata_jobs","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"completed_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_ai_localization_jobs","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"related_document_id","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"source_locale","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"target_locales","type":"jsonb","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"files_related_mph","indexes":[{"name":"files_related_mph_fk","columns":["file_id"]},{"name":"files_related_mph_oidx","columns":["order"]},{"name":"files_related_mph_idix","columns":["related_id"]}],"foreignKeys":[{"name":"files_related_mph_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_lnk","indexes":[{"name":"files_folder_lnk_fk","columns":["file_id"]},{"name":"files_folder_lnk_ifk","columns":["folder_id"]},{"name":"files_folder_lnk_uq","columns":["file_id","folder_id"],"type":"unique"},{"name":"files_folder_lnk_oifk","columns":["file_ord"]}],"foreignKeys":[{"name":"files_folder_lnk_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_lnk_ifk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"file_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_lnk","indexes":[{"name":"upload_folders_parent_lnk_fk","columns":["folder_id"]},{"name":"upload_folders_parent_lnk_ifk","columns":["inv_folder_id"]},{"name":"upload_folders_parent_lnk_uq","columns":["folder_id","inv_folder_id"],"type":"unique"},{"name":"upload_folders_parent_lnk_oifk","columns":["folder_ord"]}],"foreignKeys":[{"name":"upload_folders_parent_lnk_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_lnk_ifk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_release_actions_release_lnk","indexes":[{"name":"strapi_release_actions_release_lnk_fk","columns":["release_action_id"]},{"name":"strapi_release_actions_release_lnk_ifk","columns":["release_id"]},{"name":"strapi_release_actions_release_lnk_uq","columns":["release_action_id","release_id"],"type":"unique"},{"name":"strapi_release_actions_release_lnk_oifk","columns":["release_action_ord"]}],"foreignKeys":[{"name":"strapi_release_actions_release_lnk_fk","columns":["release_action_id"],"referencedColumns":["id"],"referencedTable":"strapi_release_actions","onDelete":"CASCADE"},{"name":"strapi_release_actions_release_lnk_ifk","columns":["release_id"],"referencedColumns":["id"],"referencedTable":"strapi_releases","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"release_action_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_action_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stage_required_to_publish_lnk","indexes":[{"name":"strapi_workflows_stage_required_to_publish_lnk_fk","columns":["workflow_id"]},{"name":"strapi_workflows_stage_required_to_publish_lnk_ifk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stage_required_to_publish_lnk_uq","columns":["workflow_id","workflow_stage_id"],"type":"unique"}],"foreignKeys":[{"name":"strapi_workflows_stage_required_to_publish_lnk_fk","columns":["workflow_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows","onDelete":"CASCADE"},{"name":"strapi_workflows_stage_required_to_publish_lnk_ifk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stages_workflow_lnk","indexes":[{"name":"strapi_workflows_stages_workflow_lnk_fk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stages_workflow_lnk_ifk","columns":["workflow_id"]},{"name":"strapi_workflows_stages_workflow_lnk_uq","columns":["workflow_stage_id","workflow_id"],"type":"unique"},{"name":"strapi_workflows_stages_workflow_lnk_oifk","columns":["workflow_stage_ord"]}],"foreignKeys":[{"name":"strapi_workflows_stages_workflow_lnk_fk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"},{"name":"strapi_workflows_stages_workflow_lnk_ifk","columns":["workflow_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"workflow_stage_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_workflows_stages_permissions_lnk","indexes":[{"name":"strapi_workflows_stages_permissions_lnk_fk","columns":["workflow_stage_id"]},{"name":"strapi_workflows_stages_permissions_lnk_ifk","columns":["permission_id"]},{"name":"strapi_workflows_stages_permissions_lnk_uq","columns":["workflow_stage_id","permission_id"],"type":"unique"},{"name":"strapi_workflows_stages_permissions_lnk_ofk","columns":["permission_ord"]}],"foreignKeys":[{"name":"strapi_workflows_stages_permissions_lnk_fk","columns":["workflow_stage_id"],"referencedColumns":["id"],"referencedTable":"strapi_workflows_stages","onDelete":"CASCADE"},{"name":"strapi_workflows_stages_permissions_lnk_ifk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"workflow_stage_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_lnk","indexes":[{"name":"up_permissions_role_lnk_fk","columns":["permission_id"]},{"name":"up_permissions_role_lnk_ifk","columns":["role_id"]},{"name":"up_permissions_role_lnk_uq","columns":["permission_id","role_id"],"type":"unique"},{"name":"up_permissions_role_lnk_oifk","columns":["permission_ord"]}],"foreignKeys":[{"name":"up_permissions_role_lnk_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_lnk","indexes":[{"name":"up_users_role_lnk_fk","columns":["user_id"]},{"name":"up_users_role_lnk_ifk","columns":["role_id"]},{"name":"up_users_role_lnk_uq","columns":["user_id","role_id"],"type":"unique"},{"name":"up_users_role_lnk_oifk","columns":["user_ord"]}],"foreignKeys":[{"name":"up_users_role_lnk_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"materials_author_user_lnk","indexes":[{"name":"materials_author_user_lnk_fk","columns":["material_id"]},{"name":"materials_author_user_lnk_ifk","columns":["user_id"]},{"name":"materials_author_user_lnk_uq","columns":["material_id","user_id"],"type":"unique"}],"foreignKeys":[{"name":"materials_author_user_lnk_fk","columns":["material_id"],"referencedColumns":["id"],"referencedTable":"materials","onDelete":"CASCADE"},{"name":"materials_author_user_lnk_ifk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"material_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"news_author_user_lnk","indexes":[{"name":"news_author_user_lnk_fk","columns":["news_item_id"]},{"name":"news_author_user_lnk_ifk","columns":["user_id"]},{"name":"news_author_user_lnk_uq","columns":["news_item_id","user_id"],"type":"unique"}],"foreignKeys":[{"name":"news_author_user_lnk_fk","columns":["news_item_id"],"referencedColumns":["id"],"referencedTable":"news","onDelete":"CASCADE"},{"name":"news_author_user_lnk_ifk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"news_item_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"persons_departments_lnk","indexes":[{"name":"persons_departments_lnk_fk","columns":["person_id"]},{"name":"persons_departments_lnk_ifk","columns":["department_id"]},{"name":"persons_departments_lnk_uq","columns":["person_id","department_id"],"type":"unique"},{"name":"persons_departments_lnk_ofk","columns":["department_ord"]},{"name":"persons_departments_lnk_oifk","columns":["person_ord"]}],"foreignKeys":[{"name":"persons_departments_lnk_fk","columns":["person_id"],"referencedColumns":["id"],"referencedTable":"persons","onDelete":"CASCADE"},{"name":"persons_departments_lnk_ifk","columns":["department_id"],"referencedColumns":["id"],"referencedTable":"departments","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"person_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"department_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"department_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"person_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"schedules_author_user_lnk","indexes":[{"name":"schedules_author_user_lnk_fk","columns":["schedule_id"]},{"name":"schedules_author_user_lnk_ifk","columns":["user_id"]},{"name":"schedules_author_user_lnk_uq","columns":["schedule_id","user_id"],"type":"unique"}],"foreignKeys":[{"name":"schedules_author_user_lnk_fk","columns":["schedule_id"],"referencedColumns":["id"],"referencedTable":"schedules","onDelete":"CASCADE"},{"name":"schedules_author_user_lnk_ifk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"schedule_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_permissions_role_lnk","indexes":[{"name":"admin_permissions_role_lnk_fk","columns":["permission_id"]},{"name":"admin_permissions_role_lnk_ifk","columns":["role_id"]},{"name":"admin_permissions_role_lnk_uq","columns":["permission_id","role_id"],"type":"unique"},{"name":"admin_permissions_role_lnk_oifk","columns":["permission_ord"]}],"foreignKeys":[{"name":"admin_permissions_role_lnk_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_lnk","indexes":[{"name":"admin_users_roles_lnk_fk","columns":["user_id"]},{"name":"admin_users_roles_lnk_ifk","columns":["role_id"]},{"name":"admin_users_roles_lnk_uq","columns":["user_id","role_id"],"type":"unique"},{"name":"admin_users_roles_lnk_ofk","columns":["role_ord"]},{"name":"admin_users_roles_lnk_oifk","columns":["user_ord"]}],"foreignKeys":[{"name":"admin_users_roles_lnk_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_lnk_ifk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_lnk","indexes":[{"name":"strapi_api_token_permissions_token_lnk_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_lnk_ifk","columns":["api_token_id"]},{"name":"strapi_api_token_permissions_token_lnk_uq","columns":["api_token_permission_id","api_token_id"],"type":"unique"},{"name":"strapi_api_token_permissions_token_lnk_oifk","columns":["api_token_permission_ord"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_lnk_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_lnk_ifk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions_token_lnk","indexes":[{"name":"strapi_transfer_token_permissions_token_lnk_fk","columns":["transfer_token_permission_id"]},{"name":"strapi_transfer_token_permissions_token_lnk_ifk","columns":["transfer_token_id"]},{"name":"strapi_transfer_token_permissions_token_lnk_uq","columns":["transfer_token_permission_id","transfer_token_id"],"type":"unique"},{"name":"strapi_transfer_token_permissions_token_lnk_oifk","columns":["transfer_token_permission_ord"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_token_lnk_fk","columns":["transfer_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_token_permissions","onDelete":"CASCADE"},{"name":"strapi_transfer_token_permissions_token_lnk_ifk","columns":["transfer_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"transfer_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_permission_ord","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}	2026-02-25 15:29:26.058	d5194859cf2ff62fd5856ca99daa154243ef5ec09fd7199b61a1404fc057f1a7
\.


--
-- Data for Name: strapi_history_versions; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.strapi_history_versions (id, content_type, related_document_id, locale, status, data, schema, created_at, created_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.strapi_migrations (id, name, "time") FROM stdin;
\.


--
-- Data for Name: strapi_migrations_internal; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.strapi_migrations_internal (id, name, "time") FROM stdin;
1	5.0.0-rename-identifiers-longer-than-max-length	2026-02-12 15:06:58.546
2	5.0.0-02-created-document-id	2026-02-12 15:06:58.571
3	5.0.0-03-created-locale	2026-02-12 15:06:58.593
4	5.0.0-04-created-published-at	2026-02-12 15:06:58.613
5	5.0.0-05-drop-slug-fields-index	2026-02-12 15:06:58.635
6	5.0.0-06-add-document-id-indexes	2026-02-12 15:06:58.656
7	core::5.0.0-discard-drafts	2026-02-12 15:06:58.677
\.


--
-- Data for Name: strapi_release_actions; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.strapi_release_actions (id, document_id, type, content_type, entry_document_id, locale, is_entry_valid, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_release_actions_release_lnk; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.strapi_release_actions_release_lnk (id, release_action_id, release_id, release_action_ord) FROM stdin;
\.


--
-- Data for Name: strapi_releases; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.strapi_releases (id, document_id, name, released_at, scheduled_at, timezone, status, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_sessions; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.strapi_sessions (id, document_id, user_id, session_id, child_id, device_id, origin, expires_at, absolute_expires_at, status, type, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	x9x73je87hwkrjsl8gvzdqww	1	0044204dbe730bbd52759691e3786696	\N	4c8e4a54-c5bf-4b6e-86c8-54729b27e7e3	admin	2026-02-12 17:54:25.449	2026-03-14 15:54:25.449	active	session	2026-02-12 15:54:25.449	2026-02-12 15:54:25.449	2026-02-12 15:54:25.449	\N	\N	\N
2	zberbgys13ipgrgt21zx0v2o	1	2780cf11acbcf82574840444a498c90a	b694b9c41326cc36ed66afa03230beac	4c8e4a54-c5bf-4b6e-86c8-54729b27e7e3	admin	2026-02-27 14:25:01.587	2026-03-15 14:25:01.587	rotated	refresh	2026-02-13 14:25:01.587	2026-02-16 11:37:56.568	2026-02-13 14:25:01.591	\N	\N	\N
3	n3o5ivavsmr4jrad3o8525j9	1	b694b9c41326cc36ed66afa03230beac	1ac7147092cc3c25b5fa1abbbbc00416	4c8e4a54-c5bf-4b6e-86c8-54729b27e7e3	admin	2026-03-02 11:37:56.545	2026-03-15 14:25:01.587	rotated	refresh	2026-02-16 11:37:56.546	2026-02-16 11:37:56.778	2026-02-16 11:37:56.551	\N	\N	\N
4	stx96tqmmhg0tadvfihtprhj	1	1ac7147092cc3c25b5fa1abbbbc00416	eb0e0a27d5cf253a8887a1a42fccae31	4c8e4a54-c5bf-4b6e-86c8-54729b27e7e3	admin	2026-03-02 11:37:56.659	2026-03-15 14:25:01.587	rotated	refresh	2026-02-16 11:37:56.659	2026-02-16 12:11:50.47	2026-02-16 11:37:56.66	\N	\N	\N
5	gj6sjwsbivqwzrrf8baiwxzh	1	eb0e0a27d5cf253a8887a1a42fccae31	9e6b176549674df25362abf66bd08033	4c8e4a54-c5bf-4b6e-86c8-54729b27e7e3	admin	2026-03-02 12:11:50.413	2026-03-15 14:25:01.587	rotated	refresh	2026-02-16 12:11:50.417	2026-02-16 13:12:05.543	2026-02-16 12:11:50.425	\N	\N	\N
6	uvirz7oifmfusbim2u3mkcmb	1	9e6b176549674df25362abf66bd08033	cb48f20c49e50bb689b945fc5789a0b1	4c8e4a54-c5bf-4b6e-86c8-54729b27e7e3	admin	2026-03-02 13:12:05.529	2026-03-15 14:25:01.587	rotated	refresh	2026-02-16 13:12:05.529	2026-02-16 13:47:58.286	2026-02-16 13:12:05.531	\N	\N	\N
7	kfdsrgxi75gq0bt1kzq69ay3	1	cb48f20c49e50bb689b945fc5789a0b1	9edf7cf5b95b1adbbb4cd66f9f763bd0	4c8e4a54-c5bf-4b6e-86c8-54729b27e7e3	admin	2026-03-02 13:47:58.27	2026-03-15 14:25:01.587	rotated	refresh	2026-02-16 13:47:58.271	2026-02-17 15:38:45.755	2026-02-16 13:47:58.273	\N	\N	\N
8	qc6epc83l3wpqe5xg1mf74ja	1	9edf7cf5b95b1adbbb4cd66f9f763bd0	d6745f0e69a6d41957ee43922edcf88b	4c8e4a54-c5bf-4b6e-86c8-54729b27e7e3	admin	2026-03-03 15:38:45.746	2026-03-15 14:25:01.587	rotated	refresh	2026-02-17 15:38:45.747	2026-02-18 14:18:50.205	2026-02-17 15:38:45.748	\N	\N	\N
9	xce8th114l6c93wqj0jso247	1	d6745f0e69a6d41957ee43922edcf88b	f61d80b0619488e644b6e50a1b2215dd	4c8e4a54-c5bf-4b6e-86c8-54729b27e7e3	admin	2026-03-04 14:18:50.188	2026-03-15 14:25:01.587	rotated	refresh	2026-02-18 14:18:50.189	2026-02-18 15:05:58.293	2026-02-18 14:18:50.191	\N	\N	\N
10	mn26e8ej9h8dyb0jxmt43qab	1	f61d80b0619488e644b6e50a1b2215dd	6f471e9e7de5fc5c8ef5c7a8d81f8071	4c8e4a54-c5bf-4b6e-86c8-54729b27e7e3	admin	2026-03-04 15:05:58.281	2026-03-15 14:25:01.587	rotated	refresh	2026-02-18 15:05:58.282	2026-02-25 12:08:03.555	2026-02-18 15:05:58.282	\N	\N	\N
11	i3mjgkgd7bznl7x0d758hx5p	1	6f471e9e7de5fc5c8ef5c7a8d81f8071	e65ec1b2312ac837ec96e2dcdd069c26	4c8e4a54-c5bf-4b6e-86c8-54729b27e7e3	admin	2026-03-11 12:08:03.549	2026-03-15 14:25:01.587	rotated	refresh	2026-02-25 12:08:03.549	2026-02-25 12:45:24.168	2026-02-25 12:08:03.55	\N	\N	\N
12	kvcf8jmwhluszwjoclnd6e5k	1	e65ec1b2312ac837ec96e2dcdd069c26	bdb3eb8fd2f3c57db02fc5a43913ecad	4c8e4a54-c5bf-4b6e-86c8-54729b27e7e3	admin	2026-03-11 12:45:24.14	2026-03-15 14:25:01.587	rotated	refresh	2026-02-25 12:45:24.141	2026-02-25 13:20:38.264	2026-02-25 12:45:24.143	\N	\N	\N
14	l3l7900h2wf519vwxho6wn4u	1	8024cba78285e450203283b85173c32c	\N	4c8e4a54-c5bf-4b6e-86c8-54729b27e7e3	admin	2026-03-11 13:54:40.631	2026-03-15 14:25:01.587	active	refresh	2026-02-25 13:54:40.633	2026-02-25 13:54:40.633	2026-02-25 13:54:40.636	\N	\N	\N
13	f6gefx31pl76vjy28ikj0q7o	1	bdb3eb8fd2f3c57db02fc5a43913ecad	8024cba78285e450203283b85173c32c	4c8e4a54-c5bf-4b6e-86c8-54729b27e7e3	admin	2026-03-11 13:20:38.253	2026-03-15 14:25:01.587	rotated	refresh	2026-02-25 13:20:38.253	2026-02-25 13:54:40.673	2026-02-25 13:20:38.254	\N	\N	\N
\.


--
-- Data for Name: strapi_transfer_token_permissions; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.strapi_transfer_token_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_token_permissions_token_lnk; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.strapi_transfer_token_permissions_token_lnk (id, transfer_token_permission_id, transfer_token_id, transfer_token_permission_ord) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_tokens; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.strapi_transfer_tokens (id, document_id, name, description, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
1	pdfindexer	http://pdf-indexer:8080/webhooks/strapi	{"x-webhook-secret": "58b857f89f1f454fa06cf0bd75fc6f6b"}	["entry.create", "entry.update", "entry.delete", "entry.publish", "entry.unpublish"]	t
\.


--
-- Data for Name: strapi_workflows; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.strapi_workflows (id, document_id, name, content_types, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stage_required_to_publish_lnk; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.strapi_workflows_stage_required_to_publish_lnk (id, workflow_id, workflow_stage_id) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stages; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.strapi_workflows_stages (id, document_id, name, color, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stages_permissions_lnk; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.strapi_workflows_stages_permissions_lnk (id, workflow_stage_id, permission_id, permission_ord) FROM stdin;
\.


--
-- Data for Name: strapi_workflows_stages_workflow_lnk; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.strapi_workflows_stages_workflow_lnk (id, workflow_stage_id, workflow_id, workflow_stage_ord) FROM stdin;
\.


--
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.up_permissions (id, document_id, action, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	rgqa6s66f2s871j1u37rqljl	plugin::users-permissions.auth.logout	2026-02-12 15:07:51.398	2026-02-12 15:07:51.398	2026-02-12 15:07:51.398	\N	\N	\N
2	puqmhujpd1vh25wpfav8vkl4	plugin::users-permissions.user.me	2026-02-12 15:07:51.398	2026-02-12 15:07:51.398	2026-02-12 15:07:51.398	\N	\N	\N
3	h1mk3u6jlpgd2rp48zl5jpj2	plugin::users-permissions.auth.changePassword	2026-02-12 15:07:51.398	2026-02-12 15:07:51.398	2026-02-12 15:07:51.398	\N	\N	\N
4	p87llwmgkfc9xskbs4q2owrh	plugin::users-permissions.auth.callback	2026-02-12 15:07:51.406	2026-02-12 15:07:51.406	2026-02-12 15:07:51.406	\N	\N	\N
5	jfqcybatbmhzimposvrm5dwd	plugin::users-permissions.auth.connect	2026-02-12 15:07:51.406	2026-02-12 15:07:51.406	2026-02-12 15:07:51.406	\N	\N	\N
6	x0pp6q2rtwcsmuajh3r9sg3f	plugin::users-permissions.auth.forgotPassword	2026-02-12 15:07:51.406	2026-02-12 15:07:51.406	2026-02-12 15:07:51.406	\N	\N	\N
7	nikji8xni56prct86bx73zar	plugin::users-permissions.auth.resetPassword	2026-02-12 15:07:51.406	2026-02-12 15:07:51.406	2026-02-12 15:07:51.406	\N	\N	\N
8	w128ly6pbnhjlvqwxdaiyxeq	plugin::users-permissions.auth.emailConfirmation	2026-02-12 15:07:51.406	2026-02-12 15:07:51.406	2026-02-12 15:07:51.406	\N	\N	\N
9	pkwmd6q2yrn5errrv9fmegb5	plugin::users-permissions.auth.register	2026-02-12 15:07:51.406	2026-02-12 15:07:51.406	2026-02-12 15:07:51.406	\N	\N	\N
10	rdztv4fixxqlujgemrxfmj0p	plugin::users-permissions.auth.sendEmailConfirmation	2026-02-12 15:07:51.406	2026-02-12 15:07:51.406	2026-02-12 15:07:51.406	\N	\N	\N
11	e5nbjiokgw1w0n2v44daguei	plugin::users-permissions.auth.refresh	2026-02-12 15:07:51.406	2026-02-12 15:07:51.406	2026-02-12 15:07:51.406	\N	\N	\N
12	coq9q5wabpb899an49s2jd2i	api::news-item.news-item.find	2026-02-13 14:28:38.383	2026-02-13 14:28:38.383	2026-02-13 14:28:38.384	\N	\N	\N
13	kb9sv53cui3o0xs0woxq0yah	api::news-item.news-item.findOne	2026-02-13 14:28:38.383	2026-02-13 14:28:38.383	2026-02-13 14:28:38.384	\N	\N	\N
14	oxohbfyta0uukgq6u9wpts85	api::news-item.news-item.create	2026-02-13 14:28:38.383	2026-02-13 14:28:38.383	2026-02-13 14:28:38.385	\N	\N	\N
15	sqfn3cpq0hi34etwcvynkasn	api::news-item.news-item.update	2026-02-13 14:28:38.383	2026-02-13 14:28:38.383	2026-02-13 14:28:38.385	\N	\N	\N
17	n9g41swr7qrtoaphw2nzkklm	api::department.department.findOne	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.108	\N	\N	\N
16	imcjpncdh6l7kyznvxu6szig	api::department.department.find	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.108	\N	\N	\N
18	venur0h0c6129wcsm4420jc8	api::department.department.create	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.108	\N	\N	\N
19	kwj7mjy5dtuyx277p05qbvco	api::department.department.update	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.108	\N	\N	\N
20	wpq6mj0kuci41xohdgff1cho	api::department.department.delete	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.113	\N	\N	\N
21	jqcdbxc6dnxhnu542i2zz5ss	api::material.material.find	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.114	\N	\N	\N
22	vn9u8u0z8oa7017ttdq1dzb2	api::material.material.create	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.114	\N	\N	\N
23	zuknnmgb2yspxqjp31wv7m5t	api::material.material.findOne	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.114	\N	\N	\N
24	a9sxf4nk0br5gva2yw97ul4a	api::material.material.update	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.114	\N	\N	\N
25	su2atwiwrmgxjonaitur9kdq	api::material.material.delete	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.114	\N	\N	\N
26	qiwz5pnaciahbpq3e1in57wr	api::news-item.news-item.find	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.115	\N	\N	\N
27	aini7kl7srmphrwqq0tuyut0	api::news-item.news-item.findOne	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.115	\N	\N	\N
28	qh7euju9j2ttb0lgtht8wpl8	api::news-item.news-item.create	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.115	\N	\N	\N
29	k0rbkchhuhv512du0rs65qh2	api::news-item.news-item.update	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.115	\N	\N	\N
30	puqzrvkx9tcssttcspmr2pd0	api::news-item.news-item.delete	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.115	\N	\N	\N
32	k63atc27902qi25dj0tnfieq	api::page.page.findOne	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.115	\N	\N	\N
31	bl747g1umfj4frvthyl00vw7	api::page.page.find	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.115	\N	\N	\N
33	ko45shxzjj34pi2ormxpap3i	api::page.page.create	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.115	\N	\N	\N
34	a2svgq30cx114z5quzpg1vbz	api::page.page.update	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.116	\N	\N	\N
35	nkojpff6kgo8ivhjrqz0x8mw	api::page.page.delete	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.116	\N	\N	\N
36	ynu6mozhjh9qirbzk8l12w6n	api::person.person.find	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.116	\N	\N	\N
37	jcndrvk8vgzksp0a4nf4lswd	api::person.person.findOne	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.116	\N	\N	\N
38	nbgf6evtquj90b5y76y6078k	api::person.person.create	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.116	\N	\N	\N
39	d3o42auzume5gyndoxa3e627	api::person.person.update	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.116	\N	\N	\N
40	zqmi5rzy65hzqhdvi0vq5tqj	api::person.person.delete	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.116	\N	\N	\N
41	ivxyaxku0acbq4yzabu8kjus	api::schedule.schedule.find	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.116	\N	\N	\N
42	sq5qm55ojriorikfir25wbyl	api::schedule.schedule.findOne	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.116	\N	\N	\N
43	robc5osq8558k6iqqxxs2lji	api::schedule.schedule.update	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.117	\N	\N	\N
44	c8cl15ug25kk0btabqn7d6nf	api::schedule.schedule.create	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.116	\N	\N	\N
45	fps4dq2vp9h37o6j5tu05wyy	api::schedule.schedule.delete	2026-02-13 14:30:07.107	2026-02-13 14:30:07.107	2026-02-13 14:30:07.117	\N	\N	\N
46	otzzrhkgutu2xgsz3svke0ec	plugin::content-type-builder.components.getComponents	2026-02-13 14:30:07.108	2026-02-13 14:30:07.108	2026-02-13 14:30:07.12	\N	\N	\N
47	sue5hbinpoi13nf8ma3ntilt	plugin::content-type-builder.components.getComponent	2026-02-13 14:30:07.108	2026-02-13 14:30:07.108	2026-02-13 14:30:07.12	\N	\N	\N
48	cbgjjpyagne4n9jtsepijbpu	plugin::content-type-builder.content-types.getContentTypes	2026-02-13 14:30:07.108	2026-02-13 14:30:07.108	2026-02-13 14:30:07.12	\N	\N	\N
49	sihb07oxahkqfchp01fir3iw	plugin::content-type-builder.content-types.getContentType	2026-02-13 14:30:07.108	2026-02-13 14:30:07.108	2026-02-13 14:30:07.12	\N	\N	\N
50	k3rteu1yynt4iab0y6opxb90	plugin::email.email.send	2026-02-13 14:30:07.108	2026-02-13 14:30:07.108	2026-02-13 14:30:07.12	\N	\N	\N
51	euw9sg0id7fc0ytbuysh8rn4	plugin::upload.content-api.find	2026-02-13 14:30:07.108	2026-02-13 14:30:07.108	2026-02-13 14:30:07.121	\N	\N	\N
52	hfg5jbb5lf86qipgpkbvolmk	plugin::upload.content-api.findOne	2026-02-13 14:30:07.108	2026-02-13 14:30:07.108	2026-02-13 14:30:07.121	\N	\N	\N
53	t47sj7a1x2g0exngd9i9nlhw	plugin::upload.content-api.destroy	2026-02-13 14:30:07.108	2026-02-13 14:30:07.108	2026-02-13 14:30:07.121	\N	\N	\N
54	zoj2o80k8bqre9hu05vedk27	plugin::upload.content-api.upload	2026-02-13 14:30:07.108	2026-02-13 14:30:07.108	2026-02-13 14:30:07.121	\N	\N	\N
55	cuqy78sj87d1gf0uy84e0lnb	api::department.department.find	2026-02-16 11:40:43.224	2026-02-16 11:40:43.224	2026-02-16 11:40:43.224	\N	\N	\N
56	o7i5r2pdjtb6qpj4yg9md6pt	api::department.department.findOne	2026-02-16 11:40:43.224	2026-02-16 11:40:43.224	2026-02-16 11:40:43.225	\N	\N	\N
57	js1iv9ccg0a6dmxbjsjy2s64	api::news-item.news-item.find	2026-02-16 11:40:43.224	2026-02-16 11:40:43.224	2026-02-16 11:40:43.225	\N	\N	\N
58	zqf13onnvwnehqct09ql9q6g	api::news-item.news-item.findOne	2026-02-16 11:40:43.224	2026-02-16 11:40:43.224	2026-02-16 11:40:43.225	\N	\N	\N
59	uh68tdf5weudse7blhbiukkn	api::page.page.find	2026-02-16 11:40:43.224	2026-02-16 11:40:43.224	2026-02-16 11:40:43.226	\N	\N	\N
60	air98fruup5nnn0u33r9nxkq	api::page.page.findOne	2026-02-16 11:40:43.224	2026-02-16 11:40:43.224	2026-02-16 11:40:43.226	\N	\N	\N
61	wvs7xp8i8y9684aycwrt6ek8	api::person.person.find	2026-02-16 11:40:43.224	2026-02-16 11:40:43.224	2026-02-16 11:40:43.227	\N	\N	\N
62	wv18yo88het429nywswdkgev	api::person.person.findOne	2026-02-16 11:40:43.224	2026-02-16 11:40:43.224	2026-02-16 11:40:43.227	\N	\N	\N
63	bf0v2s2acx9qr15yvqqhzhvo	api::schedule.schedule.find	2026-02-16 11:40:43.224	2026-02-16 11:40:43.224	2026-02-16 11:40:43.227	\N	\N	\N
64	n3c7f9fuzo7xfixn0e2xa7wt	api::schedule.schedule.findOne	2026-02-16 11:40:43.224	2026-02-16 11:40:43.224	2026-02-16 11:40:43.228	\N	\N	\N
65	t4q9ff6js7cmohngwn0hydmt	plugin::upload.content-api.findOne	2026-02-16 11:40:43.224	2026-02-16 11:40:43.224	2026-02-16 11:40:43.228	\N	\N	\N
66	xajb79xx6ptb6vookhuvmq81	plugin::upload.content-api.find	2026-02-16 11:40:43.224	2026-02-16 11:40:43.224	2026-02-16 11:40:43.228	\N	\N	\N
67	l80k8oerea7nfr0a37zsvdhf	plugin::users-permissions.auth.changePassword	2026-02-16 11:40:43.224	2026-02-16 11:40:43.224	2026-02-16 11:40:43.229	\N	\N	\N
68	t3hg7vpe0kjyihk2i29e2id1	plugin::users-permissions.auth.logout	2026-02-16 11:40:43.224	2026-02-16 11:40:43.224	2026-02-16 11:40:43.229	\N	\N	\N
69	oz4acfjxuu266jursf31vv58	plugin::users-permissions.user.find	2026-02-16 11:40:43.224	2026-02-16 11:40:43.224	2026-02-16 11:40:43.229	\N	\N	\N
70	d92cadz1pr0ee0e3m1wtuw2g	plugin::users-permissions.user.findOne	2026-02-16 11:40:43.224	2026-02-16 11:40:43.224	2026-02-16 11:40:43.229	\N	\N	\N
71	aoo06imsi9jvjqg1vry1l8k6	api::portal.portal.createNews	2026-02-16 12:00:36.469	2026-02-16 12:00:36.469	2026-02-16 12:00:36.472	\N	\N	\N
72	n79secaae253sxnul0yz00n8	api::portal.portal.updateNews	2026-02-16 12:00:36.469	2026-02-16 12:00:36.469	2026-02-16 12:00:36.473	\N	\N	\N
73	h05soh1adkt48gk05fvhw5xd	api::portal.portal.submitNews	2026-02-16 12:00:36.469	2026-02-16 12:00:36.469	2026-02-16 12:00:36.474	\N	\N	\N
74	xf4rxhj52kapb5upjcsnwkqk	api::portal.portal.createMaterial	2026-02-16 12:00:36.469	2026-02-16 12:00:36.469	2026-02-16 12:00:36.477	\N	\N	\N
75	sa96631dyrgopvr9sec34xt7	api::portal.portal.updateMaterial	2026-02-16 12:00:36.469	2026-02-16 12:00:36.469	2026-02-16 12:00:36.478	\N	\N	\N
76	d350flftuvviar19brp568mz	api::portal.portal.submitMaterial	2026-02-16 12:00:36.469	2026-02-16 12:00:36.469	2026-02-16 12:00:36.479	\N	\N	\N
77	eyg5uf4xo5mj6qwk1cfusi1o	api::portal.portal.createSchedule	2026-02-16 12:00:36.469	2026-02-16 12:00:36.469	2026-02-16 12:00:36.48	\N	\N	\N
78	vbgs25ho6l7298xiay59takd	api::portal.portal.updateSchedule	2026-02-16 12:00:36.469	2026-02-16 12:00:36.469	2026-02-16 12:00:36.481	\N	\N	\N
79	qvkfl9hny13u45gqsfjz1vrn	api::portal.portal.submitSchedule	2026-02-16 12:00:36.469	2026-02-16 12:00:36.469	2026-02-16 12:00:36.482	\N	\N	\N
80	ohi6t6xhen9l4ficz3a1o4de	api::portal.portal.my	2026-02-16 12:00:36.469	2026-02-16 12:00:36.469	2026-02-16 12:00:36.483	\N	\N	\N
81	q6y9k2guqux3xhji9sgafgvb	plugin::users-permissions.auth.callback	2026-02-16 12:00:36.469	2026-02-16 12:00:36.469	2026-02-16 12:00:36.484	\N	\N	\N
82	wo6um2jcgz4rw7z19494gjy7	plugin::users-permissions.auth.changePassword	2026-02-16 12:00:36.469	2026-02-16 12:00:36.469	2026-02-16 12:00:36.488	\N	\N	\N
83	k7t4vurrvfjz09ziy5h0ta5v	plugin::users-permissions.auth.resetPassword	2026-02-16 12:00:36.469	2026-02-16 12:00:36.469	2026-02-16 12:00:36.489	\N	\N	\N
84	wgfz3vuce5m11a9qbe0slmhb	plugin::users-permissions.auth.refresh	2026-02-16 12:00:36.469	2026-02-16 12:00:36.469	2026-02-16 12:00:36.489	\N	\N	\N
85	d51ws7vhhtrfu2jcv2tc51vf	plugin::users-permissions.auth.logout	2026-02-16 12:00:36.469	2026-02-16 12:00:36.469	2026-02-16 12:00:36.49	\N	\N	\N
86	ujhjoe5tqx3hk5q3djygivto	plugin::users-permissions.auth.connect	2026-02-16 12:00:36.469	2026-02-16 12:00:36.469	2026-02-16 12:00:36.491	\N	\N	\N
87	yn952irz8w9yr7urireqi2s4	plugin::users-permissions.auth.forgotPassword	2026-02-16 12:00:36.469	2026-02-16 12:00:36.469	2026-02-16 12:00:36.491	\N	\N	\N
88	o76cp7ripnjjs0tbb6uh1wdp	plugin::users-permissions.auth.register	2026-02-16 12:00:36.469	2026-02-16 12:00:36.469	2026-02-16 12:00:36.491	\N	\N	\N
89	i7bpzydimfu94jxs61jplcsq	plugin::users-permissions.auth.emailConfirmation	2026-02-16 12:00:36.469	2026-02-16 12:00:36.469	2026-02-16 12:00:36.491	\N	\N	\N
90	qjpq1qa04u558jx6ldasekvk	plugin::users-permissions.auth.sendEmailConfirmation	2026-02-16 12:00:36.469	2026-02-16 12:00:36.469	2026-02-16 12:00:36.491	\N	\N	\N
91	wie3fm2nd1r6zdijzlpgvphh	plugin::users-permissions.permissions.getPermissions	2026-02-16 12:00:36.47	2026-02-16 12:00:36.47	2026-02-16 12:00:36.491	\N	\N	\N
92	\N	api::portal.portal.getNews	\N	\N	\N	\N	\N	\N
93	\N	api::portal.portal.getMaterial	\N	\N	\N	\N	\N	\N
94	\N	api::portal.portal.getSchedule	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: up_permissions_role_lnk; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.up_permissions_role_lnk (id, permission_id, role_id, permission_ord) FROM stdin;
1	2	1	1
2	1	1	1
3	3	1	1
4	4	2	1
5	7	2	1
6	5	2	1
7	6	2	2
8	10	2	2
9	8	2	2
10	9	2	2
11	11	2	3
12	13	3	1
13	12	3	1
14	14	3	2
15	15	3	2
16	16	4	1
17	18	4	1
18	19	4	1
19	20	4	1
20	21	4	1
21	22	4	1
22	23	4	1
23	17	4	1
24	25	4	1
25	26	4	1
26	27	4	2
27	28	4	2
28	24	4	2
29	32	4	2
30	33	4	2
31	34	4	2
32	35	4	3
33	36	4	3
34	30	4	3
35	38	4	4
36	39	4	4
37	40	4	4
38	41	4	4
39	42	4	4
40	29	4	3
41	31	4	4
42	44	4	5
43	45	4	5
44	37	4	5
45	47	4	5
46	48	4	5
47	49	4	5
48	50	4	5
49	43	4	5
50	51	4	6
51	52	4	6
52	46	4	6
53	54	4	6
54	53	4	6
55	55	2	4
56	56	2	4
57	57	2	4
58	58	2	4
59	60	2	4
60	59	2	4
61	61	2	4
62	62	2	4
63	63	2	5
64	66	2	5
65	65	2	5
66	67	2	5
67	68	2	5
68	69	2	5
69	70	2	5
70	64	2	5
71	71	3	3
72	72	3	3
73	73	3	3
74	74	3	3
75	75	3	3
76	76	3	3
77	77	3	3
78	79	3	3
79	78	3	4
80	81	3	4
81	80	3	4
82	82	3	4
83	83	3	4
84	84	3	4
85	85	3	4
86	86	3	4
87	88	3	5
88	87	3	5
89	89	3	5
90	90	3	5
91	91	3	5
92	54	3	\N
93	21	2	\N
94	23	2	\N
95	92	3	\N
96	93	3	\N
97	94	3	\N
\.


--
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.up_roles (id, document_id, name, description, type, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	qr8ekmshq4zmofq5rkgdkxi0	Authenticated	Default role given to authenticated user.	authenticated	2026-02-12 15:07:51.387	2026-02-12 15:07:51.387	2026-02-12 15:07:51.387	\N	\N	\N
2	zxplgfll0nxue64k6lmohnks	Public	Default role given to unauthenticated user.	public	2026-02-12 15:07:51.391	2026-02-16 11:40:43.208	2026-02-12 15:07:51.391	\N	\N	\N
3	hvbrcj8ln1wugbzh90o9oogi	PortalUser	Роль для преподавателей/лаборантов	portaluser	2026-02-13 14:28:38.371	2026-02-16 12:00:36.447	2026-02-13 14:28:38.372	\N	\N	\N
4	iznyywfsdq2jd1u6jzpmcr4b	Moderator	Модератор	moderator	2026-02-13 14:30:07.096	2026-02-16 13:48:08.282	2026-02-13 14:30:07.097	\N	\N	\N
\.


--
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.up_users (id, document_id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
4	b48zsrq3rbf0xtg6bqm8g4ct	admin	threedots65@gmail.com	local	$2a$10$M.CFhtvYJvZjoAQtkEK5AeWnuNVHgfqA981mNpoLigtGn1zEjgBRK	\N	\N	f	f	2026-02-16 13:49:44.504	2026-02-16 13:49:44.504	2026-02-16 13:49:44.224	1	1	\N
\.


--
-- Data for Name: up_users_role_lnk; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.up_users_role_lnk (id, user_id, role_id, user_ord) FROM stdin;
4	4	3	1
\.


--
-- Data for Name: upload_folders; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.upload_folders (id, document_id, name, path_id, path, created_at, updated_at, published_at, created_by_id, updated_by_id, locale) FROM stdin;
1	xbtioqkh75kqjmmwtvtlvka1	API Uploads	1	/1	2026-02-16 12:05:43.897	2026-02-16 12:05:43.897	2026-02-16 12:05:43.897	\N	\N	\N
\.


--
-- Data for Name: upload_folders_parent_lnk; Type: TABLE DATA; Schema: public; Owner: law_site
--

COPY public.upload_folders_parent_lnk (id, folder_id, inv_folder_id, folder_ord) FROM stdin;
\.


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 163, true);


--
-- Name: admin_permissions_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.admin_permissions_role_lnk_id_seq', 223, true);


--
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);


--
-- Name: admin_users_roles_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.admin_users_roles_lnk_id_seq', 1, true);


--
-- Name: components_person_link_labels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.components_person_link_labels_id_seq', 2, true);


--
-- Name: components_person_publications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.components_person_publications_id_seq', 2, true);


--
-- Name: components_person_subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.components_person_subjects_id_seq', 2, true);


--
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.departments_id_seq', 4, true);


--
-- Name: files_folder_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.files_folder_lnk_id_seq', 2, true);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.files_id_seq', 5, true);


--
-- Name: files_related_mph_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.files_related_mph_id_seq', 11, true);


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 3, true);


--
-- Name: materials_author_user_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.materials_author_user_lnk_id_seq', 2, true);


--
-- Name: materials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.materials_id_seq', 2, true);


--
-- Name: news_author_user_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.news_author_user_lnk_id_seq', 15, true);


--
-- Name: news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.news_id_seq', 15, true);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.pages_id_seq', 1, false);


--
-- Name: persons_cmps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.persons_cmps_id_seq', 6, true);


--
-- Name: persons_departments_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.persons_departments_lnk_id_seq', 8, true);


--
-- Name: persons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.persons_id_seq', 5, true);


--
-- Name: schedules_author_user_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.schedules_author_user_lnk_id_seq', 1, false);


--
-- Name: schedules_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.schedules_id_seq', 1, false);


--
-- Name: strapi_ai_localization_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.strapi_ai_localization_jobs_id_seq', 1, false);


--
-- Name: strapi_ai_metadata_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.strapi_ai_metadata_jobs_id_seq', 1, false);


--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);


--
-- Name: strapi_api_token_permissions_token_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_lnk_id_seq', 1, false);


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 2, true);


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 38, true);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 4, true);


--
-- Name: strapi_history_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.strapi_history_versions_id_seq', 1, false);


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);


--
-- Name: strapi_migrations_internal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.strapi_migrations_internal_id_seq', 7, true);


--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.strapi_release_actions_id_seq', 1, false);


--
-- Name: strapi_release_actions_release_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.strapi_release_actions_release_lnk_id_seq', 1, false);


--
-- Name: strapi_releases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.strapi_releases_id_seq', 1, false);


--
-- Name: strapi_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.strapi_sessions_id_seq', 14, true);


--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_token_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_token_lnk_id_seq', 1, false);


--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.strapi_transfer_tokens_id_seq', 1, false);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, true);


--
-- Name: strapi_workflows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.strapi_workflows_id_seq', 1, false);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.strapi_workflows_stage_required_to_publish_lnk_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_permissions_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_permissions_lnk_id_seq', 1, false);


--
-- Name: strapi_workflows_stages_workflow_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.strapi_workflows_stages_workflow_lnk_id_seq', 1, false);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 94, true);


--
-- Name: up_permissions_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.up_permissions_role_lnk_id_seq', 98, true);


--
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 4, true);


--
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.up_users_id_seq', 4, true);


--
-- Name: up_users_role_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.up_users_role_lnk_id_seq', 4, true);


--
-- Name: upload_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.upload_folders_id_seq', 1, true);


--
-- Name: upload_folders_parent_lnk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: law_site
--

SELECT pg_catalog.setval('public.upload_folders_parent_lnk_id_seq', 1, false);


--
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_uq UNIQUE (permission_id, role_id);


--
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_uq UNIQUE (user_id, role_id);


--
-- Name: components_person_link_labels components_person_link_labels_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.components_person_link_labels
    ADD CONSTRAINT components_person_link_labels_pkey PRIMARY KEY (id);


--
-- Name: components_person_publications components_person_publications_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.components_person_publications
    ADD CONSTRAINT components_person_publications_pkey PRIMARY KEY (id);


--
-- Name: components_person_subjects components_person_subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.components_person_subjects
    ADD CONSTRAINT components_person_subjects_pkey PRIMARY KEY (id);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: files_folder_lnk files_folder_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_pkey PRIMARY KEY (id);


--
-- Name: files_folder_lnk files_folder_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_uq UNIQUE (file_id, folder_id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: files_related_mph files_related_mph_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.files_related_mph
    ADD CONSTRAINT files_related_mph_pkey PRIMARY KEY (id);


--
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- Name: materials_author_user_lnk materials_author_user_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.materials_author_user_lnk
    ADD CONSTRAINT materials_author_user_lnk_pkey PRIMARY KEY (id);


--
-- Name: materials_author_user_lnk materials_author_user_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.materials_author_user_lnk
    ADD CONSTRAINT materials_author_user_lnk_uq UNIQUE (material_id, user_id);


--
-- Name: materials materials_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_pkey PRIMARY KEY (id);


--
-- Name: news_author_user_lnk news_author_user_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.news_author_user_lnk
    ADD CONSTRAINT news_author_user_lnk_pkey PRIMARY KEY (id);


--
-- Name: news_author_user_lnk news_author_user_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.news_author_user_lnk
    ADD CONSTRAINT news_author_user_lnk_uq UNIQUE (news_item_id, user_id);


--
-- Name: news news_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: persons_cmps persons_cmps_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.persons_cmps
    ADD CONSTRAINT persons_cmps_pkey PRIMARY KEY (id);


--
-- Name: persons_departments_lnk persons_departments_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.persons_departments_lnk
    ADD CONSTRAINT persons_departments_lnk_pkey PRIMARY KEY (id);


--
-- Name: persons_departments_lnk persons_departments_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.persons_departments_lnk
    ADD CONSTRAINT persons_departments_lnk_uq UNIQUE (person_id, department_id);


--
-- Name: persons persons_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_pkey PRIMARY KEY (id);


--
-- Name: persons_cmps persons_uq; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.persons_cmps
    ADD CONSTRAINT persons_uq UNIQUE (entity_id, cmp_id, field, component_type);


--
-- Name: schedules_author_user_lnk schedules_author_user_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.schedules_author_user_lnk
    ADD CONSTRAINT schedules_author_user_lnk_pkey PRIMARY KEY (id);


--
-- Name: schedules_author_user_lnk schedules_author_user_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.schedules_author_user_lnk
    ADD CONSTRAINT schedules_author_user_lnk_uq UNIQUE (schedule_id, user_id);


--
-- Name: schedules schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_pkey PRIMARY KEY (id);


--
-- Name: strapi_ai_localization_jobs strapi_ai_localization_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_ai_localization_jobs
    ADD CONSTRAINT strapi_ai_localization_jobs_pkey PRIMARY KEY (id);


--
-- Name: strapi_ai_metadata_jobs strapi_ai_metadata_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_ai_metadata_jobs
    ADD CONSTRAINT strapi_ai_metadata_jobs_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_uq UNIQUE (api_token_permission_id, api_token_id);


--
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- Name: strapi_history_versions strapi_history_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_history_versions
    ADD CONSTRAINT strapi_history_versions_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations_internal strapi_migrations_internal_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_migrations_internal
    ADD CONSTRAINT strapi_migrations_internal_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions strapi_release_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_uq UNIQUE (release_action_id, release_id);


--
-- Name: strapi_releases strapi_releases_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_pkey PRIMARY KEY (id);


--
-- Name: strapi_sessions strapi_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_sessions
    ADD CONSTRAINT strapi_sessions_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_uq UNIQUE (transfer_token_permission_id, transfer_token_id);


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows strapi_workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_uq UNIQUE (workflow_id, workflow_stage_id);


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_uq UNIQUE (workflow_stage_id, permission_id);


--
-- Name: strapi_workflows_stages strapi_workflows_stages_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_pkey PRIMARY KEY (id);


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_uq UNIQUE (workflow_stage_id, workflow_id);


--
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_uq UNIQUE (permission_id, role_id);


--
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_lnk up_users_role_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_lnk up_users_role_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_uq UNIQUE (user_id, role_id);


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_pkey PRIMARY KEY (id);


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_uq; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_uq UNIQUE (folder_id, inv_folder_id);


--
-- Name: upload_folders upload_folders_path_id_index; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);


--
-- Name: upload_folders upload_folders_path_index; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);


--
-- Name: upload_folders upload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- Name: admin_permissions_documents_idx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX admin_permissions_documents_idx ON public.admin_permissions USING btree (document_id, locale, published_at);


--
-- Name: admin_permissions_role_lnk_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX admin_permissions_role_lnk_fk ON public.admin_permissions_role_lnk USING btree (permission_id);


--
-- Name: admin_permissions_role_lnk_ifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX admin_permissions_role_lnk_ifk ON public.admin_permissions_role_lnk USING btree (role_id);


--
-- Name: admin_permissions_role_lnk_oifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX admin_permissions_role_lnk_oifk ON public.admin_permissions_role_lnk USING btree (permission_ord);


--
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- Name: admin_roles_documents_idx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX admin_roles_documents_idx ON public.admin_roles USING btree (document_id, locale, published_at);


--
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- Name: admin_users_documents_idx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX admin_users_documents_idx ON public.admin_users USING btree (document_id, locale, published_at);


--
-- Name: admin_users_roles_lnk_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX admin_users_roles_lnk_fk ON public.admin_users_roles_lnk USING btree (user_id);


--
-- Name: admin_users_roles_lnk_ifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX admin_users_roles_lnk_ifk ON public.admin_users_roles_lnk USING btree (role_id);


--
-- Name: admin_users_roles_lnk_ofk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX admin_users_roles_lnk_ofk ON public.admin_users_roles_lnk USING btree (role_ord);


--
-- Name: admin_users_roles_lnk_oifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX admin_users_roles_lnk_oifk ON public.admin_users_roles_lnk USING btree (user_ord);


--
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- Name: departments_created_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX departments_created_by_id_fk ON public.departments USING btree (created_by_id);


--
-- Name: departments_documents_idx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX departments_documents_idx ON public.departments USING btree (document_id, locale, published_at);


--
-- Name: departments_updated_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX departments_updated_by_id_fk ON public.departments USING btree (updated_by_id);


--
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- Name: files_documents_idx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX files_documents_idx ON public.files USING btree (document_id, locale, published_at);


--
-- Name: files_folder_lnk_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX files_folder_lnk_fk ON public.files_folder_lnk USING btree (file_id);


--
-- Name: files_folder_lnk_ifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX files_folder_lnk_ifk ON public.files_folder_lnk USING btree (folder_id);


--
-- Name: files_folder_lnk_oifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX files_folder_lnk_oifk ON public.files_folder_lnk USING btree (file_ord);


--
-- Name: files_related_mph_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX files_related_mph_fk ON public.files_related_mph USING btree (file_id);


--
-- Name: files_related_mph_idix; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX files_related_mph_idix ON public.files_related_mph USING btree (related_id);


--
-- Name: files_related_mph_oidx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX files_related_mph_oidx ON public.files_related_mph USING btree ("order");


--
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- Name: i18n_locale_documents_idx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX i18n_locale_documents_idx ON public.i18n_locale USING btree (document_id, locale, published_at);


--
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- Name: materials_author_user_lnk_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX materials_author_user_lnk_fk ON public.materials_author_user_lnk USING btree (material_id);


--
-- Name: materials_author_user_lnk_ifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX materials_author_user_lnk_ifk ON public.materials_author_user_lnk USING btree (user_id);


--
-- Name: materials_created_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX materials_created_by_id_fk ON public.materials USING btree (created_by_id);


--
-- Name: materials_documents_idx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX materials_documents_idx ON public.materials USING btree (document_id, locale, published_at);


--
-- Name: materials_updated_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX materials_updated_by_id_fk ON public.materials USING btree (updated_by_id);


--
-- Name: news_author_user_lnk_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX news_author_user_lnk_fk ON public.news_author_user_lnk USING btree (news_item_id);


--
-- Name: news_author_user_lnk_ifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX news_author_user_lnk_ifk ON public.news_author_user_lnk USING btree (user_id);


--
-- Name: news_created_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX news_created_by_id_fk ON public.news USING btree (created_by_id);


--
-- Name: news_documents_idx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX news_documents_idx ON public.news USING btree (document_id, locale, published_at);


--
-- Name: news_updated_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX news_updated_by_id_fk ON public.news USING btree (updated_by_id);


--
-- Name: pages_created_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX pages_created_by_id_fk ON public.pages USING btree (created_by_id);


--
-- Name: pages_documents_idx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX pages_documents_idx ON public.pages USING btree (document_id, locale, published_at);


--
-- Name: pages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX pages_updated_by_id_fk ON public.pages USING btree (updated_by_id);


--
-- Name: persons_component_type_idx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX persons_component_type_idx ON public.persons_cmps USING btree (component_type);


--
-- Name: persons_created_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX persons_created_by_id_fk ON public.persons USING btree (created_by_id);


--
-- Name: persons_departments_lnk_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX persons_departments_lnk_fk ON public.persons_departments_lnk USING btree (person_id);


--
-- Name: persons_departments_lnk_ifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX persons_departments_lnk_ifk ON public.persons_departments_lnk USING btree (department_id);


--
-- Name: persons_departments_lnk_ofk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX persons_departments_lnk_ofk ON public.persons_departments_lnk USING btree (department_ord);


--
-- Name: persons_departments_lnk_oifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX persons_departments_lnk_oifk ON public.persons_departments_lnk USING btree (person_ord);


--
-- Name: persons_documents_idx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX persons_documents_idx ON public.persons USING btree (document_id, locale, published_at);


--
-- Name: persons_entity_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX persons_entity_fk ON public.persons_cmps USING btree (entity_id);


--
-- Name: persons_field_idx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX persons_field_idx ON public.persons_cmps USING btree (field);


--
-- Name: persons_updated_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX persons_updated_by_id_fk ON public.persons USING btree (updated_by_id);


--
-- Name: schedules_author_user_lnk_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX schedules_author_user_lnk_fk ON public.schedules_author_user_lnk USING btree (schedule_id);


--
-- Name: schedules_author_user_lnk_ifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX schedules_author_user_lnk_ifk ON public.schedules_author_user_lnk USING btree (user_id);


--
-- Name: schedules_created_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX schedules_created_by_id_fk ON public.schedules USING btree (created_by_id);


--
-- Name: schedules_documents_idx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX schedules_documents_idx ON public.schedules USING btree (document_id, locale, published_at);


--
-- Name: schedules_updated_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX schedules_updated_by_id_fk ON public.schedules USING btree (updated_by_id);


--
-- Name: strapi_api_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);


--
-- Name: strapi_api_token_permissions_documents_idx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_api_token_permissions_documents_idx ON public.strapi_api_token_permissions USING btree (document_id, locale, published_at);


--
-- Name: strapi_api_token_permissions_token_lnk_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_api_token_permissions_token_lnk_fk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_id);


--
-- Name: strapi_api_token_permissions_token_lnk_ifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_api_token_permissions_token_lnk_ifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_id);


--
-- Name: strapi_api_token_permissions_token_lnk_oifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_api_token_permissions_token_lnk_oifk ON public.strapi_api_token_permissions_token_lnk USING btree (api_token_permission_ord);


--
-- Name: strapi_api_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- Name: strapi_api_tokens_documents_idx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_api_tokens_documents_idx ON public.strapi_api_tokens USING btree (document_id, locale, published_at);


--
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- Name: strapi_history_versions_created_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_history_versions_created_by_id_fk ON public.strapi_history_versions USING btree (created_by_id);


--
-- Name: strapi_release_actions_created_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_release_actions_created_by_id_fk ON public.strapi_release_actions USING btree (created_by_id);


--
-- Name: strapi_release_actions_documents_idx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_release_actions_documents_idx ON public.strapi_release_actions USING btree (document_id, locale, published_at);


--
-- Name: strapi_release_actions_release_lnk_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_release_actions_release_lnk_fk ON public.strapi_release_actions_release_lnk USING btree (release_action_id);


--
-- Name: strapi_release_actions_release_lnk_ifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_release_actions_release_lnk_ifk ON public.strapi_release_actions_release_lnk USING btree (release_id);


--
-- Name: strapi_release_actions_release_lnk_oifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_release_actions_release_lnk_oifk ON public.strapi_release_actions_release_lnk USING btree (release_action_ord);


--
-- Name: strapi_release_actions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_release_actions_updated_by_id_fk ON public.strapi_release_actions USING btree (updated_by_id);


--
-- Name: strapi_releases_created_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_releases_created_by_id_fk ON public.strapi_releases USING btree (created_by_id);


--
-- Name: strapi_releases_documents_idx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_releases_documents_idx ON public.strapi_releases USING btree (document_id, locale, published_at);


--
-- Name: strapi_releases_updated_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_releases_updated_by_id_fk ON public.strapi_releases USING btree (updated_by_id);


--
-- Name: strapi_sessions_created_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_sessions_created_by_id_fk ON public.strapi_sessions USING btree (created_by_id);


--
-- Name: strapi_sessions_documents_idx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_sessions_documents_idx ON public.strapi_sessions USING btree (document_id, locale, published_at);


--
-- Name: strapi_sessions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_sessions_updated_by_id_fk ON public.strapi_sessions USING btree (updated_by_id);


--
-- Name: strapi_transfer_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_transfer_token_permissions_created_by_id_fk ON public.strapi_transfer_token_permissions USING btree (created_by_id);


--
-- Name: strapi_transfer_token_permissions_documents_idx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_transfer_token_permissions_documents_idx ON public.strapi_transfer_token_permissions USING btree (document_id, locale, published_at);


--
-- Name: strapi_transfer_token_permissions_token_lnk_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_fk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_id);


--
-- Name: strapi_transfer_token_permissions_token_lnk_ifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_ifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_id);


--
-- Name: strapi_transfer_token_permissions_token_lnk_oifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_transfer_token_permissions_token_lnk_oifk ON public.strapi_transfer_token_permissions_token_lnk USING btree (transfer_token_permission_ord);


--
-- Name: strapi_transfer_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_transfer_token_permissions_updated_by_id_fk ON public.strapi_transfer_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_transfer_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_transfer_tokens_created_by_id_fk ON public.strapi_transfer_tokens USING btree (created_by_id);


--
-- Name: strapi_transfer_tokens_documents_idx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_transfer_tokens_documents_idx ON public.strapi_transfer_tokens USING btree (document_id, locale, published_at);


--
-- Name: strapi_transfer_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_transfer_tokens_updated_by_id_fk ON public.strapi_transfer_tokens USING btree (updated_by_id);


--
-- Name: strapi_workflows_created_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_workflows_created_by_id_fk ON public.strapi_workflows USING btree (created_by_id);


--
-- Name: strapi_workflows_documents_idx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_workflows_documents_idx ON public.strapi_workflows USING btree (document_id, locale, published_at);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_workflows_stage_required_to_publish_lnk_fk ON public.strapi_workflows_stage_required_to_publish_lnk USING btree (workflow_id);


--
-- Name: strapi_workflows_stage_required_to_publish_lnk_ifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_workflows_stage_required_to_publish_lnk_ifk ON public.strapi_workflows_stage_required_to_publish_lnk USING btree (workflow_stage_id);


--
-- Name: strapi_workflows_stages_created_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_workflows_stages_created_by_id_fk ON public.strapi_workflows_stages USING btree (created_by_id);


--
-- Name: strapi_workflows_stages_documents_idx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_workflows_stages_documents_idx ON public.strapi_workflows_stages USING btree (document_id, locale, published_at);


--
-- Name: strapi_workflows_stages_permissions_lnk_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_fk ON public.strapi_workflows_stages_permissions_lnk USING btree (workflow_stage_id);


--
-- Name: strapi_workflows_stages_permissions_lnk_ifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_ifk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_id);


--
-- Name: strapi_workflows_stages_permissions_lnk_ofk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_workflows_stages_permissions_lnk_ofk ON public.strapi_workflows_stages_permissions_lnk USING btree (permission_ord);


--
-- Name: strapi_workflows_stages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_workflows_stages_updated_by_id_fk ON public.strapi_workflows_stages USING btree (updated_by_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_fk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_ifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_ifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_id);


--
-- Name: strapi_workflows_stages_workflow_lnk_oifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_workflows_stages_workflow_lnk_oifk ON public.strapi_workflows_stages_workflow_lnk USING btree (workflow_stage_ord);


--
-- Name: strapi_workflows_updated_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX strapi_workflows_updated_by_id_fk ON public.strapi_workflows USING btree (updated_by_id);


--
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- Name: up_permissions_documents_idx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX up_permissions_documents_idx ON public.up_permissions USING btree (document_id, locale, published_at);


--
-- Name: up_permissions_role_lnk_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX up_permissions_role_lnk_fk ON public.up_permissions_role_lnk USING btree (permission_id);


--
-- Name: up_permissions_role_lnk_ifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX up_permissions_role_lnk_ifk ON public.up_permissions_role_lnk USING btree (role_id);


--
-- Name: up_permissions_role_lnk_oifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX up_permissions_role_lnk_oifk ON public.up_permissions_role_lnk USING btree (permission_ord);


--
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- Name: up_roles_documents_idx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX up_roles_documents_idx ON public.up_roles USING btree (document_id, locale, published_at);


--
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- Name: up_users_documents_idx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX up_users_documents_idx ON public.up_users USING btree (document_id, locale, published_at);


--
-- Name: up_users_role_lnk_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX up_users_role_lnk_fk ON public.up_users_role_lnk USING btree (user_id);


--
-- Name: up_users_role_lnk_ifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX up_users_role_lnk_ifk ON public.up_users_role_lnk USING btree (role_id);


--
-- Name: up_users_role_lnk_oifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX up_users_role_lnk_oifk ON public.up_users_role_lnk USING btree (user_ord);


--
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- Name: upload_files_created_at_index; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);


--
-- Name: upload_files_ext_index; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);


--
-- Name: upload_files_folder_path_index; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);


--
-- Name: upload_files_name_index; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX upload_files_name_index ON public.files USING btree (name);


--
-- Name: upload_files_size_index; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX upload_files_size_index ON public.files USING btree (size);


--
-- Name: upload_files_updated_at_index; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);


--
-- Name: upload_folders_created_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);


--
-- Name: upload_folders_documents_idx; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX upload_folders_documents_idx ON public.upload_folders USING btree (document_id, locale, published_at);


--
-- Name: upload_folders_parent_lnk_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX upload_folders_parent_lnk_fk ON public.upload_folders_parent_lnk USING btree (folder_id);


--
-- Name: upload_folders_parent_lnk_ifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX upload_folders_parent_lnk_ifk ON public.upload_folders_parent_lnk USING btree (inv_folder_id);


--
-- Name: upload_folders_parent_lnk_oifk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX upload_folders_parent_lnk_oifk ON public.upload_folders_parent_lnk USING btree (folder_ord);


--
-- Name: upload_folders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: law_site
--

CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);


--
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: admin_permissions_role_lnk admin_permissions_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.admin_permissions_role_lnk
    ADD CONSTRAINT admin_permissions_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- Name: admin_users_roles_lnk admin_users_roles_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.admin_users_roles_lnk
    ADD CONSTRAINT admin_users_roles_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: departments departments_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: departments departments_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files_folder_lnk files_folder_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files_folder_lnk files_folder_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.files_folder_lnk
    ADD CONSTRAINT files_folder_lnk_ifk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: files_related_mph files_related_mph_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.files_related_mph
    ADD CONSTRAINT files_related_mph_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: materials_author_user_lnk materials_author_user_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.materials_author_user_lnk
    ADD CONSTRAINT materials_author_user_lnk_fk FOREIGN KEY (material_id) REFERENCES public.materials(id) ON DELETE CASCADE;


--
-- Name: materials_author_user_lnk materials_author_user_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.materials_author_user_lnk
    ADD CONSTRAINT materials_author_user_lnk_ifk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: materials materials_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: materials materials_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: news_author_user_lnk news_author_user_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.news_author_user_lnk
    ADD CONSTRAINT news_author_user_lnk_fk FOREIGN KEY (news_item_id) REFERENCES public.news(id) ON DELETE CASCADE;


--
-- Name: news_author_user_lnk news_author_user_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.news_author_user_lnk
    ADD CONSTRAINT news_author_user_lnk_ifk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: news news_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: news news_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: pages pages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: pages pages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: persons persons_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: persons_departments_lnk persons_departments_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.persons_departments_lnk
    ADD CONSTRAINT persons_departments_lnk_fk FOREIGN KEY (person_id) REFERENCES public.persons(id) ON DELETE CASCADE;


--
-- Name: persons_departments_lnk persons_departments_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.persons_departments_lnk
    ADD CONSTRAINT persons_departments_lnk_ifk FOREIGN KEY (department_id) REFERENCES public.departments(id) ON DELETE CASCADE;


--
-- Name: persons_cmps persons_entity_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.persons_cmps
    ADD CONSTRAINT persons_entity_fk FOREIGN KEY (entity_id) REFERENCES public.persons(id) ON DELETE CASCADE;


--
-- Name: persons persons_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: schedules_author_user_lnk schedules_author_user_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.schedules_author_user_lnk
    ADD CONSTRAINT schedules_author_user_lnk_fk FOREIGN KEY (schedule_id) REFERENCES public.schedules(id) ON DELETE CASCADE;


--
-- Name: schedules_author_user_lnk schedules_author_user_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.schedules_author_user_lnk
    ADD CONSTRAINT schedules_author_user_lnk_ifk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: schedules schedules_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: schedules schedules_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions_token_lnk strapi_api_token_permissions_token_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_lnk
    ADD CONSTRAINT strapi_api_token_permissions_token_lnk_ifk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_history_versions strapi_history_versions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_history_versions
    ADD CONSTRAINT strapi_history_versions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_release_actions strapi_release_actions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_fk FOREIGN KEY (release_action_id) REFERENCES public.strapi_release_actions(id) ON DELETE CASCADE;


--
-- Name: strapi_release_actions_release_lnk strapi_release_actions_release_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_release_actions_release_lnk
    ADD CONSTRAINT strapi_release_actions_release_lnk_ifk FOREIGN KEY (release_id) REFERENCES public.strapi_releases(id) ON DELETE CASCADE;


--
-- Name: strapi_release_actions strapi_release_actions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_releases strapi_releases_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_releases strapi_releases_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_sessions strapi_sessions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_sessions
    ADD CONSTRAINT strapi_sessions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_sessions strapi_sessions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_sessions
    ADD CONSTRAINT strapi_sessions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_fk FOREIGN KEY (transfer_token_permission_id) REFERENCES public.strapi_transfer_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions_token_lnk strapi_transfer_token_permissions_token_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_lnk
    ADD CONSTRAINT strapi_transfer_token_permissions_token_lnk_ifk FOREIGN KEY (transfer_token_id) REFERENCES public.strapi_transfer_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows strapi_workflows_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_fk FOREIGN KEY (workflow_id) REFERENCES public.strapi_workflows(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stage_required_to_publish_lnk strapi_workflows_stage_required_to_publish_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_workflows_stage_required_to_publish_lnk
    ADD CONSTRAINT strapi_workflows_stage_required_to_publish_lnk_ifk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages strapi_workflows_stages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_fk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages_permissions_lnk strapi_workflows_stages_permissions_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_workflows_stages_permissions_lnk
    ADD CONSTRAINT strapi_workflows_stages_permissions_lnk_ifk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages strapi_workflows_stages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_workflows_stages
    ADD CONSTRAINT strapi_workflows_stages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_fk FOREIGN KEY (workflow_stage_id) REFERENCES public.strapi_workflows_stages(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows_stages_workflow_lnk strapi_workflows_stages_workflow_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_workflows_stages_workflow_lnk
    ADD CONSTRAINT strapi_workflows_stages_workflow_lnk_ifk FOREIGN KEY (workflow_id) REFERENCES public.strapi_workflows(id) ON DELETE CASCADE;


--
-- Name: strapi_workflows strapi_workflows_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.strapi_workflows
    ADD CONSTRAINT strapi_workflows_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- Name: up_permissions_role_lnk up_permissions_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.up_permissions_role_lnk
    ADD CONSTRAINT up_permissions_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users_role_lnk up_users_role_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: up_users_role_lnk up_users_role_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.up_users_role_lnk
    ADD CONSTRAINT up_users_role_lnk_ifk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders upload_folders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders_parent_lnk upload_folders_parent_lnk_ifk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.upload_folders_parent_lnk
    ADD CONSTRAINT upload_folders_parent_lnk_ifk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders upload_folders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: law_site
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict 1b6RUXIzILMKkLjOwTR9AIBvJuIIZXCchvLDM9fpaFJ2gkgZntGBddyictncsAZ

