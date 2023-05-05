--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE api_server;
ALTER ROLE api_server WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:4B43YnbkOhbw+DOSVHiwpw==$icelfjzhIGem9LoJPJCNmK5Kn7bGIHzcmjbLEEn2dGQ=:9swtkX0N8Ap2Ww/sygdCgjE0QstLHT+ZK1kv3GdfcWM=';
CREATE ROLE keycloak;
ALTER ROLE keycloak WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:5cUcYcpc/3CKB2RE0Arj5w==$062Gt1LymIY3nu04tJzow/Ih299Mgj4kEkTvtqCowi4=:7S0PGnzxAHQdjPeD/vK0ZpT8lhPO7qy9Lg6fFZ8bT+0=';
CREATE ROLE khoa;
ALTER ROLE khoa WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:+RhI8R3kixK9vt22tNIyBQ==$RrexC0Hqg7oXmvvBQuTZpHPaeEyfzYmKubv5ByKi93M=:XyNDFgZhmhYgI0T5zpKDcvnORv79PWYtCpQhT8hlc0c=';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:QT65GjTjIh1hGf2H6g3+LQ==$IDjhj19W4V0ZwpvLrI6OcAd/+GrCOk4pQlnE9EtQOqo=:0E3itYYRcIgXNhPy+J/F2Hdh6StDHOWxqECs6ZB6wuo=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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

--
-- PostgreSQL database dump complete
--

--
-- Database "cs_block1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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

--
-- Name: cs_block1; Type: DATABASE; Schema: -; Owner: khoa
--

CREATE DATABASE cs_block1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE cs_block1 OWNER TO khoa;

\connect cs_block1

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
-- Name: table2; Type: TABLE; Schema: public; Owner: khoa
--

CREATE TABLE public.table2 (
    id integer NOT NULL,
    col1 integer
);


ALTER TABLE public.table2 OWNER TO khoa;

--
-- Name: COLUMN table2.id; Type: COMMENT; Schema: public; Owner: khoa
--

COMMENT ON COLUMN public.table2.id IS 'Id';


--
-- Name: COLUMN table2.col1; Type: COMMENT; Schema: public; Owner: khoa
--

COMMENT ON COLUMN public.table2.col1 IS 'des';


--
-- Name: table2_id_seq; Type: SEQUENCE; Schema: public; Owner: khoa
--

CREATE SEQUENCE public.table2_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table2_id_seq OWNER TO khoa;

--
-- Name: table2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: khoa
--

ALTER SEQUENCE public.table2_id_seq OWNED BY public.table2.id;


--
-- Name: table2 id; Type: DEFAULT; Schema: public; Owner: khoa
--

ALTER TABLE ONLY public.table2 ALTER COLUMN id SET DEFAULT nextval('public.table2_id_seq'::regclass);


--
-- Data for Name: table2; Type: TABLE DATA; Schema: public; Owner: khoa
--

COPY public.table2 (id, col1) FROM stdin;
\.


--
-- Name: table2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: khoa
--

SELECT pg_catalog.setval('public.table2_id_seq', 1, false);


--
-- Name: table2 table2_pkey; Type: CONSTRAINT; Schema: public; Owner: khoa
--

ALTER TABLE ONLY public.table2
    ADD CONSTRAINT table2_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- Database "cs_block2" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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

--
-- Name: cs_block2; Type: DATABASE; Schema: -; Owner: khoa
--

CREATE DATABASE cs_block2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE cs_block2 OWNER TO khoa;

\connect cs_block2

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
-- Name: table1; Type: TABLE; Schema: public; Owner: khoa
--

CREATE TABLE public.table1 (
    id integer NOT NULL,
    col1 integer
);


ALTER TABLE public.table1 OWNER TO khoa;

--
-- Name: COLUMN table1.id; Type: COMMENT; Schema: public; Owner: khoa
--

COMMENT ON COLUMN public.table1.id IS 'Id';


--
-- Name: COLUMN table1.col1; Type: COMMENT; Schema: public; Owner: khoa
--

COMMENT ON COLUMN public.table1.col1 IS 'des1';


--
-- Name: table1_id_seq; Type: SEQUENCE; Schema: public; Owner: khoa
--

CREATE SEQUENCE public.table1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table1_id_seq OWNER TO khoa;

--
-- Name: table1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: khoa
--

ALTER SEQUENCE public.table1_id_seq OWNED BY public.table1.id;


--
-- Name: table2; Type: TABLE; Schema: public; Owner: khoa
--

CREATE TABLE public.table2 (
    id integer NOT NULL,
    col1 integer
);


ALTER TABLE public.table2 OWNER TO khoa;

--
-- Name: COLUMN table2.id; Type: COMMENT; Schema: public; Owner: khoa
--

COMMENT ON COLUMN public.table2.id IS 'Id';


--
-- Name: COLUMN table2.col1; Type: COMMENT; Schema: public; Owner: khoa
--

COMMENT ON COLUMN public.table2.col1 IS 'des1';


--
-- Name: table2_id_seq; Type: SEQUENCE; Schema: public; Owner: khoa
--

CREATE SEQUENCE public.table2_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table2_id_seq OWNER TO khoa;

--
-- Name: table2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: khoa
--

ALTER SEQUENCE public.table2_id_seq OWNED BY public.table2.id;


--
-- Name: table1 id; Type: DEFAULT; Schema: public; Owner: khoa
--

ALTER TABLE ONLY public.table1 ALTER COLUMN id SET DEFAULT nextval('public.table1_id_seq'::regclass);


--
-- Name: table2 id; Type: DEFAULT; Schema: public; Owner: khoa
--

ALTER TABLE ONLY public.table2 ALTER COLUMN id SET DEFAULT nextval('public.table2_id_seq'::regclass);


--
-- Data for Name: table1; Type: TABLE DATA; Schema: public; Owner: khoa
--

COPY public.table1 (id, col1) FROM stdin;
1	10
2	11
3	12
4	13
5	14
6	15
7	16
\.


--
-- Data for Name: table2; Type: TABLE DATA; Schema: public; Owner: khoa
--

COPY public.table2 (id, col1) FROM stdin;
1	10
2	11
3	12
4	13
5	14
6	15
7	16
8	17
9	18
10	19
11	100
12	110
13	120
14	130
15	140
16	150
17	160
18	170
19	180
20	190
\.


--
-- Name: table1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: khoa
--

SELECT pg_catalog.setval('public.table1_id_seq', 50, true);


--
-- Name: table2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: khoa
--

SELECT pg_catalog.setval('public.table2_id_seq', 10, true);


--
-- Name: table1 table1_pkey; Type: CONSTRAINT; Schema: public; Owner: khoa
--

ALTER TABLE ONLY public.table1
    ADD CONSTRAINT table1_pkey PRIMARY KEY (id);


--
-- Name: table2 table2_pkey; Type: CONSTRAINT; Schema: public; Owner: khoa
--

ALTER TABLE ONLY public.table2
    ADD CONSTRAINT table2_pkey PRIMARY KEY (id);


--
-- Name: table1 table1_col1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: khoa
--

ALTER TABLE ONLY public.table1
    ADD CONSTRAINT table1_col1_fkey FOREIGN KEY (col1) REFERENCES public.table2(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "hcmut_Block10" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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

--
-- Name: hcmut_Block10; Type: DATABASE; Schema: -; Owner: khoa
--

CREATE DATABASE "hcmut_Block10" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE "hcmut_Block10" OWNER TO khoa;

\connect "hcmut_Block10"

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

--
-- PostgreSQL database dump complete
--

--
-- Database "hcmut_Khoa" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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

--
-- Name: hcmut_Khoa; Type: DATABASE; Schema: -; Owner: khoa
--

CREATE DATABASE "hcmut_Khoa" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE "hcmut_Khoa" OWNER TO khoa;

\connect "hcmut_Khoa"

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

--
-- PostgreSQL database dump complete
--

--
-- Database "hcmut_Quan ly sinh vien nam 4" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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

--
-- Name: hcmut_Quan ly sinh vien nam 4; Type: DATABASE; Schema: -; Owner: khoa
--

CREATE DATABASE "hcmut_Quan ly sinh vien nam 4" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE "hcmut_Quan ly sinh vien nam 4" OWNER TO khoa;

\connect -reuse-previous=on "dbname='hcmut_Quan ly sinh vien nam 4'"

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

--
-- PostgreSQL database dump complete
--

--
-- Database "hcmut_block11" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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

--
-- Name: hcmut_block11; Type: DATABASE; Schema: -; Owner: khoa
--

CREATE DATABASE hcmut_block11 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE hcmut_block11 OWNER TO khoa;

\connect hcmut_block11

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

--
-- PostgreSQL database dump complete
--

--
-- Database "hcmut_block12" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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

--
-- Name: hcmut_block12; Type: DATABASE; Schema: -; Owner: khoa
--

CREATE DATABASE hcmut_block12 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE hcmut_block12 OWNER TO khoa;

\connect hcmut_block12

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

--
-- PostgreSQL database dump complete
--

--
-- Database "hcmut_block3" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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

--
-- Name: hcmut_block3; Type: DATABASE; Schema: -; Owner: khoa
--

CREATE DATABASE hcmut_block3 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE hcmut_block3 OWNER TO khoa;

\connect hcmut_block3

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
-- Name: table1; Type: TABLE; Schema: public; Owner: khoa
--

CREATE TABLE public.table1 (
    id integer NOT NULL,
    col1 integer
);


ALTER TABLE public.table1 OWNER TO khoa;

--
-- Name: COLUMN table1.id; Type: COMMENT; Schema: public; Owner: khoa
--

COMMENT ON COLUMN public.table1.id IS 'Id';


--
-- Name: COLUMN table1.col1; Type: COMMENT; Schema: public; Owner: khoa
--

COMMENT ON COLUMN public.table1.col1 IS 'des1';


--
-- Name: table1_id_seq; Type: SEQUENCE; Schema: public; Owner: khoa
--

CREATE SEQUENCE public.table1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table1_id_seq OWNER TO khoa;

--
-- Name: table1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: khoa
--

ALTER SEQUENCE public.table1_id_seq OWNED BY public.table1.id;


--
-- Name: table1 id; Type: DEFAULT; Schema: public; Owner: khoa
--

ALTER TABLE ONLY public.table1 ALTER COLUMN id SET DEFAULT nextval('public.table1_id_seq'::regclass);


--
-- Data for Name: table1; Type: TABLE DATA; Schema: public; Owner: khoa
--

COPY public.table1 (id, col1) FROM stdin;
\.


--
-- Name: table1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: khoa
--

SELECT pg_catalog.setval('public.table1_id_seq', 1, false);


--
-- Name: table1 table1_pkey; Type: CONSTRAINT; Schema: public; Owner: khoa
--

ALTER TABLE ONLY public.table1
    ADD CONSTRAINT table1_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- Database "hcmut_block4" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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

--
-- Name: hcmut_block4; Type: DATABASE; Schema: -; Owner: khoa
--

CREATE DATABASE hcmut_block4 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE hcmut_block4 OWNER TO khoa;

\connect hcmut_block4

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
-- Name: table3; Type: TABLE; Schema: public; Owner: khoa
--

CREATE TABLE public.table3 (
    id integer NOT NULL,
    col1 text,
    col2 character varying(255)
);


ALTER TABLE public.table3 OWNER TO khoa;

--
-- Name: COLUMN table3.id; Type: COMMENT; Schema: public; Owner: khoa
--

COMMENT ON COLUMN public.table3.id IS 'Id';


--
-- Name: table3_id_seq; Type: SEQUENCE; Schema: public; Owner: khoa
--

CREATE SEQUENCE public.table3_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table3_id_seq OWNER TO khoa;

--
-- Name: table3_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: khoa
--

ALTER SEQUENCE public.table3_id_seq OWNED BY public.table3.id;


--
-- Name: table4; Type: TABLE; Schema: public; Owner: khoa
--

CREATE TABLE public.table4 (
    id integer NOT NULL,
    col2 text
);


ALTER TABLE public.table4 OWNER TO khoa;

--
-- Name: COLUMN table4.id; Type: COMMENT; Schema: public; Owner: khoa
--

COMMENT ON COLUMN public.table4.id IS 'Id';


--
-- Name: table4_id_seq; Type: SEQUENCE; Schema: public; Owner: khoa
--

CREATE SEQUENCE public.table4_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table4_id_seq OWNER TO khoa;

--
-- Name: table4_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: khoa
--

ALTER SEQUENCE public.table4_id_seq OWNED BY public.table4.id;


--
-- Name: table6; Type: TABLE; Schema: public; Owner: khoa
--

CREATE TABLE public.table6 (
    id integer NOT NULL,
    col1 text,
    col2 integer NOT NULL
);


ALTER TABLE public.table6 OWNER TO khoa;

--
-- Name: COLUMN table6.id; Type: COMMENT; Schema: public; Owner: khoa
--

COMMENT ON COLUMN public.table6.id IS 'Id';


--
-- Name: COLUMN table6.col1; Type: COMMENT; Schema: public; Owner: khoa
--

COMMENT ON COLUMN public.table6.col1 IS 'asd';


--
-- Name: COLUMN table6.col2; Type: COMMENT; Schema: public; Owner: khoa
--

COMMENT ON COLUMN public.table6.col2 IS '12213';


--
-- Name: table6_col2_seq; Type: SEQUENCE; Schema: public; Owner: khoa
--

CREATE SEQUENCE public.table6_col2_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table6_col2_seq OWNER TO khoa;

--
-- Name: table6_col2_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: khoa
--

ALTER SEQUENCE public.table6_col2_seq OWNED BY public.table6.col2;


--
-- Name: table6_id_seq; Type: SEQUENCE; Schema: public; Owner: khoa
--

CREATE SEQUENCE public.table6_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table6_id_seq OWNER TO khoa;

--
-- Name: table6_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: khoa
--

ALTER SEQUENCE public.table6_id_seq OWNED BY public.table6.id;


--
-- Name: table3 id; Type: DEFAULT; Schema: public; Owner: khoa
--

ALTER TABLE ONLY public.table3 ALTER COLUMN id SET DEFAULT nextval('public.table3_id_seq'::regclass);


--
-- Name: table4 id; Type: DEFAULT; Schema: public; Owner: khoa
--

ALTER TABLE ONLY public.table4 ALTER COLUMN id SET DEFAULT nextval('public.table4_id_seq'::regclass);


--
-- Name: table6 id; Type: DEFAULT; Schema: public; Owner: khoa
--

ALTER TABLE ONLY public.table6 ALTER COLUMN id SET DEFAULT nextval('public.table6_id_seq'::regclass);


--
-- Name: table6 col2; Type: DEFAULT; Schema: public; Owner: khoa
--

ALTER TABLE ONLY public.table6 ALTER COLUMN col2 SET DEFAULT nextval('public.table6_col2_seq'::regclass);


--
-- Data for Name: table3; Type: TABLE DATA; Schema: public; Owner: khoa
--

COPY public.table3 (id, col1, col2) FROM stdin;
1	val2	val3
3	def3	def4
6	23	12
7	12	12
8	13	13
9	23	23
10	22	22
11	qttt	123
\.


--
-- Data for Name: table4; Type: TABLE DATA; Schema: public; Owner: khoa
--

COPY public.table4 (id, col2) FROM stdin;
1	23
3	89
\.


--
-- Data for Name: table6; Type: TABLE DATA; Schema: public; Owner: khoa
--

COPY public.table6 (id, col1, col2) FROM stdin;
1	85	85
\.


--
-- Name: table3_id_seq; Type: SEQUENCE SET; Schema: public; Owner: khoa
--

SELECT pg_catalog.setval('public.table3_id_seq', 1, false);


--
-- Name: table4_id_seq; Type: SEQUENCE SET; Schema: public; Owner: khoa
--

SELECT pg_catalog.setval('public.table4_id_seq', 1, false);


--
-- Name: table6_col2_seq; Type: SEQUENCE SET; Schema: public; Owner: khoa
--

SELECT pg_catalog.setval('public.table6_col2_seq', 1, false);


--
-- Name: table6_id_seq; Type: SEQUENCE SET; Schema: public; Owner: khoa
--

SELECT pg_catalog.setval('public.table6_id_seq', 1, false);


--
-- Name: table3 table3_pkey; Type: CONSTRAINT; Schema: public; Owner: khoa
--

ALTER TABLE ONLY public.table3
    ADD CONSTRAINT table3_pkey PRIMARY KEY (id);


--
-- Name: table4 table4_pkey; Type: CONSTRAINT; Schema: public; Owner: khoa
--

ALTER TABLE ONLY public.table4
    ADD CONSTRAINT table4_pkey PRIMARY KEY (id);


--
-- Name: table6 table6_pkey; Type: CONSTRAINT; Schema: public; Owner: khoa
--

ALTER TABLE ONLY public.table6
    ADD CONSTRAINT table6_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- Database "hcmut_block9" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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

--
-- Name: hcmut_block9; Type: DATABASE; Schema: -; Owner: khoa
--

CREATE DATABASE hcmut_block9 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE hcmut_block9 OWNER TO khoa;

\connect hcmut_block9

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
-- Name: table1; Type: TABLE; Schema: public; Owner: khoa
--

CREATE TABLE public.table1 (
    id integer NOT NULL,
    newcol integer
);


ALTER TABLE public.table1 OWNER TO khoa;

--
-- Name: COLUMN table1.id; Type: COMMENT; Schema: public; Owner: khoa
--

COMMENT ON COLUMN public.table1.id IS 'Id';


--
-- Name: COLUMN table1.newcol; Type: COMMENT; Schema: public; Owner: khoa
--

COMMENT ON COLUMN public.table1.newcol IS 'des1';


--
-- Name: table1_id_seq; Type: SEQUENCE; Schema: public; Owner: khoa
--

CREATE SEQUENCE public.table1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table1_id_seq OWNER TO khoa;

--
-- Name: table1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: khoa
--

ALTER SEQUENCE public.table1_id_seq OWNED BY public.table1.id;


--
-- Name: table1 id; Type: DEFAULT; Schema: public; Owner: khoa
--

ALTER TABLE ONLY public.table1 ALTER COLUMN id SET DEFAULT nextval('public.table1_id_seq'::regclass);


--
-- Data for Name: table1; Type: TABLE DATA; Schema: public; Owner: khoa
--

COPY public.table1 (id, newcol) FROM stdin;
\.


--
-- Name: table1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: khoa
--

SELECT pg_catalog.setval('public.table1_id_seq', 1, false);


--
-- Name: table1 table1_pkey; Type: CONSTRAINT; Schema: public; Owner: khoa
--

ALTER TABLE ONLY public.table1
    ADD CONSTRAINT table1_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- Database "hcmut_chuong_trinh_dao_tao" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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

--
-- Name: hcmut_chuong_trinh_dao_tao; Type: DATABASE; Schema: -; Owner: api_server
--

CREATE DATABASE hcmut_chuong_trinh_dao_tao WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE hcmut_chuong_trinh_dao_tao OWNER TO api_server;

\connect hcmut_chuong_trinh_dao_tao

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

--
-- PostgreSQL database dump complete
--

--
-- Database "hcmut_metadata" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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

--
-- Name: hcmut_metadata; Type: DATABASE; Schema: -; Owner: khoa
--

CREATE DATABASE hcmut_metadata WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE hcmut_metadata OWNER TO khoa;

\connect hcmut_metadata

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
-- Name: block_info; Type: TABLE; Schema: public; Owner: khoa
--

CREATE TABLE public.block_info (
    block_name character varying(255) NOT NULL,
    display_name character varying(255),
    description character varying(255),
    owner character varying(255)
);


ALTER TABLE public.block_info OWNER TO khoa;

--
-- Name: user_permission; Type: TABLE; Schema: public; Owner: khoa
--

CREATE TABLE public.user_permission (
    username character varying(255),
    blocks character varying(255)
);


ALTER TABLE public.user_permission OWNER TO khoa;

--
-- Data for Name: block_info; Type: TABLE DATA; Schema: public; Owner: khoa
--

COPY public.block_info (block_name, display_name, description, owner) FROM stdin;
hcmut_nghien_cuu-kh			\N
hcmut_block3		abcdef	\N
cs_block1		Báo cáo tháng 4, tổng hợp điểm trung bình của tất cả sinh viên	
\.


--
-- Data for Name: user_permission; Type: TABLE DATA; Schema: public; Owner: khoa
--

COPY public.user_permission (username, blocks) FROM stdin;
khoa	hcmut_block4
khoa	hcmut_block9
khoa	hcmut_nghien_cuu-kh
manh	cs_block1
manh	cs_block2
khoa	cs_block2
manh_normal	cs_block1
manh_normal	cs_block2
khoa	hcmut_block3
\.


--
-- Name: block_info block_info_pkey; Type: CONSTRAINT; Schema: public; Owner: khoa
--

ALTER TABLE ONLY public.block_info
    ADD CONSTRAINT block_info_pkey PRIMARY KEY (block_name);


--
-- PostgreSQL database dump complete
--

--
-- Database "hcmut_nghien_cuu-kh" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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

--
-- Name: hcmut_nghien_cuu-kh; Type: DATABASE; Schema: -; Owner: khoa
--

CREATE DATABASE "hcmut_nghien_cuu-kh" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE "hcmut_nghien_cuu-kh" OWNER TO khoa;

\connect -reuse-previous=on "dbname='hcmut_nghien_cuu-kh'"

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
-- Name: danh_sach_de_tai; Type: TABLE; Schema: public; Owner: khoa
--

CREATE TABLE public.danh_sach_de_tai (
    id integer NOT NULL,
    madt integer,
    tendetai text
);


ALTER TABLE public.danh_sach_de_tai OWNER TO khoa;

--
-- Name: COLUMN danh_sach_de_tai.id; Type: COMMENT; Schema: public; Owner: khoa
--

COMMENT ON COLUMN public.danh_sach_de_tai.id IS 'Id';


--
-- Name: COLUMN danh_sach_de_tai.madt; Type: COMMENT; Schema: public; Owner: khoa
--

COMMENT ON COLUMN public.danh_sach_de_tai.madt IS 'mã đề tài';


--
-- Name: COLUMN danh_sach_de_tai.tendetai; Type: COMMENT; Schema: public; Owner: khoa
--

COMMENT ON COLUMN public.danh_sach_de_tai.tendetai IS 'Tên đề tài';


--
-- Name: danh_sach_de_tai_id_seq; Type: SEQUENCE; Schema: public; Owner: khoa
--

CREATE SEQUENCE public.danh_sach_de_tai_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.danh_sach_de_tai_id_seq OWNER TO khoa;

--
-- Name: danh_sach_de_tai_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: khoa
--

ALTER SEQUENCE public.danh_sach_de_tai_id_seq OWNED BY public.danh_sach_de_tai.id;


--
-- Name: danh_sach_de_tai id; Type: DEFAULT; Schema: public; Owner: khoa
--

ALTER TABLE ONLY public.danh_sach_de_tai ALTER COLUMN id SET DEFAULT nextval('public.danh_sach_de_tai_id_seq'::regclass);


--
-- Data for Name: danh_sach_de_tai; Type: TABLE DATA; Schema: public; Owner: khoa
--

COPY public.danh_sach_de_tai (id, madt, tendetai) FROM stdin;
\.


--
-- Name: danh_sach_de_tai_id_seq; Type: SEQUENCE SET; Schema: public; Owner: khoa
--

SELECT pg_catalog.setval('public.danh_sach_de_tai_id_seq', 1, false);


--
-- Name: danh_sach_de_tai danh_sach_de_tai_pkey; Type: CONSTRAINT; Schema: public; Owner: khoa
--

ALTER TABLE ONLY public.danh_sach_de_tai
    ADD CONSTRAINT danh_sach_de_tai_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- Database "keycloak" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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

--
-- Name: keycloak; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE keycloak WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE keycloak OWNER TO postgres;

\connect keycloak

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
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO keycloak;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO keycloak;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO keycloak;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO keycloak;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO keycloak;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO keycloak;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO keycloak;

--
-- Name: client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO keycloak;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.client_attributes OWNER TO keycloak;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO keycloak;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO keycloak;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO keycloak;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO keycloak;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO keycloak;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO keycloak;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO keycloak;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO keycloak;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO keycloak;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO keycloak;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO keycloak;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO keycloak;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO keycloak;

--
-- Name: component; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO keycloak;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO keycloak;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO keycloak;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO keycloak;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO keycloak;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO keycloak;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO keycloak;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO keycloak;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO keycloak;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO keycloak;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO keycloak;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO keycloak;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO keycloak;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO keycloak;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO keycloak;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO keycloak;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO keycloak;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO keycloak;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO keycloak;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO keycloak;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO keycloak;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO keycloak;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO keycloak;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO keycloak;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO keycloak;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO keycloak;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO keycloak;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO keycloak;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO keycloak;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO keycloak;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO keycloak;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO keycloak;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO keycloak;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO keycloak;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO keycloak;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO keycloak;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO keycloak;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO keycloak;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO keycloak;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO keycloak;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO keycloak;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO keycloak;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO keycloak;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO keycloak;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO keycloak;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO keycloak;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO keycloak;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO keycloak;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO keycloak;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO keycloak;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO keycloak;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO keycloak;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO keycloak;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO keycloak;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO keycloak;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO keycloak;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO keycloak;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO keycloak;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO keycloak;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO keycloak;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO keycloak;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO keycloak;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO keycloak;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO keycloak;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO keycloak;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO keycloak;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO keycloak;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO keycloak;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO keycloak;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO keycloak;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
d96b5bd8-2258-487a-bdb1-c12e1c8d9ee6	\N	auth-cookie	7b27a11d-121a-4360-960c-3ea6deb0ac35	e29f11ca-90ce-4201-8519-c7b595b4b24d	2	10	f	\N	\N
0392ab1c-8ee1-470e-8f07-68e0f02dd6f3	\N	auth-spnego	7b27a11d-121a-4360-960c-3ea6deb0ac35	e29f11ca-90ce-4201-8519-c7b595b4b24d	3	20	f	\N	\N
4c2d5c1c-4e39-4029-a3e8-12d263bca071	\N	identity-provider-redirector	7b27a11d-121a-4360-960c-3ea6deb0ac35	e29f11ca-90ce-4201-8519-c7b595b4b24d	2	25	f	\N	\N
b3faaaac-c76c-45a3-ade8-201c85075c07	\N	\N	7b27a11d-121a-4360-960c-3ea6deb0ac35	e29f11ca-90ce-4201-8519-c7b595b4b24d	2	30	t	46692cc4-389c-4461-b546-5dc371ab7615	\N
e1c07f3b-0abe-4540-97a0-2a49445b239d	\N	auth-username-password-form	7b27a11d-121a-4360-960c-3ea6deb0ac35	46692cc4-389c-4461-b546-5dc371ab7615	0	10	f	\N	\N
5e3118d7-3fa4-431d-b4e5-842fd0c3d6a9	\N	\N	7b27a11d-121a-4360-960c-3ea6deb0ac35	46692cc4-389c-4461-b546-5dc371ab7615	1	20	t	3ecbafda-e839-44c3-bf8f-a403546058f9	\N
ea8d5022-2942-4fdc-be14-100de9eb266b	\N	conditional-user-configured	7b27a11d-121a-4360-960c-3ea6deb0ac35	3ecbafda-e839-44c3-bf8f-a403546058f9	0	10	f	\N	\N
d6c7776c-c7e0-4f36-b651-10206ac8bca2	\N	auth-otp-form	7b27a11d-121a-4360-960c-3ea6deb0ac35	3ecbafda-e839-44c3-bf8f-a403546058f9	0	20	f	\N	\N
cc3a1ed8-281c-41c3-a892-2adbd2388b98	\N	direct-grant-validate-username	7b27a11d-121a-4360-960c-3ea6deb0ac35	1df96ad9-a2ad-4514-9844-cd865d818da7	0	10	f	\N	\N
644cacba-1e2e-48d3-be86-952106c85aa9	\N	direct-grant-validate-password	7b27a11d-121a-4360-960c-3ea6deb0ac35	1df96ad9-a2ad-4514-9844-cd865d818da7	0	20	f	\N	\N
677dbca2-fc7b-423a-824e-eedcf6ba3597	\N	\N	7b27a11d-121a-4360-960c-3ea6deb0ac35	1df96ad9-a2ad-4514-9844-cd865d818da7	1	30	t	a60a8177-94d6-4ce5-974a-41f2b2d82173	\N
7e04fd9a-9f84-48df-87c6-6f78c911df6d	\N	conditional-user-configured	7b27a11d-121a-4360-960c-3ea6deb0ac35	a60a8177-94d6-4ce5-974a-41f2b2d82173	0	10	f	\N	\N
409c56b6-24b7-4311-ac6b-e426822c4009	\N	direct-grant-validate-otp	7b27a11d-121a-4360-960c-3ea6deb0ac35	a60a8177-94d6-4ce5-974a-41f2b2d82173	0	20	f	\N	\N
0ba6302d-c59a-42e1-9394-814392f4d734	\N	registration-page-form	7b27a11d-121a-4360-960c-3ea6deb0ac35	356af88b-8aed-4700-8bf2-47a15a28dd69	0	10	t	bb6230d6-a350-4455-bf7c-a829ec63ba90	\N
7051e520-ef3e-4b6c-8645-1f4540db51c6	\N	registration-user-creation	7b27a11d-121a-4360-960c-3ea6deb0ac35	bb6230d6-a350-4455-bf7c-a829ec63ba90	0	20	f	\N	\N
3938bf48-5d75-41be-9e85-b72064d264e7	\N	registration-profile-action	7b27a11d-121a-4360-960c-3ea6deb0ac35	bb6230d6-a350-4455-bf7c-a829ec63ba90	0	40	f	\N	\N
5beea437-80e4-41c2-a276-dd53d7144a59	\N	registration-password-action	7b27a11d-121a-4360-960c-3ea6deb0ac35	bb6230d6-a350-4455-bf7c-a829ec63ba90	0	50	f	\N	\N
12160472-dc8d-4661-b298-6370a8d6930d	\N	registration-recaptcha-action	7b27a11d-121a-4360-960c-3ea6deb0ac35	bb6230d6-a350-4455-bf7c-a829ec63ba90	3	60	f	\N	\N
dd303c6e-69ad-49e3-a5dc-0b77b004886f	\N	reset-credentials-choose-user	7b27a11d-121a-4360-960c-3ea6deb0ac35	d5cb4658-e2fd-45fc-87a4-8c10f1504090	0	10	f	\N	\N
f4ad83d4-3b66-4eba-b2ac-6a7838dbf208	\N	reset-credential-email	7b27a11d-121a-4360-960c-3ea6deb0ac35	d5cb4658-e2fd-45fc-87a4-8c10f1504090	0	20	f	\N	\N
d90a612b-84a1-4f00-8d1b-6d6e00c780b7	\N	reset-password	7b27a11d-121a-4360-960c-3ea6deb0ac35	d5cb4658-e2fd-45fc-87a4-8c10f1504090	0	30	f	\N	\N
1d9836d9-0dc7-44da-9bce-57326abbab7c	\N	\N	7b27a11d-121a-4360-960c-3ea6deb0ac35	d5cb4658-e2fd-45fc-87a4-8c10f1504090	1	40	t	9cfb885b-0e07-4bcc-9517-3f0531bcd498	\N
f3c9ecad-1618-4a8a-981a-30395684c90d	\N	conditional-user-configured	7b27a11d-121a-4360-960c-3ea6deb0ac35	9cfb885b-0e07-4bcc-9517-3f0531bcd498	0	10	f	\N	\N
6bfb00f4-11ab-4359-bd59-1a0e91585a5a	\N	reset-otp	7b27a11d-121a-4360-960c-3ea6deb0ac35	9cfb885b-0e07-4bcc-9517-3f0531bcd498	0	20	f	\N	\N
7bc2ac00-9556-4392-992b-4ec4d4993a02	\N	client-secret	7b27a11d-121a-4360-960c-3ea6deb0ac35	053b3985-51b0-4a4f-9143-ff14a24dedfb	2	10	f	\N	\N
97dff475-ce60-42d4-81bf-8e161dc7f4d3	\N	client-jwt	7b27a11d-121a-4360-960c-3ea6deb0ac35	053b3985-51b0-4a4f-9143-ff14a24dedfb	2	20	f	\N	\N
0ff6c883-4122-4101-86fd-e19436758d1b	\N	client-secret-jwt	7b27a11d-121a-4360-960c-3ea6deb0ac35	053b3985-51b0-4a4f-9143-ff14a24dedfb	2	30	f	\N	\N
77f29a7b-4b78-4fdc-8663-a6fbfbc5dba1	\N	client-x509	7b27a11d-121a-4360-960c-3ea6deb0ac35	053b3985-51b0-4a4f-9143-ff14a24dedfb	2	40	f	\N	\N
95ff8104-3501-493b-8676-0a3f82faf83c	\N	idp-review-profile	7b27a11d-121a-4360-960c-3ea6deb0ac35	806a8e4a-101d-40f5-b7fe-af15de1b6ec7	0	10	f	\N	7fe369e6-90ed-4bbb-a5ca-a6ba7bf5c44c
bd8da78e-feba-48e2-8ac3-29e05135b12d	\N	\N	7b27a11d-121a-4360-960c-3ea6deb0ac35	806a8e4a-101d-40f5-b7fe-af15de1b6ec7	0	20	t	43eb6de3-139c-4f53-a201-887e5f08ef8b	\N
39ca7483-73c7-4a9c-b61d-93d03fbf9ccb	\N	idp-create-user-if-unique	7b27a11d-121a-4360-960c-3ea6deb0ac35	43eb6de3-139c-4f53-a201-887e5f08ef8b	2	10	f	\N	0dc048ee-fc78-412c-a1c0-f6c5571f070e
845fc4b3-9178-44a9-8776-95c10f50c567	\N	\N	7b27a11d-121a-4360-960c-3ea6deb0ac35	43eb6de3-139c-4f53-a201-887e5f08ef8b	2	20	t	b8720fe7-2972-4035-8da3-2765dd7ab368	\N
56fe9528-d00f-459b-95d7-26ba1adc21ae	\N	idp-confirm-link	7b27a11d-121a-4360-960c-3ea6deb0ac35	b8720fe7-2972-4035-8da3-2765dd7ab368	0	10	f	\N	\N
4fc5b3ca-90d2-4a58-828f-aa46867947e2	\N	\N	7b27a11d-121a-4360-960c-3ea6deb0ac35	b8720fe7-2972-4035-8da3-2765dd7ab368	0	20	t	f699e358-970c-4e61-90ce-1d62ac051d4e	\N
d0b47348-342d-421a-b107-b1692391b908	\N	idp-email-verification	7b27a11d-121a-4360-960c-3ea6deb0ac35	f699e358-970c-4e61-90ce-1d62ac051d4e	2	10	f	\N	\N
92950808-8295-4095-a1c7-e90d6cb13871	\N	\N	7b27a11d-121a-4360-960c-3ea6deb0ac35	f699e358-970c-4e61-90ce-1d62ac051d4e	2	20	t	01bf3f28-1b9c-46d8-b308-fe6a930ec4a2	\N
adfd9bd5-2ada-4bc3-acbf-acfc451efe25	\N	idp-username-password-form	7b27a11d-121a-4360-960c-3ea6deb0ac35	01bf3f28-1b9c-46d8-b308-fe6a930ec4a2	0	10	f	\N	\N
99b7502f-3861-4a40-854b-2256b86ddf1c	\N	\N	7b27a11d-121a-4360-960c-3ea6deb0ac35	01bf3f28-1b9c-46d8-b308-fe6a930ec4a2	1	20	t	31f3ea99-c468-46dd-83a5-e85dcc499e9d	\N
01009c9d-38e9-4c15-bf6d-9779b9c98209	\N	conditional-user-configured	7b27a11d-121a-4360-960c-3ea6deb0ac35	31f3ea99-c468-46dd-83a5-e85dcc499e9d	0	10	f	\N	\N
35b6b7ec-57d0-4351-805c-44b8b7d3cbc1	\N	auth-otp-form	7b27a11d-121a-4360-960c-3ea6deb0ac35	31f3ea99-c468-46dd-83a5-e85dcc499e9d	0	20	f	\N	\N
fc0fd757-c0ab-4c5f-b208-cdda5176aea8	\N	http-basic-authenticator	7b27a11d-121a-4360-960c-3ea6deb0ac35	191e7cb4-503f-472a-a409-391ae8c3f5dc	0	10	f	\N	\N
7cb75fb8-f456-4d09-9fa6-f3ebeaf4093a	\N	docker-http-basic-authenticator	7b27a11d-121a-4360-960c-3ea6deb0ac35	29895d82-4ec3-45d1-b36a-14354d0e5172	0	10	f	\N	\N
70ab00f0-c186-4af7-8ae5-d1a80e6afd21	\N	no-cookie-redirect	7b27a11d-121a-4360-960c-3ea6deb0ac35	fa566bdc-6396-4757-88d7-62f65c6909d5	0	10	f	\N	\N
9966f923-9868-47a0-9600-95a09b680128	\N	\N	7b27a11d-121a-4360-960c-3ea6deb0ac35	fa566bdc-6396-4757-88d7-62f65c6909d5	0	20	t	c4040153-35bc-4058-8e13-5be5d24b76a0	\N
b315bb97-e47c-46f4-a4aa-76b92a92c1b7	\N	basic-auth	7b27a11d-121a-4360-960c-3ea6deb0ac35	c4040153-35bc-4058-8e13-5be5d24b76a0	0	10	f	\N	\N
2d5c87ad-288b-4f95-a148-1df0d3f09727	\N	basic-auth-otp	7b27a11d-121a-4360-960c-3ea6deb0ac35	c4040153-35bc-4058-8e13-5be5d24b76a0	3	20	f	\N	\N
cba71967-f7e1-4f88-85b7-22ff90461205	\N	auth-spnego	7b27a11d-121a-4360-960c-3ea6deb0ac35	c4040153-35bc-4058-8e13-5be5d24b76a0	3	30	f	\N	\N
8476aa85-6aa7-4557-a9ff-ecde9ad1eaf3	\N	auth-cookie	aef5c390-9834-4cad-83be-4efe22893758	829b4dc2-aecc-4564-9525-c6febc6c909a	2	10	f	\N	\N
5cdae652-db8f-4d9c-8526-16bfcfb5bdae	\N	auth-spnego	aef5c390-9834-4cad-83be-4efe22893758	829b4dc2-aecc-4564-9525-c6febc6c909a	3	20	f	\N	\N
5de83e21-b63b-4a7a-ad67-fc96831e658e	\N	identity-provider-redirector	aef5c390-9834-4cad-83be-4efe22893758	829b4dc2-aecc-4564-9525-c6febc6c909a	2	25	f	\N	\N
6d090979-105e-4420-ba9c-e030a0bb058a	\N	\N	aef5c390-9834-4cad-83be-4efe22893758	829b4dc2-aecc-4564-9525-c6febc6c909a	2	30	t	4497f6e9-4894-4e4f-a5cf-fe3722ae5769	\N
3fe74280-8a78-476d-ada6-7f205595115c	\N	auth-username-password-form	aef5c390-9834-4cad-83be-4efe22893758	4497f6e9-4894-4e4f-a5cf-fe3722ae5769	0	10	f	\N	\N
c3af7940-4131-449c-8bb6-2eb9c37b31cd	\N	\N	aef5c390-9834-4cad-83be-4efe22893758	4497f6e9-4894-4e4f-a5cf-fe3722ae5769	1	20	t	bdaee086-4b41-44c4-9978-e30ed70871a9	\N
bfcc50cf-a11c-4b84-966a-fe00889230d2	\N	conditional-user-configured	aef5c390-9834-4cad-83be-4efe22893758	bdaee086-4b41-44c4-9978-e30ed70871a9	0	10	f	\N	\N
a7ed1c7a-ecf0-4f3c-a827-5a397f3c8bdd	\N	auth-otp-form	aef5c390-9834-4cad-83be-4efe22893758	bdaee086-4b41-44c4-9978-e30ed70871a9	0	20	f	\N	\N
778af6bb-356e-4bbf-a257-11bdc953c95f	\N	direct-grant-validate-username	aef5c390-9834-4cad-83be-4efe22893758	1361e062-8130-484a-ad92-a224025efeec	0	10	f	\N	\N
08482660-2d7a-46a3-8563-051191207cd0	\N	direct-grant-validate-password	aef5c390-9834-4cad-83be-4efe22893758	1361e062-8130-484a-ad92-a224025efeec	0	20	f	\N	\N
2dea2fa8-4246-404c-b4d7-332a211156f0	\N	\N	aef5c390-9834-4cad-83be-4efe22893758	1361e062-8130-484a-ad92-a224025efeec	1	30	t	cc9561cd-c559-462e-8efb-f6a83afa67f4	\N
7ec50514-b9fe-489f-9061-a57eff009eda	\N	conditional-user-configured	aef5c390-9834-4cad-83be-4efe22893758	cc9561cd-c559-462e-8efb-f6a83afa67f4	0	10	f	\N	\N
d3b7dd59-b229-4481-bde8-966cfcdc3ba0	\N	direct-grant-validate-otp	aef5c390-9834-4cad-83be-4efe22893758	cc9561cd-c559-462e-8efb-f6a83afa67f4	0	20	f	\N	\N
1249df0c-a028-47c5-a24c-2c90139d50a9	\N	registration-page-form	aef5c390-9834-4cad-83be-4efe22893758	ad3bef9e-4215-465e-ba18-619ab2eb0f99	0	10	t	f7466d0c-fbbb-485f-9312-565da5b673c0	\N
3f7908c5-b230-415a-b511-888d2f7b3ebc	\N	registration-user-creation	aef5c390-9834-4cad-83be-4efe22893758	f7466d0c-fbbb-485f-9312-565da5b673c0	0	20	f	\N	\N
933eafbd-c0a6-46d9-be6f-260a83d5c973	\N	registration-profile-action	aef5c390-9834-4cad-83be-4efe22893758	f7466d0c-fbbb-485f-9312-565da5b673c0	0	40	f	\N	\N
8e70e606-d2b2-4191-be4a-5fe86270be74	\N	registration-password-action	aef5c390-9834-4cad-83be-4efe22893758	f7466d0c-fbbb-485f-9312-565da5b673c0	0	50	f	\N	\N
9c496099-5986-4b87-83a8-73b8c0833545	\N	registration-recaptcha-action	aef5c390-9834-4cad-83be-4efe22893758	f7466d0c-fbbb-485f-9312-565da5b673c0	3	60	f	\N	\N
7cee269a-9d5a-4101-bf98-42c0bbbae145	\N	reset-credentials-choose-user	aef5c390-9834-4cad-83be-4efe22893758	4c47edc1-f056-42a0-ad39-8214100c9b3a	0	10	f	\N	\N
31860f50-2393-42b9-93b8-429b66c0110f	\N	reset-credential-email	aef5c390-9834-4cad-83be-4efe22893758	4c47edc1-f056-42a0-ad39-8214100c9b3a	0	20	f	\N	\N
d96ad89a-c26b-42ab-b107-bcacb96bbef3	\N	reset-password	aef5c390-9834-4cad-83be-4efe22893758	4c47edc1-f056-42a0-ad39-8214100c9b3a	0	30	f	\N	\N
13a75ec8-3178-48aa-9cc7-76f86a2594f0	\N	\N	aef5c390-9834-4cad-83be-4efe22893758	4c47edc1-f056-42a0-ad39-8214100c9b3a	1	40	t	fe9854b1-54ac-478a-8cb2-9fe1a1ab7b68	\N
d8d23e54-b507-490e-bf9e-6e5740f823d0	\N	conditional-user-configured	aef5c390-9834-4cad-83be-4efe22893758	fe9854b1-54ac-478a-8cb2-9fe1a1ab7b68	0	10	f	\N	\N
1588ae61-4f3f-40b6-9482-83ab20e9ea59	\N	reset-otp	aef5c390-9834-4cad-83be-4efe22893758	fe9854b1-54ac-478a-8cb2-9fe1a1ab7b68	0	20	f	\N	\N
ee3659cb-5718-4dea-a26c-56e0878de42c	\N	client-secret	aef5c390-9834-4cad-83be-4efe22893758	bf41faa2-c8f5-4110-9f69-7f60ef2b5b97	2	10	f	\N	\N
ac5c9914-c167-4e26-8834-1ed9926f27ee	\N	client-jwt	aef5c390-9834-4cad-83be-4efe22893758	bf41faa2-c8f5-4110-9f69-7f60ef2b5b97	2	20	f	\N	\N
cac9c2be-ce6e-4bcd-9b37-9af78d296899	\N	client-secret-jwt	aef5c390-9834-4cad-83be-4efe22893758	bf41faa2-c8f5-4110-9f69-7f60ef2b5b97	2	30	f	\N	\N
1d45ce54-4d2a-4251-b811-cb58284278f0	\N	client-x509	aef5c390-9834-4cad-83be-4efe22893758	bf41faa2-c8f5-4110-9f69-7f60ef2b5b97	2	40	f	\N	\N
65cfaf06-dbbe-4e8c-9d3d-19b32d88b787	\N	idp-review-profile	aef5c390-9834-4cad-83be-4efe22893758	643d87fa-9358-46f0-b44f-e6c8df85cd64	0	10	f	\N	58079fc7-2c08-4ef3-a420-98401e583fff
27f94cad-2acb-424f-bf50-26db9512e194	\N	\N	aef5c390-9834-4cad-83be-4efe22893758	643d87fa-9358-46f0-b44f-e6c8df85cd64	0	20	t	db1b0579-dab5-4cb1-b3a3-1625eec83d31	\N
3668c2ca-4102-4b6c-aad3-8bca742d35b8	\N	idp-create-user-if-unique	aef5c390-9834-4cad-83be-4efe22893758	db1b0579-dab5-4cb1-b3a3-1625eec83d31	2	10	f	\N	17dace07-27ca-4acc-9e71-209b7280c41a
3b71a85e-8b8d-4827-a549-433e077bb568	\N	\N	aef5c390-9834-4cad-83be-4efe22893758	db1b0579-dab5-4cb1-b3a3-1625eec83d31	2	20	t	7676afb6-307d-437e-aba4-5a9c658e0e31	\N
b66ca137-861d-4a53-b1c1-3247c6e3fad9	\N	idp-confirm-link	aef5c390-9834-4cad-83be-4efe22893758	7676afb6-307d-437e-aba4-5a9c658e0e31	0	10	f	\N	\N
5f6f0f9f-1584-4ecd-8878-4100a1732ada	\N	\N	aef5c390-9834-4cad-83be-4efe22893758	7676afb6-307d-437e-aba4-5a9c658e0e31	0	20	t	17240ad7-9bf9-41c3-89d0-98b532264e81	\N
2c4be52b-7d34-408b-a6f4-790b939de2e9	\N	idp-email-verification	aef5c390-9834-4cad-83be-4efe22893758	17240ad7-9bf9-41c3-89d0-98b532264e81	2	10	f	\N	\N
30c84145-ac71-4d9a-b15a-9e3e28851a8b	\N	\N	aef5c390-9834-4cad-83be-4efe22893758	17240ad7-9bf9-41c3-89d0-98b532264e81	2	20	t	297940b7-704a-4aad-a536-9eb1c7d36634	\N
8ee9da68-8580-4e5a-b38a-3792c30c183e	\N	idp-username-password-form	aef5c390-9834-4cad-83be-4efe22893758	297940b7-704a-4aad-a536-9eb1c7d36634	0	10	f	\N	\N
8b409a47-523b-463c-a12d-e9738bdea5f6	\N	\N	aef5c390-9834-4cad-83be-4efe22893758	297940b7-704a-4aad-a536-9eb1c7d36634	1	20	t	85c2fbcd-c94f-4586-817f-16026ae9f849	\N
06665463-40cc-4479-a66c-9e3c507ac011	\N	conditional-user-configured	aef5c390-9834-4cad-83be-4efe22893758	85c2fbcd-c94f-4586-817f-16026ae9f849	0	10	f	\N	\N
9aa67af5-2cc7-4cd4-ad3a-1bceb32e06bc	\N	auth-otp-form	aef5c390-9834-4cad-83be-4efe22893758	85c2fbcd-c94f-4586-817f-16026ae9f849	0	20	f	\N	\N
f6605c7a-f1f4-4037-9e87-d96f31ca6909	\N	http-basic-authenticator	aef5c390-9834-4cad-83be-4efe22893758	dd582dc7-2b57-4cdc-9007-6b95df085681	0	10	f	\N	\N
96aaea99-fdbb-4041-958f-59805af2a9d4	\N	docker-http-basic-authenticator	aef5c390-9834-4cad-83be-4efe22893758	1afcb00a-28c4-4812-a7d2-2a20f9af5cf4	0	10	f	\N	\N
bedcc50c-e530-4179-8269-c6b4571ab49c	\N	no-cookie-redirect	aef5c390-9834-4cad-83be-4efe22893758	d35a5208-59db-4fae-9621-310ba0659387	0	10	f	\N	\N
f278c0ef-1f96-4eae-b6b0-368d91c6d4c1	\N	\N	aef5c390-9834-4cad-83be-4efe22893758	d35a5208-59db-4fae-9621-310ba0659387	0	20	t	5740e58b-8eb0-49d8-8024-a31c226333ff	\N
bad3ff8b-65ee-4417-986f-9bc34d1fb53e	\N	basic-auth	aef5c390-9834-4cad-83be-4efe22893758	5740e58b-8eb0-49d8-8024-a31c226333ff	0	10	f	\N	\N
3c043f35-b011-400e-ae98-07f615bcd7f1	\N	basic-auth-otp	aef5c390-9834-4cad-83be-4efe22893758	5740e58b-8eb0-49d8-8024-a31c226333ff	3	20	f	\N	\N
061e1553-4252-465f-8ed7-fcca89794c12	\N	auth-spnego	aef5c390-9834-4cad-83be-4efe22893758	5740e58b-8eb0-49d8-8024-a31c226333ff	3	30	f	\N	\N
cf704c4c-b71a-4cc1-a12a-91ed36e6dd5a	\N	auth-cookie	60d763c7-10e3-4490-8529-e1c97d983ade	81611d87-b075-4351-9781-cded2d0f85bd	2	10	f	\N	\N
81b9e2c8-6869-4a85-93e6-44d119ab3016	\N	auth-spnego	60d763c7-10e3-4490-8529-e1c97d983ade	81611d87-b075-4351-9781-cded2d0f85bd	3	20	f	\N	\N
325d0333-4980-4962-8f68-1dc4289c3a18	\N	identity-provider-redirector	60d763c7-10e3-4490-8529-e1c97d983ade	81611d87-b075-4351-9781-cded2d0f85bd	2	25	f	\N	\N
5f402fd6-8962-40c3-a87a-c00582dbe804	\N	\N	60d763c7-10e3-4490-8529-e1c97d983ade	81611d87-b075-4351-9781-cded2d0f85bd	2	30	t	c8f60b67-04d0-442e-a980-62fc3b378157	\N
623d384c-0fbe-46e3-82cd-adeccdbbb8d2	\N	auth-username-password-form	60d763c7-10e3-4490-8529-e1c97d983ade	c8f60b67-04d0-442e-a980-62fc3b378157	0	10	f	\N	\N
d42224ad-c86b-4430-8fcf-b3ac1cdb25e0	\N	\N	60d763c7-10e3-4490-8529-e1c97d983ade	c8f60b67-04d0-442e-a980-62fc3b378157	1	20	t	163c865b-5352-43d7-99c4-033b80e5e93c	\N
b10d1a4e-e02a-41af-9379-d46e10eee8bc	\N	conditional-user-configured	60d763c7-10e3-4490-8529-e1c97d983ade	163c865b-5352-43d7-99c4-033b80e5e93c	0	10	f	\N	\N
33cf3923-7f52-48a8-8948-6db353c374a1	\N	auth-otp-form	60d763c7-10e3-4490-8529-e1c97d983ade	163c865b-5352-43d7-99c4-033b80e5e93c	0	20	f	\N	\N
9e091545-0c51-4f42-be2b-2fbd3681d6b1	\N	direct-grant-validate-username	60d763c7-10e3-4490-8529-e1c97d983ade	19dc4db1-2091-4e69-8490-0677e29aa32a	0	10	f	\N	\N
7805a0b9-7431-4b6e-ad88-d574d1959128	\N	direct-grant-validate-password	60d763c7-10e3-4490-8529-e1c97d983ade	19dc4db1-2091-4e69-8490-0677e29aa32a	0	20	f	\N	\N
c36fb95c-1c7f-4a0a-888e-fb1776954c2b	\N	\N	60d763c7-10e3-4490-8529-e1c97d983ade	19dc4db1-2091-4e69-8490-0677e29aa32a	1	30	t	e8f05043-2056-41b0-9e15-2eecd83a2af7	\N
2f6852ef-5ea8-403d-a009-987248bbf15c	\N	conditional-user-configured	60d763c7-10e3-4490-8529-e1c97d983ade	e8f05043-2056-41b0-9e15-2eecd83a2af7	0	10	f	\N	\N
3fb61bc9-0c8c-46dc-a3ad-738f5ad9a30c	\N	direct-grant-validate-otp	60d763c7-10e3-4490-8529-e1c97d983ade	e8f05043-2056-41b0-9e15-2eecd83a2af7	0	20	f	\N	\N
a0424969-9aa6-4443-8cb8-b7899f545113	\N	registration-page-form	60d763c7-10e3-4490-8529-e1c97d983ade	f8c9ef42-39e3-4a31-9582-0048fe5b7515	0	10	t	33e5f30d-b48e-4134-8325-38b1ffc04036	\N
e63f5de7-1e6b-4b7f-b530-e3591fa63b28	\N	registration-user-creation	60d763c7-10e3-4490-8529-e1c97d983ade	33e5f30d-b48e-4134-8325-38b1ffc04036	0	20	f	\N	\N
b16aaadb-fe69-49cd-bc5e-4ffb964794a2	\N	registration-profile-action	60d763c7-10e3-4490-8529-e1c97d983ade	33e5f30d-b48e-4134-8325-38b1ffc04036	0	40	f	\N	\N
72130fe6-c58d-444e-9d18-41d3ab1a4c65	\N	registration-password-action	60d763c7-10e3-4490-8529-e1c97d983ade	33e5f30d-b48e-4134-8325-38b1ffc04036	0	50	f	\N	\N
09d9ca4d-c443-4cea-baba-74d8bc10c324	\N	registration-recaptcha-action	60d763c7-10e3-4490-8529-e1c97d983ade	33e5f30d-b48e-4134-8325-38b1ffc04036	3	60	f	\N	\N
023e0a8d-d01b-4797-88fc-423464e35a52	\N	reset-credentials-choose-user	60d763c7-10e3-4490-8529-e1c97d983ade	f6ff7085-4f59-4538-991c-8fda01e8817a	0	10	f	\N	\N
3d14f0e3-9e6b-4c67-b726-ae2c7cb13506	\N	reset-credential-email	60d763c7-10e3-4490-8529-e1c97d983ade	f6ff7085-4f59-4538-991c-8fda01e8817a	0	20	f	\N	\N
d150d17a-6bac-4dfc-9a7a-fd1b3ce9900a	\N	reset-password	60d763c7-10e3-4490-8529-e1c97d983ade	f6ff7085-4f59-4538-991c-8fda01e8817a	0	30	f	\N	\N
8bf5753f-a904-4757-9913-bc3778cd9c04	\N	\N	60d763c7-10e3-4490-8529-e1c97d983ade	f6ff7085-4f59-4538-991c-8fda01e8817a	1	40	t	0fcb3d2d-8a7b-4ad1-a82f-95794ba54316	\N
0613eb0f-3d2a-49b7-a10e-f5ea74fc2602	\N	conditional-user-configured	60d763c7-10e3-4490-8529-e1c97d983ade	0fcb3d2d-8a7b-4ad1-a82f-95794ba54316	0	10	f	\N	\N
387adb65-ab0a-4224-977d-e656920299ac	\N	reset-otp	60d763c7-10e3-4490-8529-e1c97d983ade	0fcb3d2d-8a7b-4ad1-a82f-95794ba54316	0	20	f	\N	\N
8bf6ef37-4b70-4969-92ee-5de05afe16b9	\N	client-secret	60d763c7-10e3-4490-8529-e1c97d983ade	8b913b43-dc9d-44c2-bd0f-1c8eadaab7af	2	10	f	\N	\N
57a854a0-e704-459b-8f84-a17001363dfe	\N	client-jwt	60d763c7-10e3-4490-8529-e1c97d983ade	8b913b43-dc9d-44c2-bd0f-1c8eadaab7af	2	20	f	\N	\N
0a59bf17-06d1-4f8e-bd46-6b3dcff35882	\N	client-secret-jwt	60d763c7-10e3-4490-8529-e1c97d983ade	8b913b43-dc9d-44c2-bd0f-1c8eadaab7af	2	30	f	\N	\N
cc15a4b9-7c30-4b24-9f64-25111cde82f6	\N	client-x509	60d763c7-10e3-4490-8529-e1c97d983ade	8b913b43-dc9d-44c2-bd0f-1c8eadaab7af	2	40	f	\N	\N
f72f42ab-1081-47a9-8bda-592ac0ca6a01	\N	idp-review-profile	60d763c7-10e3-4490-8529-e1c97d983ade	60109967-1792-408d-a4f5-b60b0a41e6f1	0	10	f	\N	cf2e11b0-da21-4040-8396-3d1264e57283
8163e1b2-4f83-4fdd-84a6-1d06a40cad46	\N	\N	60d763c7-10e3-4490-8529-e1c97d983ade	60109967-1792-408d-a4f5-b60b0a41e6f1	0	20	t	7b822f65-1f38-45c6-8e6d-c3874c3ff8ca	\N
8572d099-05ea-426a-95a1-28840d13353a	\N	idp-create-user-if-unique	60d763c7-10e3-4490-8529-e1c97d983ade	7b822f65-1f38-45c6-8e6d-c3874c3ff8ca	2	10	f	\N	7f7767bc-9df4-41e2-b071-c2c23ed1cfe7
3e5230bb-9948-4152-89ed-dbbd3617a145	\N	\N	60d763c7-10e3-4490-8529-e1c97d983ade	7b822f65-1f38-45c6-8e6d-c3874c3ff8ca	2	20	t	83220627-cf5a-4640-9793-d3e095ee1091	\N
fe142296-a194-4c19-b61f-25f7bc0eba02	\N	idp-confirm-link	60d763c7-10e3-4490-8529-e1c97d983ade	83220627-cf5a-4640-9793-d3e095ee1091	0	10	f	\N	\N
7528fe50-b97f-4138-a9d2-b54de11c6e55	\N	\N	60d763c7-10e3-4490-8529-e1c97d983ade	83220627-cf5a-4640-9793-d3e095ee1091	0	20	t	742d655c-53f8-435b-801c-bacd72de3da2	\N
5d7a4fcd-a417-40cc-8905-bc61167ce44c	\N	idp-email-verification	60d763c7-10e3-4490-8529-e1c97d983ade	742d655c-53f8-435b-801c-bacd72de3da2	2	10	f	\N	\N
7c6a10c0-f402-455c-a690-23540b439fe6	\N	\N	60d763c7-10e3-4490-8529-e1c97d983ade	742d655c-53f8-435b-801c-bacd72de3da2	2	20	t	585e2b01-c29e-429f-9d20-2225135bf1ff	\N
63f87b39-de3d-4a8c-9876-3c1df3d8c16f	\N	idp-username-password-form	60d763c7-10e3-4490-8529-e1c97d983ade	585e2b01-c29e-429f-9d20-2225135bf1ff	0	10	f	\N	\N
5165bbdd-7d0b-4f59-abab-7bcf0871dd5b	\N	\N	60d763c7-10e3-4490-8529-e1c97d983ade	585e2b01-c29e-429f-9d20-2225135bf1ff	1	20	t	6cfb0602-80b2-4d8a-835d-8461e594b616	\N
bd947292-035e-45c4-8c79-fb1e2f2b434e	\N	conditional-user-configured	60d763c7-10e3-4490-8529-e1c97d983ade	6cfb0602-80b2-4d8a-835d-8461e594b616	0	10	f	\N	\N
74b08d69-8b7d-44e3-8cfc-60fbcc288f7f	\N	auth-otp-form	60d763c7-10e3-4490-8529-e1c97d983ade	6cfb0602-80b2-4d8a-835d-8461e594b616	0	20	f	\N	\N
f43a918c-9d89-4f0d-bbb1-5fe4580a4d1f	\N	http-basic-authenticator	60d763c7-10e3-4490-8529-e1c97d983ade	1adb37e1-de1e-49b9-ad6f-4686c81b740e	0	10	f	\N	\N
36892f24-58af-4d4f-9692-23362407a3ee	\N	docker-http-basic-authenticator	60d763c7-10e3-4490-8529-e1c97d983ade	4f26b250-bc09-4ac9-8ba3-95d72626cd74	0	10	f	\N	\N
6409e8fd-2135-4717-bc3c-487038aba0dc	\N	no-cookie-redirect	60d763c7-10e3-4490-8529-e1c97d983ade	85f36e45-4944-471c-9140-928f45f3cea0	0	10	f	\N	\N
f2b51933-f283-45d9-910c-9aea9b899092	\N	\N	60d763c7-10e3-4490-8529-e1c97d983ade	85f36e45-4944-471c-9140-928f45f3cea0	0	20	t	90b60d6c-6418-4634-91a9-99027c62941d	\N
8d8715df-c57c-48a5-bc4a-73d619d17769	\N	basic-auth	60d763c7-10e3-4490-8529-e1c97d983ade	90b60d6c-6418-4634-91a9-99027c62941d	0	10	f	\N	\N
99c9691e-5ef8-4ab1-8abc-07ce973ecefa	\N	basic-auth-otp	60d763c7-10e3-4490-8529-e1c97d983ade	90b60d6c-6418-4634-91a9-99027c62941d	3	20	f	\N	\N
708be511-c8a1-4146-a005-481a21973890	\N	auth-spnego	60d763c7-10e3-4490-8529-e1c97d983ade	90b60d6c-6418-4634-91a9-99027c62941d	3	30	f	\N	\N
f9b69da5-2b48-4444-8ca8-32034d876007	\N	conditional-user-configured	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	97e65e29-b03e-45b2-a3e1-30a72ef9f72e	0	10	f	\N	\N
e0e96fcd-0b98-4760-a0c1-655244c12a6b	\N	auth-otp-form	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	97e65e29-b03e-45b2-a3e1-30a72ef9f72e	0	20	f	\N	\N
380dee59-75bb-4098-b505-48a2efd36d68	\N	http-basic-authenticator	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	62d5f61c-3e2d-4a02-a90a-ef39df58b007	0	10	f	\N	\N
d46bd58c-7f45-40bf-a0c2-32dcc3c94b47	\N	docker-http-basic-authenticator	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	4f5178cc-6084-4a21-8946-c3248dcaa318	0	10	f	\N	\N
27e20a1a-a7dd-4881-b51e-5a35510682c0	\N	no-cookie-redirect	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	26a8932c-0a1e-4824-bf93-83a6fbb24b92	0	10	f	\N	\N
114d0301-5ffe-48a5-973d-5b2909c17dfd	\N	\N	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	26a8932c-0a1e-4824-bf93-83a6fbb24b92	0	20	t	8ade37ed-1649-44ea-a623-25905a5c21d3	\N
f6ab2b03-d42d-4b06-97ad-bb8d65805e10	\N	basic-auth	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	8ade37ed-1649-44ea-a623-25905a5c21d3	0	10	f	\N	\N
776c5365-3170-4a33-b937-b7b79a0bdcc7	\N	basic-auth-otp	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	8ade37ed-1649-44ea-a623-25905a5c21d3	3	20	f	\N	\N
1efcfca2-d032-426e-89ac-05203bc59196	\N	auth-spnego	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	8ade37ed-1649-44ea-a623-25905a5c21d3	3	30	f	\N	\N
5fa6e56f-c88c-4551-a977-64488e3b4fc8	\N	auth-cookie	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	78b93566-086f-4d3c-90af-a38b3a279cfb	2	10	f	\N	\N
f04da8b9-5f4f-4ea9-8386-4ef5492b2277	\N	auth-spnego	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	78b93566-086f-4d3c-90af-a38b3a279cfb	3	20	f	\N	\N
108fc74c-ee44-40b4-b18d-5585e50fc380	\N	identity-provider-redirector	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	78b93566-086f-4d3c-90af-a38b3a279cfb	2	25	f	\N	\N
8c5d26b1-d824-48d2-9527-c1f570c667c6	\N	\N	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	78b93566-086f-4d3c-90af-a38b3a279cfb	2	30	t	c53be5d2-239a-437e-8656-4e5013664a29	\N
08ccebee-a52b-422c-b0ad-02c503637933	\N	auth-username-password-form	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	c53be5d2-239a-437e-8656-4e5013664a29	0	10	f	\N	\N
cc81d090-bc70-460f-a416-54703a89cce2	\N	\N	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	c53be5d2-239a-437e-8656-4e5013664a29	1	20	t	c5c45111-7f03-4682-a7f8-5b6dc66f820f	\N
54ce5889-6a43-446d-8ec0-bb2a13f32cd6	\N	conditional-user-configured	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	c5c45111-7f03-4682-a7f8-5b6dc66f820f	0	10	f	\N	\N
e64a4bf8-fdbf-4e40-98ca-2bc08530788a	\N	auth-otp-form	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	c5c45111-7f03-4682-a7f8-5b6dc66f820f	0	20	f	\N	\N
62bf7670-0cc8-41a2-ac74-a2d9f28b122d	\N	direct-grant-validate-username	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	45e3c9a0-7314-420a-be52-034ca6986cd4	0	10	f	\N	\N
84cc3077-bb52-4a4b-b451-2c4c08d221ae	\N	direct-grant-validate-password	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	45e3c9a0-7314-420a-be52-034ca6986cd4	0	20	f	\N	\N
8151dc3a-38cd-44ac-8f77-923592391909	\N	\N	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	45e3c9a0-7314-420a-be52-034ca6986cd4	1	30	t	32e0e486-01ae-46a4-bfe4-68b967e26f32	\N
67c287bc-4e77-40f8-a386-ee83570ef39c	\N	conditional-user-configured	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	32e0e486-01ae-46a4-bfe4-68b967e26f32	0	10	f	\N	\N
ff1034b1-a46b-4b74-a366-ab1da24e7ff8	\N	direct-grant-validate-otp	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	32e0e486-01ae-46a4-bfe4-68b967e26f32	0	20	f	\N	\N
2676d8a8-aab7-47b8-9093-11614340adf6	\N	registration-page-form	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	aa79f132-b27e-46a8-81dd-fb371a863982	0	10	t	b105abd4-ffd1-4bee-83e0-0ea0b93b02f9	\N
b6af6535-e443-4c4c-b22b-28e8f0899270	\N	registration-user-creation	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	b105abd4-ffd1-4bee-83e0-0ea0b93b02f9	0	20	f	\N	\N
80e15efd-5cc3-4522-a9ea-4c2e942f68e3	\N	registration-profile-action	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	b105abd4-ffd1-4bee-83e0-0ea0b93b02f9	0	40	f	\N	\N
d2600555-e24d-4b51-93a8-946c43a96e24	\N	registration-password-action	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	b105abd4-ffd1-4bee-83e0-0ea0b93b02f9	0	50	f	\N	\N
e4d6e9c9-cc37-422e-a8c6-672ef09414a0	\N	registration-recaptcha-action	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	b105abd4-ffd1-4bee-83e0-0ea0b93b02f9	3	60	f	\N	\N
ca5d13fc-f9ad-4192-ba0e-82d4b9fa4f6d	\N	reset-credentials-choose-user	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	911ef2e4-b0f0-4414-a156-8be25524f84b	0	10	f	\N	\N
65818d94-ca9a-40e9-969f-738fa4207712	\N	reset-credential-email	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	911ef2e4-b0f0-4414-a156-8be25524f84b	0	20	f	\N	\N
f89e11ec-2c04-42c2-b369-a8076765491e	\N	reset-password	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	911ef2e4-b0f0-4414-a156-8be25524f84b	0	30	f	\N	\N
23bd543b-5bf3-49f7-adf8-0f397bd9ac77	\N	\N	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	911ef2e4-b0f0-4414-a156-8be25524f84b	1	40	t	125bba9a-9c29-4e2f-b43e-3225b821c47d	\N
a9834067-6011-43cd-bb23-c4cd7909ce1a	\N	auth-cookie	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	a6965485-5262-4bc0-993e-a0c871d43867	2	10	f	\N	\N
cfc52ed8-5443-45b2-b8ca-6ed9bbd666ff	\N	auth-spnego	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	a6965485-5262-4bc0-993e-a0c871d43867	3	20	f	\N	\N
fb0cbc6b-28e8-4402-8d10-cfee50ad3f0d	\N	identity-provider-redirector	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	a6965485-5262-4bc0-993e-a0c871d43867	2	25	f	\N	\N
ea1d0961-c749-408c-bc32-2409574b6f2a	\N	\N	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	a6965485-5262-4bc0-993e-a0c871d43867	2	30	t	5b11812a-1c34-4f7d-a2eb-b71af1929bde	\N
87d81553-09c4-4271-a177-1daa7853a20e	\N	auth-username-password-form	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	5b11812a-1c34-4f7d-a2eb-b71af1929bde	0	10	f	\N	\N
3ad5d692-a5ba-4c8b-a69d-71f094b41901	\N	\N	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	5b11812a-1c34-4f7d-a2eb-b71af1929bde	1	20	t	cbd5f244-f1e2-4c26-8b0b-464c7ba17bdf	\N
d29d4d0a-8296-47de-a472-0fe9dbf7e922	\N	conditional-user-configured	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	cbd5f244-f1e2-4c26-8b0b-464c7ba17bdf	0	10	f	\N	\N
06a563e0-62a8-448d-af2b-79860ec73d7a	\N	auth-otp-form	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	cbd5f244-f1e2-4c26-8b0b-464c7ba17bdf	0	20	f	\N	\N
163fd85e-0e83-49af-bd99-f3b3f9c44e7d	\N	direct-grant-validate-username	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	cd5cecca-cd2b-4968-a74f-179c7e0ebf5c	0	10	f	\N	\N
d837e3fd-99c7-4af0-9acc-9553a3242772	\N	direct-grant-validate-password	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	cd5cecca-cd2b-4968-a74f-179c7e0ebf5c	0	20	f	\N	\N
cbb6d112-7b31-4a4f-ac87-e74350eaf3b0	\N	\N	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	cd5cecca-cd2b-4968-a74f-179c7e0ebf5c	1	30	t	e687cb58-b0e0-48ac-8628-9765d3081cbe	\N
8c369238-2453-41a7-982b-c8654d04b142	\N	conditional-user-configured	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	e687cb58-b0e0-48ac-8628-9765d3081cbe	0	10	f	\N	\N
20c9738c-9bf4-4828-911e-a5cf7b27ebcb	\N	direct-grant-validate-otp	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	e687cb58-b0e0-48ac-8628-9765d3081cbe	0	20	f	\N	\N
ffd4698f-7f67-4679-b699-e9438c5fdc39	\N	registration-page-form	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	8ace4d62-8714-4538-a108-239a49c35ea5	0	10	t	e7fdf08c-9c2f-4cb3-a9f4-1731cc81114f	\N
b5ec7dec-bd9d-4ee9-98da-62566becf5ef	\N	registration-user-creation	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	e7fdf08c-9c2f-4cb3-a9f4-1731cc81114f	0	20	f	\N	\N
f6aca9dc-a195-488c-b3b5-4c945d282378	\N	registration-profile-action	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	e7fdf08c-9c2f-4cb3-a9f4-1731cc81114f	0	40	f	\N	\N
343f93d2-d2f0-4936-829b-0ae424ff71fc	\N	auth-cookie	dd9bcc37-69c8-4b94-9737-50788f40287c	2b26047b-e456-46ae-9aa1-41dffd6b9789	2	10	f	\N	\N
e80ae6a9-79b8-4dcf-83b2-b3c116fc719d	\N	auth-spnego	dd9bcc37-69c8-4b94-9737-50788f40287c	2b26047b-e456-46ae-9aa1-41dffd6b9789	3	20	f	\N	\N
5c3576b4-e13f-4d98-9059-5fa25142bf7e	\N	identity-provider-redirector	dd9bcc37-69c8-4b94-9737-50788f40287c	2b26047b-e456-46ae-9aa1-41dffd6b9789	2	25	f	\N	\N
a295cd78-7c54-4001-8294-a14df7dac8f2	\N	\N	dd9bcc37-69c8-4b94-9737-50788f40287c	2b26047b-e456-46ae-9aa1-41dffd6b9789	2	30	t	5f7b4a9b-5263-40b1-ab6a-c733ceb15388	\N
c243b38c-b851-4fcb-ab95-242e6c19cc1b	\N	auth-username-password-form	dd9bcc37-69c8-4b94-9737-50788f40287c	5f7b4a9b-5263-40b1-ab6a-c733ceb15388	0	10	f	\N	\N
c6dc2fa0-f021-4cc1-ba15-8d30fe8decdb	\N	\N	dd9bcc37-69c8-4b94-9737-50788f40287c	5f7b4a9b-5263-40b1-ab6a-c733ceb15388	1	20	t	b19972f1-17aa-4c36-87a0-d7225ed7f09f	\N
8cdf4518-09c4-4a57-8ac2-44bb96d8a251	\N	conditional-user-configured	dd9bcc37-69c8-4b94-9737-50788f40287c	b19972f1-17aa-4c36-87a0-d7225ed7f09f	0	10	f	\N	\N
8c6a2c05-463f-4d45-a90f-c6eaff25853a	\N	auth-otp-form	dd9bcc37-69c8-4b94-9737-50788f40287c	b19972f1-17aa-4c36-87a0-d7225ed7f09f	0	20	f	\N	\N
ffb25ea1-6e2f-4541-bbd4-550d67d6a775	\N	direct-grant-validate-username	dd9bcc37-69c8-4b94-9737-50788f40287c	6f62dcab-77fd-47ca-8417-f1eea131056b	0	10	f	\N	\N
7448787a-3bc1-42e4-83b4-7c067e4c2fa3	\N	direct-grant-validate-password	dd9bcc37-69c8-4b94-9737-50788f40287c	6f62dcab-77fd-47ca-8417-f1eea131056b	0	20	f	\N	\N
4cf87f82-31f0-45dc-989d-27165dc9b8d4	\N	\N	dd9bcc37-69c8-4b94-9737-50788f40287c	6f62dcab-77fd-47ca-8417-f1eea131056b	1	30	t	5d6ffee9-681c-4ae0-ba12-1090c54e3875	\N
6ab0e6a6-51d6-44d8-bf81-2a8fd4a4e6d4	\N	conditional-user-configured	dd9bcc37-69c8-4b94-9737-50788f40287c	5d6ffee9-681c-4ae0-ba12-1090c54e3875	0	10	f	\N	\N
073f3649-2eac-4936-babc-c95d1309b9f5	\N	direct-grant-validate-otp	dd9bcc37-69c8-4b94-9737-50788f40287c	5d6ffee9-681c-4ae0-ba12-1090c54e3875	0	20	f	\N	\N
9277f153-6c6f-403d-a500-3b2e78a41fbf	\N	registration-page-form	dd9bcc37-69c8-4b94-9737-50788f40287c	af075028-a3fb-4a27-a5b1-8e1592d2becb	0	10	t	b0998123-b1c7-4b62-9841-c920a9659315	\N
87bba7ae-b5cf-4f7a-bb3c-1b6bdbe6b45d	\N	registration-user-creation	dd9bcc37-69c8-4b94-9737-50788f40287c	b0998123-b1c7-4b62-9841-c920a9659315	0	20	f	\N	\N
199767bb-718d-40c8-9352-460d98b5beb0	\N	registration-profile-action	dd9bcc37-69c8-4b94-9737-50788f40287c	b0998123-b1c7-4b62-9841-c920a9659315	0	40	f	\N	\N
5b353f77-a422-46b9-8f78-c05514327a0f	\N	registration-password-action	dd9bcc37-69c8-4b94-9737-50788f40287c	b0998123-b1c7-4b62-9841-c920a9659315	0	50	f	\N	\N
bbcbc462-2cca-466f-88ab-414ae7b12a5c	\N	registration-recaptcha-action	dd9bcc37-69c8-4b94-9737-50788f40287c	b0998123-b1c7-4b62-9841-c920a9659315	3	60	f	\N	\N
042c670f-f399-4534-8a75-713d6899bd6a	\N	reset-credentials-choose-user	dd9bcc37-69c8-4b94-9737-50788f40287c	449dc9b3-6836-441d-9513-b4973309e956	0	10	f	\N	\N
7061b24d-9365-4780-843c-513838005f4a	\N	reset-credential-email	dd9bcc37-69c8-4b94-9737-50788f40287c	449dc9b3-6836-441d-9513-b4973309e956	0	20	f	\N	\N
afaee47f-19bd-49d0-9a00-175dc6364dd2	\N	reset-password	dd9bcc37-69c8-4b94-9737-50788f40287c	449dc9b3-6836-441d-9513-b4973309e956	0	30	f	\N	\N
bef19e92-8c73-4195-8b4a-505df9ad3d6e	\N	\N	dd9bcc37-69c8-4b94-9737-50788f40287c	449dc9b3-6836-441d-9513-b4973309e956	1	40	t	cecc37f4-172f-43cb-a3ea-1ebfb485d38e	\N
e893ddde-7adb-4ca3-81d6-e2a2910bdc51	\N	conditional-user-configured	dd9bcc37-69c8-4b94-9737-50788f40287c	cecc37f4-172f-43cb-a3ea-1ebfb485d38e	0	10	f	\N	\N
cec44c2b-a021-4667-8a3f-1fcfa37da3bc	\N	reset-otp	dd9bcc37-69c8-4b94-9737-50788f40287c	cecc37f4-172f-43cb-a3ea-1ebfb485d38e	0	20	f	\N	\N
10831aba-6b53-40bf-8b61-5aad3ef43d18	\N	client-secret	dd9bcc37-69c8-4b94-9737-50788f40287c	b5092881-7757-41ce-9a68-f18907dd1fb8	2	10	f	\N	\N
b50ee7d3-9dc9-4192-9a1b-bd5214a6b678	\N	client-jwt	dd9bcc37-69c8-4b94-9737-50788f40287c	b5092881-7757-41ce-9a68-f18907dd1fb8	2	20	f	\N	\N
7f51b23a-989a-4a9e-b65b-796699b15fab	\N	client-secret-jwt	dd9bcc37-69c8-4b94-9737-50788f40287c	b5092881-7757-41ce-9a68-f18907dd1fb8	2	30	f	\N	\N
312ecb00-663f-4eb8-800b-9156ed031ebd	\N	client-x509	dd9bcc37-69c8-4b94-9737-50788f40287c	b5092881-7757-41ce-9a68-f18907dd1fb8	2	40	f	\N	\N
3f18405e-d6a4-4c11-aa97-97896ab15805	\N	idp-review-profile	dd9bcc37-69c8-4b94-9737-50788f40287c	850ee7ac-6ee9-4bd6-b760-3d5f92d94962	0	10	f	\N	a25bf5e8-e029-48fb-a1cd-5a921d3fcb54
0e13d4c7-5c23-4d27-9ec4-aad8434718b8	\N	\N	dd9bcc37-69c8-4b94-9737-50788f40287c	850ee7ac-6ee9-4bd6-b760-3d5f92d94962	0	20	t	fc75216c-09c0-4fd7-8c1e-e3e9fccb2bab	\N
2297ba98-18a9-40c3-83db-b177bb80180a	\N	idp-create-user-if-unique	dd9bcc37-69c8-4b94-9737-50788f40287c	fc75216c-09c0-4fd7-8c1e-e3e9fccb2bab	2	10	f	\N	f4eb483d-7985-4626-97f5-9a27409b0e55
7cdc4e9a-f19b-4aa6-85f3-9f9a7a420df5	\N	\N	dd9bcc37-69c8-4b94-9737-50788f40287c	fc75216c-09c0-4fd7-8c1e-e3e9fccb2bab	2	20	t	0d6fae27-15d4-40f1-80f1-c3a8ef062463	\N
04f2d31d-a9b1-4ea3-ac9a-2d9b1ace241f	\N	idp-confirm-link	dd9bcc37-69c8-4b94-9737-50788f40287c	0d6fae27-15d4-40f1-80f1-c3a8ef062463	0	10	f	\N	\N
e6da70e1-4c41-43a8-a7bd-059a997b509e	\N	\N	dd9bcc37-69c8-4b94-9737-50788f40287c	0d6fae27-15d4-40f1-80f1-c3a8ef062463	0	20	t	ed50bcf9-930b-4902-97f6-70bc08fef038	\N
272357d5-3415-465d-ac26-cfe5b51afbdc	\N	idp-email-verification	dd9bcc37-69c8-4b94-9737-50788f40287c	ed50bcf9-930b-4902-97f6-70bc08fef038	2	10	f	\N	\N
ebe04b3e-f4a0-4ba7-be85-55e5bf441022	\N	\N	dd9bcc37-69c8-4b94-9737-50788f40287c	ed50bcf9-930b-4902-97f6-70bc08fef038	2	20	t	810d5379-a712-4948-8366-90d74d2527bf	\N
d95b8ee0-4261-4e61-a35c-154f799ee4b1	\N	idp-username-password-form	dd9bcc37-69c8-4b94-9737-50788f40287c	810d5379-a712-4948-8366-90d74d2527bf	0	10	f	\N	\N
fff6207a-da49-4e05-9451-236fc0cc1ee0	\N	\N	dd9bcc37-69c8-4b94-9737-50788f40287c	810d5379-a712-4948-8366-90d74d2527bf	1	20	t	ddef0fd0-c281-4a41-b4e6-e47ed38779ea	\N
08b695c2-a1b8-4adf-bec5-ad57c84cb3ad	\N	conditional-user-configured	dd9bcc37-69c8-4b94-9737-50788f40287c	ddef0fd0-c281-4a41-b4e6-e47ed38779ea	0	10	f	\N	\N
286a88fd-5d37-4302-b6fc-5e3857c9a702	\N	auth-otp-form	dd9bcc37-69c8-4b94-9737-50788f40287c	ddef0fd0-c281-4a41-b4e6-e47ed38779ea	0	20	f	\N	\N
f0308bc6-321b-401f-b1bc-d1996a4bd8ed	\N	http-basic-authenticator	dd9bcc37-69c8-4b94-9737-50788f40287c	a7407ee6-7324-46aa-8812-76b9dac58a8d	0	10	f	\N	\N
7707a3b2-2f2c-4189-bfa8-4c02b324312c	\N	docker-http-basic-authenticator	dd9bcc37-69c8-4b94-9737-50788f40287c	bb3039ac-e334-4b97-8314-be78a374d6d6	0	10	f	\N	\N
20d4dc15-3cd5-4351-9620-7063cd48f2a1	\N	no-cookie-redirect	dd9bcc37-69c8-4b94-9737-50788f40287c	0ddb8751-69d6-40b9-85d3-fcf735d6470a	0	10	f	\N	\N
e4afef1b-cd48-417a-bed5-d91cd6898136	\N	\N	dd9bcc37-69c8-4b94-9737-50788f40287c	0ddb8751-69d6-40b9-85d3-fcf735d6470a	0	20	t	3db19e0c-b73c-42a4-b5dc-53a1bc40400d	\N
15a40d5a-5b28-4223-ab31-70471a9e01c2	\N	basic-auth	dd9bcc37-69c8-4b94-9737-50788f40287c	3db19e0c-b73c-42a4-b5dc-53a1bc40400d	0	10	f	\N	\N
b190ec18-399a-4278-9d71-bd135e0395a3	\N	basic-auth-otp	dd9bcc37-69c8-4b94-9737-50788f40287c	3db19e0c-b73c-42a4-b5dc-53a1bc40400d	3	20	f	\N	\N
cc943233-9c96-4f5d-93b1-224a44159d43	\N	auth-spnego	dd9bcc37-69c8-4b94-9737-50788f40287c	3db19e0c-b73c-42a4-b5dc-53a1bc40400d	3	30	f	\N	\N
36d812b6-5490-4df2-87e1-125b29b5d2b7	\N	registration-password-action	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	e7fdf08c-9c2f-4cb3-a9f4-1731cc81114f	0	50	f	\N	\N
c310c177-2ccf-4042-bfd7-64309ecbb9a0	\N	registration-recaptcha-action	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	e7fdf08c-9c2f-4cb3-a9f4-1731cc81114f	3	60	f	\N	\N
9b9fa39d-a394-4f83-90e4-11137e8c3d0f	\N	reset-credentials-choose-user	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	c6a8f381-0a39-422d-8692-22d867bec550	0	10	f	\N	\N
c1921c3e-e24d-4690-a8b6-a97230e35a2b	\N	reset-credential-email	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	c6a8f381-0a39-422d-8692-22d867bec550	0	20	f	\N	\N
81a9ef59-0adf-4ae5-8899-b2674334c16e	\N	reset-password	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	c6a8f381-0a39-422d-8692-22d867bec550	0	30	f	\N	\N
a239fa9e-ba82-4d9c-95f8-ed4400ad4f6b	\N	\N	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	c6a8f381-0a39-422d-8692-22d867bec550	1	40	t	86608168-031c-4569-9ca2-4d683e992336	\N
758a9da1-656b-45c7-be69-d8e61e267f85	\N	conditional-user-configured	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	86608168-031c-4569-9ca2-4d683e992336	0	10	f	\N	\N
b28d64c8-1876-405d-b4f6-91b80ce05c14	\N	reset-otp	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	86608168-031c-4569-9ca2-4d683e992336	0	20	f	\N	\N
14f7df92-69d3-4f2e-a94d-9b4e16526629	\N	client-secret	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	3ff7dc4e-ab24-4139-a72b-57f9055cb352	2	10	f	\N	\N
0a7f9605-c968-41a1-9562-03dcd06a8ee3	\N	client-jwt	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	3ff7dc4e-ab24-4139-a72b-57f9055cb352	2	20	f	\N	\N
27d573cd-466a-4f22-b697-eb4b4b8476f5	\N	client-secret-jwt	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	3ff7dc4e-ab24-4139-a72b-57f9055cb352	2	30	f	\N	\N
22f66e58-40ec-46c2-8f27-f7b59472be44	\N	client-x509	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	3ff7dc4e-ab24-4139-a72b-57f9055cb352	2	40	f	\N	\N
30d7ccad-1cec-4b2e-96c0-f20b2176d63d	\N	idp-review-profile	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	365404ea-117d-4116-be38-49a99ba8876f	0	10	f	\N	d80a59b3-26d2-445e-842f-3ceb379a9a44
eca31983-a3e6-41f3-94d7-26e2b59de08b	\N	\N	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	365404ea-117d-4116-be38-49a99ba8876f	0	20	t	96b5ee0c-aa01-4d08-9770-f6212d742993	\N
c11bf444-e053-4227-b990-626d797f441b	\N	idp-create-user-if-unique	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	96b5ee0c-aa01-4d08-9770-f6212d742993	2	10	f	\N	751dde14-2687-45fe-8481-44e7d2b2cfce
8d56e0ce-4de0-40ad-b579-25898cd8ff70	\N	\N	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	96b5ee0c-aa01-4d08-9770-f6212d742993	2	20	t	508d7679-dec9-4e54-8b8e-e0ea15ac1840	\N
ff212fdb-1b43-4cf8-932d-f24e51beb8cd	\N	idp-confirm-link	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	508d7679-dec9-4e54-8b8e-e0ea15ac1840	0	10	f	\N	\N
547e028f-211a-43bf-9def-c526bda0d945	\N	\N	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	508d7679-dec9-4e54-8b8e-e0ea15ac1840	0	20	t	bb27f59a-9217-4900-92b6-ef78dc101208	\N
309e9b44-d2cb-4e86-84c5-19e42487974c	\N	idp-email-verification	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	bb27f59a-9217-4900-92b6-ef78dc101208	2	10	f	\N	\N
9e7a772c-f8e8-4643-9e3d-7b83d5d615d6	\N	\N	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	bb27f59a-9217-4900-92b6-ef78dc101208	2	20	t	d801c19e-bc87-48ee-b22d-ae04503f3613	\N
62799430-c0a3-41cf-8ba7-f79fac53bcc8	\N	idp-username-password-form	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	d801c19e-bc87-48ee-b22d-ae04503f3613	0	10	f	\N	\N
3cb40e6d-02aa-4d08-9bdc-216ec85aa0d8	\N	\N	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	d801c19e-bc87-48ee-b22d-ae04503f3613	1	20	t	97e65e29-b03e-45b2-a3e1-30a72ef9f72e	\N
e1124f71-0c2f-4ac9-993a-ec8ef66097d4	\N	conditional-user-configured	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	125bba9a-9c29-4e2f-b43e-3225b821c47d	0	10	f	\N	\N
6d56d71e-4190-41a3-a0b4-7bb83168565d	\N	reset-otp	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	125bba9a-9c29-4e2f-b43e-3225b821c47d	0	20	f	\N	\N
131e1c76-c843-4360-adb2-c75fbebcf526	\N	client-secret	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	038ce04b-a210-4a86-9475-75eff4e22db8	2	10	f	\N	\N
d481bc9e-ca7d-465b-ac98-1b975db26758	\N	client-jwt	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	038ce04b-a210-4a86-9475-75eff4e22db8	2	20	f	\N	\N
7c066807-09af-43d0-9de5-717a27601dc9	\N	client-secret-jwt	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	038ce04b-a210-4a86-9475-75eff4e22db8	2	30	f	\N	\N
ac6ec633-2030-4ba6-b9c2-6a532123fac6	\N	client-x509	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	038ce04b-a210-4a86-9475-75eff4e22db8	2	40	f	\N	\N
0c9d2c9c-5566-4fab-8cad-54e5b426df09	\N	idp-review-profile	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	abb930c9-0051-4ce8-ac4c-7606724ee62d	0	10	f	\N	c08ba6c4-82f3-40f3-b67c-37cd7ec2467a
f5e1096e-5ad3-4511-9d3c-7b1b758ec4fc	\N	\N	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	abb930c9-0051-4ce8-ac4c-7606724ee62d	0	20	t	8abdde64-e4bd-42d9-8ca0-dc4d8b8dee44	\N
9c7e08fd-5f00-4ead-a548-68c71d961e53	\N	idp-create-user-if-unique	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	8abdde64-e4bd-42d9-8ca0-dc4d8b8dee44	2	10	f	\N	95f67227-67d5-4ce5-adf5-143a416701da
22e7ba03-8578-46e5-b42a-54249048b923	\N	\N	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	8abdde64-e4bd-42d9-8ca0-dc4d8b8dee44	2	20	t	da8fa68f-0470-4f6b-9823-5a3820e4597f	\N
39c1fe0e-3fc4-409d-9d0c-6f415f582181	\N	idp-confirm-link	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	da8fa68f-0470-4f6b-9823-5a3820e4597f	0	10	f	\N	\N
e35bcafc-21e9-4734-b052-337dc8fc23d8	\N	\N	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	da8fa68f-0470-4f6b-9823-5a3820e4597f	0	20	t	560e25fe-9686-4573-a758-9718078eb36c	\N
1daacd4c-2079-4fb8-a522-6fc98d4c9da8	\N	idp-email-verification	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	560e25fe-9686-4573-a758-9718078eb36c	2	10	f	\N	\N
8e244598-6718-4014-8360-2390e0d8fda5	\N	\N	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	560e25fe-9686-4573-a758-9718078eb36c	2	20	t	80115951-9361-4093-95a7-620c5fb51ac3	\N
255d4987-1c28-4091-a48b-258434a582ee	\N	idp-username-password-form	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	80115951-9361-4093-95a7-620c5fb51ac3	0	10	f	\N	\N
61535184-5e0e-47ce-8690-93ef1d0dc86f	\N	\N	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	80115951-9361-4093-95a7-620c5fb51ac3	1	20	t	09bdb3b9-79c2-4dcc-af6c-0c254ee5473b	\N
ae846164-a0f0-4190-89c5-9d07ca0a8138	\N	conditional-user-configured	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	09bdb3b9-79c2-4dcc-af6c-0c254ee5473b	0	10	f	\N	\N
b6eaef9c-1bc7-468c-ba06-583cd41f8733	\N	auth-otp-form	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	09bdb3b9-79c2-4dcc-af6c-0c254ee5473b	0	20	f	\N	\N
4f200412-1765-4df6-897e-4003ea9fe90f	\N	http-basic-authenticator	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	0b435bab-c8a1-4e8a-a73e-8dcea2ff8dc5	0	10	f	\N	\N
0d9e2e65-71b2-4f91-bc26-2dcbb8a06532	\N	docker-http-basic-authenticator	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	90a58617-21a8-4f35-a88a-a4faf1c0e322	0	10	f	\N	\N
aa1e88d4-8466-49c6-8395-7c34fc80351a	\N	no-cookie-redirect	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	9f6a791d-7fd8-4433-a9ab-84eaf4ebcb1a	0	10	f	\N	\N
39a2c49b-dc55-4b28-a6e8-2cf7b2ceee22	\N	\N	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	9f6a791d-7fd8-4433-a9ab-84eaf4ebcb1a	0	20	t	a1a619ad-1ae5-41be-a3ef-3e56da55f4a7	\N
135e81ef-9fc2-420c-bf49-6433bc6ce914	\N	basic-auth	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	a1a619ad-1ae5-41be-a3ef-3e56da55f4a7	0	10	f	\N	\N
9f982d8b-2c7f-43e4-9559-4cf001314976	\N	basic-auth-otp	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	a1a619ad-1ae5-41be-a3ef-3e56da55f4a7	3	20	f	\N	\N
9ddebae5-0e06-4e61-87da-20c815ec02d0	\N	auth-spnego	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	a1a619ad-1ae5-41be-a3ef-3e56da55f4a7	3	30	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
e29f11ca-90ce-4201-8519-c7b595b4b24d	browser	browser based authentication	7b27a11d-121a-4360-960c-3ea6deb0ac35	basic-flow	t	t
46692cc4-389c-4461-b546-5dc371ab7615	forms	Username, password, otp and other auth forms.	7b27a11d-121a-4360-960c-3ea6deb0ac35	basic-flow	f	t
3ecbafda-e839-44c3-bf8f-a403546058f9	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	7b27a11d-121a-4360-960c-3ea6deb0ac35	basic-flow	f	t
1df96ad9-a2ad-4514-9844-cd865d818da7	direct grant	OpenID Connect Resource Owner Grant	7b27a11d-121a-4360-960c-3ea6deb0ac35	basic-flow	t	t
a60a8177-94d6-4ce5-974a-41f2b2d82173	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	7b27a11d-121a-4360-960c-3ea6deb0ac35	basic-flow	f	t
356af88b-8aed-4700-8bf2-47a15a28dd69	registration	registration flow	7b27a11d-121a-4360-960c-3ea6deb0ac35	basic-flow	t	t
bb6230d6-a350-4455-bf7c-a829ec63ba90	registration form	registration form	7b27a11d-121a-4360-960c-3ea6deb0ac35	form-flow	f	t
d5cb4658-e2fd-45fc-87a4-8c10f1504090	reset credentials	Reset credentials for a user if they forgot their password or something	7b27a11d-121a-4360-960c-3ea6deb0ac35	basic-flow	t	t
9cfb885b-0e07-4bcc-9517-3f0531bcd498	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	7b27a11d-121a-4360-960c-3ea6deb0ac35	basic-flow	f	t
053b3985-51b0-4a4f-9143-ff14a24dedfb	clients	Base authentication for clients	7b27a11d-121a-4360-960c-3ea6deb0ac35	client-flow	t	t
806a8e4a-101d-40f5-b7fe-af15de1b6ec7	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	7b27a11d-121a-4360-960c-3ea6deb0ac35	basic-flow	t	t
43eb6de3-139c-4f53-a201-887e5f08ef8b	User creation or linking	Flow for the existing/non-existing user alternatives	7b27a11d-121a-4360-960c-3ea6deb0ac35	basic-flow	f	t
b8720fe7-2972-4035-8da3-2765dd7ab368	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	7b27a11d-121a-4360-960c-3ea6deb0ac35	basic-flow	f	t
f699e358-970c-4e61-90ce-1d62ac051d4e	Account verification options	Method with which to verity the existing account	7b27a11d-121a-4360-960c-3ea6deb0ac35	basic-flow	f	t
01bf3f28-1b9c-46d8-b308-fe6a930ec4a2	Verify Existing Account by Re-authentication	Reauthentication of existing account	7b27a11d-121a-4360-960c-3ea6deb0ac35	basic-flow	f	t
31f3ea99-c468-46dd-83a5-e85dcc499e9d	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	7b27a11d-121a-4360-960c-3ea6deb0ac35	basic-flow	f	t
191e7cb4-503f-472a-a409-391ae8c3f5dc	saml ecp	SAML ECP Profile Authentication Flow	7b27a11d-121a-4360-960c-3ea6deb0ac35	basic-flow	t	t
29895d82-4ec3-45d1-b36a-14354d0e5172	docker auth	Used by Docker clients to authenticate against the IDP	7b27a11d-121a-4360-960c-3ea6deb0ac35	basic-flow	t	t
fa566bdc-6396-4757-88d7-62f65c6909d5	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	7b27a11d-121a-4360-960c-3ea6deb0ac35	basic-flow	t	t
c4040153-35bc-4058-8e13-5be5d24b76a0	Authentication Options	Authentication options.	7b27a11d-121a-4360-960c-3ea6deb0ac35	basic-flow	f	t
829b4dc2-aecc-4564-9525-c6febc6c909a	browser	browser based authentication	aef5c390-9834-4cad-83be-4efe22893758	basic-flow	t	t
4497f6e9-4894-4e4f-a5cf-fe3722ae5769	forms	Username, password, otp and other auth forms.	aef5c390-9834-4cad-83be-4efe22893758	basic-flow	f	t
bdaee086-4b41-44c4-9978-e30ed70871a9	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	aef5c390-9834-4cad-83be-4efe22893758	basic-flow	f	t
1361e062-8130-484a-ad92-a224025efeec	direct grant	OpenID Connect Resource Owner Grant	aef5c390-9834-4cad-83be-4efe22893758	basic-flow	t	t
cc9561cd-c559-462e-8efb-f6a83afa67f4	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	aef5c390-9834-4cad-83be-4efe22893758	basic-flow	f	t
ad3bef9e-4215-465e-ba18-619ab2eb0f99	registration	registration flow	aef5c390-9834-4cad-83be-4efe22893758	basic-flow	t	t
f7466d0c-fbbb-485f-9312-565da5b673c0	registration form	registration form	aef5c390-9834-4cad-83be-4efe22893758	form-flow	f	t
4c47edc1-f056-42a0-ad39-8214100c9b3a	reset credentials	Reset credentials for a user if they forgot their password or something	aef5c390-9834-4cad-83be-4efe22893758	basic-flow	t	t
fe9854b1-54ac-478a-8cb2-9fe1a1ab7b68	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	aef5c390-9834-4cad-83be-4efe22893758	basic-flow	f	t
bf41faa2-c8f5-4110-9f69-7f60ef2b5b97	clients	Base authentication for clients	aef5c390-9834-4cad-83be-4efe22893758	client-flow	t	t
643d87fa-9358-46f0-b44f-e6c8df85cd64	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	aef5c390-9834-4cad-83be-4efe22893758	basic-flow	t	t
db1b0579-dab5-4cb1-b3a3-1625eec83d31	User creation or linking	Flow for the existing/non-existing user alternatives	aef5c390-9834-4cad-83be-4efe22893758	basic-flow	f	t
7676afb6-307d-437e-aba4-5a9c658e0e31	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	aef5c390-9834-4cad-83be-4efe22893758	basic-flow	f	t
17240ad7-9bf9-41c3-89d0-98b532264e81	Account verification options	Method with which to verity the existing account	aef5c390-9834-4cad-83be-4efe22893758	basic-flow	f	t
297940b7-704a-4aad-a536-9eb1c7d36634	Verify Existing Account by Re-authentication	Reauthentication of existing account	aef5c390-9834-4cad-83be-4efe22893758	basic-flow	f	t
85c2fbcd-c94f-4586-817f-16026ae9f849	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	aef5c390-9834-4cad-83be-4efe22893758	basic-flow	f	t
dd582dc7-2b57-4cdc-9007-6b95df085681	saml ecp	SAML ECP Profile Authentication Flow	aef5c390-9834-4cad-83be-4efe22893758	basic-flow	t	t
1afcb00a-28c4-4812-a7d2-2a20f9af5cf4	docker auth	Used by Docker clients to authenticate against the IDP	aef5c390-9834-4cad-83be-4efe22893758	basic-flow	t	t
d35a5208-59db-4fae-9621-310ba0659387	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	aef5c390-9834-4cad-83be-4efe22893758	basic-flow	t	t
5740e58b-8eb0-49d8-8024-a31c226333ff	Authentication Options	Authentication options.	aef5c390-9834-4cad-83be-4efe22893758	basic-flow	f	t
2b26047b-e456-46ae-9aa1-41dffd6b9789	browser	browser based authentication	dd9bcc37-69c8-4b94-9737-50788f40287c	basic-flow	t	t
5f7b4a9b-5263-40b1-ab6a-c733ceb15388	forms	Username, password, otp and other auth forms.	dd9bcc37-69c8-4b94-9737-50788f40287c	basic-flow	f	t
b19972f1-17aa-4c36-87a0-d7225ed7f09f	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	dd9bcc37-69c8-4b94-9737-50788f40287c	basic-flow	f	t
6f62dcab-77fd-47ca-8417-f1eea131056b	direct grant	OpenID Connect Resource Owner Grant	dd9bcc37-69c8-4b94-9737-50788f40287c	basic-flow	t	t
5d6ffee9-681c-4ae0-ba12-1090c54e3875	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	dd9bcc37-69c8-4b94-9737-50788f40287c	basic-flow	f	t
af075028-a3fb-4a27-a5b1-8e1592d2becb	registration	registration flow	dd9bcc37-69c8-4b94-9737-50788f40287c	basic-flow	t	t
b0998123-b1c7-4b62-9841-c920a9659315	registration form	registration form	dd9bcc37-69c8-4b94-9737-50788f40287c	form-flow	f	t
449dc9b3-6836-441d-9513-b4973309e956	reset credentials	Reset credentials for a user if they forgot their password or something	dd9bcc37-69c8-4b94-9737-50788f40287c	basic-flow	t	t
cecc37f4-172f-43cb-a3ea-1ebfb485d38e	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	dd9bcc37-69c8-4b94-9737-50788f40287c	basic-flow	f	t
b5092881-7757-41ce-9a68-f18907dd1fb8	clients	Base authentication for clients	dd9bcc37-69c8-4b94-9737-50788f40287c	client-flow	t	t
850ee7ac-6ee9-4bd6-b760-3d5f92d94962	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	dd9bcc37-69c8-4b94-9737-50788f40287c	basic-flow	t	t
fc75216c-09c0-4fd7-8c1e-e3e9fccb2bab	User creation or linking	Flow for the existing/non-existing user alternatives	dd9bcc37-69c8-4b94-9737-50788f40287c	basic-flow	f	t
0d6fae27-15d4-40f1-80f1-c3a8ef062463	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	dd9bcc37-69c8-4b94-9737-50788f40287c	basic-flow	f	t
ed50bcf9-930b-4902-97f6-70bc08fef038	Account verification options	Method with which to verity the existing account	dd9bcc37-69c8-4b94-9737-50788f40287c	basic-flow	f	t
810d5379-a712-4948-8366-90d74d2527bf	Verify Existing Account by Re-authentication	Reauthentication of existing account	dd9bcc37-69c8-4b94-9737-50788f40287c	basic-flow	f	t
ddef0fd0-c281-4a41-b4e6-e47ed38779ea	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	dd9bcc37-69c8-4b94-9737-50788f40287c	basic-flow	f	t
a7407ee6-7324-46aa-8812-76b9dac58a8d	saml ecp	SAML ECP Profile Authentication Flow	dd9bcc37-69c8-4b94-9737-50788f40287c	basic-flow	t	t
bb3039ac-e334-4b97-8314-be78a374d6d6	docker auth	Used by Docker clients to authenticate against the IDP	dd9bcc37-69c8-4b94-9737-50788f40287c	basic-flow	t	t
0ddb8751-69d6-40b9-85d3-fcf735d6470a	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	dd9bcc37-69c8-4b94-9737-50788f40287c	basic-flow	t	t
3db19e0c-b73c-42a4-b5dc-53a1bc40400d	Authentication Options	Authentication options.	dd9bcc37-69c8-4b94-9737-50788f40287c	basic-flow	f	t
a6965485-5262-4bc0-993e-a0c871d43867	browser	browser based authentication	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	basic-flow	t	t
5b11812a-1c34-4f7d-a2eb-b71af1929bde	forms	Username, password, otp and other auth forms.	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	basic-flow	f	t
cbd5f244-f1e2-4c26-8b0b-464c7ba17bdf	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	basic-flow	f	t
cd5cecca-cd2b-4968-a74f-179c7e0ebf5c	direct grant	OpenID Connect Resource Owner Grant	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	basic-flow	t	t
e687cb58-b0e0-48ac-8628-9765d3081cbe	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	basic-flow	f	t
8ace4d62-8714-4538-a108-239a49c35ea5	registration	registration flow	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	basic-flow	t	t
e7fdf08c-9c2f-4cb3-a9f4-1731cc81114f	registration form	registration form	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	form-flow	f	t
c6a8f381-0a39-422d-8692-22d867bec550	reset credentials	Reset credentials for a user if they forgot their password or something	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	basic-flow	t	t
86608168-031c-4569-9ca2-4d683e992336	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	basic-flow	f	t
3ff7dc4e-ab24-4139-a72b-57f9055cb352	clients	Base authentication for clients	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	client-flow	t	t
365404ea-117d-4116-be38-49a99ba8876f	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	basic-flow	t	t
96b5ee0c-aa01-4d08-9770-f6212d742993	User creation or linking	Flow for the existing/non-existing user alternatives	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	basic-flow	f	t
508d7679-dec9-4e54-8b8e-e0ea15ac1840	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	basic-flow	f	t
bb27f59a-9217-4900-92b6-ef78dc101208	Account verification options	Method with which to verity the existing account	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	basic-flow	f	t
d801c19e-bc87-48ee-b22d-ae04503f3613	Verify Existing Account by Re-authentication	Reauthentication of existing account	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	basic-flow	f	t
97e65e29-b03e-45b2-a3e1-30a72ef9f72e	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	basic-flow	f	t
62d5f61c-3e2d-4a02-a90a-ef39df58b007	saml ecp	SAML ECP Profile Authentication Flow	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	basic-flow	t	t
4f5178cc-6084-4a21-8946-c3248dcaa318	docker auth	Used by Docker clients to authenticate against the IDP	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	basic-flow	t	t
26a8932c-0a1e-4824-bf93-83a6fbb24b92	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	basic-flow	t	t
8ade37ed-1649-44ea-a623-25905a5c21d3	Authentication Options	Authentication options.	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	basic-flow	f	t
78b93566-086f-4d3c-90af-a38b3a279cfb	browser	browser based authentication	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	basic-flow	t	t
c53be5d2-239a-437e-8656-4e5013664a29	forms	Username, password, otp and other auth forms.	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	basic-flow	f	t
c5c45111-7f03-4682-a7f8-5b6dc66f820f	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	basic-flow	f	t
45e3c9a0-7314-420a-be52-034ca6986cd4	direct grant	OpenID Connect Resource Owner Grant	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	basic-flow	t	t
32e0e486-01ae-46a4-bfe4-68b967e26f32	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	basic-flow	f	t
aa79f132-b27e-46a8-81dd-fb371a863982	registration	registration flow	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	basic-flow	t	t
b105abd4-ffd1-4bee-83e0-0ea0b93b02f9	registration form	registration form	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	form-flow	f	t
911ef2e4-b0f0-4414-a156-8be25524f84b	reset credentials	Reset credentials for a user if they forgot their password or something	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	basic-flow	t	t
125bba9a-9c29-4e2f-b43e-3225b821c47d	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	basic-flow	f	t
038ce04b-a210-4a86-9475-75eff4e22db8	clients	Base authentication for clients	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	client-flow	t	t
abb930c9-0051-4ce8-ac4c-7606724ee62d	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	basic-flow	t	t
8abdde64-e4bd-42d9-8ca0-dc4d8b8dee44	User creation or linking	Flow for the existing/non-existing user alternatives	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	basic-flow	f	t
da8fa68f-0470-4f6b-9823-5a3820e4597f	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	basic-flow	f	t
560e25fe-9686-4573-a758-9718078eb36c	Account verification options	Method with which to verity the existing account	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	basic-flow	f	t
80115951-9361-4093-95a7-620c5fb51ac3	Verify Existing Account by Re-authentication	Reauthentication of existing account	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	basic-flow	f	t
09bdb3b9-79c2-4dcc-af6c-0c254ee5473b	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	basic-flow	f	t
0b435bab-c8a1-4e8a-a73e-8dcea2ff8dc5	saml ecp	SAML ECP Profile Authentication Flow	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	basic-flow	t	t
90a58617-21a8-4f35-a88a-a4faf1c0e322	docker auth	Used by Docker clients to authenticate against the IDP	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	basic-flow	t	t
9f6a791d-7fd8-4433-a9ab-84eaf4ebcb1a	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	basic-flow	t	t
a1a619ad-1ae5-41be-a3ef-3e56da55f4a7	Authentication Options	Authentication options.	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	basic-flow	f	t
81611d87-b075-4351-9781-cded2d0f85bd	browser	browser based authentication	60d763c7-10e3-4490-8529-e1c97d983ade	basic-flow	t	t
c8f60b67-04d0-442e-a980-62fc3b378157	forms	Username, password, otp and other auth forms.	60d763c7-10e3-4490-8529-e1c97d983ade	basic-flow	f	t
163c865b-5352-43d7-99c4-033b80e5e93c	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	60d763c7-10e3-4490-8529-e1c97d983ade	basic-flow	f	t
19dc4db1-2091-4e69-8490-0677e29aa32a	direct grant	OpenID Connect Resource Owner Grant	60d763c7-10e3-4490-8529-e1c97d983ade	basic-flow	t	t
e8f05043-2056-41b0-9e15-2eecd83a2af7	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	60d763c7-10e3-4490-8529-e1c97d983ade	basic-flow	f	t
f8c9ef42-39e3-4a31-9582-0048fe5b7515	registration	registration flow	60d763c7-10e3-4490-8529-e1c97d983ade	basic-flow	t	t
33e5f30d-b48e-4134-8325-38b1ffc04036	registration form	registration form	60d763c7-10e3-4490-8529-e1c97d983ade	form-flow	f	t
f6ff7085-4f59-4538-991c-8fda01e8817a	reset credentials	Reset credentials for a user if they forgot their password or something	60d763c7-10e3-4490-8529-e1c97d983ade	basic-flow	t	t
0fcb3d2d-8a7b-4ad1-a82f-95794ba54316	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	60d763c7-10e3-4490-8529-e1c97d983ade	basic-flow	f	t
8b913b43-dc9d-44c2-bd0f-1c8eadaab7af	clients	Base authentication for clients	60d763c7-10e3-4490-8529-e1c97d983ade	client-flow	t	t
60109967-1792-408d-a4f5-b60b0a41e6f1	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	60d763c7-10e3-4490-8529-e1c97d983ade	basic-flow	t	t
7b822f65-1f38-45c6-8e6d-c3874c3ff8ca	User creation or linking	Flow for the existing/non-existing user alternatives	60d763c7-10e3-4490-8529-e1c97d983ade	basic-flow	f	t
83220627-cf5a-4640-9793-d3e095ee1091	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	60d763c7-10e3-4490-8529-e1c97d983ade	basic-flow	f	t
742d655c-53f8-435b-801c-bacd72de3da2	Account verification options	Method with which to verity the existing account	60d763c7-10e3-4490-8529-e1c97d983ade	basic-flow	f	t
585e2b01-c29e-429f-9d20-2225135bf1ff	Verify Existing Account by Re-authentication	Reauthentication of existing account	60d763c7-10e3-4490-8529-e1c97d983ade	basic-flow	f	t
6cfb0602-80b2-4d8a-835d-8461e594b616	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	60d763c7-10e3-4490-8529-e1c97d983ade	basic-flow	f	t
1adb37e1-de1e-49b9-ad6f-4686c81b740e	saml ecp	SAML ECP Profile Authentication Flow	60d763c7-10e3-4490-8529-e1c97d983ade	basic-flow	t	t
4f26b250-bc09-4ac9-8ba3-95d72626cd74	docker auth	Used by Docker clients to authenticate against the IDP	60d763c7-10e3-4490-8529-e1c97d983ade	basic-flow	t	t
85f36e45-4944-471c-9140-928f45f3cea0	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	60d763c7-10e3-4490-8529-e1c97d983ade	basic-flow	t	t
90b60d6c-6418-4634-91a9-99027c62941d	Authentication Options	Authentication options.	60d763c7-10e3-4490-8529-e1c97d983ade	basic-flow	f	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
7fe369e6-90ed-4bbb-a5ca-a6ba7bf5c44c	review profile config	7b27a11d-121a-4360-960c-3ea6deb0ac35
0dc048ee-fc78-412c-a1c0-f6c5571f070e	create unique user config	7b27a11d-121a-4360-960c-3ea6deb0ac35
58079fc7-2c08-4ef3-a420-98401e583fff	review profile config	aef5c390-9834-4cad-83be-4efe22893758
17dace07-27ca-4acc-9e71-209b7280c41a	create unique user config	aef5c390-9834-4cad-83be-4efe22893758
a25bf5e8-e029-48fb-a1cd-5a921d3fcb54	review profile config	dd9bcc37-69c8-4b94-9737-50788f40287c
f4eb483d-7985-4626-97f5-9a27409b0e55	create unique user config	dd9bcc37-69c8-4b94-9737-50788f40287c
d80a59b3-26d2-445e-842f-3ceb379a9a44	review profile config	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6
751dde14-2687-45fe-8481-44e7d2b2cfce	create unique user config	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6
c08ba6c4-82f3-40f3-b67c-37cd7ec2467a	review profile config	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd
95f67227-67d5-4ce5-adf5-143a416701da	create unique user config	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd
cf2e11b0-da21-4040-8396-3d1264e57283	review profile config	60d763c7-10e3-4490-8529-e1c97d983ade
7f7767bc-9df4-41e2-b071-c2c23ed1cfe7	create unique user config	60d763c7-10e3-4490-8529-e1c97d983ade
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
0dc048ee-fc78-412c-a1c0-f6c5571f070e	false	require.password.update.after.registration
7fe369e6-90ed-4bbb-a5ca-a6ba7bf5c44c	missing	update.profile.on.first.login
17dace07-27ca-4acc-9e71-209b7280c41a	false	require.password.update.after.registration
58079fc7-2c08-4ef3-a420-98401e583fff	missing	update.profile.on.first.login
a25bf5e8-e029-48fb-a1cd-5a921d3fcb54	missing	update.profile.on.first.login
f4eb483d-7985-4626-97f5-9a27409b0e55	false	require.password.update.after.registration
751dde14-2687-45fe-8481-44e7d2b2cfce	false	require.password.update.after.registration
d80a59b3-26d2-445e-842f-3ceb379a9a44	missing	update.profile.on.first.login
95f67227-67d5-4ce5-adf5-143a416701da	false	require.password.update.after.registration
c08ba6c4-82f3-40f3-b67c-37cd7ec2467a	missing	update.profile.on.first.login
7f7767bc-9df4-41e2-b071-c2c23ed1cfe7	false	require.password.update.after.registration
cf2e11b0-da21-4040-8396-3d1264e57283	missing	update.profile.on.first.login
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
526d8a87-adcb-464b-9825-0ad9c321cfcd	t	f	master-realm	0	f	\N	\N	t	\N	f	7b27a11d-121a-4360-960c-3ea6deb0ac35	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
a5c0cd4f-9960-4295-be98-18892e399260	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	7b27a11d-121a-4360-960c-3ea6deb0ac35	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
b6ffcb90-757d-4454-bc80-afead1b60dc4	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	7b27a11d-121a-4360-960c-3ea6deb0ac35	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
cad6ab25-5328-4e82-baa9-50a954478705	t	f	broker	0	f	\N	\N	t	\N	f	7b27a11d-121a-4360-960c-3ea6deb0ac35	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
c4c6722f-da0c-4d9a-a651-f3ff1c34f74a	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	7b27a11d-121a-4360-960c-3ea6deb0ac35	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
98a507c1-1511-4e2a-aff8-89550c2e9a27	t	f	admin-cli	0	t	\N	\N	f	\N	f	7b27a11d-121a-4360-960c-3ea6deb0ac35	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
cc7cc122-1036-41cc-9b96-6787f169a971	t	f	hcmut-realm	0	f	\N	\N	t	\N	f	7b27a11d-121a-4360-960c-3ea6deb0ac35	\N	0	f	f	hcmut Realm	f	client-secret	\N	\N	\N	t	f	f	f
3c1f54e6-677d-4390-833e-c6fddac239b0	t	f	realm-management	0	f	\N	\N	t	\N	f	aef5c390-9834-4cad-83be-4efe22893758	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
928149f2-e5f0-433f-8627-3b365ba78f43	t	f	account	0	t	\N	/realms/hcmut/account/	f	\N	f	aef5c390-9834-4cad-83be-4efe22893758	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
42d7f3cb-b3bf-4a0b-a6ec-068cf3f8478f	t	f	account-console	0	t	\N	/realms/hcmut/account/	f	\N	f	aef5c390-9834-4cad-83be-4efe22893758	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
5063e93f-ce2b-48db-a18c-84fecf2e76b5	t	f	broker	0	f	\N	\N	t	\N	f	aef5c390-9834-4cad-83be-4efe22893758	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
02a8082a-7107-4805-991d-5bd6f4aea9ff	t	f	security-admin-console	0	t	\N	/admin/hcmut/console/	f	\N	f	aef5c390-9834-4cad-83be-4efe22893758	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
72dfb620-0862-4fe2-8451-974d6e51d22d	t	f	admin-cli	0	t	\N	\N	f	\N	f	aef5c390-9834-4cad-83be-4efe22893758	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
77861797-fdcd-4947-a13a-3b1f38496674	t	t	api_server	0	f	Panaxm4uaNAn0jA57yxXDjj5ga2o2xG0		f		f	7b27a11d-121a-4360-960c-3ea6deb0ac35	openid-connect	-1	t	f		f	client-secret			\N	t	f	t	f
417002ee-8613-452e-b8f0-f8c218f6652d	t	t	console	0	t	\N		f		f	7b27a11d-121a-4360-960c-3ea6deb0ac35	openid-connect	-1	t	f		f	client-secret			\N	t	f	t	f
269d9728-9023-4b46-8512-4820bf9d4331	t	f	realm-management	0	f	\N	\N	t	\N	f	dd9bcc37-69c8-4b94-9737-50788f40287c	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
c9d7ba83-2724-418b-8b2d-ea3a602c723c	t	f	pkt2-realm	0	f	\N	\N	t	\N	f	7b27a11d-121a-4360-960c-3ea6deb0ac35	\N	0	f	f	pkt2 Realm	f	client-secret	\N	\N	\N	t	f	f	f
d54ba4a6-256b-4e5e-bfd4-2fb208bf84f9	t	t	test	0	f	wp27GXizpuKwZXiTwtWBjwLSs3tNcztD	\N	f	\N	f	7b27a11d-121a-4360-960c-3ea6deb0ac35	openid-connect	-1	t	f		f	client-secret	\N		\N	t	f	t	f
2562fb91-4b82-42b8-aa73-612927e02a94	t	t	console	0	t	\N		f		f	aef5c390-9834-4cad-83be-4efe22893758	openid-connect	-1	t	f		f	client-secret			\N	t	f	t	f
ce857b6b-099f-4727-a8e4-51203afebea3	t	f	account	0	t	\N	/realms/pdt/account/	f	\N	f	dd9bcc37-69c8-4b94-9737-50788f40287c	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
01cdc332-278c-4884-9386-3bc62a7c2df9	t	f	account-console	0	t	\N	/realms/pdt/account/	f	\N	f	dd9bcc37-69c8-4b94-9737-50788f40287c	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
203a5e14-bbbd-40f9-b641-f1ea67c467d9	t	f	broker	0	f	\N	\N	t	\N	f	dd9bcc37-69c8-4b94-9737-50788f40287c	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
962887df-3902-4556-923d-622a6e793de3	t	f	security-admin-console	0	t	\N	/admin/pdt/console/	f	\N	f	dd9bcc37-69c8-4b94-9737-50788f40287c	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
413eabd5-1505-4190-902c-29bb9bc63de2	t	f	pdt-realm	0	f	\N	\N	t	\N	f	7b27a11d-121a-4360-960c-3ea6deb0ac35	\N	0	f	f	pdt Realm	f	client-secret	\N	\N	\N	t	f	f	f
b27eb59e-f415-46c5-af86-1c526634434c	t	f	admin-cli	0	t	\N	\N	f	\N	f	dd9bcc37-69c8-4b94-9737-50788f40287c	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
725c3687-2ed3-4c82-ba58-0127dc67f445	t	t	console	0	t	\N	\N	f	\N	f	dd9bcc37-69c8-4b94-9737-50788f40287c	openid-connect	-1	f	f	\N	f	client-secret	\N	\N	\N	t	f	f	f
548af2e3-5c3a-4f3b-8549-3b72fa039d22	t	f	realm-management	0	f	\N	\N	t	\N	f	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
40e8770f-aeae-4711-a208-8f8f4cd71021	t	f	account	0	t	\N	/realms/pkt/account/	f	\N	f	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
bd8261f7-9d01-4003-a5b5-c344168aa641	t	f	account-console	0	t	\N	/realms/pkt/account/	f	\N	f	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
7e9ddf81-ecb6-4337-8d3f-90ad988bd702	t	f	broker	0	f	\N	\N	t	\N	f	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	t	f	pkt-realm	0	f	\N	\N	t	\N	f	7b27a11d-121a-4360-960c-3ea6deb0ac35	\N	0	f	f	pkt Realm	f	client-secret	\N	\N	\N	t	f	f	f
fc659080-6f8b-4b2f-b7d8-ef7b5b859603	t	f	security-admin-console	0	t	\N	/admin/pkt/console/	f	\N	f	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
90e5180e-54f6-49da-aaff-8b7d90119626	t	f	admin-cli	0	t	\N	\N	f	\N	f	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
ef4b8911-9bac-4af9-af11-ed4989f050f5	t	t	console	0	t	\N	\N	f	\N	f	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	openid-connect	-1	f	f	\N	f	client-secret	\N	\N	\N	t	f	f	f
8cd3c0b7-149b-461d-b4db-987d93c12289	t	f	pit-realm	0	f	\N	\N	t	\N	f	7b27a11d-121a-4360-960c-3ea6deb0ac35	\N	0	f	f	pit Realm	f	client-secret	\N	\N	\N	t	f	f	f
5eea5d8c-eae1-4307-adb6-da4e0148ee74	t	f	realm-management	0	f	\N	\N	t	\N	f	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	t	f	account	0	t	\N	/realms/pit/account/	f	\N	f	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
055aed68-db28-4769-a5a2-3896b6383f81	t	f	account-console	0	t	\N	/realms/pit/account/	f	\N	f	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
fcd3d799-45ca-49dc-8ba5-5a40a7b2db98	t	f	broker	0	f	\N	\N	t	\N	f	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
7a818d10-f579-486b-a765-914f257898e4	t	f	security-admin-console	0	t	\N	/admin/pit/console/	f	\N	f	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
06d132b3-1f68-4cf3-8adc-f8eb40500c8e	t	f	admin-cli	0	t	\N	\N	f	\N	f	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
c83e2155-6053-4feb-9079-1c17482cfa53	t	t	console	0	t	\N	\N	f	\N	f	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	openid-connect	-1	f	f	\N	f	client-secret	\N	\N	\N	t	f	f	f
194d9d32-bc5c-405b-bbdd-94cc13279160	t	f	realm-management	0	f	\N	\N	t	\N	f	60d763c7-10e3-4490-8529-e1c97d983ade	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
1933ba2e-6c06-4466-b1c5-44b87f23a311	t	f	account	0	t	\N	/realms/pkt2/account/	f	\N	f	60d763c7-10e3-4490-8529-e1c97d983ade	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
fe783fd4-f23f-4777-9958-15ba12be6fb9	t	f	account-console	0	t	\N	/realms/pkt2/account/	f	\N	f	60d763c7-10e3-4490-8529-e1c97d983ade	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
11512b0d-f605-437f-ba6e-2d241ee0002e	t	f	broker	0	f	\N	\N	t	\N	f	60d763c7-10e3-4490-8529-e1c97d983ade	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
8b95af71-6ef9-4cd2-8165-6bf8e2b397ab	t	f	security-admin-console	0	t	\N	/admin/pkt2/console/	f	\N	f	60d763c7-10e3-4490-8529-e1c97d983ade	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
6976f573-c2a2-473c-9287-6767d325a277	t	f	admin-cli	0	t	\N	\N	f	\N	f	60d763c7-10e3-4490-8529-e1c97d983ade	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
9df70eb4-dea8-4ea0-841f-3718eced8d37	t	t	console	0	t	\N	\N	f	\N	f	60d763c7-10e3-4490-8529-e1c97d983ade	openid-connect	-1	f	f	\N	f	client-secret	\N	\N	\N	t	f	f	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
a5c0cd4f-9960-4295-be98-18892e399260	post.logout.redirect.uris	+
b6ffcb90-757d-4454-bc80-afead1b60dc4	post.logout.redirect.uris	+
b6ffcb90-757d-4454-bc80-afead1b60dc4	pkce.code.challenge.method	S256
c4c6722f-da0c-4d9a-a651-f3ff1c34f74a	post.logout.redirect.uris	+
c4c6722f-da0c-4d9a-a651-f3ff1c34f74a	pkce.code.challenge.method	S256
928149f2-e5f0-433f-8627-3b365ba78f43	post.logout.redirect.uris	+
42d7f3cb-b3bf-4a0b-a6ec-068cf3f8478f	post.logout.redirect.uris	+
42d7f3cb-b3bf-4a0b-a6ec-068cf3f8478f	pkce.code.challenge.method	S256
02a8082a-7107-4805-991d-5bd6f4aea9ff	post.logout.redirect.uris	+
02a8082a-7107-4805-991d-5bd6f4aea9ff	pkce.code.challenge.method	S256
417002ee-8613-452e-b8f0-f8c218f6652d	display.on.consent.screen	false
417002ee-8613-452e-b8f0-f8c218f6652d	backchannel.logout.revoke.offline.tokens	false
417002ee-8613-452e-b8f0-f8c218f6652d	backchannel.logout.session.required	true
417002ee-8613-452e-b8f0-f8c218f6652d	oauth2.device.authorization.grant.enabled	false
417002ee-8613-452e-b8f0-f8c218f6652d	oidc.ciba.grant.enabled	false
d54ba4a6-256b-4e5e-bfd4-2fb208bf84f9	client.secret.creation.time	1681700221
d54ba4a6-256b-4e5e-bfd4-2fb208bf84f9	oauth2.device.authorization.grant.enabled	false
d54ba4a6-256b-4e5e-bfd4-2fb208bf84f9	oidc.ciba.grant.enabled	false
d54ba4a6-256b-4e5e-bfd4-2fb208bf84f9	backchannel.logout.session.required	true
d54ba4a6-256b-4e5e-bfd4-2fb208bf84f9	backchannel.logout.revoke.offline.tokens	false
2562fb91-4b82-42b8-aa73-612927e02a94	display.on.consent.screen	false
2562fb91-4b82-42b8-aa73-612927e02a94	backchannel.logout.revoke.offline.tokens	false
2562fb91-4b82-42b8-aa73-612927e02a94	backchannel.logout.session.required	true
2562fb91-4b82-42b8-aa73-612927e02a94	oauth2.device.authorization.grant.enabled	false
2562fb91-4b82-42b8-aa73-612927e02a94	oidc.ciba.grant.enabled	false
ce857b6b-099f-4727-a8e4-51203afebea3	post.logout.redirect.uris	+
77861797-fdcd-4947-a13a-3b1f38496674	backchannel.logout.revoke.offline.tokens	false
77861797-fdcd-4947-a13a-3b1f38496674	backchannel.logout.session.required	true
77861797-fdcd-4947-a13a-3b1f38496674	client.secret.creation.time	1681551585
77861797-fdcd-4947-a13a-3b1f38496674	display.on.consent.screen	false
77861797-fdcd-4947-a13a-3b1f38496674	oauth2.device.authorization.grant.enabled	false
77861797-fdcd-4947-a13a-3b1f38496674	oidc.ciba.grant.enabled	false
01cdc332-278c-4884-9386-3bc62a7c2df9	post.logout.redirect.uris	+
01cdc332-278c-4884-9386-3bc62a7c2df9	pkce.code.challenge.method	S256
962887df-3902-4556-923d-622a6e793de3	post.logout.redirect.uris	+
962887df-3902-4556-923d-622a6e793de3	pkce.code.challenge.method	S256
40e8770f-aeae-4711-a208-8f8f4cd71021	post.logout.redirect.uris	+
bd8261f7-9d01-4003-a5b5-c344168aa641	post.logout.redirect.uris	+
bd8261f7-9d01-4003-a5b5-c344168aa641	pkce.code.challenge.method	S256
fc659080-6f8b-4b2f-b7d8-ef7b5b859603	post.logout.redirect.uris	+
fc659080-6f8b-4b2f-b7d8-ef7b5b859603	pkce.code.challenge.method	S256
1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	post.logout.redirect.uris	+
055aed68-db28-4769-a5a2-3896b6383f81	post.logout.redirect.uris	+
055aed68-db28-4769-a5a2-3896b6383f81	pkce.code.challenge.method	S256
7a818d10-f579-486b-a765-914f257898e4	post.logout.redirect.uris	+
7a818d10-f579-486b-a765-914f257898e4	pkce.code.challenge.method	S256
1933ba2e-6c06-4466-b1c5-44b87f23a311	post.logout.redirect.uris	+
fe783fd4-f23f-4777-9958-15ba12be6fb9	post.logout.redirect.uris	+
fe783fd4-f23f-4777-9958-15ba12be6fb9	pkce.code.challenge.method	S256
8b95af71-6ef9-4cd2-8165-6bf8e2b397ab	post.logout.redirect.uris	+
8b95af71-6ef9-4cd2-8165-6bf8e2b397ab	pkce.code.challenge.method	S256
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
8e27f114-b1c4-47cb-8032-138c3805716d	offline_access	7b27a11d-121a-4360-960c-3ea6deb0ac35	OpenID Connect built-in scope: offline_access	openid-connect
49e97e25-d4dd-40c8-882f-3e894f6c59e1	role_list	7b27a11d-121a-4360-960c-3ea6deb0ac35	SAML role list	saml
9ce86df7-ae42-4e8f-9c53-85f3901d8f4f	profile	7b27a11d-121a-4360-960c-3ea6deb0ac35	OpenID Connect built-in scope: profile	openid-connect
b32226bf-f4fa-433f-b566-e8b8e95f686d	email	7b27a11d-121a-4360-960c-3ea6deb0ac35	OpenID Connect built-in scope: email	openid-connect
a9fa8229-bcee-42fb-84c5-91b0df91a164	address	7b27a11d-121a-4360-960c-3ea6deb0ac35	OpenID Connect built-in scope: address	openid-connect
7e38e21a-76ad-4b8a-8be2-da3ff54dbb90	phone	7b27a11d-121a-4360-960c-3ea6deb0ac35	OpenID Connect built-in scope: phone	openid-connect
21b57b5b-6b2a-4700-9180-060e36c2da9e	roles	7b27a11d-121a-4360-960c-3ea6deb0ac35	OpenID Connect scope for add user roles to the access token	openid-connect
a3a86244-e2bc-4626-a691-36026a20eaac	web-origins	7b27a11d-121a-4360-960c-3ea6deb0ac35	OpenID Connect scope for add allowed web origins to the access token	openid-connect
b6d65dc0-5828-49cd-8a61-51b909a95424	microprofile-jwt	7b27a11d-121a-4360-960c-3ea6deb0ac35	Microprofile - JWT built-in scope	openid-connect
b3f8a4b6-06e2-4a09-b541-9f77e2f4e970	acr	7b27a11d-121a-4360-960c-3ea6deb0ac35	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
384ec609-a8d1-4ae4-97bf-d5e957132a5d	offline_access	aef5c390-9834-4cad-83be-4efe22893758	OpenID Connect built-in scope: offline_access	openid-connect
284a6148-dc6d-4b68-8b5b-95ed681a3aa4	role_list	aef5c390-9834-4cad-83be-4efe22893758	SAML role list	saml
4bcdc5f8-ddbb-4903-bdce-75740243a6de	profile	aef5c390-9834-4cad-83be-4efe22893758	OpenID Connect built-in scope: profile	openid-connect
b1809973-dc13-4006-ba94-56f00b4e0619	email	aef5c390-9834-4cad-83be-4efe22893758	OpenID Connect built-in scope: email	openid-connect
0de9b76a-bccf-4d9c-b56f-6845cb6a6387	address	aef5c390-9834-4cad-83be-4efe22893758	OpenID Connect built-in scope: address	openid-connect
83878d56-5ac3-4322-afdd-7bdfc294bebd	phone	aef5c390-9834-4cad-83be-4efe22893758	OpenID Connect built-in scope: phone	openid-connect
07e618c7-bfa6-468b-adb2-e15ba0f56d04	roles	aef5c390-9834-4cad-83be-4efe22893758	OpenID Connect scope for add user roles to the access token	openid-connect
5d917fd0-475a-4cfc-b28d-cc0ba8ebbc12	web-origins	aef5c390-9834-4cad-83be-4efe22893758	OpenID Connect scope for add allowed web origins to the access token	openid-connect
5c5aa9a6-de06-4b20-b20c-3b21efd29cb3	microprofile-jwt	aef5c390-9834-4cad-83be-4efe22893758	Microprofile - JWT built-in scope	openid-connect
5df278e3-86c1-429a-af9c-ac3bb962d0ba	acr	aef5c390-9834-4cad-83be-4efe22893758	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
a2675b92-0d79-4b69-b612-2a7c20433c47	offline_access	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	OpenID Connect built-in scope: offline_access	openid-connect
010070ea-a6d9-45fe-9a00-918471ac3dd3	role_list	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	SAML role list	saml
80bad978-251c-47e3-903a-86af08c4b811	profile	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	OpenID Connect built-in scope: profile	openid-connect
185f848c-dd45-46ad-81ce-26c5be5c0ee7	email	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	OpenID Connect built-in scope: email	openid-connect
62334196-39d2-4539-89fd-f90101dc5e03	address	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	OpenID Connect built-in scope: address	openid-connect
99c830a1-f8f5-4c82-8577-9d43ac671636	phone	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	OpenID Connect built-in scope: phone	openid-connect
4700486b-5409-48ed-bea9-f0257d6d0690	roles	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	OpenID Connect scope for add user roles to the access token	openid-connect
1366450b-302c-48e2-bc7a-0a1f0a66479b	web-origins	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	OpenID Connect scope for add allowed web origins to the access token	openid-connect
2729bd3c-c919-4768-9c69-2e5152e94cd5	profile	dd9bcc37-69c8-4b94-9737-50788f40287c	OpenID Connect built-in scope: profile	openid-connect
3dd11a2b-d310-4c68-a546-ade7fb0fbe50	email	dd9bcc37-69c8-4b94-9737-50788f40287c	OpenID Connect built-in scope: email	openid-connect
85f93bf5-c148-4aee-bf72-0a9c9fca86c6	address	dd9bcc37-69c8-4b94-9737-50788f40287c	OpenID Connect built-in scope: address	openid-connect
5adfbeaa-0d84-4438-8815-db1c1a01ea0c	phone	dd9bcc37-69c8-4b94-9737-50788f40287c	OpenID Connect built-in scope: phone	openid-connect
0629b8d7-75de-457a-abf4-4d97423b1c0a	roles	dd9bcc37-69c8-4b94-9737-50788f40287c	OpenID Connect scope for add user roles to the access token	openid-connect
034b2113-cc61-4e5f-b921-e690ac46e24d	offline_access	dd9bcc37-69c8-4b94-9737-50788f40287c	OpenID Connect built-in scope: offline_access	openid-connect
5a5e5838-f9cf-442a-a4d8-3c6436a2728f	role_list	dd9bcc37-69c8-4b94-9737-50788f40287c	SAML role list	saml
9167a5b4-dd14-4d0b-bd36-d657f743670a	web-origins	dd9bcc37-69c8-4b94-9737-50788f40287c	OpenID Connect scope for add allowed web origins to the access token	openid-connect
a1983e8d-2811-4ed6-adfd-6b16475d96db	microprofile-jwt	dd9bcc37-69c8-4b94-9737-50788f40287c	Microprofile - JWT built-in scope	openid-connect
46d940b1-fb0d-40ad-a551-6ca1eae0e844	acr	dd9bcc37-69c8-4b94-9737-50788f40287c	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
8aa30a2b-f3d5-406b-89f0-83e98d24df4a	microprofile-jwt	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	Microprofile - JWT built-in scope	openid-connect
52c09584-d9a4-4bd6-b0ac-0fca69abc7b9	acr	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
99adc83f-41d2-4bab-b1d5-4fbab02b25de	offline_access	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	OpenID Connect built-in scope: offline_access	openid-connect
64cbd8af-432e-4175-b6fc-d737c256d24e	role_list	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	SAML role list	saml
6dc97505-f071-4fd4-bc01-58a56e5985eb	profile	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	OpenID Connect built-in scope: profile	openid-connect
e65b2bf1-e2a4-4015-8c78-cf732e9efe20	email	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	OpenID Connect built-in scope: email	openid-connect
e96c4d2e-33bb-45d7-8225-2578d24fa8b9	address	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	OpenID Connect built-in scope: address	openid-connect
4ba41e2c-1fd5-45d1-ab77-19269aaf5169	phone	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	OpenID Connect built-in scope: phone	openid-connect
e65232e9-5405-4fa8-abfe-e6b74891c21f	roles	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	OpenID Connect scope for add user roles to the access token	openid-connect
f299ed6e-d170-41f8-b7e1-2a63406adfcc	web-origins	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	OpenID Connect scope for add allowed web origins to the access token	openid-connect
31da5254-ec0d-4f84-b9b5-53804d14ba82	microprofile-jwt	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	Microprofile - JWT built-in scope	openid-connect
676a39d7-db2d-4b0c-9ee7-0fe6e629c8ac	acr	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
2845c8ab-6a7b-4ca0-b83a-182fc73907dd	web-origins	60d763c7-10e3-4490-8529-e1c97d983ade	OpenID Connect scope for add allowed web origins to the access token	openid-connect
46505150-ff79-4f47-909a-a520df58e767	microprofile-jwt	60d763c7-10e3-4490-8529-e1c97d983ade	Microprofile - JWT built-in scope	openid-connect
75d202a7-0e42-4362-910b-c957479087fe	offline_access	60d763c7-10e3-4490-8529-e1c97d983ade	OpenID Connect built-in scope: offline_access	openid-connect
47600150-3aff-4e6b-8c8a-63030b7718a9	acr	60d763c7-10e3-4490-8529-e1c97d983ade	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
0e935cb0-6e9d-45ba-8c2f-d5f2a0310b12	role_list	60d763c7-10e3-4490-8529-e1c97d983ade	SAML role list	saml
0c21cef9-585a-404e-b8f2-fbba43b1bb79	profile	60d763c7-10e3-4490-8529-e1c97d983ade	OpenID Connect built-in scope: profile	openid-connect
ae9bf4a6-05d1-4bef-9772-d5dc9b77710c	email	60d763c7-10e3-4490-8529-e1c97d983ade	OpenID Connect built-in scope: email	openid-connect
eabf4c77-7d0b-403c-87e5-49a9243e3c8e	address	60d763c7-10e3-4490-8529-e1c97d983ade	OpenID Connect built-in scope: address	openid-connect
c102a4f2-8de9-429c-88da-dd094ed17600	phone	60d763c7-10e3-4490-8529-e1c97d983ade	OpenID Connect built-in scope: phone	openid-connect
ff5fe863-8734-4cf2-af69-f18261d53492	roles	60d763c7-10e3-4490-8529-e1c97d983ade	OpenID Connect scope for add user roles to the access token	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
8e27f114-b1c4-47cb-8032-138c3805716d	true	display.on.consent.screen
8e27f114-b1c4-47cb-8032-138c3805716d	${offlineAccessScopeConsentText}	consent.screen.text
49e97e25-d4dd-40c8-882f-3e894f6c59e1	true	display.on.consent.screen
49e97e25-d4dd-40c8-882f-3e894f6c59e1	${samlRoleListScopeConsentText}	consent.screen.text
9ce86df7-ae42-4e8f-9c53-85f3901d8f4f	true	display.on.consent.screen
9ce86df7-ae42-4e8f-9c53-85f3901d8f4f	${profileScopeConsentText}	consent.screen.text
9ce86df7-ae42-4e8f-9c53-85f3901d8f4f	true	include.in.token.scope
b32226bf-f4fa-433f-b566-e8b8e95f686d	true	display.on.consent.screen
b32226bf-f4fa-433f-b566-e8b8e95f686d	${emailScopeConsentText}	consent.screen.text
b32226bf-f4fa-433f-b566-e8b8e95f686d	true	include.in.token.scope
a9fa8229-bcee-42fb-84c5-91b0df91a164	true	display.on.consent.screen
a9fa8229-bcee-42fb-84c5-91b0df91a164	${addressScopeConsentText}	consent.screen.text
a9fa8229-bcee-42fb-84c5-91b0df91a164	true	include.in.token.scope
7e38e21a-76ad-4b8a-8be2-da3ff54dbb90	true	display.on.consent.screen
7e38e21a-76ad-4b8a-8be2-da3ff54dbb90	${phoneScopeConsentText}	consent.screen.text
7e38e21a-76ad-4b8a-8be2-da3ff54dbb90	true	include.in.token.scope
21b57b5b-6b2a-4700-9180-060e36c2da9e	true	display.on.consent.screen
21b57b5b-6b2a-4700-9180-060e36c2da9e	${rolesScopeConsentText}	consent.screen.text
21b57b5b-6b2a-4700-9180-060e36c2da9e	false	include.in.token.scope
a3a86244-e2bc-4626-a691-36026a20eaac	false	display.on.consent.screen
a3a86244-e2bc-4626-a691-36026a20eaac		consent.screen.text
a3a86244-e2bc-4626-a691-36026a20eaac	false	include.in.token.scope
b6d65dc0-5828-49cd-8a61-51b909a95424	false	display.on.consent.screen
b6d65dc0-5828-49cd-8a61-51b909a95424	true	include.in.token.scope
b3f8a4b6-06e2-4a09-b541-9f77e2f4e970	false	display.on.consent.screen
b3f8a4b6-06e2-4a09-b541-9f77e2f4e970	false	include.in.token.scope
384ec609-a8d1-4ae4-97bf-d5e957132a5d	true	display.on.consent.screen
384ec609-a8d1-4ae4-97bf-d5e957132a5d	${offlineAccessScopeConsentText}	consent.screen.text
284a6148-dc6d-4b68-8b5b-95ed681a3aa4	true	display.on.consent.screen
284a6148-dc6d-4b68-8b5b-95ed681a3aa4	${samlRoleListScopeConsentText}	consent.screen.text
4bcdc5f8-ddbb-4903-bdce-75740243a6de	true	display.on.consent.screen
4bcdc5f8-ddbb-4903-bdce-75740243a6de	${profileScopeConsentText}	consent.screen.text
4bcdc5f8-ddbb-4903-bdce-75740243a6de	true	include.in.token.scope
b1809973-dc13-4006-ba94-56f00b4e0619	true	display.on.consent.screen
b1809973-dc13-4006-ba94-56f00b4e0619	${emailScopeConsentText}	consent.screen.text
b1809973-dc13-4006-ba94-56f00b4e0619	true	include.in.token.scope
0de9b76a-bccf-4d9c-b56f-6845cb6a6387	true	display.on.consent.screen
0de9b76a-bccf-4d9c-b56f-6845cb6a6387	${addressScopeConsentText}	consent.screen.text
0de9b76a-bccf-4d9c-b56f-6845cb6a6387	true	include.in.token.scope
83878d56-5ac3-4322-afdd-7bdfc294bebd	true	display.on.consent.screen
83878d56-5ac3-4322-afdd-7bdfc294bebd	${phoneScopeConsentText}	consent.screen.text
83878d56-5ac3-4322-afdd-7bdfc294bebd	true	include.in.token.scope
07e618c7-bfa6-468b-adb2-e15ba0f56d04	true	display.on.consent.screen
07e618c7-bfa6-468b-adb2-e15ba0f56d04	${rolesScopeConsentText}	consent.screen.text
07e618c7-bfa6-468b-adb2-e15ba0f56d04	false	include.in.token.scope
5d917fd0-475a-4cfc-b28d-cc0ba8ebbc12	false	display.on.consent.screen
5d917fd0-475a-4cfc-b28d-cc0ba8ebbc12		consent.screen.text
5d917fd0-475a-4cfc-b28d-cc0ba8ebbc12	false	include.in.token.scope
5c5aa9a6-de06-4b20-b20c-3b21efd29cb3	false	display.on.consent.screen
5c5aa9a6-de06-4b20-b20c-3b21efd29cb3	true	include.in.token.scope
5df278e3-86c1-429a-af9c-ac3bb962d0ba	false	display.on.consent.screen
5df278e3-86c1-429a-af9c-ac3bb962d0ba	false	include.in.token.scope
034b2113-cc61-4e5f-b921-e690ac46e24d	true	display.on.consent.screen
034b2113-cc61-4e5f-b921-e690ac46e24d	${offlineAccessScopeConsentText}	consent.screen.text
5a5e5838-f9cf-442a-a4d8-3c6436a2728f	true	display.on.consent.screen
5a5e5838-f9cf-442a-a4d8-3c6436a2728f	${samlRoleListScopeConsentText}	consent.screen.text
2729bd3c-c919-4768-9c69-2e5152e94cd5	true	display.on.consent.screen
2729bd3c-c919-4768-9c69-2e5152e94cd5	${profileScopeConsentText}	consent.screen.text
2729bd3c-c919-4768-9c69-2e5152e94cd5	true	include.in.token.scope
3dd11a2b-d310-4c68-a546-ade7fb0fbe50	true	display.on.consent.screen
3dd11a2b-d310-4c68-a546-ade7fb0fbe50	${emailScopeConsentText}	consent.screen.text
3dd11a2b-d310-4c68-a546-ade7fb0fbe50	true	include.in.token.scope
85f93bf5-c148-4aee-bf72-0a9c9fca86c6	true	display.on.consent.screen
85f93bf5-c148-4aee-bf72-0a9c9fca86c6	${addressScopeConsentText}	consent.screen.text
85f93bf5-c148-4aee-bf72-0a9c9fca86c6	true	include.in.token.scope
5adfbeaa-0d84-4438-8815-db1c1a01ea0c	true	display.on.consent.screen
5adfbeaa-0d84-4438-8815-db1c1a01ea0c	${phoneScopeConsentText}	consent.screen.text
5adfbeaa-0d84-4438-8815-db1c1a01ea0c	true	include.in.token.scope
0629b8d7-75de-457a-abf4-4d97423b1c0a	true	display.on.consent.screen
0629b8d7-75de-457a-abf4-4d97423b1c0a	${rolesScopeConsentText}	consent.screen.text
0629b8d7-75de-457a-abf4-4d97423b1c0a	false	include.in.token.scope
9167a5b4-dd14-4d0b-bd36-d657f743670a	false	display.on.consent.screen
9167a5b4-dd14-4d0b-bd36-d657f743670a		consent.screen.text
9167a5b4-dd14-4d0b-bd36-d657f743670a	false	include.in.token.scope
a1983e8d-2811-4ed6-adfd-6b16475d96db	false	display.on.consent.screen
a1983e8d-2811-4ed6-adfd-6b16475d96db	true	include.in.token.scope
46d940b1-fb0d-40ad-a551-6ca1eae0e844	false	display.on.consent.screen
46d940b1-fb0d-40ad-a551-6ca1eae0e844	false	include.in.token.scope
75d202a7-0e42-4362-910b-c957479087fe	true	display.on.consent.screen
75d202a7-0e42-4362-910b-c957479087fe	${offlineAccessScopeConsentText}	consent.screen.text
0e935cb0-6e9d-45ba-8c2f-d5f2a0310b12	true	display.on.consent.screen
0e935cb0-6e9d-45ba-8c2f-d5f2a0310b12	${samlRoleListScopeConsentText}	consent.screen.text
0c21cef9-585a-404e-b8f2-fbba43b1bb79	true	display.on.consent.screen
0c21cef9-585a-404e-b8f2-fbba43b1bb79	${profileScopeConsentText}	consent.screen.text
0c21cef9-585a-404e-b8f2-fbba43b1bb79	true	include.in.token.scope
ae9bf4a6-05d1-4bef-9772-d5dc9b77710c	true	display.on.consent.screen
ae9bf4a6-05d1-4bef-9772-d5dc9b77710c	${emailScopeConsentText}	consent.screen.text
ae9bf4a6-05d1-4bef-9772-d5dc9b77710c	true	include.in.token.scope
eabf4c77-7d0b-403c-87e5-49a9243e3c8e	true	display.on.consent.screen
eabf4c77-7d0b-403c-87e5-49a9243e3c8e	${addressScopeConsentText}	consent.screen.text
eabf4c77-7d0b-403c-87e5-49a9243e3c8e	true	include.in.token.scope
c102a4f2-8de9-429c-88da-dd094ed17600	true	display.on.consent.screen
c102a4f2-8de9-429c-88da-dd094ed17600	${phoneScopeConsentText}	consent.screen.text
c102a4f2-8de9-429c-88da-dd094ed17600	true	include.in.token.scope
ff5fe863-8734-4cf2-af69-f18261d53492	true	display.on.consent.screen
ff5fe863-8734-4cf2-af69-f18261d53492	${rolesScopeConsentText}	consent.screen.text
ff5fe863-8734-4cf2-af69-f18261d53492	false	include.in.token.scope
2845c8ab-6a7b-4ca0-b83a-182fc73907dd	false	display.on.consent.screen
2845c8ab-6a7b-4ca0-b83a-182fc73907dd		consent.screen.text
2845c8ab-6a7b-4ca0-b83a-182fc73907dd	false	include.in.token.scope
46505150-ff79-4f47-909a-a520df58e767	false	display.on.consent.screen
46505150-ff79-4f47-909a-a520df58e767	true	include.in.token.scope
99adc83f-41d2-4bab-b1d5-4fbab02b25de	true	display.on.consent.screen
99adc83f-41d2-4bab-b1d5-4fbab02b25de	${offlineAccessScopeConsentText}	consent.screen.text
64cbd8af-432e-4175-b6fc-d737c256d24e	true	display.on.consent.screen
64cbd8af-432e-4175-b6fc-d737c256d24e	${samlRoleListScopeConsentText}	consent.screen.text
6dc97505-f071-4fd4-bc01-58a56e5985eb	true	display.on.consent.screen
6dc97505-f071-4fd4-bc01-58a56e5985eb	${profileScopeConsentText}	consent.screen.text
6dc97505-f071-4fd4-bc01-58a56e5985eb	true	include.in.token.scope
e65b2bf1-e2a4-4015-8c78-cf732e9efe20	true	display.on.consent.screen
e65b2bf1-e2a4-4015-8c78-cf732e9efe20	${emailScopeConsentText}	consent.screen.text
e65b2bf1-e2a4-4015-8c78-cf732e9efe20	true	include.in.token.scope
e96c4d2e-33bb-45d7-8225-2578d24fa8b9	true	display.on.consent.screen
e96c4d2e-33bb-45d7-8225-2578d24fa8b9	${addressScopeConsentText}	consent.screen.text
e96c4d2e-33bb-45d7-8225-2578d24fa8b9	true	include.in.token.scope
4ba41e2c-1fd5-45d1-ab77-19269aaf5169	true	display.on.consent.screen
4ba41e2c-1fd5-45d1-ab77-19269aaf5169	${phoneScopeConsentText}	consent.screen.text
4ba41e2c-1fd5-45d1-ab77-19269aaf5169	true	include.in.token.scope
e65232e9-5405-4fa8-abfe-e6b74891c21f	true	display.on.consent.screen
e65232e9-5405-4fa8-abfe-e6b74891c21f	${rolesScopeConsentText}	consent.screen.text
e65232e9-5405-4fa8-abfe-e6b74891c21f	false	include.in.token.scope
f299ed6e-d170-41f8-b7e1-2a63406adfcc	false	display.on.consent.screen
f299ed6e-d170-41f8-b7e1-2a63406adfcc		consent.screen.text
f299ed6e-d170-41f8-b7e1-2a63406adfcc	false	include.in.token.scope
31da5254-ec0d-4f84-b9b5-53804d14ba82	false	display.on.consent.screen
31da5254-ec0d-4f84-b9b5-53804d14ba82	true	include.in.token.scope
676a39d7-db2d-4b0c-9ee7-0fe6e629c8ac	false	display.on.consent.screen
676a39d7-db2d-4b0c-9ee7-0fe6e629c8ac	false	include.in.token.scope
a2675b92-0d79-4b69-b612-2a7c20433c47	true	display.on.consent.screen
a2675b92-0d79-4b69-b612-2a7c20433c47	${offlineAccessScopeConsentText}	consent.screen.text
010070ea-a6d9-45fe-9a00-918471ac3dd3	true	display.on.consent.screen
010070ea-a6d9-45fe-9a00-918471ac3dd3	${samlRoleListScopeConsentText}	consent.screen.text
80bad978-251c-47e3-903a-86af08c4b811	true	display.on.consent.screen
80bad978-251c-47e3-903a-86af08c4b811	${profileScopeConsentText}	consent.screen.text
80bad978-251c-47e3-903a-86af08c4b811	true	include.in.token.scope
185f848c-dd45-46ad-81ce-26c5be5c0ee7	true	display.on.consent.screen
185f848c-dd45-46ad-81ce-26c5be5c0ee7	${emailScopeConsentText}	consent.screen.text
185f848c-dd45-46ad-81ce-26c5be5c0ee7	true	include.in.token.scope
62334196-39d2-4539-89fd-f90101dc5e03	true	display.on.consent.screen
62334196-39d2-4539-89fd-f90101dc5e03	${addressScopeConsentText}	consent.screen.text
62334196-39d2-4539-89fd-f90101dc5e03	true	include.in.token.scope
99c830a1-f8f5-4c82-8577-9d43ac671636	true	display.on.consent.screen
99c830a1-f8f5-4c82-8577-9d43ac671636	${phoneScopeConsentText}	consent.screen.text
99c830a1-f8f5-4c82-8577-9d43ac671636	true	include.in.token.scope
4700486b-5409-48ed-bea9-f0257d6d0690	true	display.on.consent.screen
4700486b-5409-48ed-bea9-f0257d6d0690	${rolesScopeConsentText}	consent.screen.text
4700486b-5409-48ed-bea9-f0257d6d0690	false	include.in.token.scope
1366450b-302c-48e2-bc7a-0a1f0a66479b	false	display.on.consent.screen
1366450b-302c-48e2-bc7a-0a1f0a66479b		consent.screen.text
1366450b-302c-48e2-bc7a-0a1f0a66479b	false	include.in.token.scope
8aa30a2b-f3d5-406b-89f0-83e98d24df4a	false	display.on.consent.screen
8aa30a2b-f3d5-406b-89f0-83e98d24df4a	true	include.in.token.scope
52c09584-d9a4-4bd6-b0ac-0fca69abc7b9	false	display.on.consent.screen
52c09584-d9a4-4bd6-b0ac-0fca69abc7b9	false	include.in.token.scope
47600150-3aff-4e6b-8c8a-63030b7718a9	false	display.on.consent.screen
47600150-3aff-4e6b-8c8a-63030b7718a9	false	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
a5c0cd4f-9960-4295-be98-18892e399260	b3f8a4b6-06e2-4a09-b541-9f77e2f4e970	t
a5c0cd4f-9960-4295-be98-18892e399260	a3a86244-e2bc-4626-a691-36026a20eaac	t
a5c0cd4f-9960-4295-be98-18892e399260	b32226bf-f4fa-433f-b566-e8b8e95f686d	t
a5c0cd4f-9960-4295-be98-18892e399260	21b57b5b-6b2a-4700-9180-060e36c2da9e	t
a5c0cd4f-9960-4295-be98-18892e399260	9ce86df7-ae42-4e8f-9c53-85f3901d8f4f	t
a5c0cd4f-9960-4295-be98-18892e399260	7e38e21a-76ad-4b8a-8be2-da3ff54dbb90	f
a5c0cd4f-9960-4295-be98-18892e399260	b6d65dc0-5828-49cd-8a61-51b909a95424	f
a5c0cd4f-9960-4295-be98-18892e399260	a9fa8229-bcee-42fb-84c5-91b0df91a164	f
a5c0cd4f-9960-4295-be98-18892e399260	8e27f114-b1c4-47cb-8032-138c3805716d	f
b6ffcb90-757d-4454-bc80-afead1b60dc4	b3f8a4b6-06e2-4a09-b541-9f77e2f4e970	t
b6ffcb90-757d-4454-bc80-afead1b60dc4	a3a86244-e2bc-4626-a691-36026a20eaac	t
b6ffcb90-757d-4454-bc80-afead1b60dc4	b32226bf-f4fa-433f-b566-e8b8e95f686d	t
b6ffcb90-757d-4454-bc80-afead1b60dc4	21b57b5b-6b2a-4700-9180-060e36c2da9e	t
b6ffcb90-757d-4454-bc80-afead1b60dc4	9ce86df7-ae42-4e8f-9c53-85f3901d8f4f	t
b6ffcb90-757d-4454-bc80-afead1b60dc4	7e38e21a-76ad-4b8a-8be2-da3ff54dbb90	f
b6ffcb90-757d-4454-bc80-afead1b60dc4	b6d65dc0-5828-49cd-8a61-51b909a95424	f
b6ffcb90-757d-4454-bc80-afead1b60dc4	a9fa8229-bcee-42fb-84c5-91b0df91a164	f
b6ffcb90-757d-4454-bc80-afead1b60dc4	8e27f114-b1c4-47cb-8032-138c3805716d	f
98a507c1-1511-4e2a-aff8-89550c2e9a27	b3f8a4b6-06e2-4a09-b541-9f77e2f4e970	t
98a507c1-1511-4e2a-aff8-89550c2e9a27	a3a86244-e2bc-4626-a691-36026a20eaac	t
98a507c1-1511-4e2a-aff8-89550c2e9a27	b32226bf-f4fa-433f-b566-e8b8e95f686d	t
98a507c1-1511-4e2a-aff8-89550c2e9a27	21b57b5b-6b2a-4700-9180-060e36c2da9e	t
98a507c1-1511-4e2a-aff8-89550c2e9a27	9ce86df7-ae42-4e8f-9c53-85f3901d8f4f	t
98a507c1-1511-4e2a-aff8-89550c2e9a27	7e38e21a-76ad-4b8a-8be2-da3ff54dbb90	f
98a507c1-1511-4e2a-aff8-89550c2e9a27	b6d65dc0-5828-49cd-8a61-51b909a95424	f
98a507c1-1511-4e2a-aff8-89550c2e9a27	a9fa8229-bcee-42fb-84c5-91b0df91a164	f
98a507c1-1511-4e2a-aff8-89550c2e9a27	8e27f114-b1c4-47cb-8032-138c3805716d	f
cad6ab25-5328-4e82-baa9-50a954478705	b3f8a4b6-06e2-4a09-b541-9f77e2f4e970	t
cad6ab25-5328-4e82-baa9-50a954478705	a3a86244-e2bc-4626-a691-36026a20eaac	t
cad6ab25-5328-4e82-baa9-50a954478705	b32226bf-f4fa-433f-b566-e8b8e95f686d	t
cad6ab25-5328-4e82-baa9-50a954478705	21b57b5b-6b2a-4700-9180-060e36c2da9e	t
cad6ab25-5328-4e82-baa9-50a954478705	9ce86df7-ae42-4e8f-9c53-85f3901d8f4f	t
cad6ab25-5328-4e82-baa9-50a954478705	7e38e21a-76ad-4b8a-8be2-da3ff54dbb90	f
cad6ab25-5328-4e82-baa9-50a954478705	b6d65dc0-5828-49cd-8a61-51b909a95424	f
cad6ab25-5328-4e82-baa9-50a954478705	a9fa8229-bcee-42fb-84c5-91b0df91a164	f
cad6ab25-5328-4e82-baa9-50a954478705	8e27f114-b1c4-47cb-8032-138c3805716d	f
526d8a87-adcb-464b-9825-0ad9c321cfcd	b3f8a4b6-06e2-4a09-b541-9f77e2f4e970	t
526d8a87-adcb-464b-9825-0ad9c321cfcd	a3a86244-e2bc-4626-a691-36026a20eaac	t
526d8a87-adcb-464b-9825-0ad9c321cfcd	b32226bf-f4fa-433f-b566-e8b8e95f686d	t
526d8a87-adcb-464b-9825-0ad9c321cfcd	21b57b5b-6b2a-4700-9180-060e36c2da9e	t
526d8a87-adcb-464b-9825-0ad9c321cfcd	9ce86df7-ae42-4e8f-9c53-85f3901d8f4f	t
526d8a87-adcb-464b-9825-0ad9c321cfcd	7e38e21a-76ad-4b8a-8be2-da3ff54dbb90	f
526d8a87-adcb-464b-9825-0ad9c321cfcd	b6d65dc0-5828-49cd-8a61-51b909a95424	f
526d8a87-adcb-464b-9825-0ad9c321cfcd	a9fa8229-bcee-42fb-84c5-91b0df91a164	f
526d8a87-adcb-464b-9825-0ad9c321cfcd	8e27f114-b1c4-47cb-8032-138c3805716d	f
c4c6722f-da0c-4d9a-a651-f3ff1c34f74a	b3f8a4b6-06e2-4a09-b541-9f77e2f4e970	t
c4c6722f-da0c-4d9a-a651-f3ff1c34f74a	a3a86244-e2bc-4626-a691-36026a20eaac	t
c4c6722f-da0c-4d9a-a651-f3ff1c34f74a	b32226bf-f4fa-433f-b566-e8b8e95f686d	t
c4c6722f-da0c-4d9a-a651-f3ff1c34f74a	21b57b5b-6b2a-4700-9180-060e36c2da9e	t
c4c6722f-da0c-4d9a-a651-f3ff1c34f74a	9ce86df7-ae42-4e8f-9c53-85f3901d8f4f	t
c4c6722f-da0c-4d9a-a651-f3ff1c34f74a	7e38e21a-76ad-4b8a-8be2-da3ff54dbb90	f
c4c6722f-da0c-4d9a-a651-f3ff1c34f74a	b6d65dc0-5828-49cd-8a61-51b909a95424	f
c4c6722f-da0c-4d9a-a651-f3ff1c34f74a	a9fa8229-bcee-42fb-84c5-91b0df91a164	f
c4c6722f-da0c-4d9a-a651-f3ff1c34f74a	8e27f114-b1c4-47cb-8032-138c3805716d	f
928149f2-e5f0-433f-8627-3b365ba78f43	5d917fd0-475a-4cfc-b28d-cc0ba8ebbc12	t
928149f2-e5f0-433f-8627-3b365ba78f43	4bcdc5f8-ddbb-4903-bdce-75740243a6de	t
928149f2-e5f0-433f-8627-3b365ba78f43	b1809973-dc13-4006-ba94-56f00b4e0619	t
928149f2-e5f0-433f-8627-3b365ba78f43	07e618c7-bfa6-468b-adb2-e15ba0f56d04	t
928149f2-e5f0-433f-8627-3b365ba78f43	5df278e3-86c1-429a-af9c-ac3bb962d0ba	t
928149f2-e5f0-433f-8627-3b365ba78f43	0de9b76a-bccf-4d9c-b56f-6845cb6a6387	f
928149f2-e5f0-433f-8627-3b365ba78f43	5c5aa9a6-de06-4b20-b20c-3b21efd29cb3	f
928149f2-e5f0-433f-8627-3b365ba78f43	83878d56-5ac3-4322-afdd-7bdfc294bebd	f
928149f2-e5f0-433f-8627-3b365ba78f43	384ec609-a8d1-4ae4-97bf-d5e957132a5d	f
42d7f3cb-b3bf-4a0b-a6ec-068cf3f8478f	5d917fd0-475a-4cfc-b28d-cc0ba8ebbc12	t
42d7f3cb-b3bf-4a0b-a6ec-068cf3f8478f	4bcdc5f8-ddbb-4903-bdce-75740243a6de	t
42d7f3cb-b3bf-4a0b-a6ec-068cf3f8478f	b1809973-dc13-4006-ba94-56f00b4e0619	t
42d7f3cb-b3bf-4a0b-a6ec-068cf3f8478f	07e618c7-bfa6-468b-adb2-e15ba0f56d04	t
42d7f3cb-b3bf-4a0b-a6ec-068cf3f8478f	5df278e3-86c1-429a-af9c-ac3bb962d0ba	t
42d7f3cb-b3bf-4a0b-a6ec-068cf3f8478f	0de9b76a-bccf-4d9c-b56f-6845cb6a6387	f
42d7f3cb-b3bf-4a0b-a6ec-068cf3f8478f	5c5aa9a6-de06-4b20-b20c-3b21efd29cb3	f
42d7f3cb-b3bf-4a0b-a6ec-068cf3f8478f	83878d56-5ac3-4322-afdd-7bdfc294bebd	f
42d7f3cb-b3bf-4a0b-a6ec-068cf3f8478f	384ec609-a8d1-4ae4-97bf-d5e957132a5d	f
72dfb620-0862-4fe2-8451-974d6e51d22d	5d917fd0-475a-4cfc-b28d-cc0ba8ebbc12	t
72dfb620-0862-4fe2-8451-974d6e51d22d	4bcdc5f8-ddbb-4903-bdce-75740243a6de	t
72dfb620-0862-4fe2-8451-974d6e51d22d	b1809973-dc13-4006-ba94-56f00b4e0619	t
72dfb620-0862-4fe2-8451-974d6e51d22d	07e618c7-bfa6-468b-adb2-e15ba0f56d04	t
72dfb620-0862-4fe2-8451-974d6e51d22d	5df278e3-86c1-429a-af9c-ac3bb962d0ba	t
72dfb620-0862-4fe2-8451-974d6e51d22d	0de9b76a-bccf-4d9c-b56f-6845cb6a6387	f
72dfb620-0862-4fe2-8451-974d6e51d22d	5c5aa9a6-de06-4b20-b20c-3b21efd29cb3	f
72dfb620-0862-4fe2-8451-974d6e51d22d	83878d56-5ac3-4322-afdd-7bdfc294bebd	f
72dfb620-0862-4fe2-8451-974d6e51d22d	384ec609-a8d1-4ae4-97bf-d5e957132a5d	f
5063e93f-ce2b-48db-a18c-84fecf2e76b5	5d917fd0-475a-4cfc-b28d-cc0ba8ebbc12	t
5063e93f-ce2b-48db-a18c-84fecf2e76b5	4bcdc5f8-ddbb-4903-bdce-75740243a6de	t
5063e93f-ce2b-48db-a18c-84fecf2e76b5	b1809973-dc13-4006-ba94-56f00b4e0619	t
5063e93f-ce2b-48db-a18c-84fecf2e76b5	07e618c7-bfa6-468b-adb2-e15ba0f56d04	t
5063e93f-ce2b-48db-a18c-84fecf2e76b5	5df278e3-86c1-429a-af9c-ac3bb962d0ba	t
5063e93f-ce2b-48db-a18c-84fecf2e76b5	0de9b76a-bccf-4d9c-b56f-6845cb6a6387	f
5063e93f-ce2b-48db-a18c-84fecf2e76b5	5c5aa9a6-de06-4b20-b20c-3b21efd29cb3	f
5063e93f-ce2b-48db-a18c-84fecf2e76b5	83878d56-5ac3-4322-afdd-7bdfc294bebd	f
5063e93f-ce2b-48db-a18c-84fecf2e76b5	384ec609-a8d1-4ae4-97bf-d5e957132a5d	f
3c1f54e6-677d-4390-833e-c6fddac239b0	5d917fd0-475a-4cfc-b28d-cc0ba8ebbc12	t
3c1f54e6-677d-4390-833e-c6fddac239b0	4bcdc5f8-ddbb-4903-bdce-75740243a6de	t
3c1f54e6-677d-4390-833e-c6fddac239b0	b1809973-dc13-4006-ba94-56f00b4e0619	t
3c1f54e6-677d-4390-833e-c6fddac239b0	07e618c7-bfa6-468b-adb2-e15ba0f56d04	t
3c1f54e6-677d-4390-833e-c6fddac239b0	5df278e3-86c1-429a-af9c-ac3bb962d0ba	t
3c1f54e6-677d-4390-833e-c6fddac239b0	0de9b76a-bccf-4d9c-b56f-6845cb6a6387	f
3c1f54e6-677d-4390-833e-c6fddac239b0	5c5aa9a6-de06-4b20-b20c-3b21efd29cb3	f
3c1f54e6-677d-4390-833e-c6fddac239b0	83878d56-5ac3-4322-afdd-7bdfc294bebd	f
3c1f54e6-677d-4390-833e-c6fddac239b0	384ec609-a8d1-4ae4-97bf-d5e957132a5d	f
02a8082a-7107-4805-991d-5bd6f4aea9ff	5d917fd0-475a-4cfc-b28d-cc0ba8ebbc12	t
02a8082a-7107-4805-991d-5bd6f4aea9ff	4bcdc5f8-ddbb-4903-bdce-75740243a6de	t
02a8082a-7107-4805-991d-5bd6f4aea9ff	b1809973-dc13-4006-ba94-56f00b4e0619	t
02a8082a-7107-4805-991d-5bd6f4aea9ff	07e618c7-bfa6-468b-adb2-e15ba0f56d04	t
02a8082a-7107-4805-991d-5bd6f4aea9ff	5df278e3-86c1-429a-af9c-ac3bb962d0ba	t
02a8082a-7107-4805-991d-5bd6f4aea9ff	0de9b76a-bccf-4d9c-b56f-6845cb6a6387	f
02a8082a-7107-4805-991d-5bd6f4aea9ff	5c5aa9a6-de06-4b20-b20c-3b21efd29cb3	f
02a8082a-7107-4805-991d-5bd6f4aea9ff	83878d56-5ac3-4322-afdd-7bdfc294bebd	f
02a8082a-7107-4805-991d-5bd6f4aea9ff	384ec609-a8d1-4ae4-97bf-d5e957132a5d	f
417002ee-8613-452e-b8f0-f8c218f6652d	b3f8a4b6-06e2-4a09-b541-9f77e2f4e970	t
417002ee-8613-452e-b8f0-f8c218f6652d	a3a86244-e2bc-4626-a691-36026a20eaac	t
417002ee-8613-452e-b8f0-f8c218f6652d	b32226bf-f4fa-433f-b566-e8b8e95f686d	t
417002ee-8613-452e-b8f0-f8c218f6652d	21b57b5b-6b2a-4700-9180-060e36c2da9e	t
417002ee-8613-452e-b8f0-f8c218f6652d	9ce86df7-ae42-4e8f-9c53-85f3901d8f4f	t
417002ee-8613-452e-b8f0-f8c218f6652d	7e38e21a-76ad-4b8a-8be2-da3ff54dbb90	f
417002ee-8613-452e-b8f0-f8c218f6652d	b6d65dc0-5828-49cd-8a61-51b909a95424	f
417002ee-8613-452e-b8f0-f8c218f6652d	a9fa8229-bcee-42fb-84c5-91b0df91a164	f
417002ee-8613-452e-b8f0-f8c218f6652d	8e27f114-b1c4-47cb-8032-138c3805716d	f
77861797-fdcd-4947-a13a-3b1f38496674	b3f8a4b6-06e2-4a09-b541-9f77e2f4e970	t
77861797-fdcd-4947-a13a-3b1f38496674	a3a86244-e2bc-4626-a691-36026a20eaac	t
77861797-fdcd-4947-a13a-3b1f38496674	b32226bf-f4fa-433f-b566-e8b8e95f686d	t
77861797-fdcd-4947-a13a-3b1f38496674	21b57b5b-6b2a-4700-9180-060e36c2da9e	t
77861797-fdcd-4947-a13a-3b1f38496674	9ce86df7-ae42-4e8f-9c53-85f3901d8f4f	t
77861797-fdcd-4947-a13a-3b1f38496674	7e38e21a-76ad-4b8a-8be2-da3ff54dbb90	f
77861797-fdcd-4947-a13a-3b1f38496674	b6d65dc0-5828-49cd-8a61-51b909a95424	f
77861797-fdcd-4947-a13a-3b1f38496674	a9fa8229-bcee-42fb-84c5-91b0df91a164	f
77861797-fdcd-4947-a13a-3b1f38496674	8e27f114-b1c4-47cb-8032-138c3805716d	f
d54ba4a6-256b-4e5e-bfd4-2fb208bf84f9	b3f8a4b6-06e2-4a09-b541-9f77e2f4e970	t
d54ba4a6-256b-4e5e-bfd4-2fb208bf84f9	a3a86244-e2bc-4626-a691-36026a20eaac	t
d54ba4a6-256b-4e5e-bfd4-2fb208bf84f9	b32226bf-f4fa-433f-b566-e8b8e95f686d	t
d54ba4a6-256b-4e5e-bfd4-2fb208bf84f9	21b57b5b-6b2a-4700-9180-060e36c2da9e	t
d54ba4a6-256b-4e5e-bfd4-2fb208bf84f9	9ce86df7-ae42-4e8f-9c53-85f3901d8f4f	t
d54ba4a6-256b-4e5e-bfd4-2fb208bf84f9	7e38e21a-76ad-4b8a-8be2-da3ff54dbb90	f
d54ba4a6-256b-4e5e-bfd4-2fb208bf84f9	b6d65dc0-5828-49cd-8a61-51b909a95424	f
d54ba4a6-256b-4e5e-bfd4-2fb208bf84f9	a9fa8229-bcee-42fb-84c5-91b0df91a164	f
d54ba4a6-256b-4e5e-bfd4-2fb208bf84f9	8e27f114-b1c4-47cb-8032-138c3805716d	f
2562fb91-4b82-42b8-aa73-612927e02a94	5d917fd0-475a-4cfc-b28d-cc0ba8ebbc12	t
2562fb91-4b82-42b8-aa73-612927e02a94	4bcdc5f8-ddbb-4903-bdce-75740243a6de	t
2562fb91-4b82-42b8-aa73-612927e02a94	b1809973-dc13-4006-ba94-56f00b4e0619	t
2562fb91-4b82-42b8-aa73-612927e02a94	07e618c7-bfa6-468b-adb2-e15ba0f56d04	t
2562fb91-4b82-42b8-aa73-612927e02a94	5df278e3-86c1-429a-af9c-ac3bb962d0ba	t
2562fb91-4b82-42b8-aa73-612927e02a94	0de9b76a-bccf-4d9c-b56f-6845cb6a6387	f
2562fb91-4b82-42b8-aa73-612927e02a94	5c5aa9a6-de06-4b20-b20c-3b21efd29cb3	f
2562fb91-4b82-42b8-aa73-612927e02a94	83878d56-5ac3-4322-afdd-7bdfc294bebd	f
2562fb91-4b82-42b8-aa73-612927e02a94	384ec609-a8d1-4ae4-97bf-d5e957132a5d	f
1933ba2e-6c06-4466-b1c5-44b87f23a311	ff5fe863-8734-4cf2-af69-f18261d53492	t
1933ba2e-6c06-4466-b1c5-44b87f23a311	47600150-3aff-4e6b-8c8a-63030b7718a9	t
1933ba2e-6c06-4466-b1c5-44b87f23a311	2845c8ab-6a7b-4ca0-b83a-182fc73907dd	t
1933ba2e-6c06-4466-b1c5-44b87f23a311	ae9bf4a6-05d1-4bef-9772-d5dc9b77710c	t
1933ba2e-6c06-4466-b1c5-44b87f23a311	0c21cef9-585a-404e-b8f2-fbba43b1bb79	t
1933ba2e-6c06-4466-b1c5-44b87f23a311	eabf4c77-7d0b-403c-87e5-49a9243e3c8e	f
1933ba2e-6c06-4466-b1c5-44b87f23a311	46505150-ff79-4f47-909a-a520df58e767	f
1933ba2e-6c06-4466-b1c5-44b87f23a311	75d202a7-0e42-4362-910b-c957479087fe	f
1933ba2e-6c06-4466-b1c5-44b87f23a311	c102a4f2-8de9-429c-88da-dd094ed17600	f
fe783fd4-f23f-4777-9958-15ba12be6fb9	ff5fe863-8734-4cf2-af69-f18261d53492	t
fe783fd4-f23f-4777-9958-15ba12be6fb9	47600150-3aff-4e6b-8c8a-63030b7718a9	t
fe783fd4-f23f-4777-9958-15ba12be6fb9	2845c8ab-6a7b-4ca0-b83a-182fc73907dd	t
fe783fd4-f23f-4777-9958-15ba12be6fb9	ae9bf4a6-05d1-4bef-9772-d5dc9b77710c	t
fe783fd4-f23f-4777-9958-15ba12be6fb9	0c21cef9-585a-404e-b8f2-fbba43b1bb79	t
ce857b6b-099f-4727-a8e4-51203afebea3	0629b8d7-75de-457a-abf4-4d97423b1c0a	t
ce857b6b-099f-4727-a8e4-51203afebea3	2729bd3c-c919-4768-9c69-2e5152e94cd5	t
ce857b6b-099f-4727-a8e4-51203afebea3	9167a5b4-dd14-4d0b-bd36-d657f743670a	t
ce857b6b-099f-4727-a8e4-51203afebea3	46d940b1-fb0d-40ad-a551-6ca1eae0e844	t
ce857b6b-099f-4727-a8e4-51203afebea3	3dd11a2b-d310-4c68-a546-ade7fb0fbe50	t
ce857b6b-099f-4727-a8e4-51203afebea3	a1983e8d-2811-4ed6-adfd-6b16475d96db	f
ce857b6b-099f-4727-a8e4-51203afebea3	85f93bf5-c148-4aee-bf72-0a9c9fca86c6	f
ce857b6b-099f-4727-a8e4-51203afebea3	5adfbeaa-0d84-4438-8815-db1c1a01ea0c	f
ce857b6b-099f-4727-a8e4-51203afebea3	034b2113-cc61-4e5f-b921-e690ac46e24d	f
01cdc332-278c-4884-9386-3bc62a7c2df9	0629b8d7-75de-457a-abf4-4d97423b1c0a	t
01cdc332-278c-4884-9386-3bc62a7c2df9	2729bd3c-c919-4768-9c69-2e5152e94cd5	t
01cdc332-278c-4884-9386-3bc62a7c2df9	9167a5b4-dd14-4d0b-bd36-d657f743670a	t
01cdc332-278c-4884-9386-3bc62a7c2df9	46d940b1-fb0d-40ad-a551-6ca1eae0e844	t
01cdc332-278c-4884-9386-3bc62a7c2df9	3dd11a2b-d310-4c68-a546-ade7fb0fbe50	t
01cdc332-278c-4884-9386-3bc62a7c2df9	a1983e8d-2811-4ed6-adfd-6b16475d96db	f
01cdc332-278c-4884-9386-3bc62a7c2df9	85f93bf5-c148-4aee-bf72-0a9c9fca86c6	f
01cdc332-278c-4884-9386-3bc62a7c2df9	5adfbeaa-0d84-4438-8815-db1c1a01ea0c	f
01cdc332-278c-4884-9386-3bc62a7c2df9	034b2113-cc61-4e5f-b921-e690ac46e24d	f
b27eb59e-f415-46c5-af86-1c526634434c	0629b8d7-75de-457a-abf4-4d97423b1c0a	t
b27eb59e-f415-46c5-af86-1c526634434c	2729bd3c-c919-4768-9c69-2e5152e94cd5	t
b27eb59e-f415-46c5-af86-1c526634434c	9167a5b4-dd14-4d0b-bd36-d657f743670a	t
b27eb59e-f415-46c5-af86-1c526634434c	46d940b1-fb0d-40ad-a551-6ca1eae0e844	t
b27eb59e-f415-46c5-af86-1c526634434c	3dd11a2b-d310-4c68-a546-ade7fb0fbe50	t
b27eb59e-f415-46c5-af86-1c526634434c	a1983e8d-2811-4ed6-adfd-6b16475d96db	f
b27eb59e-f415-46c5-af86-1c526634434c	85f93bf5-c148-4aee-bf72-0a9c9fca86c6	f
b27eb59e-f415-46c5-af86-1c526634434c	5adfbeaa-0d84-4438-8815-db1c1a01ea0c	f
b27eb59e-f415-46c5-af86-1c526634434c	034b2113-cc61-4e5f-b921-e690ac46e24d	f
203a5e14-bbbd-40f9-b641-f1ea67c467d9	0629b8d7-75de-457a-abf4-4d97423b1c0a	t
203a5e14-bbbd-40f9-b641-f1ea67c467d9	2729bd3c-c919-4768-9c69-2e5152e94cd5	t
203a5e14-bbbd-40f9-b641-f1ea67c467d9	9167a5b4-dd14-4d0b-bd36-d657f743670a	t
203a5e14-bbbd-40f9-b641-f1ea67c467d9	46d940b1-fb0d-40ad-a551-6ca1eae0e844	t
203a5e14-bbbd-40f9-b641-f1ea67c467d9	3dd11a2b-d310-4c68-a546-ade7fb0fbe50	t
203a5e14-bbbd-40f9-b641-f1ea67c467d9	a1983e8d-2811-4ed6-adfd-6b16475d96db	f
203a5e14-bbbd-40f9-b641-f1ea67c467d9	85f93bf5-c148-4aee-bf72-0a9c9fca86c6	f
203a5e14-bbbd-40f9-b641-f1ea67c467d9	5adfbeaa-0d84-4438-8815-db1c1a01ea0c	f
203a5e14-bbbd-40f9-b641-f1ea67c467d9	034b2113-cc61-4e5f-b921-e690ac46e24d	f
269d9728-9023-4b46-8512-4820bf9d4331	0629b8d7-75de-457a-abf4-4d97423b1c0a	t
269d9728-9023-4b46-8512-4820bf9d4331	2729bd3c-c919-4768-9c69-2e5152e94cd5	t
269d9728-9023-4b46-8512-4820bf9d4331	9167a5b4-dd14-4d0b-bd36-d657f743670a	t
269d9728-9023-4b46-8512-4820bf9d4331	46d940b1-fb0d-40ad-a551-6ca1eae0e844	t
269d9728-9023-4b46-8512-4820bf9d4331	3dd11a2b-d310-4c68-a546-ade7fb0fbe50	t
269d9728-9023-4b46-8512-4820bf9d4331	a1983e8d-2811-4ed6-adfd-6b16475d96db	f
269d9728-9023-4b46-8512-4820bf9d4331	85f93bf5-c148-4aee-bf72-0a9c9fca86c6	f
269d9728-9023-4b46-8512-4820bf9d4331	5adfbeaa-0d84-4438-8815-db1c1a01ea0c	f
269d9728-9023-4b46-8512-4820bf9d4331	034b2113-cc61-4e5f-b921-e690ac46e24d	f
962887df-3902-4556-923d-622a6e793de3	0629b8d7-75de-457a-abf4-4d97423b1c0a	t
962887df-3902-4556-923d-622a6e793de3	2729bd3c-c919-4768-9c69-2e5152e94cd5	t
962887df-3902-4556-923d-622a6e793de3	9167a5b4-dd14-4d0b-bd36-d657f743670a	t
962887df-3902-4556-923d-622a6e793de3	46d940b1-fb0d-40ad-a551-6ca1eae0e844	t
962887df-3902-4556-923d-622a6e793de3	3dd11a2b-d310-4c68-a546-ade7fb0fbe50	t
962887df-3902-4556-923d-622a6e793de3	a1983e8d-2811-4ed6-adfd-6b16475d96db	f
962887df-3902-4556-923d-622a6e793de3	85f93bf5-c148-4aee-bf72-0a9c9fca86c6	f
962887df-3902-4556-923d-622a6e793de3	5adfbeaa-0d84-4438-8815-db1c1a01ea0c	f
962887df-3902-4556-923d-622a6e793de3	034b2113-cc61-4e5f-b921-e690ac46e24d	f
725c3687-2ed3-4c82-ba58-0127dc67f445	0629b8d7-75de-457a-abf4-4d97423b1c0a	t
725c3687-2ed3-4c82-ba58-0127dc67f445	2729bd3c-c919-4768-9c69-2e5152e94cd5	t
725c3687-2ed3-4c82-ba58-0127dc67f445	9167a5b4-dd14-4d0b-bd36-d657f743670a	t
725c3687-2ed3-4c82-ba58-0127dc67f445	46d940b1-fb0d-40ad-a551-6ca1eae0e844	t
725c3687-2ed3-4c82-ba58-0127dc67f445	3dd11a2b-d310-4c68-a546-ade7fb0fbe50	t
725c3687-2ed3-4c82-ba58-0127dc67f445	a1983e8d-2811-4ed6-adfd-6b16475d96db	f
725c3687-2ed3-4c82-ba58-0127dc67f445	85f93bf5-c148-4aee-bf72-0a9c9fca86c6	f
725c3687-2ed3-4c82-ba58-0127dc67f445	5adfbeaa-0d84-4438-8815-db1c1a01ea0c	f
725c3687-2ed3-4c82-ba58-0127dc67f445	034b2113-cc61-4e5f-b921-e690ac46e24d	f
40e8770f-aeae-4711-a208-8f8f4cd71021	676a39d7-db2d-4b0c-9ee7-0fe6e629c8ac	t
40e8770f-aeae-4711-a208-8f8f4cd71021	6dc97505-f071-4fd4-bc01-58a56e5985eb	t
40e8770f-aeae-4711-a208-8f8f4cd71021	e65232e9-5405-4fa8-abfe-e6b74891c21f	t
40e8770f-aeae-4711-a208-8f8f4cd71021	f299ed6e-d170-41f8-b7e1-2a63406adfcc	t
40e8770f-aeae-4711-a208-8f8f4cd71021	e65b2bf1-e2a4-4015-8c78-cf732e9efe20	t
40e8770f-aeae-4711-a208-8f8f4cd71021	4ba41e2c-1fd5-45d1-ab77-19269aaf5169	f
40e8770f-aeae-4711-a208-8f8f4cd71021	31da5254-ec0d-4f84-b9b5-53804d14ba82	f
40e8770f-aeae-4711-a208-8f8f4cd71021	99adc83f-41d2-4bab-b1d5-4fbab02b25de	f
40e8770f-aeae-4711-a208-8f8f4cd71021	e96c4d2e-33bb-45d7-8225-2578d24fa8b9	f
bd8261f7-9d01-4003-a5b5-c344168aa641	676a39d7-db2d-4b0c-9ee7-0fe6e629c8ac	t
bd8261f7-9d01-4003-a5b5-c344168aa641	6dc97505-f071-4fd4-bc01-58a56e5985eb	t
bd8261f7-9d01-4003-a5b5-c344168aa641	e65232e9-5405-4fa8-abfe-e6b74891c21f	t
bd8261f7-9d01-4003-a5b5-c344168aa641	f299ed6e-d170-41f8-b7e1-2a63406adfcc	t
bd8261f7-9d01-4003-a5b5-c344168aa641	e65b2bf1-e2a4-4015-8c78-cf732e9efe20	t
bd8261f7-9d01-4003-a5b5-c344168aa641	4ba41e2c-1fd5-45d1-ab77-19269aaf5169	f
bd8261f7-9d01-4003-a5b5-c344168aa641	31da5254-ec0d-4f84-b9b5-53804d14ba82	f
bd8261f7-9d01-4003-a5b5-c344168aa641	99adc83f-41d2-4bab-b1d5-4fbab02b25de	f
bd8261f7-9d01-4003-a5b5-c344168aa641	e96c4d2e-33bb-45d7-8225-2578d24fa8b9	f
90e5180e-54f6-49da-aaff-8b7d90119626	676a39d7-db2d-4b0c-9ee7-0fe6e629c8ac	t
90e5180e-54f6-49da-aaff-8b7d90119626	6dc97505-f071-4fd4-bc01-58a56e5985eb	t
90e5180e-54f6-49da-aaff-8b7d90119626	e65232e9-5405-4fa8-abfe-e6b74891c21f	t
90e5180e-54f6-49da-aaff-8b7d90119626	f299ed6e-d170-41f8-b7e1-2a63406adfcc	t
90e5180e-54f6-49da-aaff-8b7d90119626	e65b2bf1-e2a4-4015-8c78-cf732e9efe20	t
90e5180e-54f6-49da-aaff-8b7d90119626	4ba41e2c-1fd5-45d1-ab77-19269aaf5169	f
90e5180e-54f6-49da-aaff-8b7d90119626	31da5254-ec0d-4f84-b9b5-53804d14ba82	f
90e5180e-54f6-49da-aaff-8b7d90119626	99adc83f-41d2-4bab-b1d5-4fbab02b25de	f
90e5180e-54f6-49da-aaff-8b7d90119626	e96c4d2e-33bb-45d7-8225-2578d24fa8b9	f
7e9ddf81-ecb6-4337-8d3f-90ad988bd702	676a39d7-db2d-4b0c-9ee7-0fe6e629c8ac	t
7e9ddf81-ecb6-4337-8d3f-90ad988bd702	6dc97505-f071-4fd4-bc01-58a56e5985eb	t
7e9ddf81-ecb6-4337-8d3f-90ad988bd702	e65232e9-5405-4fa8-abfe-e6b74891c21f	t
7e9ddf81-ecb6-4337-8d3f-90ad988bd702	f299ed6e-d170-41f8-b7e1-2a63406adfcc	t
7e9ddf81-ecb6-4337-8d3f-90ad988bd702	e65b2bf1-e2a4-4015-8c78-cf732e9efe20	t
7e9ddf81-ecb6-4337-8d3f-90ad988bd702	4ba41e2c-1fd5-45d1-ab77-19269aaf5169	f
7e9ddf81-ecb6-4337-8d3f-90ad988bd702	31da5254-ec0d-4f84-b9b5-53804d14ba82	f
7e9ddf81-ecb6-4337-8d3f-90ad988bd702	99adc83f-41d2-4bab-b1d5-4fbab02b25de	f
7e9ddf81-ecb6-4337-8d3f-90ad988bd702	e96c4d2e-33bb-45d7-8225-2578d24fa8b9	f
548af2e3-5c3a-4f3b-8549-3b72fa039d22	676a39d7-db2d-4b0c-9ee7-0fe6e629c8ac	t
548af2e3-5c3a-4f3b-8549-3b72fa039d22	6dc97505-f071-4fd4-bc01-58a56e5985eb	t
548af2e3-5c3a-4f3b-8549-3b72fa039d22	e65232e9-5405-4fa8-abfe-e6b74891c21f	t
548af2e3-5c3a-4f3b-8549-3b72fa039d22	f299ed6e-d170-41f8-b7e1-2a63406adfcc	t
548af2e3-5c3a-4f3b-8549-3b72fa039d22	e65b2bf1-e2a4-4015-8c78-cf732e9efe20	t
548af2e3-5c3a-4f3b-8549-3b72fa039d22	4ba41e2c-1fd5-45d1-ab77-19269aaf5169	f
548af2e3-5c3a-4f3b-8549-3b72fa039d22	31da5254-ec0d-4f84-b9b5-53804d14ba82	f
548af2e3-5c3a-4f3b-8549-3b72fa039d22	99adc83f-41d2-4bab-b1d5-4fbab02b25de	f
548af2e3-5c3a-4f3b-8549-3b72fa039d22	e96c4d2e-33bb-45d7-8225-2578d24fa8b9	f
fc659080-6f8b-4b2f-b7d8-ef7b5b859603	676a39d7-db2d-4b0c-9ee7-0fe6e629c8ac	t
fc659080-6f8b-4b2f-b7d8-ef7b5b859603	6dc97505-f071-4fd4-bc01-58a56e5985eb	t
fc659080-6f8b-4b2f-b7d8-ef7b5b859603	e65232e9-5405-4fa8-abfe-e6b74891c21f	t
fc659080-6f8b-4b2f-b7d8-ef7b5b859603	f299ed6e-d170-41f8-b7e1-2a63406adfcc	t
fc659080-6f8b-4b2f-b7d8-ef7b5b859603	e65b2bf1-e2a4-4015-8c78-cf732e9efe20	t
fc659080-6f8b-4b2f-b7d8-ef7b5b859603	4ba41e2c-1fd5-45d1-ab77-19269aaf5169	f
fc659080-6f8b-4b2f-b7d8-ef7b5b859603	31da5254-ec0d-4f84-b9b5-53804d14ba82	f
fc659080-6f8b-4b2f-b7d8-ef7b5b859603	99adc83f-41d2-4bab-b1d5-4fbab02b25de	f
fc659080-6f8b-4b2f-b7d8-ef7b5b859603	e96c4d2e-33bb-45d7-8225-2578d24fa8b9	f
ef4b8911-9bac-4af9-af11-ed4989f050f5	676a39d7-db2d-4b0c-9ee7-0fe6e629c8ac	t
ef4b8911-9bac-4af9-af11-ed4989f050f5	6dc97505-f071-4fd4-bc01-58a56e5985eb	t
ef4b8911-9bac-4af9-af11-ed4989f050f5	e65232e9-5405-4fa8-abfe-e6b74891c21f	t
ef4b8911-9bac-4af9-af11-ed4989f050f5	f299ed6e-d170-41f8-b7e1-2a63406adfcc	t
ef4b8911-9bac-4af9-af11-ed4989f050f5	e65b2bf1-e2a4-4015-8c78-cf732e9efe20	t
ef4b8911-9bac-4af9-af11-ed4989f050f5	4ba41e2c-1fd5-45d1-ab77-19269aaf5169	f
ef4b8911-9bac-4af9-af11-ed4989f050f5	31da5254-ec0d-4f84-b9b5-53804d14ba82	f
ef4b8911-9bac-4af9-af11-ed4989f050f5	99adc83f-41d2-4bab-b1d5-4fbab02b25de	f
ef4b8911-9bac-4af9-af11-ed4989f050f5	e96c4d2e-33bb-45d7-8225-2578d24fa8b9	f
1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	185f848c-dd45-46ad-81ce-26c5be5c0ee7	t
1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	52c09584-d9a4-4bd6-b0ac-0fca69abc7b9	t
1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	4700486b-5409-48ed-bea9-f0257d6d0690	t
1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	1366450b-302c-48e2-bc7a-0a1f0a66479b	t
1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	80bad978-251c-47e3-903a-86af08c4b811	t
1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	a2675b92-0d79-4b69-b612-2a7c20433c47	f
1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	8aa30a2b-f3d5-406b-89f0-83e98d24df4a	f
1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	99c830a1-f8f5-4c82-8577-9d43ac671636	f
1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	62334196-39d2-4539-89fd-f90101dc5e03	f
055aed68-db28-4769-a5a2-3896b6383f81	185f848c-dd45-46ad-81ce-26c5be5c0ee7	t
055aed68-db28-4769-a5a2-3896b6383f81	52c09584-d9a4-4bd6-b0ac-0fca69abc7b9	t
055aed68-db28-4769-a5a2-3896b6383f81	4700486b-5409-48ed-bea9-f0257d6d0690	t
055aed68-db28-4769-a5a2-3896b6383f81	1366450b-302c-48e2-bc7a-0a1f0a66479b	t
055aed68-db28-4769-a5a2-3896b6383f81	80bad978-251c-47e3-903a-86af08c4b811	t
055aed68-db28-4769-a5a2-3896b6383f81	a2675b92-0d79-4b69-b612-2a7c20433c47	f
055aed68-db28-4769-a5a2-3896b6383f81	8aa30a2b-f3d5-406b-89f0-83e98d24df4a	f
055aed68-db28-4769-a5a2-3896b6383f81	99c830a1-f8f5-4c82-8577-9d43ac671636	f
055aed68-db28-4769-a5a2-3896b6383f81	62334196-39d2-4539-89fd-f90101dc5e03	f
06d132b3-1f68-4cf3-8adc-f8eb40500c8e	185f848c-dd45-46ad-81ce-26c5be5c0ee7	t
06d132b3-1f68-4cf3-8adc-f8eb40500c8e	52c09584-d9a4-4bd6-b0ac-0fca69abc7b9	t
06d132b3-1f68-4cf3-8adc-f8eb40500c8e	4700486b-5409-48ed-bea9-f0257d6d0690	t
06d132b3-1f68-4cf3-8adc-f8eb40500c8e	1366450b-302c-48e2-bc7a-0a1f0a66479b	t
06d132b3-1f68-4cf3-8adc-f8eb40500c8e	80bad978-251c-47e3-903a-86af08c4b811	t
06d132b3-1f68-4cf3-8adc-f8eb40500c8e	a2675b92-0d79-4b69-b612-2a7c20433c47	f
06d132b3-1f68-4cf3-8adc-f8eb40500c8e	8aa30a2b-f3d5-406b-89f0-83e98d24df4a	f
06d132b3-1f68-4cf3-8adc-f8eb40500c8e	99c830a1-f8f5-4c82-8577-9d43ac671636	f
06d132b3-1f68-4cf3-8adc-f8eb40500c8e	62334196-39d2-4539-89fd-f90101dc5e03	f
fcd3d799-45ca-49dc-8ba5-5a40a7b2db98	185f848c-dd45-46ad-81ce-26c5be5c0ee7	t
fcd3d799-45ca-49dc-8ba5-5a40a7b2db98	52c09584-d9a4-4bd6-b0ac-0fca69abc7b9	t
fcd3d799-45ca-49dc-8ba5-5a40a7b2db98	4700486b-5409-48ed-bea9-f0257d6d0690	t
fcd3d799-45ca-49dc-8ba5-5a40a7b2db98	1366450b-302c-48e2-bc7a-0a1f0a66479b	t
fcd3d799-45ca-49dc-8ba5-5a40a7b2db98	80bad978-251c-47e3-903a-86af08c4b811	t
fcd3d799-45ca-49dc-8ba5-5a40a7b2db98	a2675b92-0d79-4b69-b612-2a7c20433c47	f
fcd3d799-45ca-49dc-8ba5-5a40a7b2db98	8aa30a2b-f3d5-406b-89f0-83e98d24df4a	f
fcd3d799-45ca-49dc-8ba5-5a40a7b2db98	99c830a1-f8f5-4c82-8577-9d43ac671636	f
fcd3d799-45ca-49dc-8ba5-5a40a7b2db98	62334196-39d2-4539-89fd-f90101dc5e03	f
5eea5d8c-eae1-4307-adb6-da4e0148ee74	185f848c-dd45-46ad-81ce-26c5be5c0ee7	t
5eea5d8c-eae1-4307-adb6-da4e0148ee74	52c09584-d9a4-4bd6-b0ac-0fca69abc7b9	t
5eea5d8c-eae1-4307-adb6-da4e0148ee74	4700486b-5409-48ed-bea9-f0257d6d0690	t
5eea5d8c-eae1-4307-adb6-da4e0148ee74	1366450b-302c-48e2-bc7a-0a1f0a66479b	t
5eea5d8c-eae1-4307-adb6-da4e0148ee74	80bad978-251c-47e3-903a-86af08c4b811	t
5eea5d8c-eae1-4307-adb6-da4e0148ee74	a2675b92-0d79-4b69-b612-2a7c20433c47	f
5eea5d8c-eae1-4307-adb6-da4e0148ee74	8aa30a2b-f3d5-406b-89f0-83e98d24df4a	f
5eea5d8c-eae1-4307-adb6-da4e0148ee74	99c830a1-f8f5-4c82-8577-9d43ac671636	f
5eea5d8c-eae1-4307-adb6-da4e0148ee74	62334196-39d2-4539-89fd-f90101dc5e03	f
7a818d10-f579-486b-a765-914f257898e4	185f848c-dd45-46ad-81ce-26c5be5c0ee7	t
7a818d10-f579-486b-a765-914f257898e4	52c09584-d9a4-4bd6-b0ac-0fca69abc7b9	t
7a818d10-f579-486b-a765-914f257898e4	4700486b-5409-48ed-bea9-f0257d6d0690	t
7a818d10-f579-486b-a765-914f257898e4	1366450b-302c-48e2-bc7a-0a1f0a66479b	t
7a818d10-f579-486b-a765-914f257898e4	80bad978-251c-47e3-903a-86af08c4b811	t
7a818d10-f579-486b-a765-914f257898e4	a2675b92-0d79-4b69-b612-2a7c20433c47	f
7a818d10-f579-486b-a765-914f257898e4	8aa30a2b-f3d5-406b-89f0-83e98d24df4a	f
7a818d10-f579-486b-a765-914f257898e4	99c830a1-f8f5-4c82-8577-9d43ac671636	f
7a818d10-f579-486b-a765-914f257898e4	62334196-39d2-4539-89fd-f90101dc5e03	f
c83e2155-6053-4feb-9079-1c17482cfa53	185f848c-dd45-46ad-81ce-26c5be5c0ee7	t
c83e2155-6053-4feb-9079-1c17482cfa53	52c09584-d9a4-4bd6-b0ac-0fca69abc7b9	t
c83e2155-6053-4feb-9079-1c17482cfa53	4700486b-5409-48ed-bea9-f0257d6d0690	t
c83e2155-6053-4feb-9079-1c17482cfa53	1366450b-302c-48e2-bc7a-0a1f0a66479b	t
c83e2155-6053-4feb-9079-1c17482cfa53	80bad978-251c-47e3-903a-86af08c4b811	t
c83e2155-6053-4feb-9079-1c17482cfa53	a2675b92-0d79-4b69-b612-2a7c20433c47	f
c83e2155-6053-4feb-9079-1c17482cfa53	8aa30a2b-f3d5-406b-89f0-83e98d24df4a	f
c83e2155-6053-4feb-9079-1c17482cfa53	99c830a1-f8f5-4c82-8577-9d43ac671636	f
c83e2155-6053-4feb-9079-1c17482cfa53	62334196-39d2-4539-89fd-f90101dc5e03	f
fe783fd4-f23f-4777-9958-15ba12be6fb9	eabf4c77-7d0b-403c-87e5-49a9243e3c8e	f
fe783fd4-f23f-4777-9958-15ba12be6fb9	46505150-ff79-4f47-909a-a520df58e767	f
fe783fd4-f23f-4777-9958-15ba12be6fb9	75d202a7-0e42-4362-910b-c957479087fe	f
fe783fd4-f23f-4777-9958-15ba12be6fb9	c102a4f2-8de9-429c-88da-dd094ed17600	f
6976f573-c2a2-473c-9287-6767d325a277	ff5fe863-8734-4cf2-af69-f18261d53492	t
6976f573-c2a2-473c-9287-6767d325a277	47600150-3aff-4e6b-8c8a-63030b7718a9	t
6976f573-c2a2-473c-9287-6767d325a277	2845c8ab-6a7b-4ca0-b83a-182fc73907dd	t
6976f573-c2a2-473c-9287-6767d325a277	ae9bf4a6-05d1-4bef-9772-d5dc9b77710c	t
6976f573-c2a2-473c-9287-6767d325a277	0c21cef9-585a-404e-b8f2-fbba43b1bb79	t
6976f573-c2a2-473c-9287-6767d325a277	eabf4c77-7d0b-403c-87e5-49a9243e3c8e	f
6976f573-c2a2-473c-9287-6767d325a277	46505150-ff79-4f47-909a-a520df58e767	f
6976f573-c2a2-473c-9287-6767d325a277	75d202a7-0e42-4362-910b-c957479087fe	f
6976f573-c2a2-473c-9287-6767d325a277	c102a4f2-8de9-429c-88da-dd094ed17600	f
11512b0d-f605-437f-ba6e-2d241ee0002e	ff5fe863-8734-4cf2-af69-f18261d53492	t
11512b0d-f605-437f-ba6e-2d241ee0002e	47600150-3aff-4e6b-8c8a-63030b7718a9	t
11512b0d-f605-437f-ba6e-2d241ee0002e	2845c8ab-6a7b-4ca0-b83a-182fc73907dd	t
11512b0d-f605-437f-ba6e-2d241ee0002e	ae9bf4a6-05d1-4bef-9772-d5dc9b77710c	t
11512b0d-f605-437f-ba6e-2d241ee0002e	0c21cef9-585a-404e-b8f2-fbba43b1bb79	t
11512b0d-f605-437f-ba6e-2d241ee0002e	eabf4c77-7d0b-403c-87e5-49a9243e3c8e	f
11512b0d-f605-437f-ba6e-2d241ee0002e	46505150-ff79-4f47-909a-a520df58e767	f
11512b0d-f605-437f-ba6e-2d241ee0002e	75d202a7-0e42-4362-910b-c957479087fe	f
11512b0d-f605-437f-ba6e-2d241ee0002e	c102a4f2-8de9-429c-88da-dd094ed17600	f
194d9d32-bc5c-405b-bbdd-94cc13279160	ff5fe863-8734-4cf2-af69-f18261d53492	t
194d9d32-bc5c-405b-bbdd-94cc13279160	47600150-3aff-4e6b-8c8a-63030b7718a9	t
194d9d32-bc5c-405b-bbdd-94cc13279160	2845c8ab-6a7b-4ca0-b83a-182fc73907dd	t
194d9d32-bc5c-405b-bbdd-94cc13279160	ae9bf4a6-05d1-4bef-9772-d5dc9b77710c	t
194d9d32-bc5c-405b-bbdd-94cc13279160	0c21cef9-585a-404e-b8f2-fbba43b1bb79	t
194d9d32-bc5c-405b-bbdd-94cc13279160	eabf4c77-7d0b-403c-87e5-49a9243e3c8e	f
194d9d32-bc5c-405b-bbdd-94cc13279160	46505150-ff79-4f47-909a-a520df58e767	f
194d9d32-bc5c-405b-bbdd-94cc13279160	75d202a7-0e42-4362-910b-c957479087fe	f
194d9d32-bc5c-405b-bbdd-94cc13279160	c102a4f2-8de9-429c-88da-dd094ed17600	f
8b95af71-6ef9-4cd2-8165-6bf8e2b397ab	ff5fe863-8734-4cf2-af69-f18261d53492	t
8b95af71-6ef9-4cd2-8165-6bf8e2b397ab	47600150-3aff-4e6b-8c8a-63030b7718a9	t
8b95af71-6ef9-4cd2-8165-6bf8e2b397ab	2845c8ab-6a7b-4ca0-b83a-182fc73907dd	t
8b95af71-6ef9-4cd2-8165-6bf8e2b397ab	ae9bf4a6-05d1-4bef-9772-d5dc9b77710c	t
8b95af71-6ef9-4cd2-8165-6bf8e2b397ab	0c21cef9-585a-404e-b8f2-fbba43b1bb79	t
8b95af71-6ef9-4cd2-8165-6bf8e2b397ab	eabf4c77-7d0b-403c-87e5-49a9243e3c8e	f
8b95af71-6ef9-4cd2-8165-6bf8e2b397ab	46505150-ff79-4f47-909a-a520df58e767	f
8b95af71-6ef9-4cd2-8165-6bf8e2b397ab	75d202a7-0e42-4362-910b-c957479087fe	f
8b95af71-6ef9-4cd2-8165-6bf8e2b397ab	c102a4f2-8de9-429c-88da-dd094ed17600	f
9df70eb4-dea8-4ea0-841f-3718eced8d37	ff5fe863-8734-4cf2-af69-f18261d53492	t
9df70eb4-dea8-4ea0-841f-3718eced8d37	47600150-3aff-4e6b-8c8a-63030b7718a9	t
9df70eb4-dea8-4ea0-841f-3718eced8d37	2845c8ab-6a7b-4ca0-b83a-182fc73907dd	t
9df70eb4-dea8-4ea0-841f-3718eced8d37	ae9bf4a6-05d1-4bef-9772-d5dc9b77710c	t
9df70eb4-dea8-4ea0-841f-3718eced8d37	0c21cef9-585a-404e-b8f2-fbba43b1bb79	t
9df70eb4-dea8-4ea0-841f-3718eced8d37	eabf4c77-7d0b-403c-87e5-49a9243e3c8e	f
9df70eb4-dea8-4ea0-841f-3718eced8d37	46505150-ff79-4f47-909a-a520df58e767	f
9df70eb4-dea8-4ea0-841f-3718eced8d37	75d202a7-0e42-4362-910b-c957479087fe	f
9df70eb4-dea8-4ea0-841f-3718eced8d37	c102a4f2-8de9-429c-88da-dd094ed17600	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
8e27f114-b1c4-47cb-8032-138c3805716d	88bbd399-61ca-4793-8f16-510b85549f03
384ec609-a8d1-4ae4-97bf-d5e957132a5d	895aa141-91e5-4e76-b743-ae223b55b302
034b2113-cc61-4e5f-b921-e690ac46e24d	7829b6ca-e83a-4612-b385-1c355b58c9c9
99adc83f-41d2-4bab-b1d5-4fbab02b25de	9e661049-5ad1-49c1-86ab-6bd73695482a
a2675b92-0d79-4b69-b612-2a7c20433c47	84202fcf-efde-4d05-976f-c37cedd95876
75d202a7-0e42-4362-910b-c957479087fe	f712e44f-7301-4b39-b03a-259ec653b76c
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
4355a633-e703-44bd-a258-82d67c004775	Trusted Hosts	7b27a11d-121a-4360-960c-3ea6deb0ac35	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	7b27a11d-121a-4360-960c-3ea6deb0ac35	anonymous
90a6cf54-33cc-48aa-a115-f59e5fd71d3e	Consent Required	7b27a11d-121a-4360-960c-3ea6deb0ac35	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	7b27a11d-121a-4360-960c-3ea6deb0ac35	anonymous
3b23877f-bb96-4f66-a6bf-94d1847a56e9	Full Scope Disabled	7b27a11d-121a-4360-960c-3ea6deb0ac35	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	7b27a11d-121a-4360-960c-3ea6deb0ac35	anonymous
4a2d260a-09eb-437e-ace5-3f63af781ecb	Max Clients Limit	7b27a11d-121a-4360-960c-3ea6deb0ac35	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	7b27a11d-121a-4360-960c-3ea6deb0ac35	anonymous
c2ce8214-5821-454e-932b-351edfb0c9aa	Allowed Protocol Mapper Types	7b27a11d-121a-4360-960c-3ea6deb0ac35	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	7b27a11d-121a-4360-960c-3ea6deb0ac35	anonymous
2d854969-49b3-4662-bfcf-cb56e6a9fcbe	Allowed Client Scopes	7b27a11d-121a-4360-960c-3ea6deb0ac35	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	7b27a11d-121a-4360-960c-3ea6deb0ac35	anonymous
a19dd0ea-ded3-40ed-b5cf-1ebfaac23ee4	Allowed Protocol Mapper Types	7b27a11d-121a-4360-960c-3ea6deb0ac35	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	7b27a11d-121a-4360-960c-3ea6deb0ac35	authenticated
dbfded40-0e61-4825-9c48-786405b90453	Allowed Client Scopes	7b27a11d-121a-4360-960c-3ea6deb0ac35	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	7b27a11d-121a-4360-960c-3ea6deb0ac35	authenticated
512c980e-9598-4fe8-97a5-ff7b4d0f8b0b	rsa-generated	7b27a11d-121a-4360-960c-3ea6deb0ac35	rsa-generated	org.keycloak.keys.KeyProvider	7b27a11d-121a-4360-960c-3ea6deb0ac35	\N
e827b813-71cc-4598-9803-d57ee6683cf6	rsa-enc-generated	7b27a11d-121a-4360-960c-3ea6deb0ac35	rsa-enc-generated	org.keycloak.keys.KeyProvider	7b27a11d-121a-4360-960c-3ea6deb0ac35	\N
22f72b62-a523-442c-99da-beac8aa80f68	hmac-generated	7b27a11d-121a-4360-960c-3ea6deb0ac35	hmac-generated	org.keycloak.keys.KeyProvider	7b27a11d-121a-4360-960c-3ea6deb0ac35	\N
695c45b1-9d57-48bf-93b9-09881a723338	aes-generated	7b27a11d-121a-4360-960c-3ea6deb0ac35	aes-generated	org.keycloak.keys.KeyProvider	7b27a11d-121a-4360-960c-3ea6deb0ac35	\N
94bc00fb-1f34-45ff-9a72-4fa124658208	rsa-generated	aef5c390-9834-4cad-83be-4efe22893758	rsa-generated	org.keycloak.keys.KeyProvider	aef5c390-9834-4cad-83be-4efe22893758	\N
f172c332-fae8-42b5-9ac3-294c7f64cafa	rsa-enc-generated	aef5c390-9834-4cad-83be-4efe22893758	rsa-enc-generated	org.keycloak.keys.KeyProvider	aef5c390-9834-4cad-83be-4efe22893758	\N
3912c84c-9a7a-40b3-b9cd-64b44878d0bc	hmac-generated	aef5c390-9834-4cad-83be-4efe22893758	hmac-generated	org.keycloak.keys.KeyProvider	aef5c390-9834-4cad-83be-4efe22893758	\N
fab6bff2-707c-4956-a343-367a63cddf66	aes-generated	aef5c390-9834-4cad-83be-4efe22893758	aes-generated	org.keycloak.keys.KeyProvider	aef5c390-9834-4cad-83be-4efe22893758	\N
93a12c3a-ca7b-4e50-a951-28645e2de333	Trusted Hosts	aef5c390-9834-4cad-83be-4efe22893758	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	aef5c390-9834-4cad-83be-4efe22893758	anonymous
227338b9-5622-4f67-8924-3ff3e8b3b3c0	Consent Required	aef5c390-9834-4cad-83be-4efe22893758	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	aef5c390-9834-4cad-83be-4efe22893758	anonymous
1574a4e1-c660-4c88-87d8-9875086115c5	Full Scope Disabled	aef5c390-9834-4cad-83be-4efe22893758	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	aef5c390-9834-4cad-83be-4efe22893758	anonymous
7b2ddd8f-46da-491f-87da-85f783676691	Max Clients Limit	aef5c390-9834-4cad-83be-4efe22893758	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	aef5c390-9834-4cad-83be-4efe22893758	anonymous
bd06d903-851d-4db3-acee-c88724c143cf	Allowed Protocol Mapper Types	aef5c390-9834-4cad-83be-4efe22893758	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	aef5c390-9834-4cad-83be-4efe22893758	anonymous
a44611d9-59fb-4071-a654-d7b08873e8cd	Allowed Client Scopes	aef5c390-9834-4cad-83be-4efe22893758	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	aef5c390-9834-4cad-83be-4efe22893758	anonymous
24881177-4668-4c1b-86c9-c90b51d46892	Allowed Protocol Mapper Types	aef5c390-9834-4cad-83be-4efe22893758	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	aef5c390-9834-4cad-83be-4efe22893758	authenticated
57e8a3dd-9fda-431a-8f91-8a59cb54df3e	Allowed Client Scopes	aef5c390-9834-4cad-83be-4efe22893758	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	aef5c390-9834-4cad-83be-4efe22893758	authenticated
32fb5875-76ed-4c25-91ec-a6abfcbc2811	rsa-generated	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	rsa-generated	org.keycloak.keys.KeyProvider	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	\N
377d56d5-a881-4fdf-b833-dda5d105340b	rsa-enc-generated	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	rsa-enc-generated	org.keycloak.keys.KeyProvider	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	\N
fbfd2ed4-d878-4a08-8fa7-a29f1b386cdd	hmac-generated	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	hmac-generated	org.keycloak.keys.KeyProvider	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	\N
613f8ce8-6416-4c1d-ae6d-b89cdb8761f1	aes-generated	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	aes-generated	org.keycloak.keys.KeyProvider	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	\N
17741b8a-5b5c-4e7b-b672-1ae06e8acfe4	Trusted Hosts	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	anonymous
3adaac5a-745a-4c71-a3fb-e3eea913195c	Consent Required	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	anonymous
12acf27b-b16b-48b4-8efe-e664944a7ef0	Full Scope Disabled	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	anonymous
ccd0d013-d201-4013-848c-56808baad8ff	Max Clients Limit	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	anonymous
159bcfe5-3d6b-4abd-8938-39e812bad3d1	Allowed Protocol Mapper Types	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	anonymous
bac6d981-3664-4d08-935d-836327c6ead3	Allowed Client Scopes	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	anonymous
1d040259-ea17-4858-9a69-789181ab6046	Allowed Protocol Mapper Types	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	authenticated
117e1b6a-d6b0-4b13-af56-808503445e05	Allowed Client Scopes	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	authenticated
cdfaf845-98c4-4227-bf49-7a389f484706	\N	7b27a11d-121a-4360-960c-3ea6deb0ac35	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	7b27a11d-121a-4360-960c-3ea6deb0ac35	\N
e21157b6-9128-4ae8-bc72-caaa53763c38	rsa-generated	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	rsa-generated	org.keycloak.keys.KeyProvider	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	\N
783188ec-7e3f-4709-a4f0-1abde3df5d58	rsa-enc-generated	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	rsa-enc-generated	org.keycloak.keys.KeyProvider	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	\N
f2d8a107-8ff0-46a2-8dfe-615475af647d	hmac-generated	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	hmac-generated	org.keycloak.keys.KeyProvider	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	\N
69492527-e703-4b2c-8a0e-9e54c7a46132	aes-generated	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	aes-generated	org.keycloak.keys.KeyProvider	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	\N
9a8ee13b-56e3-4022-aaab-682f03b876c5	Trusted Hosts	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	anonymous
693b0bfa-2451-4efe-ad24-a1895bb60ff0	Consent Required	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	anonymous
0c776690-6cf0-4ec0-8c05-8633566d846f	Full Scope Disabled	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	anonymous
3ef8f767-4e05-48ef-a548-19f9bc229362	Max Clients Limit	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	anonymous
91ac48c4-6888-414e-a016-3cf77b7e1152	Allowed Protocol Mapper Types	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	anonymous
6a44f4ed-d419-4b76-9feb-288344f27538	Allowed Client Scopes	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	anonymous
7d2d0085-6ac7-4da1-b3f5-b53852ca47b7	Allowed Protocol Mapper Types	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	authenticated
0533753d-2b18-46cd-9bb6-4e294af2d747	Allowed Client Scopes	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	authenticated
cdf11bbe-0c28-4697-b81c-1fa63a117c67	rsa-generated	dd9bcc37-69c8-4b94-9737-50788f40287c	rsa-generated	org.keycloak.keys.KeyProvider	dd9bcc37-69c8-4b94-9737-50788f40287c	\N
26d1ea05-4a50-40ce-b456-2e4eb0d38eb2	rsa-enc-generated	dd9bcc37-69c8-4b94-9737-50788f40287c	rsa-enc-generated	org.keycloak.keys.KeyProvider	dd9bcc37-69c8-4b94-9737-50788f40287c	\N
d59d2b08-4ece-4184-a7b9-3b5513ca966c	hmac-generated	dd9bcc37-69c8-4b94-9737-50788f40287c	hmac-generated	org.keycloak.keys.KeyProvider	dd9bcc37-69c8-4b94-9737-50788f40287c	\N
de3b80d4-122c-435e-a384-5afaf2d2d2f7	aes-generated	dd9bcc37-69c8-4b94-9737-50788f40287c	aes-generated	org.keycloak.keys.KeyProvider	dd9bcc37-69c8-4b94-9737-50788f40287c	\N
d2c923f4-9dd9-4d52-a883-a5f64cb1c7cd	Trusted Hosts	dd9bcc37-69c8-4b94-9737-50788f40287c	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	dd9bcc37-69c8-4b94-9737-50788f40287c	anonymous
7fb44d70-aff0-46b3-b406-8c6b081e1645	Consent Required	dd9bcc37-69c8-4b94-9737-50788f40287c	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	dd9bcc37-69c8-4b94-9737-50788f40287c	anonymous
2a56789c-fb6c-4703-9157-5a44f6f7e374	Full Scope Disabled	dd9bcc37-69c8-4b94-9737-50788f40287c	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	dd9bcc37-69c8-4b94-9737-50788f40287c	anonymous
67699a7f-14ee-4999-95b5-ce575801d06b	Max Clients Limit	dd9bcc37-69c8-4b94-9737-50788f40287c	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	dd9bcc37-69c8-4b94-9737-50788f40287c	anonymous
4907f077-0438-4d39-9dc2-bcfd832fce63	Allowed Protocol Mapper Types	dd9bcc37-69c8-4b94-9737-50788f40287c	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	dd9bcc37-69c8-4b94-9737-50788f40287c	anonymous
76bec2fb-f485-4d2c-947d-b7f79acc62ce	Allowed Client Scopes	dd9bcc37-69c8-4b94-9737-50788f40287c	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	dd9bcc37-69c8-4b94-9737-50788f40287c	anonymous
14291a33-6cd8-47f3-a048-b88f8ea8b652	Allowed Protocol Mapper Types	dd9bcc37-69c8-4b94-9737-50788f40287c	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	dd9bcc37-69c8-4b94-9737-50788f40287c	authenticated
60e06a69-54fb-413f-a031-57d443ce916c	Allowed Client Scopes	dd9bcc37-69c8-4b94-9737-50788f40287c	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	dd9bcc37-69c8-4b94-9737-50788f40287c	authenticated
19450795-0176-4267-ab32-46b9649f1e58	rsa-generated	60d763c7-10e3-4490-8529-e1c97d983ade	rsa-generated	org.keycloak.keys.KeyProvider	60d763c7-10e3-4490-8529-e1c97d983ade	\N
633a23d9-10f6-40d7-a6fe-a7a9f52a9914	rsa-enc-generated	60d763c7-10e3-4490-8529-e1c97d983ade	rsa-enc-generated	org.keycloak.keys.KeyProvider	60d763c7-10e3-4490-8529-e1c97d983ade	\N
819352ca-63de-476b-ac32-5f8effcbeab5	hmac-generated	60d763c7-10e3-4490-8529-e1c97d983ade	hmac-generated	org.keycloak.keys.KeyProvider	60d763c7-10e3-4490-8529-e1c97d983ade	\N
4af92bcb-ca3e-4139-bfce-e2d62c400df8	aes-generated	60d763c7-10e3-4490-8529-e1c97d983ade	aes-generated	org.keycloak.keys.KeyProvider	60d763c7-10e3-4490-8529-e1c97d983ade	\N
15b9a83d-268b-41fb-9e5d-70d2929fa733	Trusted Hosts	60d763c7-10e3-4490-8529-e1c97d983ade	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	60d763c7-10e3-4490-8529-e1c97d983ade	anonymous
6b9fba9f-0aa1-4443-a410-7114c3a1db50	Consent Required	60d763c7-10e3-4490-8529-e1c97d983ade	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	60d763c7-10e3-4490-8529-e1c97d983ade	anonymous
4ac9a378-7273-4edd-9cf6-909c3c0eb2f5	Full Scope Disabled	60d763c7-10e3-4490-8529-e1c97d983ade	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	60d763c7-10e3-4490-8529-e1c97d983ade	anonymous
e0c18037-4660-49c7-954b-d7cfaa1c5309	Max Clients Limit	60d763c7-10e3-4490-8529-e1c97d983ade	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	60d763c7-10e3-4490-8529-e1c97d983ade	anonymous
2f0046f9-ccd2-4fcc-954e-0ecd45076264	Allowed Protocol Mapper Types	60d763c7-10e3-4490-8529-e1c97d983ade	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	60d763c7-10e3-4490-8529-e1c97d983ade	anonymous
e0aa71ac-5b71-48a5-b7b7-a2a64853e68f	Allowed Client Scopes	60d763c7-10e3-4490-8529-e1c97d983ade	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	60d763c7-10e3-4490-8529-e1c97d983ade	anonymous
8ba93fe6-19ed-4edb-815f-5416080b5176	Allowed Protocol Mapper Types	60d763c7-10e3-4490-8529-e1c97d983ade	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	60d763c7-10e3-4490-8529-e1c97d983ade	authenticated
b92971d9-2e72-40db-9af0-1e93a3213573	Allowed Client Scopes	60d763c7-10e3-4490-8529-e1c97d983ade	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	60d763c7-10e3-4490-8529-e1c97d983ade	authenticated
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
75af42e4-0626-43d0-8703-97fade0bc920	dbfded40-0e61-4825-9c48-786405b90453	allow-default-scopes	true
269c475f-b20a-4062-b2ef-06ed66a5f755	4355a633-e703-44bd-a258-82d67c004775	host-sending-registration-request-must-match	true
ead25ffa-65f1-46d9-a8ed-93136ae852a4	4355a633-e703-44bd-a258-82d67c004775	client-uris-must-match	true
ce5b9c72-81cd-461b-a61b-4bee78b0fa72	c2ce8214-5821-454e-932b-351edfb0c9aa	allowed-protocol-mapper-types	saml-user-property-mapper
aef6e783-913a-4672-8acb-a8c008f15433	c2ce8214-5821-454e-932b-351edfb0c9aa	allowed-protocol-mapper-types	oidc-address-mapper
ef02d9f1-daf8-4421-8be9-d445810a02c7	c2ce8214-5821-454e-932b-351edfb0c9aa	allowed-protocol-mapper-types	saml-user-attribute-mapper
3e37a407-2a29-4698-a617-4b26f94ea0f6	c2ce8214-5821-454e-932b-351edfb0c9aa	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
d362b2bd-a603-46c8-8e4b-d6f17cd636a3	c2ce8214-5821-454e-932b-351edfb0c9aa	allowed-protocol-mapper-types	oidc-full-name-mapper
93afa7a9-cd10-457a-b366-14c96aad3460	c2ce8214-5821-454e-932b-351edfb0c9aa	allowed-protocol-mapper-types	saml-role-list-mapper
d69aade0-8711-4052-8b2d-142cf5cb5c85	c2ce8214-5821-454e-932b-351edfb0c9aa	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
f8cbc3d6-ecba-4826-9688-493286385d71	c2ce8214-5821-454e-932b-351edfb0c9aa	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
63fecb1c-a610-4b2c-9c40-225a582bf9cb	4a2d260a-09eb-437e-ace5-3f63af781ecb	max-clients	200
bbe38646-442f-4c2b-8b9e-6b5a76463056	a19dd0ea-ded3-40ed-b5cf-1ebfaac23ee4	allowed-protocol-mapper-types	saml-role-list-mapper
091925aa-72e1-4208-8a51-359f7505a425	a19dd0ea-ded3-40ed-b5cf-1ebfaac23ee4	allowed-protocol-mapper-types	oidc-address-mapper
9d28cfec-c9b9-4b03-977a-3067eb828b0a	a19dd0ea-ded3-40ed-b5cf-1ebfaac23ee4	allowed-protocol-mapper-types	saml-user-property-mapper
a597377f-5c94-4f9a-ac91-2530face85a6	a19dd0ea-ded3-40ed-b5cf-1ebfaac23ee4	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
bddae14f-39eb-4153-8ace-54dfd24e7619	a19dd0ea-ded3-40ed-b5cf-1ebfaac23ee4	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
473c53f8-9c54-462a-a949-4daf48aad515	a19dd0ea-ded3-40ed-b5cf-1ebfaac23ee4	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
9195d9fb-2181-476e-86a7-6612ad0b5d46	a19dd0ea-ded3-40ed-b5cf-1ebfaac23ee4	allowed-protocol-mapper-types	oidc-full-name-mapper
c4c63b82-60da-40f5-8a63-c96dccfff4c7	a19dd0ea-ded3-40ed-b5cf-1ebfaac23ee4	allowed-protocol-mapper-types	saml-user-attribute-mapper
3438bcc9-7f4c-4b1d-9450-a76760e370c1	2d854969-49b3-4662-bfcf-cb56e6a9fcbe	allow-default-scopes	true
419a5f10-e61b-4e79-a98d-38766b54ce05	e827b813-71cc-4598-9803-d57ee6683cf6	priority	100
a701329d-fcde-4633-8533-14ef24fdbfb7	e827b813-71cc-4598-9803-d57ee6683cf6	privateKey	MIIEowIBAAKCAQEAmCDIiuRdyQLRaSEfXasku7pwHYg816IluqiN0BsW6ibCgqsjngdbAyyvaumAw0b0dl+nYlNwpzTf8oqa4OyF/PWfIHaFYexCn9hfVBvdv6iJM8QeCqttYm0f/p8cAo+DlYj/jlYZmEHlNE/ua8fW7bmToi3SASIp8HY7nQkxJC97ZL5jOsFycrtY6NF6WhvSHZt7TZr9fbvB3WyB6BaNfPBalE3QzOW4fGJPeaG1YDSUiTf7gY/G7gc9vV+oe30eNMQk6eFHhr+c+s8JqjesnwkxIdGJZNAn7euQ2hMb0rdXwW3PTh8IIbmqJ5B2EhFNCfFhLG5AqzEm6n//+S5jzwIDAQABAoIBAEfyNTXuw+YFdaldF1ryzkgUZ+KnpHKsxmAtSAhUT3WEyDgJHSqnOuVY9EtBTHrOK15yZZSsdpo1ePZZk97tLX8RYOT2+KTzmhzDtW3vUePLHrxDM5wDMBO9HUUL1bDmU6pcZNRZpvgpre8cIFuL4vuB6S7psaiEkkYdfJsLlliQe2oC3NlIUTOsqYBIYMKUpkQJo/wna2cWHXxdqatZ6W5T/Bz5JtlOJElUuxesiLRyfSPoBhNGaFo3KVBPYCNBhdUyy+yrtzMPijnpBzom1GkiBtnh5OkHHn1bN6H5OQXXqPRsUba7UEG5VFal6LvVT1Jy8iDTXD6a1jpjqOiHIlECgYEAzE1r0G4PE1HTOme/WR/MT5yz1qfcZzcTMmJBXZgiSeXp/BS1xmWmIMug3mtlUV0kQ3XczeZx3ae0B4MgJEJ2pgyoYJowZj8Bs0DcJYIpZSkS0EKsARdpNKt+yd2tQNIg/EnVgCPdW0kOQyZlS3wEuUjvpeplFHfjGxU9MDmtMfECgYEAvp+KYl1QzUk0wgS/1vmV5QaaRqSvFVpbdhdrzBJO+NOqw19ViU+0ZvWei7W75vzUj/oX0VUFwVOTzRV93B+r24I8QkHLCfwsZfqgh7sYeIwoApLH9kD84qVIEWHPQFE5PsKvKHkObdR5FbTJXLLmOQZloT4IwDcxxnWaqmnXMb8CgYAo9YCe+eG12trBQ9l98b0RXPZFG8Q5QTZtDHvUWtLNA/YkHrbOvsROoORwkxFt/YFusOuCsCe165BRTT2dZ2HIKpN7Qo5fgVRC7sb0EiNgb5qg/Czlzx69e4Bg0juQ2k/YpKjUFtyjF4NvfPwj5QpBZ1j8Z4C6WMrEPD7XM0kA0QKBgQCADLvxB65XuG1wR7B2wIIorx7Dhaz3MxNtaJ5JH6NdExMK2ueiraAJ6cTvJM1shTpk3SNSw0Jyc6o9gcpiLAROGFZSS9AQjQ1mE83yX4Q4ti3KTL92dIFr3oti4clO80D5H9552ZgPv0L3idIaKzLr65gpkHpgZLNTFX0oLKEaEQKBgBLfuMKAdlejAVG882f1yNkaU96gvPPF/L3vqJUqPi1mafNwhq6sxUec+H0REq9CLsCILyHWnx7EnVSFZqXagF/qk3kDu/7NQlZGvlY/hNG20XCiyrrVFaXcX5WJoT5RJSwEZEv1bvsKHkFP57qTTypfuqYePucoyGiBkN+JqqDv
cd4c41ac-4749-4aec-b04b-29338aaf1041	e827b813-71cc-4598-9803-d57ee6683cf6	certificate	MIICmzCCAYMCBgGHg2/5DzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwNDE1MDU0MTA2WhcNMzMwNDE1MDU0MjQ2WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCYIMiK5F3JAtFpIR9dqyS7unAdiDzXoiW6qI3QGxbqJsKCqyOeB1sDLK9q6YDDRvR2X6diU3CnNN/yiprg7IX89Z8gdoVh7EKf2F9UG92/qIkzxB4Kq21ibR/+nxwCj4OViP+OVhmYQeU0T+5rx9btuZOiLdIBIinwdjudCTEkL3tkvmM6wXJyu1jo0XpaG9Idm3tNmv19u8HdbIHoFo188FqUTdDM5bh8Yk95obVgNJSJN/uBj8buBz29X6h7fR40xCTp4UeGv5z6zwmqN6yfCTEh0Ylk0Cft65DaExvSt1fBbc9OHwghuaonkHYSEU0J8WEsbkCrMSbqf//5LmPPAgMBAAEwDQYJKoZIhvcNAQELBQADggEBABZ5GHl4txXPKIS9n5aHMJlnfWPcXbjQYAOsdFSoacsV9A7+8uMfG8kP0nlgFhmjEo9acHDGRebyWXaGi3BRdgxILzvD1Ok0VsKWt7VhwTuXRweiVXnf2DPdf6k13NIhUArPhH09n3oAuAYIAsREuh1hzXWfFlQhwMWCm/E+El8KsHooms4M+sqFfWhEl6yVBzzwrwmCfGXjoVBsCVsjSBzUahX/Z/En1GML2oVsobka/y9D7u+pAt2JQ7SKRALAxks1Y2x7UJB5dcTDqJiTUsf8sAAFZu9U7BT+3PHjr0XaUVrZ0DSqt25Vxq7BYUPLPVEqEoYjUt8x3Eor+yfGKEs=
6f3bb1cd-b4a6-421b-be04-b3582dd044cb	e827b813-71cc-4598-9803-d57ee6683cf6	keyUse	ENC
ae19be02-1f14-40fe-98e5-a4f47a99cae6	e827b813-71cc-4598-9803-d57ee6683cf6	algorithm	RSA-OAEP
cda09946-b4fb-4b1d-96d0-2258af4340a0	695c45b1-9d57-48bf-93b9-09881a723338	secret	HkjrNyQtaIXFCyV7oQuaTw
27524703-e1bb-4612-b896-e97fe6fa818d	695c45b1-9d57-48bf-93b9-09881a723338	kid	4aa03d9a-d2e3-4476-ab91-75613435c928
b9f0e986-bdc6-4555-a9d6-5a22663bccd0	695c45b1-9d57-48bf-93b9-09881a723338	priority	100
69b465a8-5623-414a-ab6a-644e5e31cb8e	22f72b62-a523-442c-99da-beac8aa80f68	priority	100
a3d33de7-99be-456c-a571-d969f969f2ef	22f72b62-a523-442c-99da-beac8aa80f68	kid	d77f751b-b76d-48f7-b0e2-f76d740b645f
a7d7797e-37fd-49c1-acc8-905a9805233f	22f72b62-a523-442c-99da-beac8aa80f68	secret	8GEAd6ZDoFmOcHLcG6uiiscQmo04oQdSF5OmYrge1IQ9Du7GZF9izfvaAj9HHpEd7_IWUh3jN8ZDyX_3RS6xtA
ed66651b-e92a-4570-b98a-72f087a2a191	22f72b62-a523-442c-99da-beac8aa80f68	algorithm	HS256
aa7aff66-9062-4a42-86e2-6546e77ff699	512c980e-9598-4fe8-97a5-ff7b4d0f8b0b	priority	100
b8ec2c5e-764e-4044-83a3-320f07f4edea	69492527-e703-4b2c-8a0e-9e54c7a46132	priority	100
3c2c2072-acdd-46bf-be21-e08989036b87	69492527-e703-4b2c-8a0e-9e54c7a46132	kid	41472785-5820-43ba-ba95-4c66eec14972
05ab753a-512a-4b4a-ba84-6f583c2e615e	69492527-e703-4b2c-8a0e-9e54c7a46132	secret	SMu9FZd2GkeI6rOjbwcw4A
5a5e3f06-dbab-477c-b7f9-036dcd34a396	f2d8a107-8ff0-46a2-8dfe-615475af647d	secret	1oYWSAGP4PkuzIhioE2lYESrDmqr2hPLcLKoRixR9_w3RTij5jc3wp2M0iHFl3aQaSyFib7KUv_Uqxb9uIz8Cg
dcf9e131-3d4f-4ea2-9b70-3b9e70d0845d	f2d8a107-8ff0-46a2-8dfe-615475af647d	algorithm	HS256
b469dced-72b4-463c-958e-476383093322	512c980e-9598-4fe8-97a5-ff7b4d0f8b0b	privateKey	MIIEowIBAAKCAQEA0nmx6Sj9kouhSPMqUnvHBAVxwjCJ8mUiKFDYnEUbjiYPNbuM8KNoHjJPMk5HJ3c2KWyzF06+6K+/nKXHVZuJ84LOp3Hd57jfwTp5anM3+ihtIiM+mfGjoKR1wSdv/JFrcH7OF9qmRT+uhaidisDlJzLBGG4smW7MXKaTA3XEOmIzjVdCgehdLgPeXvkWDadal0Xf3cKrnX3u7xlVydzFynOBRsGw67G8gjFGR7K++o4ukfL4PJbVOWdv3YK0vWq7f7vErJ9SAY4NaLQl0cqULaOfasMjuRgDwkgOHSLl/rrhvFTrQa9O1P1ITqigDhDuxmSg1uBZT6uKkOr/qur6wQIDAQABAoIBAE2m7leacutFLq0OYbfqyMMYCx9c7xgJ7e833KLS8FaifgwR9O63KuuxHfzuWlwaJFZmLzDTMaYBaU0u8HsKFnxL71hhr0AVuh+9Jhx7A9T8Yz8sB6WePANBidxIY42oTR5E+l5coel8lDPlwLH3dtPeatVLmJLHCQjJwAWPxmTPOJJIehbsWhaNUIfe/5paE5UXpExZ94zT33/qqfafb9Xya4DwRob/3TlgTBqLRmFKxZCpPJh6SNaJcKpjb0m1nHSNont1Wyl9zVxsB38hrGMuw9dMnBZSs+2XAesQe5NRvPTpHt6CmXWVXvbcq/pg3l2tBwgK+n7QsosuwO9+6T0CgYEA+CPdk+1kGd1DaRlvU3Pj3Oc8Bw7wb7FbRDTd1O0cjCKTcfWSb9WsI+N87uEtPo0TT+YKfUMjxpcIqKYLBdDDqGhNQRPar7DMNZZWdwfTQyitGrrm4sdg+kqlYQmMd/L8xNByINMYJrpggEXyZg3XV5FnkXFgpba76RfF0fBJkAsCgYEA2SRpRxTFePQoeIUkt3rXIcC7nu+DY3WEVcC4kQmLDzzEcT0tGZoBBRlWFanCjRhabjx0GP+1QjriEvk19VINVuS3NXVivoMaIqyl/2Qx/6TTNUSXc2J8nzosrm5Untt1mwDkHdXQySw2AujmTpfqpBC1/O5H/nRioWvrBOZ0Y+MCgYEAh3UMwHQW8QeYhQcdfrEE8tJIMpI1LsPizpkNf+7wZo95bfxgtCwwjGbjDIRf7oWUxUkO8NJ19TL9xxLdcY9FP+mwQpZUCxS4ZYhsKw5ahY7u8GiXIbU1e2zEWvSbed9rnQUtSD30MTAM/fkxGgT0SRlXME50NAJNEjGoC7LgdYECgYBesziO3Yo59BHqbfbTZmmIuOuap06gA9KRK5nS91yEarYpxMp0jeu/84rNq9nDe0mFJixj8rF0jwWlzLYxpXVX3ivgzq8f80FkufMzbNk5awMKCj4a/mrnbpGqCUgyd/fUgBD8yhFiizuLDVPUFwEoSHl2M92GJfAWAmDfJDrCjQKBgCYsMUPlCWCACOlP/oSGWc3R2Z6bPXISHSeeXk+vxBA5NThzAnJcYdor8yHEXzJGj6uYhQ4PnuzLzJZiAlkFFsnxs3cWPBINKjQO5CAcpOSPCAdVssoM18ZYG32msdojPg8GqX/61O4iNhr+q+NigB8RuHhUF8eTybebUvrKEBC3
3ac000a0-b0eb-4d36-a06e-6be6057f3300	512c980e-9598-4fe8-97a5-ff7b4d0f8b0b	keyUse	SIG
b2367b80-4573-405d-a875-e04cdeed77b1	512c980e-9598-4fe8-97a5-ff7b4d0f8b0b	certificate	MIICmzCCAYMCBgGHg2/3XzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMwNDE1MDU0MTA1WhcNMzMwNDE1MDU0MjQ1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDSebHpKP2Si6FI8ypSe8cEBXHCMInyZSIoUNicRRuOJg81u4zwo2geMk8yTkcndzYpbLMXTr7or7+cpcdVm4nzgs6ncd3nuN/BOnlqczf6KG0iIz6Z8aOgpHXBJ2/8kWtwfs4X2qZFP66FqJ2KwOUnMsEYbiyZbsxcppMDdcQ6YjONV0KB6F0uA95e+RYNp1qXRd/dwqudfe7vGVXJ3MXKc4FGwbDrsbyCMUZHsr76ji6R8vg8ltU5Z2/dgrS9art/u8Ssn1IBjg1otCXRypQto59qwyO5GAPCSA4dIuX+uuG8VOtBr07U/UhOqKAOEO7GZKDW4FlPq4qQ6v+q6vrBAgMBAAEwDQYJKoZIhvcNAQELBQADggEBALdfuM9h4TJrXOfFTSqW8mOqi5vek3tQlO4E3pQ3h7mXcTuwzUop4ZesZgwZpnqg/jqXebYRaOvAwnkwPBXjbVPVE7fsK4dOGGWpIYeZLiVKuayQmM0VYEjQ4fLSD8n8wOArwqS2abSUnQYXO0Pa3UcO3Jpnx6eKpQ6oSXFjGj3KUlTjoNaLHVSd0HtMWjSCy/ipQu070p2vxUcgVnVW2AeRRZhMTEEYcOaq8lGl/Av1KiCtp+R+CROCWwmoHE+tK0reDMdZ1v46Ha40w4pIG93kO3XVGNECFZyIS+65ZPhn+3cUtxY+eH8obhy7EmRubYo5hId9iaJ4JJ/u5yLUMqY=
bf6a9077-1de1-4d45-9f28-155b60aad5b7	f172c332-fae8-42b5-9ac3-294c7f64cafa	certificate	MIICmTCCAYECBgGHg/mZQjANBgkqhkiG9w0BAQsFADAQMQ4wDAYDVQQDDAVoY211dDAeFw0yMzA0MTUwODExMjVaFw0zMzA0MTUwODEzMDVaMBAxDjAMBgNVBAMMBWhjbXV0MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjL0sIreWoLjx/HfxCWevFlWEbRolvcC9bwAWhs7m46P4Wmqzm4bBAaZUomd48EK3geYalTEuf5ZwIFQM2dGQrs5PjT0rQCjljR3C4cO7s97aEu0WsQ/fUkDsFykcPQSM+7XsMnhnXTcK6wXYpz3z1Yi2qmGt57Wxn7q+SPE+D8ycLzl30+wxeNKpr2XColiqc8K73uTqXrkvI+Abkcrt8RymJCHL7XuVCN17R2ZK2h7SfO7tr8x6wK76Y5GfDdSiCezKWQFXnJhoN4EKdhw0EjOmTK/dQpsM+lhqfnbY/BdFv361gvXjsJj7yvq96f5yeBmNQGmwr4DsNgwDEgI5twIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQAS9661ipoGlZ2S2nMzYXHxaMAHMrE2qXWbHAMkuR2zxK83kZU1eODyi3eF2ixvok371D+bcmnOxRPZEIOyYXINJtmOzepKqGDIMZ3x0DQMQ6lTVtTDZEdu2EGp4U1hwQ5QZDTHKB58oXqKaXqEBCz3yYSmfOSVvFcpwjuYIQ8WDPVnJLJg1XvShCgxJs1dAhcvBtg09Lah4H8pADJ4Ai1gq4LI4cSGCOi8AzECLCbLuKJZQONY8A5No5l7+/59I25haxnYLJ5LniecZbBPGU4CEajuo4jRtaKfALD5Qzd/m5Gia9Yqc31y3M2LE+3XwiZRz58zLzNt+zm1/QjqiYPu
6bfd9b85-86b0-441d-bc57-7deebae53fda	f172c332-fae8-42b5-9ac3-294c7f64cafa	privateKey	MIIEogIBAAKCAQEAjL0sIreWoLjx/HfxCWevFlWEbRolvcC9bwAWhs7m46P4Wmqzm4bBAaZUomd48EK3geYalTEuf5ZwIFQM2dGQrs5PjT0rQCjljR3C4cO7s97aEu0WsQ/fUkDsFykcPQSM+7XsMnhnXTcK6wXYpz3z1Yi2qmGt57Wxn7q+SPE+D8ycLzl30+wxeNKpr2XColiqc8K73uTqXrkvI+Abkcrt8RymJCHL7XuVCN17R2ZK2h7SfO7tr8x6wK76Y5GfDdSiCezKWQFXnJhoN4EKdhw0EjOmTK/dQpsM+lhqfnbY/BdFv361gvXjsJj7yvq96f5yeBmNQGmwr4DsNgwDEgI5twIDAQABAoIBAB4gwwl9jqfCX78ht/5A7WjVDr/CWLD5yTOxa6EZOrEhoWFNtTxGiRu+zSBlES0xwxHyPd+RQzh57m/lPkkExTm+naYJIbCe8KEYbWciHRUA0GM70N8/nBmCH2hH2y0uw7WAuNsHDm2UgmhUfJA0wXWFSkFIHs/bA/bDJcf8qMH9xGbhz5MJKJY4R29fFrVMLbYyittiEjcGtUS8p2sA/FF3jvcxpQc1KiErszQA91VpgF8mUjEHCdcDW5VYFEixC4CUYiCEmrKdGR1nbxc93LRPYfZrN++PuDLYP524Cqmxnf4R49Lx0E1WXOCKpyT6QhbviFIBLdXCWeG1tKjbgIECgYEAwy4kVz6DBz8Ptj4pTokZEogGwuVyWIS+SoFEAKtliu2ExeXx6Z4vRoWzYpUjV5hRhG0cBonnM1g8bHY7lBpYo857g85DCDF3dEr8Yr7ohEABwMNLurcXAi9zFhTg01iBW1VrjFRNcA1jULOBP7DQN5mCKw22ahTy4TBEHEerdIECgYEAuJgoKPPrEvjCEn8V2+15rJ/nMweJJiCB04Uv/w+XS9mZdKAEiu94E2KWSWwD/bJapvWws4nU6d8fw8oR/xOJ7jMfsof020LztF5fAINDDU7Ldev6UltZa8Hh9Gexzj7BVzzVOPNvGuz69oS9GIUU9M46/jYj0ZgiOf1sCb3rMjcCgYBQkL9Xc+pKF3G43DfYvyamS5fe4y8r8r9JqcoULKuhiSGBPsV4lV8WUSIW01DfW3RqoU8sM8hHnWhzrOoy3B0yoIzDf2SUATc5vaooaH05+eG/W93qmKDauhNbTgrvslzTApN+PV4pnp0cNrxnOej4yli8xNBDQZpv8ahrs/nGAQKBgHPSBGCtqrEco6g3VN/JAK7vJYE/GS5y9wJgbtz6S1OsFDy4qiECX7TKBsHKpDZp0bcwMM51jMGw3Z1bDC+fcsuiCCFcbKWmPILPM4x+z3NqHP7AMS+7YT/bRoqzBT0C4wx5fs9c7jlWt6A1aPAZkCyJuToHfjHj4pXADCmQoCHBAoGAFnfJcVzsRW0WbL9yR6S8oKQReaVuRt0LHIPXXXGYGOLtfj1XKJz6JDsmX3/TaHh4U4jppXe/5CmL5LricoU0TjWN8vddLb0lBcFXfX47nsE0MH39AEY1jIrQlhxTLxtcu2WEJSjVdILcJf1/iug7/eiglkkk4yik82Wsns4WGzE=
161274a8-23fc-4ff2-8138-71602dc7e5cb	f172c332-fae8-42b5-9ac3-294c7f64cafa	keyUse	ENC
8c899c5d-02d9-498e-bf95-fe32383ec258	f172c332-fae8-42b5-9ac3-294c7f64cafa	algorithm	RSA-OAEP
835baf5f-afd5-455b-b571-3b724f4bc8c0	f172c332-fae8-42b5-9ac3-294c7f64cafa	priority	100
893fe26a-eadf-49ec-b78d-cd0664e1728c	3912c84c-9a7a-40b3-b9cd-64b44878d0bc	kid	9a4f8cf6-9c5f-421a-9f42-e3038cf7dea9
7027aae9-4fc7-4ae6-843b-7c80bc58db0a	3912c84c-9a7a-40b3-b9cd-64b44878d0bc	secret	t3sGwH4DC9muDzHmVpmkHmO_hNNNDdeWdn_3gwKoZF6a40I0qSl0BWnrGYCvP3AccQzuon2HPYTiHSy3wAraHg
ea1b1431-306d-4dac-8fe9-372bcc4ab545	3912c84c-9a7a-40b3-b9cd-64b44878d0bc	algorithm	HS256
54d88018-8c58-40ef-a40a-710e058aa5b7	3912c84c-9a7a-40b3-b9cd-64b44878d0bc	priority	100
c6d8b5dc-11f7-489d-9832-8351af417f4c	fab6bff2-707c-4956-a343-367a63cddf66	kid	141b71fa-ef34-484a-af78-b75847cd7617
1d2a7840-cf58-4823-8243-ba4dd7b59a21	fab6bff2-707c-4956-a343-367a63cddf66	secret	pocSc2PUBPy0ao_ls6KkxA
053142ec-2abf-476c-9202-0458f2ced7ec	fab6bff2-707c-4956-a343-367a63cddf66	priority	100
e30ad922-7843-47af-912c-e533553516c2	94bc00fb-1f34-45ff-9a72-4fa124658208	priority	100
36f51dc4-05c6-43b4-a102-558a09ee8728	94bc00fb-1f34-45ff-9a72-4fa124658208	certificate	MIICmTCCAYECBgGHg/mVpzANBgkqhkiG9w0BAQsFADAQMQ4wDAYDVQQDDAVoY211dDAeFw0yMzA0MTUwODExMjRaFw0zMzA0MTUwODEzMDRaMBAxDjAMBgNVBAMMBWhjbXV0MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAw22E/4WpiDOqWKVN5EHA3XdhDwViAcsxYV8+tlaCTmQYSnhO7hK4dVEPrgpNsrUc6YjiH2gMJ4xWmYpCH835AgaYoIdSZ3VHNh3SjgMpwJpzbaW/kY/FF4P5e2USvwMnbT3u2WgWc8Zp7QrQjDptoUnB+G8tX+IVixRNLCXxBELs2W6X2ueovr0CflrhAD/3UTTeNQPiwfcz+8aoerm8RkwAQeeOzECGOyMK18AXdUAlUuvp8rTvDWpTeRfg3g8p1ao21nyGC9hTm6CEceYHDY9iZr/zuJdvJa0gCcOXCcK7NNNBOdEhqzwSS5e4mQYTmFccCUEp6m8YedCd4R1TTwIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQBXnF+CNHUcNb85VclT3AFQNp07Rk3RduWJZPi4eSMVxDX0SNmhw2DpYfXtXaK0UydP3QGaiz0cyESYbxFeSclFar0U4r1S5UqvRmYcViwdy2ivYy9CmE2SqIWrugFuZEJyD0N5ypvHo8+yQh3ubLMO5nqyzAnFt+3CrSVlApiyPqCVrOxGel3fbLI+YbltrB/+/npt0oqAL7CO84Wyq9pxj9OOS2b0zDe1xD764OJDxVnus9BY20xqlEjRQ0mQElSCOlDPzkcmo/Rga38KhDYmvbrt2OyBWOTqwd5oLxUucse5ehIZrMuMReWGTrBG05WjurqKHluI7SgMtZ+Eahw9
148c087f-bf0f-456f-aa0e-f87401869e81	94bc00fb-1f34-45ff-9a72-4fa124658208	keyUse	SIG
08192f66-114c-4c27-bc88-cf122a69f4e6	94bc00fb-1f34-45ff-9a72-4fa124658208	privateKey	MIIEowIBAAKCAQEAw22E/4WpiDOqWKVN5EHA3XdhDwViAcsxYV8+tlaCTmQYSnhO7hK4dVEPrgpNsrUc6YjiH2gMJ4xWmYpCH835AgaYoIdSZ3VHNh3SjgMpwJpzbaW/kY/FF4P5e2USvwMnbT3u2WgWc8Zp7QrQjDptoUnB+G8tX+IVixRNLCXxBELs2W6X2ueovr0CflrhAD/3UTTeNQPiwfcz+8aoerm8RkwAQeeOzECGOyMK18AXdUAlUuvp8rTvDWpTeRfg3g8p1ao21nyGC9hTm6CEceYHDY9iZr/zuJdvJa0gCcOXCcK7NNNBOdEhqzwSS5e4mQYTmFccCUEp6m8YedCd4R1TTwIDAQABAoIBABpyRjwhYEgJxy+C2Jp0mX8pn21dyvMM29cJAXQXG0A02c1Yyu77LTzXEO+k/k8aT6983Njnht7ikM+WFGJjHc5RNTNizLB/1aNfACDuuvuRCzYskX2cfqKy3elTIWkkVKAQcF5kcHFkyZiQokNFHuk45t0nXR/AzoMz5p5Rrh7ncRnmlEXCWjJ7nSTLrIBnibzZq4MmSdehBmYzQ2eB9DkhY0HdiJLkEMooseTA5mTobsNxXMCW/D4KSJfD/SlAOtc6L+3O3Ht2Lw/NzQtfb9LBWN5GlJTQ0TiF4w86UWeqrT5t8818y18gxSOThyqBf2yUavwUgds45nWD89MsRLUCgYEA4ohWJX5m6uSS9dptJfe3USMqalj4IcB5zXekBS/XOqs3KgDNWRF1ZlL1iSwfcJlXomDCBw6zwTTZLN5YG8qbVUOFP3ECSeaWnBwv9gC68Xm3FMzXFiSF0MI2jTOBpNQ16RjfKo+1TD4PLeEVWd5a/MLQIm9b/tNEgliGeSude/sCgYEA3NlggiGUrJrwzmGBcHZ8FrV+PAyaUausP2vkvkJYRPK2dL2YFm/uurf0RmvihwHQKx9hzBas36s5VGIW3OM6Dxid2VpNmKTl9+L673ZdU/gAg3SGpX3cK0dtXjeiAWSGlWmSKWUW4yxeesneuMmSiprlqQ7RhI+afwG2tu0tcb0CgYEAn3tygsUBud8gI5waeb9zPNkwFFz8m+6BEgln3Qr4UOKXXKfh6hHjgB1ppZ/9pm0eiD/secF9BcmqF++VQkOapiV6Gtb50INZhyBFF8Ed28FgBnHL/1fJKdaBR1l6rUuFhMyw2KsB7WJHl3o+aN2lWwvgMk4KC1Y7hjTCv23YWp8CgYBXEsGRLQpAL2qIBDuTirOMBIy7wkBJuQTVkIWEWgYRURyM1H+VQRZ/ua1u4nRSxG09w0a8v6fzG8Aju/TFrDUk5JC/tHHpoAInhO9o4GMViy8wpQ29S+01hxjgz9Bo+ihx2kjNV1T5xnGNue+9LYRAb6fiyrvipvfD4XoXj1WehQKBgCSY2CqOCExhYLpM7n6F0UgoE8lgGvvKR/zOeMe35Mit1eJZwO+ddCRdDt4R/vm+NxsewPcGJwB+PwZSp4u3og4imhC5oD2Mk2WeXSUndt9cNxF3AZ7ffrRI4rWrP+iJMuBByGkM/2wET1/PTVdm+ALS/nzsaNm+yEiMqqK/qm6h
d5153c1b-98a7-45e4-b718-fe41103bcb26	24881177-4668-4c1b-86c9-c90b51d46892	allowed-protocol-mapper-types	saml-user-attribute-mapper
62f072f1-7ea2-4110-86d7-680a22bc8005	24881177-4668-4c1b-86c9-c90b51d46892	allowed-protocol-mapper-types	oidc-address-mapper
4f07abf9-c548-4eb5-ab84-5511a4772f75	24881177-4668-4c1b-86c9-c90b51d46892	allowed-protocol-mapper-types	oidc-full-name-mapper
ea05108a-8e3c-4509-8491-a9e49a1ebf63	24881177-4668-4c1b-86c9-c90b51d46892	allowed-protocol-mapper-types	saml-user-property-mapper
15a54f13-9b66-4675-aabb-87813671a7d4	24881177-4668-4c1b-86c9-c90b51d46892	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
bf5bf82a-c947-43c0-b1fe-0a8635defa69	24881177-4668-4c1b-86c9-c90b51d46892	allowed-protocol-mapper-types	saml-role-list-mapper
e705bf0b-d8d7-4240-995a-46038fdc283e	24881177-4668-4c1b-86c9-c90b51d46892	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
d2560c46-d6fa-4364-984d-b0e2caf86029	24881177-4668-4c1b-86c9-c90b51d46892	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
b493da94-9c89-46f5-bb69-8372c80c3de7	57e8a3dd-9fda-431a-8f91-8a59cb54df3e	allow-default-scopes	true
fe7061d7-3d1d-4f33-bd2d-de130e94cb56	bd06d903-851d-4db3-acee-c88724c143cf	allowed-protocol-mapper-types	oidc-address-mapper
9af9ff7e-3184-43cc-a8aa-44a02905bb75	bd06d903-851d-4db3-acee-c88724c143cf	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
cedfdb57-619f-4843-a464-d4e077eab86e	bd06d903-851d-4db3-acee-c88724c143cf	allowed-protocol-mapper-types	saml-user-attribute-mapper
bf085c36-abb0-4dc8-9693-2e7e675359e7	bd06d903-851d-4db3-acee-c88724c143cf	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
89f8ea44-52ec-4342-93ae-00e8cfdc50b3	bd06d903-851d-4db3-acee-c88724c143cf	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
af554a25-4207-48b8-bd8f-42c1acff7bce	bd06d903-851d-4db3-acee-c88724c143cf	allowed-protocol-mapper-types	oidc-full-name-mapper
481ed270-f457-4304-a08c-83c5147b51c3	bd06d903-851d-4db3-acee-c88724c143cf	allowed-protocol-mapper-types	saml-role-list-mapper
5b18f684-8df8-4760-b386-4013d92015a3	bd06d903-851d-4db3-acee-c88724c143cf	allowed-protocol-mapper-types	saml-user-property-mapper
3dd66c42-e974-404c-83f8-6465c9b8518b	93a12c3a-ca7b-4e50-a951-28645e2de333	host-sending-registration-request-must-match	true
86a2b45b-bb72-42c9-826f-6655f73432e9	93a12c3a-ca7b-4e50-a951-28645e2de333	client-uris-must-match	true
c88afae3-1263-48ac-8b61-17d94862293d	a44611d9-59fb-4071-a654-d7b08873e8cd	allow-default-scopes	true
2b93ebdc-8a75-491d-85c1-5c35d0c75d42	7b2ddd8f-46da-491f-87da-85f783676691	max-clients	200
a697242c-c3f4-4471-8162-f6008fd06859	19450795-0176-4267-ab32-46b9649f1e58	priority	100
487af430-73c7-4893-80a9-41e69679725f	19450795-0176-4267-ab32-46b9649f1e58	privateKey	MIIEogIBAAKCAQEA0AiWxvPT9U+ax+LR54Y7KRRAVClZL2vpH3A9KHvUYXMPoP9SYiD7mZqbauxBEb14c3CMlhZDT6iuKpicXlaeJuYlyYoACaJZ1Obg23XdxwU0hD2XaaLszy8N/dj6CIM7319zhMdEGk8xEuJSdNCNDhb7CDwZ/ttRG7vC8e7iqoexWEVf7HHUGFP+fid5JV1MndM0mPwuJeCTMxXl0i2OyL0+Rorx4mhb1YgvZuiTP0tUm1o+aD10FRIpRqZhIs4LbC8PLtIOKppX91Ov/4xwGG11h4En3tDlI+yUjcLROx5Kn//aiMWzqQUQj5HL8kbko+wQBffE8xyFbjY6tuRtJwIDAQABAoIBADIBlojNbKpfj8OzpKREMm1d9lakt9D73gZWGwVjuroQB/Y52YpIBmK2dNx/XObQRidtqwWa5WQ9Flyb4Z6VsJ+GHBg1iWvHcFOKiguG6iAggq61BXP5m3X0CCd4ZCXusdIwZhrJMXgniBLTf2GgDgAQixhAJjmKa5VAjYxNUYQO+gK36x8N1pQhLSHLrbwY3lGVcMEZl2B+cFNLMADfnt2cepPzLRevmiei2puKriPVt7ehOaN1FyIkHY5t1JXOqCkUk7Pbx12/KUESHWBU1pRalwOztHm6y7G/16xLpV98Ms7edINJS/2nAS6oJXomLzOFLDV9YnnsXJiRGSpoLYUCgYEA8fOIq4p1+dz0KSmphg0SSJEuF4VQZTNxIbGG548og8PRhPoNQYhTsvJH6Zq1Jx9BOWzToPPTwPGEXVaPmimDQJqlm1blQd/VjGCsUCQDl0nGGP5nwTpXNynSoM6xWiwcXweGet5/ONEei1aLEAG/U0feh26BH09S8Gg2FwOo/C0CgYEA3BzjJ9NjOAV51GNS0hYAA39mmeEBQx+6YoT8uAsCxbEBqKKdHcrKPmlXOv4slg0DOz8FWOQ6VizJxgOM9S3wez6pjwHJRWW+buiwD6WMIYQvCa+9L3coIvRU93DqQiMf0PGkx8LRAng8FMrDJY/k6YwEkVkTqqoN+LAjfQMSnyMCgYBhBH1OA8RQv7er9cfDN+SX8pcf2VYmbl0z3IKywWXGiDOwda/xEiA1xg7t7horqM23oBqwFHVZjb68yqPkdjbqJdi4FDzzkDSKCI2vyPEjrfJgPUsPYTxtoziRQLA+7yclN9hF1of/GWN9DePPNFQqqcviVH40NtOUEMV3rwEItQKBgFf5q8j1Mkjn12PONwIFDQhY2VdTmT+M5OAPqzqcHAWL08/k/sszjFYZoGXRxVxL4yjA7ZAz2CUtTZA5RxOPwvhfeUHRQvLb0ZteoU//qNyUioBin0jjZUVjRrqHhPneNA89JdE5ynQkPk9JI2pV8vZtoj29zqB9y4vESsrieYTlAoGAJnjyLzy10jwOfyV7GWcZH3Qgrc+e1w++x06wo/yr6IyPg3/Gxc0rsk/zUMPAOAuU18SbHGgkADgK4mSS06m1Ti1Pzqte8hoMGk9xKwJ1CEx9Szyj2d9yQU8JVP780zRzHWGqWczYOGCfgxcRDCqtTdnzlCt0VsKepVAY1tNwlls=
ffa33d16-9a37-419e-9387-9024a98e6480	19450795-0176-4267-ab32-46b9649f1e58	keyUse	SIG
d0adedf9-84f4-4faf-b87e-59a2d362e96a	19450795-0176-4267-ab32-46b9649f1e58	certificate	MIIClzCCAX8CBgGH5Z7o3DANBgkqhkiG9w0BAQsFADAPMQ0wCwYDVQQDDARwa3QyMB4XDTIzMDUwNDA3MTUwOVoXDTMzMDUwNDA3MTY0OVowDzENMAsGA1UEAwwEcGt0MjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANAIlsbz0/VPmsfi0eeGOykUQFQpWS9r6R9wPSh71GFzD6D/UmIg+5mam2rsQRG9eHNwjJYWQ0+oriqYnF5WnibmJcmKAAmiWdTm4Nt13ccFNIQ9l2mi7M8vDf3Y+giDO99fc4THRBpPMRLiUnTQjQ4W+wg8Gf7bURu7wvHu4qqHsVhFX+xx1BhT/n4neSVdTJ3TNJj8LiXgkzMV5dItjsi9PkaK8eJoW9WIL2bokz9LVJtaPmg9dBUSKUamYSLOC2wvDy7SDiqaV/dTr/+McBhtdYeBJ97Q5SPslI3C0TseSp//2ojFs6kFEI+Ry/JG5KPsEAX3xPMchW42OrbkbScCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAE517MZb9b60ByncZqnZpDZHvMw0AUNcU/yOU+eadQauBGHYwTSmHbLUUwNj3QJd/3tNFwEqJAQsdb8TPJ/iqDiNmMcFLI3zRgdTRaAVptqDmCsCOOaV8CWxgxx/L8gI2tv2TxIOveeCfqrlDf4qFe4gVwn21fXLNV2jc7BYHf/K8v18Wu7gbuepbk3CBoJ+GZX95ElKbUe3JQtchIZStcCzZISp/pPxMMGOwfNBPw5sa0TQh5HYtmzbbbX0TYSuD5VKzfMW26KES401PldPN2P03cqjEn3cFwhUyK318nOSvEmU9btXibYKKnhobNgZqvLnZZlwo747XaAzFxbJVNA==
439409b5-c33a-49a0-9f6f-725b68ec7116	4af92bcb-ca3e-4139-bfce-e2d62c400df8	kid	9a86ae4b-13b2-48a0-8250-8392f747d502
80fa12df-773c-473a-9a79-e4d8d784dfaa	4af92bcb-ca3e-4139-bfce-e2d62c400df8	secret	o3tbBWlyTjPbMTH4O_ZexQ
26bd35cf-de66-4834-a7b8-a63a7f9b9478	4af92bcb-ca3e-4139-bfce-e2d62c400df8	priority	100
4ca9e3c0-6a56-4ef5-b19f-b8900817ceed	633a23d9-10f6-40d7-a6fe-a7a9f52a9914	certificate	MIIClzCCAX8CBgGH5Z7rmDANBgkqhkiG9w0BAQsFADAPMQ0wCwYDVQQDDARwa3QyMB4XDTIzMDUwNDA3MTUxMFoXDTMzMDUwNDA3MTY1MFowDzENMAsGA1UEAwwEcGt0MjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJYX/UmHST80iVvz4eUgmL0NLM1YDgG7QH4aSLNIaP4Vmk1e9u2KvJSUmtge5iDpXlIGaGlEv2WoMU8xelARKEiSP+gEJCWlNi7i39cAtKU+QhfchU1YKb8gN3IGyNqchqhYpQXr9BMFkW4v2d+m+NqENZaXQJLtjxBUvB+ERoO3QK8wCycOsppjxDqWsesFeTXH3lZgZb115OBWmRJ3AjvU4/9QFWtrVDdwZv9RF5DhE9ovG7uwoyEohzKC3Za38jhcbJwXXVKsQWORdqUqrYCekJLgBs56rbst8O7N2y5/sY27PLSFVsqlA4j/feo7ktmbcHbNWVboNru/lqet9GUCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAO2RQuFdqYZ44fFY6vAiOvk+IXb9Rkot5r1pVvgMWnFisugB9vaftCAG6Mi/SD2jd28dI+lrz3KGpdI8wEjIcm8+3Ooa9QiXE5fUCRQphkjTfCez/luQpVCTYzZw248vShR0LCzqP0aEqz9ZvZHGo7vhaOVVhSNaN3eF7wr0OTNs9VZ3MUt2IgIvYbN7LxfW2d2wWmomykaUiHhHhZHU+9NU0WCNaC2FxYJBO0o6ysp0KzObqA7krhJLXWWcKCt3DK52Tw64xw6Unyj3Lmwj9bhCqbV8Y/K4reJ8Hu+V/u38lnxt4GVl6Hv6EPwY3moKjJjbiyljjcoqTqoICM+16+w==
13c97a2e-888f-4e27-934a-5e2f684d6ea6	633a23d9-10f6-40d7-a6fe-a7a9f52a9914	priority	100
affb67de-88fc-4d4e-a21d-3e4602d40967	633a23d9-10f6-40d7-a6fe-a7a9f52a9914	keyUse	ENC
badf3fbe-f847-4dd9-90c2-bf0de57f7322	633a23d9-10f6-40d7-a6fe-a7a9f52a9914	algorithm	RSA-OAEP
4eeb3cc8-edcb-46cc-b4e6-ffa99075866b	633a23d9-10f6-40d7-a6fe-a7a9f52a9914	privateKey	MIIEogIBAAKCAQEAlhf9SYdJPzSJW/Ph5SCYvQ0szVgOAbtAfhpIs0ho/hWaTV727Yq8lJSa2B7mIOleUgZoaUS/ZagxTzF6UBEoSJI/6AQkJaU2LuLf1wC0pT5CF9yFTVgpvyA3cgbI2pyGqFilBev0EwWRbi/Z36b42oQ1lpdAku2PEFS8H4RGg7dArzALJw6ymmPEOpax6wV5NcfeVmBlvXXk4FaZEncCO9Tj/1AVa2tUN3Bm/1EXkOET2i8bu7CjISiHMoLdlrfyOFxsnBddUqxBY5F2pSqtgJ6QkuAGznqtuy3w7s3bLn+xjbs8tIVWyqUDiP996juS2Ztwds1ZVug2u7+Wp630ZQIDAQABAoIBACTtHvwFhCBAMSEFxcgktl8gjCqy5LNJWcsMdWFiSa5lKzKoz/BOByo4y0WriGuFbpaYi/yGFN6SPBtjLVfgeLwt+vn+dtQqKsPrPi27tzXGNOWA8+y86XxjlTCA+c5K3xgwwtzLmZ9KaealcCFFh4jfKP31FUZwmpdmeWf5l42U2hCeqvXHG02BtVWtGf0bhZNct3EtsyCSgoD4dc85pFeZ7Anqu64qax4C/BOkM/RxJWrt4cfV8MZUCoOCOuLvfHho0Hb7/pgadIoZX35PTS0SfzgoWzBNq3jobfXTkadYTLfQhnpUMw1CSRimRZKWXBlm8V/WuW1AziRTYYleWisCgYEAzRom200tr94e9XH/U6gYOyKahOk5RqcLGH3nof+ejsfyRlohX4lLPyNh3PGD6jf9/Cfw0IpqD7cSS/+dRvKYE4le2+W1puIbXwXKps3osZxHeyRAMUJBFVODus5L9rkfwTCwosYeLyW0sfJ98goQUqPRpHBskOvJpSleXibk+B8CgYEAu1c6rv+gY2EwCN12lCNi0etqVnN2O+CC1etSSTh3x7PV2yYqoOEJQQc56DiWNThaQ1F/TvvWLXoYH4gVWXZydTgipih6SCEtjXwQcSsuZjuv69zOABKtbMO5UB9K1GpriVEnPVQQPFVQ4TNQVKoBDbUuJ2cwcJWy8/ZV+06zkvsCgYADrix0UvY26a10ig8i2SlWJlDPgb/dXLH+RoQZjBS0SzI1wPhIVpZbE69133+WfFq6Y50WoOU2UvqpEnUoCMJh1100ZPLVg8kp81inlZpPVZaSxxu/xoiUcWMzvu/uBXRkaxNAWH3CKtMLPma0KSoR0Y65fKr2DsUXiZ5/4gLJ0QKBgAMRNYvB8a1O3Qt4HMXmImsPcKlDsK7gSSQZezppq0RgxGKXKGGD7bPb223a51KtvoSVpAD2DJaoBhcWEktprgwPRDn2NbJSoL1NR7OiolrYJVQ2REUqCR7bwX/3UzFRILuZ0YumgbGLMAzP20PXmLbRvZS1ksx1Fv35jYTU0AnbAoGAGwSI3C/kqFTDuR5gavimoDr+7z+Yc+vIgex5p716qEvC+d829Ecirqkpx10KRvnvodbc1/zXs6m0vRcYyYnjVZp/XqoUD1JCMs//HvsxdMKfu9SBWjOdMsvvOOEWXIrkQu8d0svh/KDEI737Xja2NGfMHDUTvylGW4XJE5Sy2UA=
d96afbd5-8cb6-4f0d-ac8b-b415d305afe4	819352ca-63de-476b-ac32-5f8effcbeab5	kid	96149826-4ac9-40f9-a2de-510f2b6bfdaa
24204b66-6ebc-4bfe-bcff-fd35c1603776	819352ca-63de-476b-ac32-5f8effcbeab5	priority	100
2a5beab2-10b1-4a8d-8fcd-154b03ae0a88	819352ca-63de-476b-ac32-5f8effcbeab5	algorithm	HS256
bc549b72-b210-4e42-bd9c-909b6a49bd24	819352ca-63de-476b-ac32-5f8effcbeab5	secret	wQJ_XLLRjnpyqiUY3cqk0Ye7apcnrDNP0EjC68UuovD5DGm-JHeIvVBORGfLWOKudKWXhIAfY11mlj0dtS-mpg
b8351421-f4c9-4ccc-8e66-c84ee2ebffd6	e0aa71ac-5b71-48a5-b7b7-a2a64853e68f	allow-default-scopes	true
ba4304d9-f66b-439c-b077-2db71c1b89bf	b92971d9-2e72-40db-9af0-1e93a3213573	allow-default-scopes	true
ace80eb1-efec-40e2-b3a9-ed18831ca8a7	8ba93fe6-19ed-4edb-815f-5416080b5176	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
14c6c3d4-002e-41ac-8643-100196bcac2e	8ba93fe6-19ed-4edb-815f-5416080b5176	allowed-protocol-mapper-types	saml-role-list-mapper
d44e5585-3357-4638-a0c6-cf95ab031696	8ba93fe6-19ed-4edb-815f-5416080b5176	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
0c202c9a-43d8-4af2-af3f-6a1367861f53	8ba93fe6-19ed-4edb-815f-5416080b5176	allowed-protocol-mapper-types	oidc-full-name-mapper
8edbe3f8-712c-4e8d-876d-7f5a6693c4fc	8ba93fe6-19ed-4edb-815f-5416080b5176	allowed-protocol-mapper-types	saml-user-property-mapper
0586e018-1cab-4506-bc29-30971747c670	8ba93fe6-19ed-4edb-815f-5416080b5176	allowed-protocol-mapper-types	oidc-address-mapper
77549edf-40ef-41e6-8328-ce699372ea8c	8ba93fe6-19ed-4edb-815f-5416080b5176	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
d503ac3a-4901-4437-83c2-d2ba5e45199f	8ba93fe6-19ed-4edb-815f-5416080b5176	allowed-protocol-mapper-types	saml-user-attribute-mapper
09bd4c51-1599-4cbf-9143-cfc3ade3358c	e0c18037-4660-49c7-954b-d7cfaa1c5309	max-clients	200
7aaa6cd0-0978-4dbb-b48c-65f2bf5664b5	15b9a83d-268b-41fb-9e5d-70d2929fa733	host-sending-registration-request-must-match	true
485aa33a-a465-4e27-89be-6ea88cb67d7f	15b9a83d-268b-41fb-9e5d-70d2929fa733	client-uris-must-match	true
b81a3335-577c-4ba0-896f-e24c6898c980	2f0046f9-ccd2-4fcc-954e-0ecd45076264	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
e64187f3-ef42-404d-90d5-6f0a44f3db01	2f0046f9-ccd2-4fcc-954e-0ecd45076264	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
6130df8d-b284-4401-a193-34ee82c3aeaa	2f0046f9-ccd2-4fcc-954e-0ecd45076264	allowed-protocol-mapper-types	oidc-address-mapper
e517cb16-e92c-4174-8501-f63632a687d4	2f0046f9-ccd2-4fcc-954e-0ecd45076264	allowed-protocol-mapper-types	saml-role-list-mapper
e260adb9-3f18-4cb0-b7e0-68ac4e27d822	2f0046f9-ccd2-4fcc-954e-0ecd45076264	allowed-protocol-mapper-types	saml-user-attribute-mapper
4522e6af-6ac6-4e63-bac9-73a625f5c28b	2f0046f9-ccd2-4fcc-954e-0ecd45076264	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
adcaa311-7f5a-41b2-b580-a9ce8e3c892d	2f0046f9-ccd2-4fcc-954e-0ecd45076264	allowed-protocol-mapper-types	oidc-full-name-mapper
50d6bc8c-4245-4ee3-b898-0de1d0080b87	2f0046f9-ccd2-4fcc-954e-0ecd45076264	allowed-protocol-mapper-types	saml-user-property-mapper
33a2e541-e132-4cf4-9e10-f7ac16b56b34	f2d8a107-8ff0-46a2-8dfe-615475af647d	kid	662f8eec-4c5f-4f5f-9bfe-fdac19b9a726
a5aae99d-0864-4fcc-b42f-842578743ad0	f2d8a107-8ff0-46a2-8dfe-615475af647d	priority	100
7f7efc9f-3087-4320-9acf-3eafa5e02264	e21157b6-9128-4ae8-bc72-caaa53763c38	keyUse	SIG
373ac53f-e4f1-4f67-a8fe-45111d97a711	613f8ce8-6416-4c1d-ae6d-b89cdb8761f1	secret	smIsNyF_MUsEwG3LA9ChEQ
06186763-c62c-4f16-97d2-9a879215bd38	613f8ce8-6416-4c1d-ae6d-b89cdb8761f1	priority	100
76293f1a-721f-406f-9da4-7d07d2d82ba3	613f8ce8-6416-4c1d-ae6d-b89cdb8761f1	kid	2d3a6aeb-4b16-48de-b2e3-35115b16ee49
10f9ce3d-d754-4267-8ce8-6f2d338ef13c	377d56d5-a881-4fdf-b833-dda5d105340b	privateKey	MIIEogIBAAKCAQEAvAFWspUSoSSNFfdHb/tiGWTWxWh93K+1D1T8LadPZxEhnuSTjMZu3A68vdMOMer+Fwh6/LlDHLBU2DlGvru1ZgB1k5bheZhYNnA3rTOWyKMlWUBeHsSnslTrcyQXDqLZrmzuzbKlHfvD409Ajt0FEnShx8N2pRUYAuhlvc+v2APmkY+7zB2/oZuo2YEQirJu810p39SPpvoLKzZxnA/UVLyw6oIAVI4+WnL2sh2F2308SrH6vKj6u4xKaz8QxrEwE5jikzv3Z8J1CD9jZklWFBeoFZuT8/A4ndbIfubFb84qOOW6BEHY4gyUxqKeCQznWsukE2w5Ao7Ora9EvxXshwIDAQABAoIBABEJ4AUcTI1tJho1CHTmJ/xcLrjCYRHEnNiwX5B1ptUU8OKZHaQ3AaoQ7dsYSyOMBA4rVxYbZjEt6+qSuk4j7es6JG3FUVb3TxtT7T/VupchbguaMU2Bjh8z4gjT3wEVEjxkI/phc+R1QkoSDyxDbKfBCT51AQYyFLSCwmHC9lFR1WEW4+u81Ucuyc2Pxz/UHHjNFJsesMBVEEXHHQts3ZJ0BLuS0fSk2JrpMRU4JoVxYsJK5UtUK0W76qhQlr/dJ8O22G+qkJF0VWjLDVstnGDr1u9LLGokOZpOM3VosvrKLMfPgw+20+0kKFMNTUqZ0kJoi7lwCPfqgwhGHwzY0bUCgYEA5Nyy1ovPol606f2h9unz5TH5wxaVR4KOavfjOfVnXV2KSMrxfGwm8dWJvqPKMS9C2yCV6WltO7J8D5PDNxuwsTuU07MdDNuGAEiYa0MS7HAK2DRfjvn3NDqCLHA8f0ucoGK8TdmPZ/n/U77avsIykzZBfE/xMlFBzINlACJxHAMCgYEA0kxlM+1TAXBTxVSdvsQM3JmPegAqv+XuegqI3VSj5WYdNuXOeNqZHP0sHMbU/ZUmvPvrgqZ2qUuEdQS6wPkVgHc6Kk8Vv0ByYbFCEBIEPYZ5IbkwTve/OrdB095iiWbBuw8QfnQacDfZpEiZgIBS0wXhqq82OBEztdIOILW8AC0CgYAwKcH5JLMtmIC6PYY4UEPjmADX7Yi849zU5hYLvHlkTKstZogrhxcrDaVPWWjTsP6A3vqthGJYjddN7+rFTi6BHejUJH2Ylxo8NQreh98TowClP2Bc1n4Pn8CFWZlhsKflmOHIAGENoK77EM84FeZO1LwzTR+VV0RhpcU7ogPrwQKBgCAC8QTOg2wcpSPMlZaMUUjjNyvjCp7baUm6gMrwL2KkAJ5yrNNIszXuc+CNg652Hcd2sYrZvAZZMHh/l834HIXJoFkAYNcUAFVOnjfEBlE3PwkbH3dlzv4pFyQhHe68bZED4gbdtYiPd9nCE1u0LOdiZc+NjDtMowpyRyRDhbKhAoGAF54b/GfKvebtA7QcTfKrNYAb6TBn0Dh852A3zK8Xzmcj14tzEjjketNNuEe/LRn8obfd4sjG/37gZJ/g9JnsEcb3F4w7lUr/09BxdZ1GOQtjeENVTAJVHQ5j6vdffmlUk44ozo++NzDas7JxSUQ7Bf+3emBBslXmgBxcYS9Dh5g=
95e5fb88-0354-465b-9f8d-68bdb81eff0a	377d56d5-a881-4fdf-b833-dda5d105340b	priority	100
f1be2f99-cb4c-4c05-aab4-668be4034262	377d56d5-a881-4fdf-b833-dda5d105340b	keyUse	ENC
20e7c854-628c-41d9-af6c-3d875da18423	377d56d5-a881-4fdf-b833-dda5d105340b	certificate	MIIClTCCAX0CBgGH3U1mgDANBgkqhkiG9w0BAQsFADAOMQwwCgYDVQQDDANwa3QwHhcNMjMwNTAyMTYyOTA5WhcNMzMwNTAyMTYzMDQ5WjAOMQwwCgYDVQQDDANwa3QwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC8AVaylRKhJI0V90dv+2IZZNbFaH3cr7UPVPwtp09nESGe5JOMxm7cDry90w4x6v4XCHr8uUMcsFTYOUa+u7VmAHWTluF5mFg2cDetM5bIoyVZQF4exKeyVOtzJBcOotmubO7NsqUd+8PjT0CO3QUSdKHHw3alFRgC6GW9z6/YA+aRj7vMHb+hm6jZgRCKsm7zXSnf1I+m+gsrNnGcD9RUvLDqggBUjj5acvayHYXbfTxKsfq8qPq7jEprPxDGsTATmOKTO/dnwnUIP2NmSVYUF6gVm5Pz8Did1sh+5sVvzio45boEQdjiDJTGop4JDOday6QTbDkCjs6tr0S/FeyHAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAH8e1ub7jjfT5sKj+8q+cgIzC9CwVtG9xzZKRgIsYRQ9W6xwSPqueWw97JRrs/I3Prbp1jlYjCaiunq4FtKNU1eWoCzjCBQ54MKr6Tng2DelZLzsgEs93ooFcGS6z053pqWV65MCNXberc5DdRdL/AEw5N+1uxDESXLq+PtTpqeb3glSd3yFHLO2QUPkae36hmQN9IA5SVF4E56jMC/dL8w1XEgFf+LQBqXy62HGpDK3DfwAF5yEY2tCCS3WEWnCjA0YNSKwOO4wb8vCMPIAD/x/4mUVn1s/sGqh11BqbqsGFgYs6u0yWkiO8mjouGbtQ+L0gxwWVQxnANnpY8uRmsY=
fbd5ffe7-61c9-4a60-8498-e5c0cc4bb0ca	377d56d5-a881-4fdf-b833-dda5d105340b	algorithm	RSA-OAEP
113219b9-79c3-4366-9cfd-e19c2ac21930	fbfd2ed4-d878-4a08-8fa7-a29f1b386cdd	algorithm	HS256
2bcbe0b7-9da4-4848-ac41-52e22c164dfa	fbfd2ed4-d878-4a08-8fa7-a29f1b386cdd	priority	100
85d00c97-4c2a-4225-8796-a8d427ee3f36	fbfd2ed4-d878-4a08-8fa7-a29f1b386cdd	secret	6_AC6RsH8Al9UuA5LHuyVFsN8VTAS2E49wVvSUfN8nSK1TDHDen6CV4givsSXcC72QEg8ROe6WZ-n2dYhAhPhg
78ffea6e-3fbc-4652-921e-a428a8ada377	fbfd2ed4-d878-4a08-8fa7-a29f1b386cdd	kid	4b307f2b-c529-4b37-859e-ec6cdd5cd5d6
9776c752-49a3-469c-8cde-39f8f2a360eb	32fb5875-76ed-4c25-91ec-a6abfcbc2811	certificate	MIIClTCCAX0CBgGH3U1ltDANBgkqhkiG9w0BAQsFADAOMQwwCgYDVQQDDANwa3QwHhcNMjMwNTAyMTYyOTA5WhcNMzMwNTAyMTYzMDQ5WjAOMQwwCgYDVQQDDANwa3QwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCy3OgiCmp7wsxDD1UtR2UOAfiT+T6k2k2g+S/tlQfEkwmNc7BenPAw7RRNOG8jiQm5u+BoaUAUNMDMTP/MXxiXFH2Mf1asmIV2WpxDu6n/oqu2GBHWRb3VGnJUn239D2nio5TMANuyC4lKEkiEvIJZ3myPNxaHkcXbpghghV9IFqo6mGuFqZFKhfykAm1AImxABFxFQ6HhAQ/SifnbQVyZJDhSXTtaHwb8KTxGMBjWMCWmCX31KXDhSi+Ec1YOABGoYw0ie+Vexu4G++wfdnTAWdFSKdG7pwzORdKAK3z6ppAD0cFzidw54XqOf7LJohrB2ThcX8cm3fzRuuojrhefAgMBAAEwDQYJKoZIhvcNAQELBQADggEBADwIX6v1Fju06SS4SC5OpWG025wFgRN8DPUzQttEMe8TKuvTZUUZodVY1atrHR4nVy82WUcNdn3um3ZsDJrO+9tvFzj8+fR8gNA8nxBKxC28AEmIWRtMh0wDhtyMg+5molSb73RKpzgut2ijnnNkhs6vdrhk2WGWJFNps1MhC24SZkJrlLdaQYef58gCWIpIV+8GWGy0im+zI/mFnOAXucOvUpW42GIxFgpvhYSvpwTlGSHSyQC292fETaJdpQlTl+8UFgiyUMeaM8xn4QEub9kMZhu7clr2cpZ+yvohkoHDWurT50v1tKzcNlKArlM4i/NMYmdCsnajom9JVDbcOfs=
244f547a-0eb1-42ff-ae4e-eccc87a83869	32fb5875-76ed-4c25-91ec-a6abfcbc2811	keyUse	SIG
7a9cca7e-68fd-4f9f-913d-5324fa778f47	32fb5875-76ed-4c25-91ec-a6abfcbc2811	privateKey	MIIEogIBAAKCAQEAstzoIgpqe8LMQw9VLUdlDgH4k/k+pNpNoPkv7ZUHxJMJjXOwXpzwMO0UTThvI4kJubvgaGlAFDTAzEz/zF8YlxR9jH9WrJiFdlqcQ7up/6KrthgR1kW91RpyVJ9t/Q9p4qOUzADbsguJShJIhLyCWd5sjzcWh5HF26YIYIVfSBaqOphrhamRSoX8pAJtQCJsQARcRUOh4QEP0on520FcmSQ4Ul07Wh8G/Ck8RjAY1jAlpgl99Slw4UovhHNWDgARqGMNInvlXsbuBvvsH3Z0wFnRUinRu6cMzkXSgCt8+qaQA9HBc4ncOeF6jn+yyaIawdk4XF/HJt380brqI64XnwIDAQABAoIBAAG8AaY+2px7nZZy4h0PyauSmlH5A0H++ey7LdtMbChcUqXj/sxUEkIvMlizWOSL0iPSbhElICFyB4KTppFZRLhGUxdXLsR6sCSfKU/A1JutfKPF5Ppib75OxNgMOblP+nNfqbQ2t+qokPq+ZaSf3VW4we27l4TWBYilOgSRloRw66TsltCM7qRNbh7TOcCp4I2DM9fLy9mwU/1qQ63CfldxsfPBkXT9G5MvsGK550pNXtZYt3P6vfpqZEHvPJuJjGxDPWr0rvH4C4nMcQUNQLbz8h60N0vuG7eGdpqTnsgaiBrku6lLSpKCvZYVAX5/38V6P6C0NPdqugc5CVg1HE0CgYEA8Kkk3ueAiWLmUO99AXseQlceZPHPPJFXzrONSh80qtOw76GTFi2Fus8P+nBDxeRyb/k4OanDGCecqxJiya8ns3p1S/eLKirTBpyRbnWqUpIkmyz0qujifz1NW+VFwUn1T0NbV5ZSn1wvw6dyj7GqEB9F6MXZzgkLGWG+0d2ExNUCgYEAvkNoxyx2TBchAtDIDvYcC4pUzaIm/jEs6JnzLp34G/FYInDut5S0do56T5DsHbADvw3g20cXaJLbXtnL2TN6UpLFzSyCzEMQGW4MtD/xsObXhgwYwHHsxuqHNySTaTiFqbhFC2OUWIouja8FQEv8xDL7miGRLwvR50jiSVJDtKMCgYBm9KWeasGVhObtNxdue8JdNTH+k2hKDA/ZkPzf+eupLTkjuybWtRDh81VtmXuU/H9sodzI5nRdMA0ZLptulu1QHhJyNmul1X5D9NVOwS3ldzoL3LarK0hCkPI4XyRxZXd5umIoXVnpbSHN/SPIj4Qms4pP49yjBUFnUWa2F6OGJQKBgGeL4jM7hGom0EVrAOX7lQnG0B5VmGkQtEMmvc1qFYSHlZKw6YopuQkow3IYChiiGXfaArzz9M5p1k/JsoJT3Mehr1rZVZn7CYD9fpZ+knfXOgZvAO2DUvxy2QHuuvcx1rSmX5UyLaL+GRXs4au7byYMJRgeGpiDE0qPRO/ogIaHAoGAcsYRLCtLmlsqn3UuQ6FlqwuNOiwEpppNMCH4de4RJk1HEcJJIu942nAepU914G+iF6RfxW/Lf/3LFmu5ebrFCvwbUZl2zfaGbK/8MAiFWdVFnORRsCSSt7M14UmX4hj7oOTOnF3ZU/+hTAXOLJGu+sYhauZl2LBgPWALHNLgiP0=
7a254c33-250b-4094-a1a8-ca2d5434b513	32fb5875-76ed-4c25-91ec-a6abfcbc2811	priority	100
28bf7684-2f0b-49e7-aa57-fca3713ed685	117e1b6a-d6b0-4b13-af56-808503445e05	allow-default-scopes	true
9ae7b0dc-1849-485d-a037-b5e0e090ea4b	ccd0d013-d201-4013-848c-56808baad8ff	max-clients	200
c8599f7c-e7e5-4b69-ac53-12801f9a65f9	bac6d981-3664-4d08-935d-836327c6ead3	allow-default-scopes	true
c8257759-a452-4a78-be25-dd4a1c11222a	17741b8a-5b5c-4e7b-b672-1ae06e8acfe4	host-sending-registration-request-must-match	true
cc70f9cc-92a1-4c5e-988f-b3dff8daa1b7	17741b8a-5b5c-4e7b-b672-1ae06e8acfe4	client-uris-must-match	true
94cbe662-79b4-40d7-9294-399ba5f65970	159bcfe5-3d6b-4abd-8938-39e812bad3d1	allowed-protocol-mapper-types	oidc-address-mapper
42f1515b-7aa0-44aa-a2b4-631d716f3bc7	159bcfe5-3d6b-4abd-8938-39e812bad3d1	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
03ae986e-45e6-4874-95bd-15739a11bf9f	159bcfe5-3d6b-4abd-8938-39e812bad3d1	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
d6954aab-a4e4-4746-a500-481f65c2782d	159bcfe5-3d6b-4abd-8938-39e812bad3d1	allowed-protocol-mapper-types	saml-user-attribute-mapper
008c3e51-2fc9-45d1-8396-4b4ca951bc03	159bcfe5-3d6b-4abd-8938-39e812bad3d1	allowed-protocol-mapper-types	saml-user-property-mapper
d68c1e76-dc8f-41ca-883b-d19c31cf6662	159bcfe5-3d6b-4abd-8938-39e812bad3d1	allowed-protocol-mapper-types	oidc-full-name-mapper
b609cc6f-b294-45e2-b15a-4aec170f6d45	159bcfe5-3d6b-4abd-8938-39e812bad3d1	allowed-protocol-mapper-types	saml-role-list-mapper
87cfdd83-7c22-4aba-94a8-84c1e8bfddda	26d1ea05-4a50-40ce-b456-2e4eb0d38eb2	keyUse	ENC
7186d3b0-c419-48a8-9308-a9d089737b58	26d1ea05-4a50-40ce-b456-2e4eb0d38eb2	privateKey	MIIEpAIBAAKCAQEAtpCi/pyPYs41zDgZUBFTBPqe/CYjO1lm7ZFxWP++aa89z5rQlhESGtOGDJ2sC9Gz0/OeXfs9Mw7Yy+xMGle1znbvv4ZIWlZtzDAlh3klpCtOC/RHQnM5QhihBf8cB1tcrvm2AXG8GpT1BCpe4ayMIul9fuJ+Tc/+DGA05Q9Z4CQQK7uebOxP8iuPgBl4PcTphUCenkb4g4r+KzviJeNIlhIFObImNWcD9b1TCpfDNVeivboeKgbpqs59PntWknqZD3loHOf9aS7XrFU1ek6RSu+1gO+7f5RJFLlp7emfZYbPUsd8I+FR08+wUoM8+YmMf1gWCXOKDbbz6cn9J3nq/wIDAQABAoIBADdwEl7Ysd3iGooKGv2qVRh09mRBPH+gNVY8zTumZW74TP/G1kJLqsDErLcWBhGMu1vIZbXKPhpMDt9VwQJa0hWBHmp9X2k3R54ynKLX0etZTxjoM99k1+VPT05f2mYNg0aLA47Kt8EmrIR4TVmgKOnNF1O5eXsthsrBSC6qi7M5HNQP+AlK/vGWJp6YOef76hH2pjI0Nuk/3XXXZsIfPKBFM5EHPWZW3ewHpynIp82vP2kLXXB3qhrKOijfuROOGnf3RnPN/hUxTdsGevNZ+HjdVpRl5FheSUq7xI7xvkYD4SDwCt2Q6fo+maPR4Xbg+UWTybPAGpHwXprTA+ue4mkCgYEA4mwhXM56mMwAuUY2SerQvMLO7OGlpXk8By1wwyQaEng/850X/govhxxjlkRZgaI1hvsi/ASkfQCY6AaZDj/1xVdUlXCRMgtCRHXIxPy+Vyf3Tpb/1G9FCERHhYySEoyoFBkEZj4wNYWIHk2H3h8GNop/wTadOVp1tZSX0UQeqdMCgYEAzmnbHRvC/3lbAjXWXL8P/EPbNoSALFciGZx+j8n4doFp0twZilZBUzXsSm+5dPXzimws0l4f81QvhlVu6/Ujna2ZUuj/l86Q/C0qqbXUgn80j0iOZjR2FILww0XZM0sY9p6cbscDypFlEXrvZApssZpfwatIq0+3bY2H6T7/8qUCgYA/OkzSusIXexhUpJuyZoUlwQzBr31vSPyPUIwloiY5tCS/pcW2ZifBhhb1Nl78SUzDRcwOLkm0sn8AhB8nkIrUMb/n/0g8flJiBbYr9Bw/AGUaKCaGrw/K8C48x/VegrLI8fd9ia4ys/g/5gyj5Wv5vRFR5itfgbhPHZCLmocpiwKBgQCVTjKlWohxXSm8bo7xJW79rWOqiqtf52MOHYnanmBv7+pJENYUn5G/C9kweqIufR29ucOuI1F/JB0AUVnbqcUqcADg3RLMjymGj3E1swXVowe0wOnn+fiTm6dlyGd019Rlx5Ml+iS+6O6vdzokJfo7eYvcPfZhnFb1EpQF3oEq1QKBgQCAu0Mj0s3fRbetxmzEufz0ZE28nuF+eeYhlYqPQzfjzFSng/fyx5SCIQkEGaA3hp39Rid0BtMrHcK1gOgq57EcE7cDaJpOWnPAyN012ztxbrRuDwPAOkdk38zqO92NZclznEoLnzTWSa5Hfjn4vVkw2YFlapqBGfUgMM0u+W9h/Q==
52081e44-5f55-460b-9ffe-e8d353d00d0d	26d1ea05-4a50-40ce-b456-2e4eb0d38eb2	priority	100
bfa85f17-7b81-48fa-821d-d0365cabdc28	26d1ea05-4a50-40ce-b456-2e4eb0d38eb2	algorithm	RSA-OAEP
c4c139c2-bffe-48d1-874c-fbb362a85fdf	26d1ea05-4a50-40ce-b456-2e4eb0d38eb2	certificate	MIIClTCCAX0CBgGH3UCBiDANBgkqhkiG9w0BAQsFADAOMQwwCgYDVQQDDANwZHQwHhcNMjMwNTAyMTYxNTA0WhcNMzMwNTAyMTYxNjQ0WjAOMQwwCgYDVQQDDANwZHQwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC2kKL+nI9izjXMOBlQEVME+p78JiM7WWbtkXFY/75prz3PmtCWERIa04YMnawL0bPT855d+z0zDtjL7EwaV7XOdu+/hkhaVm3MMCWHeSWkK04L9EdCczlCGKEF/xwHW1yu+bYBcbwalPUEKl7hrIwi6X1+4n5Nz/4MYDTlD1ngJBAru55s7E/yK4+AGXg9xOmFQJ6eRviDiv4rO+Il40iWEgU5siY1ZwP1vVMKl8M1V6K9uh4qBumqzn0+e1aSepkPeWgc5/1pLtesVTV6TpFK77WA77t/lEkUuWnt6Z9lhs9Sx3wj4VHTz7BSgzz5iYx/WBYJc4oNtvPpyf0neer/AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHewq4+uIx8kcuZg/HEd09PrIjGvOd9nbPssloyCNjM9WOgWeSa0uRJQlRE1VVe/rbeakKAI+9JwOfWYt2nMs0N3DOrteL/HJj4Gs94fe2YHF233lgeHPHG2zNCykuN7elEHo828jr9nclnxeJ8ytPcoy3z4/tPKaC4lTvI0pkTcHBxCNEqACT3bN0Di5Z1xZKV6DOuA9H+tUyDIhh69L3sZQ9WV2LijC4L2T5DcnOx5tTJG6adkXHPj/7NuxG6fE5F3v0oLLGo/GyzNylvv1lH0RZg1E+AM/dpsPQ97h6vsTZ+vg8JCDVQQk6P/kFHrb+ivnTJRE42XDJCdYva55D8=
2f84e2ee-61a2-4ac5-bed8-bcc814a8f5f1	d59d2b08-4ece-4184-a7b9-3b5513ca966c	algorithm	HS256
39dabde6-7153-46d1-a29a-d2bb0f6c9154	d59d2b08-4ece-4184-a7b9-3b5513ca966c	secret	0ugsOGBmI8HqiDLpM5m-jVRX2xt-uT6-CuDEe4t21UVFPCrt5FqDzG3NHJGBQhaVQsS6J4Z_sKnvAUdBXusXiA
07a53f5e-f23b-4cf1-ae0e-ee98b637def0	d59d2b08-4ece-4184-a7b9-3b5513ca966c	priority	100
d3edf1c0-76ea-4c03-951f-471c03e1ae39	d59d2b08-4ece-4184-a7b9-3b5513ca966c	kid	b79ab319-1e7e-4be7-a1b2-8051c7c5d21a
956d4c4e-7bc3-45a9-b450-f801e62242f6	de3b80d4-122c-435e-a384-5afaf2d2d2f7	priority	100
ee74e03e-6a3f-4d1f-bb52-0ac9c3837aa6	de3b80d4-122c-435e-a384-5afaf2d2d2f7	secret	VtvOP8WM3MLXDrj8z_6koA
cc73b94d-ce7e-4a91-93c5-b5a0f2fb497b	de3b80d4-122c-435e-a384-5afaf2d2d2f7	kid	d0789691-861c-436c-a720-0305ac59377b
e3d7e21b-845c-4325-8b87-4499b8601d72	cdf11bbe-0c28-4697-b81c-1fa63a117c67	privateKey	MIIEpAIBAAKCAQEAv/QkV9wSDv8KlmfIjFV7jJ4UKggT8NsuLCRUd7nRZbaEX1CNtfnjaqB1KtMoYlW4fNQyO6OxB3lOHua8f8XktDZjRDCa/0ET2lEFymbS7bWIlHwJfZrpt41KDZddtYWgDuXVD18tEfvbORrXaOlJGXaQ0QdYIKmQLkEfJ4fyLLH1fyvVA4SvKbRWK3xosQZ6/LRfLyf/imjmTrqLlKyUUacVN7LAXddwkkOMq6xZgLmfTZxQmis47QztAzRdZe9PBENn1o5myQp0oK7IiJvr4Gw0QqjNzBmXP5NaJxdaPliKvw1Y8dUud+FH8Nks662EvG07+K2gpNxsmJmDYxJ2owIDAQABAoIBAB/2xoiE4n2cdbBhsYZrg6qA9lL2IQ/wsknHy52w6SVv/69O3tIzPZiXW1DEHyDvgkxIb4xOhUpSe7JEnOtap5YPdSHj8COE5t/qBwtTFQO1a3wXrY2SGszQb8jp8EEBHTaYig1IaDJq8fCalM0+WkhYXeQY6NFuOvlLfyXE4GHAVLuzf/NRe/HhkRK7lt2DEQKsZGp2592ysi97Yhe1NbPkBxz+qvN/kcwBo/FCe0CgBvERw/5CPp3OxdxF+s+HJatCMcOEjKFDAupSHKC26HyOXfaaDq0OVRyhEqIli3BoLdzhcd2gPBW5tAaoXDeQDKJc8sDhCG4GX8FTaR0CqJ0CgYEA3d6vd2VkVfFm/eCB8bqStieuUlL7NFScw7AMFAckuFLdr1ZyQTM+PwP9F/ZsBTbvGY1Kz0wgTpLDSxP4Nu2sKtKcbBLh138ME3PW/nTnL4kiSXOkmAYUKAJJYjPpmuTyfc9I2Fh0lXfFghRCuxvivbCYiN7YjDc5yxrOJ42v8IUCgYEA3XtYssQtNoFhjBC1hAXAlc0c32fp+lmrwBut4vnnLMEqS246MxapoXG7ehILcnDdi5YJ2PlqpWqf7yQl5AJrJ+wMTjDA9/JuCPk2IWQwcK2oBqVm0hAj4wNL8tC4AZ5xtupBbe/MPLPMDZplY6QZc2G6VIfP2WklzwS7aKW2RwcCgYEAvqA5uifPUVgb2T0v6HUY4JCvYeQSGSApoKh9eCe7EPOBrMhlWkegz5uptRDwNnrAa//NqtYJW/kU+kiqFueV6SUTaHfAutpZkc0Rh4cBqwH0B4/odwWiA84TJuDbcU4MWrPiLp+xa0qA1AZ8Xy7SXZCBPffZrn80lKDvR2ShKdECgYA0kIuykcCxSO+f0G9kEAFvDCkoFH+BfTq381nHnsvw4T9qe5Swf1ZvDJEUHag91u+dq1RW/IsFC1M97HRZswE/jlQ1UnjZ392hn5PrRN4CQBS6zxKiFFaQED48OLETIUmXwe0ZbGoqlfl92QDrLw0jRzRzz2/TB5ODmHnqEjo6jQKBgQCviyEMZ5/yjfi02SOKLq2LcMmj8H8nkZaFmiu7pzGP4M1tYCIYBmtH4nmKviuw3TlEWtvt8t+fHgPQGqVtCEx899WpMr/yX72xTgyduLfcbif5b8h+bu3GcqHlamvDr4T8EpWxxruV+O8w2EQmfKaQiyVxhg2MLNc6vjLMODiSgw==
0aef66cf-e4a5-4dd9-a189-f5e71c2ec3ac	cdf11bbe-0c28-4697-b81c-1fa63a117c67	priority	100
d9402a36-8ecb-4efc-a2a0-7fe0a1bbe0cc	cdf11bbe-0c28-4697-b81c-1fa63a117c67	keyUse	SIG
88d93807-6f9e-4a94-8e69-21a91e66ec1b	cdf11bbe-0c28-4697-b81c-1fa63a117c67	certificate	MIIClTCCAX0CBgGH3UCAojANBgkqhkiG9w0BAQsFADAOMQwwCgYDVQQDDANwZHQwHhcNMjMwNTAyMTYxNTA0WhcNMzMwNTAyMTYxNjQ0WjAOMQwwCgYDVQQDDANwZHQwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC/9CRX3BIO/wqWZ8iMVXuMnhQqCBPw2y4sJFR3udFltoRfUI21+eNqoHUq0yhiVbh81DI7o7EHeU4e5rx/xeS0NmNEMJr/QRPaUQXKZtLttYiUfAl9mum3jUoNl121haAO5dUPXy0R+9s5Gtdo6UkZdpDRB1ggqZAuQR8nh/IssfV/K9UDhK8ptFYrfGixBnr8tF8vJ/+KaOZOuouUrJRRpxU3ssBd13CSQ4yrrFmAuZ9NnFCaKzjtDO0DNF1l708EQ2fWjmbJCnSgrsiIm+vgbDRCqM3MGZc/k1onF1o+WIq/DVjx1S534Ufw2SzrrYS8bTv4raCk3GyYmYNjEnajAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAGumaehT56mnj9ZGGeWQReqHjsma4bexN+IGVlpF1AjcK6lBkgaaW9rWkL5jmqB3RXsYAqPdIGnKQPTMpobjD+qUronfSZFEIeXIfsASAK0UW2Qn89yi0adQiKW7O8f7GZIref4YMigS7pi9aC8jIY3WcZoTL9r2rgnnVs+hxmnqg0o0K5Vfkh6IIRvyXkFsik3iuzpBOxSBSK8L+8XmYhfsSWwVCPzdEAm3G7fDff/8IOmyuftAX96/KAkGaaVp4fFi19gjkpVfMPjmUUHiOuzYBE1c5CZWyltA66RflnldB94PT/WKkywuoQoMpYLp1vIDg4XruSOEnsyQSorYQ2k=
74b72cdc-9558-499a-afcf-745cac0561f2	76bec2fb-f485-4d2c-947d-b7f79acc62ce	allow-default-scopes	true
c9512881-0e29-4763-bdee-519d80b702d8	14291a33-6cd8-47f3-a048-b88f8ea8b652	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
db424e67-ef16-4e02-a618-0d1b05d19dae	14291a33-6cd8-47f3-a048-b88f8ea8b652	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
059122a8-2f55-484e-ac8c-d48f7dd94585	14291a33-6cd8-47f3-a048-b88f8ea8b652	allowed-protocol-mapper-types	oidc-full-name-mapper
5ee98897-8341-4fcf-b54e-d41a324e95b0	14291a33-6cd8-47f3-a048-b88f8ea8b652	allowed-protocol-mapper-types	saml-role-list-mapper
a63895ff-d0e0-48e8-809d-3888ec90a62f	14291a33-6cd8-47f3-a048-b88f8ea8b652	allowed-protocol-mapper-types	saml-user-property-mapper
27c6c7c1-5540-40bc-8913-963631956c21	14291a33-6cd8-47f3-a048-b88f8ea8b652	allowed-protocol-mapper-types	oidc-address-mapper
2a7cb8ea-72f7-44e9-bda4-8c5874d28168	14291a33-6cd8-47f3-a048-b88f8ea8b652	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
10af5bc3-fdea-4ffe-b090-f917d3739b23	14291a33-6cd8-47f3-a048-b88f8ea8b652	allowed-protocol-mapper-types	saml-user-attribute-mapper
f11dff23-d1f8-488d-83b6-eb3a0aab405a	60e06a69-54fb-413f-a031-57d443ce916c	allow-default-scopes	true
60856fee-804b-448c-a09d-5f1414e87294	67699a7f-14ee-4999-95b5-ce575801d06b	max-clients	200
b78c1cf2-905f-4348-8443-a35bb10cbc4f	4907f077-0438-4d39-9dc2-bcfd832fce63	allowed-protocol-mapper-types	oidc-address-mapper
0f579c73-65ca-4293-b660-c9b9398268b6	4907f077-0438-4d39-9dc2-bcfd832fce63	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
1440b374-6f36-4068-9c82-f7ec37fe772e	4907f077-0438-4d39-9dc2-bcfd832fce63	allowed-protocol-mapper-types	oidc-full-name-mapper
75bfc356-0df6-4b19-9d0d-3cf0fa6a50a7	4907f077-0438-4d39-9dc2-bcfd832fce63	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
dea64fb8-add1-46da-a7c2-67f1eec918a5	4907f077-0438-4d39-9dc2-bcfd832fce63	allowed-protocol-mapper-types	saml-user-property-mapper
1c7e290b-8a4a-4733-b5e5-353c7145ff3c	4907f077-0438-4d39-9dc2-bcfd832fce63	allowed-protocol-mapper-types	saml-user-attribute-mapper
31ebeb91-e518-405a-b42e-0bb697d1566c	4907f077-0438-4d39-9dc2-bcfd832fce63	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
2d3d8d27-1553-4a95-8fb8-6bdfe0d10c74	4907f077-0438-4d39-9dc2-bcfd832fce63	allowed-protocol-mapper-types	saml-role-list-mapper
37341ac3-de92-4105-ad6b-8df8ccc5242d	d2c923f4-9dd9-4d52-a883-a5f64cb1c7cd	client-uris-must-match	true
4d3c887b-d603-473a-9c91-950ce6a016eb	d2c923f4-9dd9-4d52-a883-a5f64cb1c7cd	host-sending-registration-request-must-match	true
15838ec0-88aa-4e42-9aee-62d935a93b2b	159bcfe5-3d6b-4abd-8938-39e812bad3d1	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
9edc35cb-d87e-4fff-af9b-f3010468539c	1d040259-ea17-4858-9a69-789181ab6046	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
dd2f3a94-876e-41d4-8181-5e5cc8ebe1ef	1d040259-ea17-4858-9a69-789181ab6046	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
47cced93-1d5d-4901-bff3-abf27ea38930	1d040259-ea17-4858-9a69-789181ab6046	allowed-protocol-mapper-types	oidc-address-mapper
71a6c380-2a84-467e-8728-f72d2a958fe4	1d040259-ea17-4858-9a69-789181ab6046	allowed-protocol-mapper-types	saml-user-attribute-mapper
68781bf4-2219-4e29-a454-79af8ed76ddd	1d040259-ea17-4858-9a69-789181ab6046	allowed-protocol-mapper-types	saml-role-list-mapper
9e3cf2a0-4993-4d2b-8a9f-c708027c336e	1d040259-ea17-4858-9a69-789181ab6046	allowed-protocol-mapper-types	saml-user-property-mapper
220ec652-082a-413a-8861-1bc41ceacbcb	1d040259-ea17-4858-9a69-789181ab6046	allowed-protocol-mapper-types	oidc-full-name-mapper
717c085b-fd98-4be2-b0b3-5e2d2d8d09ee	1d040259-ea17-4858-9a69-789181ab6046	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
a4d651ae-1198-4b10-b9bc-b21ca55d3284	e21157b6-9128-4ae8-bc72-caaa53763c38	certificate	MIIClTCCAX0CBgGH4KGoITANBgkqhkiG9w0BAQsFADAOMQwwCgYDVQQDDANwaXQwHhcNMjMwNTAzMDgwMDAzWhcNMzMwNTAzMDgwMTQzWjAOMQwwCgYDVQQDDANwaXQwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDPLiEFBN6Gr50wrRalvbWn0iSTqZ25qM9MpYFfXiOgRjEqbo3lQ7UyC8L8GlNatXXew9HM2SWU/DJsok8z3+uCxuD5BFyHlVBs+gT0M7rtuQJ7KvImkCALlHZ0yQk/4ypwi6akqiWgiXKP4rHvLNm6ztmiGr0hniyEKXRB52OEgL0zoucRtx5W5Sj82ZueAMobPAqaHcWzM9zi2e7jDjR4Vjh8derhpA9Am8Q1gyXGnFqaKx8FXyb6fRnCreW6Q7iqPfeysMUvCn8pSgr66Lng/+YAsGBC69PpZlqHxJiCdQdIJyiGfWVLuF2UWe4NWCqkViFu6xYoYD/zx9uawo+3AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAGZKeaLoRrOTYNhxi9JBPoFjnN6HOxYPH0LiLNpSukusz2DWJe8/DtY4ISrj6YwA8cmk7+08+zRNC09yvtfmVbkbqXRV+XE1OEw+j3GGHh48NaWeQooY6uQ1s6sfnz23RQFN4Wh5m0l1z9k/grdHCEV3qWoYIHj607q17pDNXRoWlOYbodf2zfTT0b/rtR37DJuc1iUsTODwx7bZFFlnDkc4A7l5jnt1jemSCbNJinXOCDfa3Xhpc2PLzYNcSEmhlibAvwarmItw9a434qc3Yjg5FQVsAMG7rosSrefXfbtBCrW9LRBGz1nNwYpnMvuZIEdgI7yQAI1Lzzh2wvWqcfc=
5122a82b-622b-424e-9c5c-c1e724de8431	e21157b6-9128-4ae8-bc72-caaa53763c38	privateKey	MIIEpAIBAAKCAQEAzy4hBQTehq+dMK0Wpb21p9Ikk6mduajPTKWBX14joEYxKm6N5UO1MgvC/BpTWrV13sPRzNkllPwybKJPM9/rgsbg+QRch5VQbPoE9DO67bkCeyryJpAgC5R2dMkJP+MqcIumpKoloIlyj+Kx7yzZus7Zohq9IZ4shCl0QedjhIC9M6LnEbceVuUo/NmbngDKGzwKmh3FszPc4tnu4w40eFY4fHXq4aQPQJvENYMlxpxamisfBV8m+n0Zwq3lukO4qj33srDFLwp/KUoK+ui54P/mALBgQuvT6WZah8SYgnUHSCcohn1lS7hdlFnuDVgqpFYhbusWKGA/88fbmsKPtwIDAQABAoIBAF/qhkTxlSgbw5VWfQashp40btSiETB0E8zzTqrdRXcdKAPx/OVobEnIIjRe57o2CmTgmY/R9FE+VQXwOuTURQ9djagbuc7XdM2PDp4UGPWX0qs9HbB2xy81Q4Yb0JlwTSSfsr3HO/ZPy+cLV79YL1EKFL20zVz0Ar4JBxa/zlX4AmCOjqG/nkS/n+H6Lf8i3hrE2k6IaTyt3XP6p4UdLY8joyNvJeNjRQOvemWt+Ccq3Zf458zZSvUOfYf2dzAqrItLIszF7FjMDKq+Ve3jj17uxrdODgAniCerEDZf6ny39gnoEw5kkw/bwQzUBETxhavoPl+J+db4BDLeWXnrS4kCgYEA9raazGU2tlc+k/w0M1M9DLXDrjRna7jWJoebwXahWFTMmMwEFVtNg+p76Yw4Sdm2TxmDaVCM+74YRhFwQ5CdQcjpDFlJ4/asc3vHIvJEgsLmpbN/+pDMrlfy58/PXKigvSBVCKYFOOnuKPnqSZlwyzk54Cuf3rHulb0b5txGaasCgYEA1vqSnIX1EgbOejEVugXS0uxePO5O5vD7l6U/JL5N+ScHbpMJrgQlsCyzcOFDYosb0ZS7Y0ZVAn0WmTvo7/EnhpUgqDjI/TnzRBvqQlrCQkA1vShrsWLdSj51Ze6jzAHnO9aeN8A1M6BHbRZBOi8Fu90ZyfFN6/+wPEZcVmnZ3iUCgYEA6qyptJD2KR317YgyEzwzTxq6psM8OPBZ686EbtMsCDypXRJ7M+Fka32pHm99v2mzC6ymHpA7et7IciX2Vp6Bp2i3nUJ1kb07LqJnuqseVg+Um7uRmcMQnyoTaUN36JiSRTQzDoX1Y7zJCPsoS5gD/ZtSnRSB/q/b1V1L5B5Vb/8CgYAwxIkLzuuoWjjuyUHHgFiyFoLOSbVGeHZqkUcAu9cOZUcvU1XHzxMJoypVuhRCP5Jg+d+Ehsj0FpJQ0qFmBQvVYPEWmEMoBsRjt/1tbg9RXiWSsp+zjtzqYb7aD8fCmM/u6CHePdET1BE/8uN7In2nf2HBSOdHWSqOkduSktKkrQKBgQCm3U25nB8rf69I9PmksMTZRNQCqieL1Y9MNts/2mwuzLHxIJRfLdQCmNQCp6EhS9y0WOnqgaezC267BakIsU9Kx+euJdRFRRgJmw+HStRZucgQBr4nFkIMvS46kChCHKSoy0M0J4fq3n4HcYJ7HU9xNUyvagH5/HR9PlxemcWEpg==
75628cee-3976-4dfd-b21f-ae3fc41f78b5	e21157b6-9128-4ae8-bc72-caaa53763c38	priority	100
5b69e994-f396-41b6-b73b-832e2a754119	783188ec-7e3f-4709-a4f0-1abde3df5d58	privateKey	MIIEowIBAAKCAQEAqaERGR4VyYKs642OE5xlO+WQmT+5roDGhsXyTTB644l/TnMTyO9Zm/N6upqPc+Z54DsBDdHkILu+1ZU/YUFhMuDmHhZQksvtBo9ZMRW31sCHLDAkcn8+DidGHwcexJydicG/g4CkFE3FvBtJZHeKTVd2gbMbKhaHZJrZvUBt74gAX2UaXInvxGRDsZWZLD0yHpmKPmrLDcr0E+75J1+3S9NwyrAE9Z+Hh9kmw5irHwI07r4sylzpdv5Nh1VXvyAzTPjnuol7P44K5iYXwmE7jEu99U3nku8+aLMaCXODghA8uufLoEw+4Qde5LXu/i4m0zaxTzLKTPERNydYkHoHzQIDAQABAoIBAACRRqCeImYGbyQpmNJVeVw6MCHnHeyoxyE/y8f408xrkxa02VnYfSUBq0UxC65QVNOMdvwwGdKHNkP6KBhf8t6L9JEgs3vOPViChcKdhzwrcDhUX+bXKKK8/GXRrQds27UQhh6/QS1FNlZjA/uXT8ni80VLT1m0chcC0pwouUVuHmVqXAlpvIcXRVmOTV2JDhqo6HllH75jXam39GmZ+NWgpc7yCNdXnwpaj7+RE8CEbRZNsqahyAEhh8ouJsMyZO61dPJaXqpTdhcEXLqaSkDz8opG7/utVq0iWXGqFx6DzhdTtspBkeXgGG3bxdXGTq1SjbAqeOTPsHjvtHkRasECgYEA5qd/g4+s4yeSHdbEMAZsZO7k7qwqvVHnn9Dnm9+0MBkQMOjhp4NDzvfNHjNmp31ehZn90UGmRZzIGIHcF2KgEQGvuZk9UJXtzQShsbAXqI5QjAdt1iyo12tvovgA0kD2DX743QR0pTES4MaAPs7/+Vay3d8mKKv03VvRJXNYGY0CgYEAvEThRCo+6AjEyhtxd1lInHq16Sfh5gVR5rL7iP//FmgztR5p6D68L7BUTnh2iAuvPThlVi/DCF6yESm9Cj6LE0lfLu+Yn8eLUqGlY3w5+qBWRvnemLWW2N0fwvJ3UtiwZDTc/T0jBgw0WySwD9+dvdPRKwtyb6yQc1hbRJnnd0ECgYEA4xibld8KLAUz+ikQtPA+HQqRYOUml4xi75lx0Kjq8khbBqzkMFgvlUGqNUgKlHH9dLFvlG581SFOacLB/kxeqR/t8mEMW6Gipy8ePKLSSGUGrThLTopeGutu2RgxRtIq8JLJWGMgrdypZ6JJdo28vbQ9G/Kv0W+tAZ17SNJONakCgYBmj8eAENuQICbES0r2z4bE5/xtdbKUUlWZretlaMAX/tAcXOMpB/QQrqhezzUTS/o9CZn6564Bw0SSIQDAse2lphTaRuAIOvZlH3Yvyh7zr6EQrVJcMqBop52D3/6s/SqqjDnPIx0PUFq9RDE9lH4kSV3rayL+Py26CGo/5u+3gQKBgFrNBhgTlY42SIoXeg3aLswtDjZcMxyOBOd1xMIM2B4l4+KCFpY0EVMMRh28wmeqgpjLR1LjCb9/BiPmbsx3bFVGw0oAnyMGwnoflIlWYYqCng9+IPKf5Rl31LR0o49EVrGItX4rnIc6jr77h+JlXYRn/DlyB8VU+Cp2V7pVHhhg
d534bce8-36f7-4e44-9212-db8ae7a2e2a4	783188ec-7e3f-4709-a4f0-1abde3df5d58	certificate	MIIClTCCAX0CBgGH4KGsljANBgkqhkiG9w0BAQsFADAOMQwwCgYDVQQDDANwaXQwHhcNMjMwNTAzMDgwMDA0WhcNMzMwNTAzMDgwMTQ0WjAOMQwwCgYDVQQDDANwaXQwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCpoREZHhXJgqzrjY4TnGU75ZCZP7mugMaGxfJNMHrjiX9OcxPI71mb83q6mo9z5nngOwEN0eQgu77VlT9hQWEy4OYeFlCSy+0Gj1kxFbfWwIcsMCRyfz4OJ0YfBx7EnJ2Jwb+DgKQUTcW8G0lkd4pNV3aBsxsqFodkmtm9QG3viABfZRpcie/EZEOxlZksPTIemYo+assNyvQT7vknX7dL03DKsAT1n4eH2SbDmKsfAjTuvizKXOl2/k2HVVe/IDNM+Oe6iXs/jgrmJhfCYTuMS731TeeS7z5osxoJc4OCEDy658ugTD7hB17kte7+LibTNrFPMspM8RE3J1iQegfNAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAAq3P4vCUavoVf6HkEi3A4dBJFGBko4tCliRbctnyNs2HXdkxqo08BfelxlKeujAMgXsODhs2WN/UcGDUvSYFk8jG2Om+lCMo93RJttDNTnCcEeIWhTxbUds21Oia9oQHEO86F4mLUlNYfdwElMOh3/aoLBx4yOLhKACEbxsPNmfJ3ITWKNqCZpRbOjiP5nDEiImCVGSl5WxdOU+p9M5r7Pxe1/q6Ba/A3OkItfrlO29wHXNIWJ6kUKFyNAwX4RTsa0rLghSDt25IVDsiR6SqD+GzosFX+WGhq4w9dU0116TECgyX2//LqC4twA9i5wGDICcage4M5r0O9uAhOzK3GE=
0cc0ee02-4c53-48d9-ba8d-334f6728aadb	783188ec-7e3f-4709-a4f0-1abde3df5d58	keyUse	ENC
a6efb8da-aba4-4674-8590-ad44d6f0ced9	783188ec-7e3f-4709-a4f0-1abde3df5d58	algorithm	RSA-OAEP
d8c0b588-f382-43dc-8fd7-71b2763d40a8	783188ec-7e3f-4709-a4f0-1abde3df5d58	priority	100
0957688e-826b-4d66-8238-fc994b33d0e7	9a8ee13b-56e3-4022-aaab-682f03b876c5	host-sending-registration-request-must-match	true
64e69c1a-3d17-487d-a524-dd7d1943675b	9a8ee13b-56e3-4022-aaab-682f03b876c5	client-uris-must-match	true
fb113942-d7c2-4945-9c49-7562310277d9	3ef8f767-4e05-48ef-a548-19f9bc229362	max-clients	200
27824760-93bf-4ede-9ddb-0ae8d6ff416d	91ac48c4-6888-414e-a016-3cf77b7e1152	allowed-protocol-mapper-types	saml-role-list-mapper
241a86ac-2883-4215-9f55-08dd5a40ac02	91ac48c4-6888-414e-a016-3cf77b7e1152	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
f966b904-4d24-4482-b5d8-fbfb93e66fdf	91ac48c4-6888-414e-a016-3cf77b7e1152	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
58eb4018-66b0-49c8-90f7-39cf3b140325	91ac48c4-6888-414e-a016-3cf77b7e1152	allowed-protocol-mapper-types	saml-user-property-mapper
43b021f2-5478-476b-a3bd-f7cfec2ea97b	91ac48c4-6888-414e-a016-3cf77b7e1152	allowed-protocol-mapper-types	saml-user-attribute-mapper
9c07f614-3da1-4f00-9e61-1ad67ff28259	91ac48c4-6888-414e-a016-3cf77b7e1152	allowed-protocol-mapper-types	oidc-full-name-mapper
fe1e3105-bc7a-4d01-ad53-766ec69ba340	91ac48c4-6888-414e-a016-3cf77b7e1152	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
e72253ca-e2bf-456d-96ab-42fcd891e0d8	91ac48c4-6888-414e-a016-3cf77b7e1152	allowed-protocol-mapper-types	oidc-address-mapper
78069697-4903-404d-b015-772f0fd98625	6a44f4ed-d419-4b76-9feb-288344f27538	allow-default-scopes	true
ba8c347e-951f-42e2-b955-e014fa98ff7f	7d2d0085-6ac7-4da1-b3f5-b53852ca47b7	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
32fafb8e-925d-4f72-b60e-f60716cc42e6	7d2d0085-6ac7-4da1-b3f5-b53852ca47b7	allowed-protocol-mapper-types	saml-user-property-mapper
692e48de-604a-45a7-a365-08e837138354	7d2d0085-6ac7-4da1-b3f5-b53852ca47b7	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
8b401ebb-bbd8-4518-8f69-cf258215f315	7d2d0085-6ac7-4da1-b3f5-b53852ca47b7	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
e8679653-52a4-4757-8fbc-24ceaf5f0bc5	7d2d0085-6ac7-4da1-b3f5-b53852ca47b7	allowed-protocol-mapper-types	oidc-full-name-mapper
2a97268b-b978-46a2-a1d0-4df03f308eb4	7d2d0085-6ac7-4da1-b3f5-b53852ca47b7	allowed-protocol-mapper-types	saml-user-attribute-mapper
ce522838-b87a-4bd4-920f-d557f6ee3ba8	7d2d0085-6ac7-4da1-b3f5-b53852ca47b7	allowed-protocol-mapper-types	oidc-address-mapper
c496f399-ed71-44b4-8b10-3f7d06fb1a3f	7d2d0085-6ac7-4da1-b3f5-b53852ca47b7	allowed-protocol-mapper-types	saml-role-list-mapper
c1b88df0-f074-4736-aadb-7436c33c372d	0533753d-2b18-46cd-9bb6-4e294af2d747	allow-default-scopes	true
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.composite_role (composite, child_role) FROM stdin;
33c2018c-45f5-40b2-a110-530e248957b3	03a2967e-e7fe-4135-87bf-451b8949bfa9
33c2018c-45f5-40b2-a110-530e248957b3	4d3b41f1-a8f7-4d6c-beb4-bb2fc1dbf69d
33c2018c-45f5-40b2-a110-530e248957b3	9c71e187-1a1b-4e24-a896-090504c4acdb
33c2018c-45f5-40b2-a110-530e248957b3	3ea2c537-6f1f-486d-83b8-168b9f452cea
33c2018c-45f5-40b2-a110-530e248957b3	1efb4b4d-c8b9-49c1-804b-8b2e0dbaff2b
33c2018c-45f5-40b2-a110-530e248957b3	bdfc8ba6-9b30-4f1a-9e13-d6474077243f
33c2018c-45f5-40b2-a110-530e248957b3	0d05e70e-a7db-4dff-b790-96e167dc2df0
33c2018c-45f5-40b2-a110-530e248957b3	9f6ba0a8-d570-455d-825f-20d005479f4f
33c2018c-45f5-40b2-a110-530e248957b3	17459b0c-6b5b-452d-affb-0e580e193458
33c2018c-45f5-40b2-a110-530e248957b3	ce7fc10c-7a57-4f97-b319-bad9d1c080b5
33c2018c-45f5-40b2-a110-530e248957b3	70214213-6747-4e40-aa41-4a6d51bc10a3
33c2018c-45f5-40b2-a110-530e248957b3	5e7e1fc5-d840-4df5-a938-ef891d5d7aa4
33c2018c-45f5-40b2-a110-530e248957b3	a3c2a6f0-b77f-4fcc-bbda-80c68a223e86
33c2018c-45f5-40b2-a110-530e248957b3	bca37b76-d483-4471-8cd1-1d5823d1c647
33c2018c-45f5-40b2-a110-530e248957b3	5eaf1f4b-110b-4de4-897b-c1f93b052597
33c2018c-45f5-40b2-a110-530e248957b3	16230dc6-0d4c-46c0-895d-914b77f563c7
33c2018c-45f5-40b2-a110-530e248957b3	5aaca63d-9aeb-41c9-96ac-04c00f742c3c
33c2018c-45f5-40b2-a110-530e248957b3	18b8fc16-5cef-4b54-8f27-6c49e7f18241
1efb4b4d-c8b9-49c1-804b-8b2e0dbaff2b	16230dc6-0d4c-46c0-895d-914b77f563c7
3ea2c537-6f1f-486d-83b8-168b9f452cea	5eaf1f4b-110b-4de4-897b-c1f93b052597
3ea2c537-6f1f-486d-83b8-168b9f452cea	18b8fc16-5cef-4b54-8f27-6c49e7f18241
b8ccb5a5-7b30-403b-84c1-05b0af0e326b	89b23ffe-df23-4583-ba98-a1e7def44ae2
b8ccb5a5-7b30-403b-84c1-05b0af0e326b	198a6c51-db3a-48f9-8e04-898e9b50c392
198a6c51-db3a-48f9-8e04-898e9b50c392	a2291ef4-9f5f-4b54-83c6-da3308345235
3710b0f8-671b-43fa-bb1b-10d637f20426	23dee463-d21f-415e-90ce-9cb6fead4157
33c2018c-45f5-40b2-a110-530e248957b3	c289cf1b-cc1f-42ed-b910-5095264f2a4d
b8ccb5a5-7b30-403b-84c1-05b0af0e326b	88bbd399-61ca-4793-8f16-510b85549f03
b8ccb5a5-7b30-403b-84c1-05b0af0e326b	1024bb37-bfc7-4d95-8ec9-7d25dd4fdae0
33c2018c-45f5-40b2-a110-530e248957b3	d906b022-99b6-4be1-9354-233cdd4b9505
33c2018c-45f5-40b2-a110-530e248957b3	f6163a5b-9afd-4f65-b621-4ac9c81abb97
33c2018c-45f5-40b2-a110-530e248957b3	7c60fea7-af22-4d4e-b6f4-23749238857b
33c2018c-45f5-40b2-a110-530e248957b3	4034b444-933c-4a38-aa29-55408a32e0ae
33c2018c-45f5-40b2-a110-530e248957b3	e5a59136-3be0-4505-8fdd-fe722b5720ca
33c2018c-45f5-40b2-a110-530e248957b3	b4308ea3-ee17-4909-b248-753a94eca917
33c2018c-45f5-40b2-a110-530e248957b3	a595394f-64da-4da9-9169-c9ccba0cba8a
33c2018c-45f5-40b2-a110-530e248957b3	c4da7ee1-e887-433b-8e58-f645c366c5bd
33c2018c-45f5-40b2-a110-530e248957b3	8023abc7-cc5e-47c2-b194-50e0d859df3a
33c2018c-45f5-40b2-a110-530e248957b3	a891dce1-f248-4a2d-ba69-eab87cfdf0b2
33c2018c-45f5-40b2-a110-530e248957b3	9ad219f1-9108-4daf-8bc1-0e4c4185bce4
33c2018c-45f5-40b2-a110-530e248957b3	3a8e3f51-734c-4df4-9451-e5459c99aba8
33c2018c-45f5-40b2-a110-530e248957b3	767aa1f2-2a35-4a02-8a39-1e7ff137e0c8
33c2018c-45f5-40b2-a110-530e248957b3	558e4cf2-3d1b-4f07-9829-8034ee23e7ef
33c2018c-45f5-40b2-a110-530e248957b3	8152d047-23ef-4969-8aa6-5d7f3e119f7f
33c2018c-45f5-40b2-a110-530e248957b3	0f1cf823-dc36-4bf3-b3b8-d5ac587dea6b
33c2018c-45f5-40b2-a110-530e248957b3	7ad23bc5-e709-47f1-bf42-db9959f0cc1e
4034b444-933c-4a38-aa29-55408a32e0ae	8152d047-23ef-4969-8aa6-5d7f3e119f7f
7c60fea7-af22-4d4e-b6f4-23749238857b	7ad23bc5-e709-47f1-bf42-db9959f0cc1e
7c60fea7-af22-4d4e-b6f4-23749238857b	558e4cf2-3d1b-4f07-9829-8034ee23e7ef
a1df3e91-7146-4b67-a8d2-34228da2c413	68af0a9c-c9ce-4979-8534-6517ad123d39
a1df3e91-7146-4b67-a8d2-34228da2c413	b8fd220b-bb82-4e89-a2d0-ba6904b556f4
a1df3e91-7146-4b67-a8d2-34228da2c413	4184d2a9-0585-4116-9cbd-867053917ea4
a1df3e91-7146-4b67-a8d2-34228da2c413	37713e42-e38f-42c1-a863-9a905e06a024
a1df3e91-7146-4b67-a8d2-34228da2c413	019a5596-dbec-4489-8c38-b5d2173163a6
a1df3e91-7146-4b67-a8d2-34228da2c413	7f984901-2eac-48ad-b062-e670eebeba7d
a1df3e91-7146-4b67-a8d2-34228da2c413	513dd410-ab09-493c-b363-1baa5eac6fcb
a1df3e91-7146-4b67-a8d2-34228da2c413	aafe9c46-4d23-4c40-bfe9-7a15c81748e4
a1df3e91-7146-4b67-a8d2-34228da2c413	698d07ee-4c63-4cb7-a4e0-09e87a03fca3
a1df3e91-7146-4b67-a8d2-34228da2c413	553d5ca4-024a-4b28-bd5e-2a2a45b9b001
a1df3e91-7146-4b67-a8d2-34228da2c413	2117de04-3e64-45f8-aec7-3921166946c5
a1df3e91-7146-4b67-a8d2-34228da2c413	37cb8f80-2a01-40fb-abbd-b3eb0e346440
a1df3e91-7146-4b67-a8d2-34228da2c413	1c11aacd-2ca3-407c-b450-f1ec7a133aee
a1df3e91-7146-4b67-a8d2-34228da2c413	b9851010-e731-4d2a-8718-ac74af9890e8
a1df3e91-7146-4b67-a8d2-34228da2c413	45654ae9-960e-4643-8307-0c8302e4901d
a1df3e91-7146-4b67-a8d2-34228da2c413	2fc0fc9e-e9b2-46bc-a634-5a12229eb3b5
a1df3e91-7146-4b67-a8d2-34228da2c413	ae8b3429-9094-4852-9385-d4f0362ab031
37713e42-e38f-42c1-a863-9a905e06a024	45654ae9-960e-4643-8307-0c8302e4901d
4184d2a9-0585-4116-9cbd-867053917ea4	ae8b3429-9094-4852-9385-d4f0362ab031
4184d2a9-0585-4116-9cbd-867053917ea4	b9851010-e731-4d2a-8718-ac74af9890e8
ac66a7f0-4852-4954-91c0-1cfbd4b998ce	d66862e0-7345-424a-a580-a33474730071
ac66a7f0-4852-4954-91c0-1cfbd4b998ce	afd67c44-349f-4abc-bc91-3f7ac5f736cf
afd67c44-349f-4abc-bc91-3f7ac5f736cf	196f5b64-bdde-4dc8-8809-a3ec07e9f0a8
5ffe55e3-4c11-49bc-ae9f-abc57ca03246	f2770a4c-ada4-426a-8b9e-607f117dbc2f
33c2018c-45f5-40b2-a110-530e248957b3	09063bff-0218-4423-b788-7b4cd6904bd7
a1df3e91-7146-4b67-a8d2-34228da2c413	1f5396a4-ac4e-44fb-98e9-f9b8f3c2f212
ac66a7f0-4852-4954-91c0-1cfbd4b998ce	895aa141-91e5-4e76-b743-ae223b55b302
ac66a7f0-4852-4954-91c0-1cfbd4b998ce	4603cefd-ab55-41d1-b2fc-a9f273ae24a3
33c2018c-45f5-40b2-a110-530e248957b3	3619975c-b8c3-4ab3-876f-ddda3041fdd1
33c2018c-45f5-40b2-a110-530e248957b3	3475b62d-d922-4ce3-bbe4-5f02abf76be3
33c2018c-45f5-40b2-a110-530e248957b3	57a835b6-34c5-4063-b98e-da63927b2184
33c2018c-45f5-40b2-a110-530e248957b3	0548776a-cdbb-4dec-b4ec-f99942f4ff1a
33c2018c-45f5-40b2-a110-530e248957b3	6bf6ccce-666f-47d8-9240-3f4de97104c1
33c2018c-45f5-40b2-a110-530e248957b3	8f5e7777-bac8-4d10-8fd2-60a5b2353e0b
33c2018c-45f5-40b2-a110-530e248957b3	d7cb0209-8cf7-47e0-8158-0cbf511cf6d7
33c2018c-45f5-40b2-a110-530e248957b3	6777789d-0db0-4ecd-8f10-ff07a7e426a5
33c2018c-45f5-40b2-a110-530e248957b3	580f0c52-1d3d-4d3e-b021-8be2503a0c1a
33c2018c-45f5-40b2-a110-530e248957b3	eb013ef5-275c-4932-82e5-7a8befa79038
33c2018c-45f5-40b2-a110-530e248957b3	e7325562-5302-4947-94a1-fc9d707873c5
33c2018c-45f5-40b2-a110-530e248957b3	19bbbcab-263e-4828-ba93-d571c2402dd3
33c2018c-45f5-40b2-a110-530e248957b3	fa8ad817-0f87-4eae-a6d2-a49bbc0fe48d
33c2018c-45f5-40b2-a110-530e248957b3	68435a4f-b7d8-47a3-8894-d11f7be0c21c
33c2018c-45f5-40b2-a110-530e248957b3	fc110243-c897-44f0-9d39-35edf94a6ae4
33c2018c-45f5-40b2-a110-530e248957b3	1ae3fb38-fd96-447f-976e-f06351f880fd
33c2018c-45f5-40b2-a110-530e248957b3	f0b90130-b95d-4170-a482-0a718821cac9
0548776a-cdbb-4dec-b4ec-f99942f4ff1a	fc110243-c897-44f0-9d39-35edf94a6ae4
57a835b6-34c5-4063-b98e-da63927b2184	68435a4f-b7d8-47a3-8894-d11f7be0c21c
57a835b6-34c5-4063-b98e-da63927b2184	f0b90130-b95d-4170-a482-0a718821cac9
d0584d18-daf5-4a0c-81ed-56185f1030a3	66d88f89-753b-4b66-b9c3-99d1ab96f3da
d0584d18-daf5-4a0c-81ed-56185f1030a3	9dc98665-41b0-421e-b08d-db04bd2f1dbb
d0584d18-daf5-4a0c-81ed-56185f1030a3	765ae24b-cd44-46da-8326-fa6910507670
d0584d18-daf5-4a0c-81ed-56185f1030a3	10778f58-fff4-4205-8682-7be1bd5abab9
d0584d18-daf5-4a0c-81ed-56185f1030a3	d46e1e1f-cad9-41d3-b4f5-2124d0e2e9a0
d0584d18-daf5-4a0c-81ed-56185f1030a3	cccb4440-ed5a-48d3-9545-ddebbf54be65
d0584d18-daf5-4a0c-81ed-56185f1030a3	25d996c0-d67a-46d8-8e39-1088ff6049ab
d0584d18-daf5-4a0c-81ed-56185f1030a3	6319acc8-7b01-4fcc-8bf9-2638a843c544
d0584d18-daf5-4a0c-81ed-56185f1030a3	cad4d988-3539-4eaf-8162-57054dd90ef3
d0584d18-daf5-4a0c-81ed-56185f1030a3	c49a5eca-5054-44bd-9b55-ffce15eafe21
d0584d18-daf5-4a0c-81ed-56185f1030a3	d6be918c-48c7-4a6e-bfdc-c83718301583
d0584d18-daf5-4a0c-81ed-56185f1030a3	ef2ab335-e5d9-4be7-8ea0-34daf894f3e0
d0584d18-daf5-4a0c-81ed-56185f1030a3	01e08629-94a5-4834-a540-f4ced33a5c4f
d0584d18-daf5-4a0c-81ed-56185f1030a3	58f467e4-7f9e-4d0e-b1eb-d100b875c62f
d0584d18-daf5-4a0c-81ed-56185f1030a3	1af929a8-b957-454e-8d72-839a8ac0d03e
d0584d18-daf5-4a0c-81ed-56185f1030a3	fa777f94-0fe8-4135-b86f-15e187f07dfb
d0584d18-daf5-4a0c-81ed-56185f1030a3	869f2b98-cb12-4eaa-8bf1-67e9ea33dc36
10778f58-fff4-4205-8682-7be1bd5abab9	1af929a8-b957-454e-8d72-839a8ac0d03e
59395d5c-7206-4e49-b8d9-d9d2edfa40ee	dbbb6001-fe61-40e2-a16b-f0d342e43cbe
765ae24b-cd44-46da-8326-fa6910507670	58f467e4-7f9e-4d0e-b1eb-d100b875c62f
765ae24b-cd44-46da-8326-fa6910507670	869f2b98-cb12-4eaa-8bf1-67e9ea33dc36
59395d5c-7206-4e49-b8d9-d9d2edfa40ee	b700ec19-beee-4bcf-a551-2f77324382f0
b700ec19-beee-4bcf-a551-2f77324382f0	9d6ffade-87a7-433a-b0b7-d5ba6da80945
f952a9bb-84ff-43f7-a01b-ab9982983d41	b7323e6f-caa1-41a6-891c-b345a59b8bad
33c2018c-45f5-40b2-a110-530e248957b3	a30189b5-86ef-4328-b0f4-0f841b1eccd2
d0584d18-daf5-4a0c-81ed-56185f1030a3	c990371b-415a-471d-ac6c-89402f8d042c
59395d5c-7206-4e49-b8d9-d9d2edfa40ee	84202fcf-efde-4d05-976f-c37cedd95876
59395d5c-7206-4e49-b8d9-d9d2edfa40ee	109a67b1-6092-4d73-b42b-d2e4e07791ee
2dff6093-3bef-424c-b29e-ae7e048f8c91	b3ccb899-18c9-4f15-8eb3-3947f3814696
2dff6093-3bef-424c-b29e-ae7e048f8c91	be88497f-549d-40ce-a585-7255a292acee
2dff6093-3bef-424c-b29e-ae7e048f8c91	5ea0049b-2fce-44b6-ba7f-f56c334f59b3
2dff6093-3bef-424c-b29e-ae7e048f8c91	4a6b43f9-05c4-461b-b3e5-362435f6c624
2dff6093-3bef-424c-b29e-ae7e048f8c91	00e0ac6c-bf0c-4aeb-83d8-ccb008a2d517
2dff6093-3bef-424c-b29e-ae7e048f8c91	f7b6ba11-17a8-4fc7-a3eb-0540fe9786bf
2dff6093-3bef-424c-b29e-ae7e048f8c91	e2450042-8705-47d7-8d40-85e2628e5f54
2dff6093-3bef-424c-b29e-ae7e048f8c91	c0cccc31-98d6-4c0e-b2b0-c9069ddc5f8d
2dff6093-3bef-424c-b29e-ae7e048f8c91	f104298b-c8c7-45e4-9aeb-fe279ee695d4
2dff6093-3bef-424c-b29e-ae7e048f8c91	70ae22c5-bd13-474f-8f0d-a871255880bf
371aff16-fd2d-4c32-b43d-5c66c879f5e6	9a50c6d0-45f5-425b-ae4b-3cce30e0c8f3
675268db-75ce-4a67-bed9-1da409972038	70ae22c5-bd13-474f-8f0d-a871255880bf
675268db-75ce-4a67-bed9-1da409972038	e2450042-8705-47d7-8d40-85e2628e5f54
e2ac4260-80a6-41f6-b390-cf240cb01c70	c0cccc31-98d6-4c0e-b2b0-c9069ddc5f8d
371aff16-fd2d-4c32-b43d-5c66c879f5e6	4ec7c7fb-668d-40a5-817c-7a149add92ad
4ec7c7fb-668d-40a5-817c-7a149add92ad	6b4a0249-534d-4d4f-a224-5fcd6fa11c4a
625f7485-8d18-4e80-abfa-608bc9bff5fe	7e91ce23-69a4-4a8d-a049-488e27d61413
33c2018c-45f5-40b2-a110-530e248957b3	6617c5f0-4e01-4c93-a9a2-683609e97e37
2dff6093-3bef-424c-b29e-ae7e048f8c91	28967433-11e5-456b-87b8-c95a4f4eb254
371aff16-fd2d-4c32-b43d-5c66c879f5e6	9e661049-5ad1-49c1-86ab-6bd73695482a
371aff16-fd2d-4c32-b43d-5c66c879f5e6	cc0554d7-6667-4732-b7f3-eebcb8ee23dd
33c2018c-45f5-40b2-a110-530e248957b3	5de22eb4-b9f4-4c58-b67a-abc080ff95e7
33c2018c-45f5-40b2-a110-530e248957b3	87192a27-23d4-4ebe-a3d2-26af747a6950
33c2018c-45f5-40b2-a110-530e248957b3	62cdc368-cc98-4a70-8450-a1e78254ca92
33c2018c-45f5-40b2-a110-530e248957b3	8a06219f-0c52-4b12-9f67-27d022ba745d
33c2018c-45f5-40b2-a110-530e248957b3	eac101bc-97f8-4420-aabe-3bd1e5be1253
33c2018c-45f5-40b2-a110-530e248957b3	faeb47f6-9d0f-4ae8-909d-065094d2b785
33c2018c-45f5-40b2-a110-530e248957b3	51dd2216-d4a3-41e2-8aa4-8fd3e5abc072
33c2018c-45f5-40b2-a110-530e248957b3	9bcb6c87-032f-460a-bdfc-1d6cab36f709
33c2018c-45f5-40b2-a110-530e248957b3	afeb6572-efc2-464a-ac1e-dc5017b618fc
33c2018c-45f5-40b2-a110-530e248957b3	39e2e82d-78ed-4082-9a10-36e2d5db28a6
33c2018c-45f5-40b2-a110-530e248957b3	35436b22-5d4b-4bdf-b3fd-cc4fd6aac0d0
33c2018c-45f5-40b2-a110-530e248957b3	d3f4c47b-5166-4741-9f56-aca93f622b04
33c2018c-45f5-40b2-a110-530e248957b3	9d17d1b2-aed5-4bad-a245-81fdef6608a1
33c2018c-45f5-40b2-a110-530e248957b3	899186ca-e455-4458-92d6-a31a4600a5cb
33c2018c-45f5-40b2-a110-530e248957b3	78f084a4-275b-4c0c-afe5-9b8e5f870608
33c2018c-45f5-40b2-a110-530e248957b3	27aceaeb-ea2a-4515-b8cf-408ad73a31be
33c2018c-45f5-40b2-a110-530e248957b3	baacdcc4-db27-4994-8bf4-e9b5adb1c76e
62cdc368-cc98-4a70-8450-a1e78254ca92	899186ca-e455-4458-92d6-a31a4600a5cb
62cdc368-cc98-4a70-8450-a1e78254ca92	baacdcc4-db27-4994-8bf4-e9b5adb1c76e
8a06219f-0c52-4b12-9f67-27d022ba745d	78f084a4-275b-4c0c-afe5-9b8e5f870608
2dff6093-3bef-424c-b29e-ae7e048f8c91	d3066b7d-8b8f-465e-93ab-285bad072e3b
2dff6093-3bef-424c-b29e-ae7e048f8c91	f2e051f4-bb75-4fc4-b54a-2f2ad97eb255
33c2018c-45f5-40b2-a110-530e248957b3	7e1ecf5b-4752-46d6-886a-98a2803b5a6c
33c2018c-45f5-40b2-a110-530e248957b3	a00b830e-9926-4d93-acaa-ffcc7141c3cf
33c2018c-45f5-40b2-a110-530e248957b3	7a187b80-360d-4098-b65f-9196b41f4471
33c2018c-45f5-40b2-a110-530e248957b3	066f8ee4-d038-4bd9-bbff-1341923fec5c
33c2018c-45f5-40b2-a110-530e248957b3	f0734538-2a07-4579-ab89-1f5624d595b7
33c2018c-45f5-40b2-a110-530e248957b3	7f1f202d-848f-45fc-92e2-371e97eafeec
33c2018c-45f5-40b2-a110-530e248957b3	23910550-c2af-4ddf-8553-32f5944758af
33c2018c-45f5-40b2-a110-530e248957b3	00bac9a3-c98d-44e9-89c0-31c18496ada1
33c2018c-45f5-40b2-a110-530e248957b3	af609d01-125e-4ba0-aa18-6f72e3155a95
33c2018c-45f5-40b2-a110-530e248957b3	de150fac-2d9c-4f64-b79d-f78585879c22
33c2018c-45f5-40b2-a110-530e248957b3	18f0ded3-4ba7-43b4-9811-737f74d4c9b3
33c2018c-45f5-40b2-a110-530e248957b3	94ab3797-17dc-45e0-aae8-93daec6153ea
33c2018c-45f5-40b2-a110-530e248957b3	fe89ce5f-9d36-43bf-aaac-4e011cf03a56
33c2018c-45f5-40b2-a110-530e248957b3	4268a7b4-39fa-422c-9e6e-d645b7aa905e
33c2018c-45f5-40b2-a110-530e248957b3	815bd30c-b033-49fb-b4da-7b1318590402
33c2018c-45f5-40b2-a110-530e248957b3	5a1adf07-04fb-4cea-bb6e-8346923127bb
33c2018c-45f5-40b2-a110-530e248957b3	b41a65e1-986d-4aba-80bb-2e098d051c2e
066f8ee4-d038-4bd9-bbff-1341923fec5c	815bd30c-b033-49fb-b4da-7b1318590402
7a187b80-360d-4098-b65f-9196b41f4471	4268a7b4-39fa-422c-9e6e-d645b7aa905e
7a187b80-360d-4098-b65f-9196b41f4471	b41a65e1-986d-4aba-80bb-2e098d051c2e
a39e131d-4967-4eb9-a123-4dbc0c15fa1b	3b45968a-434d-49bb-b56a-915a16f6b54e
a39e131d-4967-4eb9-a123-4dbc0c15fa1b	8c7b831b-6c9a-40e3-8503-df6c17dcc62f
a39e131d-4967-4eb9-a123-4dbc0c15fa1b	537bbcc7-3a81-4308-a137-b271738fd0c5
a39e131d-4967-4eb9-a123-4dbc0c15fa1b	2072529b-697e-44b3-8e6c-46c49fdd3661
a39e131d-4967-4eb9-a123-4dbc0c15fa1b	f783d762-a141-4e81-aa23-b89eede2821e
a39e131d-4967-4eb9-a123-4dbc0c15fa1b	1a36586e-20f4-4719-9bc5-657133880d8d
a39e131d-4967-4eb9-a123-4dbc0c15fa1b	adf948ee-6364-4bd9-a81a-36477adc69b4
a39e131d-4967-4eb9-a123-4dbc0c15fa1b	edc871ee-91e8-4dbf-a8a7-3e84fa38306b
a39e131d-4967-4eb9-a123-4dbc0c15fa1b	eebf7ed8-65c2-4f8a-953a-87fca99a3402
a39e131d-4967-4eb9-a123-4dbc0c15fa1b	46a652d4-cf47-41ef-81cd-bfd0cf81587a
a39e131d-4967-4eb9-a123-4dbc0c15fa1b	32764a9c-1d50-4117-9241-034fc8d349cc
a39e131d-4967-4eb9-a123-4dbc0c15fa1b	edf7b943-8f1d-48a1-87a0-b1c9d779e814
a39e131d-4967-4eb9-a123-4dbc0c15fa1b	fb85a95f-e5b4-4c24-b476-b498f72dac28
a39e131d-4967-4eb9-a123-4dbc0c15fa1b	3249fe48-8f99-4c42-b658-1daae0148153
a39e131d-4967-4eb9-a123-4dbc0c15fa1b	172df765-17b5-4e97-8af0-00dd7e7b5f66
a39e131d-4967-4eb9-a123-4dbc0c15fa1b	0e67e38a-b1ce-409b-87a6-c7e310a46dbc
a39e131d-4967-4eb9-a123-4dbc0c15fa1b	87326405-397a-4ace-84cf-29b06c249f0b
05a76e40-581d-410f-82aa-3e2596b6247f	f9a607e8-ce89-4c3e-903d-30633b7553b6
2072529b-697e-44b3-8e6c-46c49fdd3661	172df765-17b5-4e97-8af0-00dd7e7b5f66
537bbcc7-3a81-4308-a137-b271738fd0c5	87326405-397a-4ace-84cf-29b06c249f0b
537bbcc7-3a81-4308-a137-b271738fd0c5	3249fe48-8f99-4c42-b658-1daae0148153
05a76e40-581d-410f-82aa-3e2596b6247f	e6602492-d78e-43cd-8c93-de3b68a4f7e5
e6602492-d78e-43cd-8c93-de3b68a4f7e5	3a510bc8-a3fa-4f30-8486-55db08e7f293
d8da3f3a-2a47-4094-a1fc-e0c779859267	001a6d1f-cd90-4002-9fce-79b6e2425099
33c2018c-45f5-40b2-a110-530e248957b3	7dc2b691-b8c0-47ab-ac42-0cb969305cc2
a39e131d-4967-4eb9-a123-4dbc0c15fa1b	6243ccbb-5fe1-4bdb-9a27-fe162d442819
05a76e40-581d-410f-82aa-3e2596b6247f	7829b6ca-e83a-4612-b385-1c355b58c9c9
05a76e40-581d-410f-82aa-3e2596b6247f	04471fda-d5f3-4f63-8ad9-107cf6185c5c
2dff6093-3bef-424c-b29e-ae7e048f8c91	675268db-75ce-4a67-bed9-1da409972038
2dff6093-3bef-424c-b29e-ae7e048f8c91	e2ac4260-80a6-41f6-b390-cf240cb01c70
2dff6093-3bef-424c-b29e-ae7e048f8c91	a98f247e-7faf-4df3-9de9-15cd3351ddf4
2dff6093-3bef-424c-b29e-ae7e048f8c91	75dcb1b0-e8d6-4908-bf4e-f0fc5a9551b4
2dff6093-3bef-424c-b29e-ae7e048f8c91	c1171177-4541-4e46-972b-738a558d1b66
33c2018c-45f5-40b2-a110-530e248957b3	18a13f9d-6f4b-4169-a8cb-b8c0791d76fd
33c2018c-45f5-40b2-a110-530e248957b3	32083aff-148a-45ad-982b-f1d5af5b6768
33c2018c-45f5-40b2-a110-530e248957b3	5bce9b38-abeb-4103-a47c-a546e28af4be
33c2018c-45f5-40b2-a110-530e248957b3	aab8e412-b1f5-4b0f-84d6-13a13b34aa26
33c2018c-45f5-40b2-a110-530e248957b3	6808a954-311b-427f-a43b-66413edb55de
33c2018c-45f5-40b2-a110-530e248957b3	a5d4b119-9eda-4b7e-8eba-9145e32cb814
33c2018c-45f5-40b2-a110-530e248957b3	8d1b3ff7-1b94-412a-8ccd-7f026b7c7f7d
33c2018c-45f5-40b2-a110-530e248957b3	38c88e5e-d537-414d-80a1-b634b0baa348
33c2018c-45f5-40b2-a110-530e248957b3	3266881f-97ee-4de3-9270-2674accb2ead
33c2018c-45f5-40b2-a110-530e248957b3	5b5a63be-7f3d-4940-804b-6016f528ab42
33c2018c-45f5-40b2-a110-530e248957b3	0e49cbff-35a2-45b7-86b3-7a69d6525ddb
33c2018c-45f5-40b2-a110-530e248957b3	5586ddbe-ef8b-4403-8533-51a0aaa7fc98
33c2018c-45f5-40b2-a110-530e248957b3	876ac072-998f-4014-bc95-a193782f38c0
33c2018c-45f5-40b2-a110-530e248957b3	6b1accf4-3374-46cb-807f-0cc872127601
33c2018c-45f5-40b2-a110-530e248957b3	c67a6fa0-9e06-49b9-837c-862edc756da5
33c2018c-45f5-40b2-a110-530e248957b3	13054329-2d19-4da6-9d09-06dfed9ffce4
33c2018c-45f5-40b2-a110-530e248957b3	50dbef80-3c88-4e12-8a42-fecc097e336a
5bce9b38-abeb-4103-a47c-a546e28af4be	6b1accf4-3374-46cb-807f-0cc872127601
5bce9b38-abeb-4103-a47c-a546e28af4be	50dbef80-3c88-4e12-8a42-fecc097e336a
aab8e412-b1f5-4b0f-84d6-13a13b34aa26	c67a6fa0-9e06-49b9-837c-862edc756da5
d7747279-e890-48c6-8a45-439c330c931c	be65478e-4a23-4887-92f6-dec5cdce3b77
d7747279-e890-48c6-8a45-439c330c931c	f0535e5d-55c0-4d5f-8499-dffd07234da3
d7747279-e890-48c6-8a45-439c330c931c	c9904c1e-0d97-4d9d-af57-0e6db104c508
d7747279-e890-48c6-8a45-439c330c931c	55b880b7-62af-407d-a158-b2919c4ba848
d7747279-e890-48c6-8a45-439c330c931c	3498538c-a9c2-4d44-9d2d-e4159a022d23
d7747279-e890-48c6-8a45-439c330c931c	7f8d0b99-1847-48df-b5d8-1686bdd3d40f
d7747279-e890-48c6-8a45-439c330c931c	167b23ba-0c31-4589-ac4f-4728fc7effe4
d7747279-e890-48c6-8a45-439c330c931c	bdf85ffb-cd50-4225-8c22-eff83d49b1b7
d7747279-e890-48c6-8a45-439c330c931c	70ac8100-37ff-42a6-bcc7-12b5756aa26c
d7747279-e890-48c6-8a45-439c330c931c	3365b9b3-8795-4e6f-8bab-f55b109dbb66
d7747279-e890-48c6-8a45-439c330c931c	6c72de52-2d6e-457a-828e-e2a79360cf51
d7747279-e890-48c6-8a45-439c330c931c	0fd4a3db-274a-40aa-ac9e-be71456ef5a8
d7747279-e890-48c6-8a45-439c330c931c	09522afe-5ad1-4094-96a2-e3ba3b80985b
d7747279-e890-48c6-8a45-439c330c931c	79b67172-d85a-4b3a-bea3-082a38b3a832
d7747279-e890-48c6-8a45-439c330c931c	64f45a50-6486-4722-8195-6529bfb788fb
d7747279-e890-48c6-8a45-439c330c931c	d1f5235e-6545-4b3a-960f-6b7636dfd046
d7747279-e890-48c6-8a45-439c330c931c	973bbb97-4df0-42d8-9d31-bc2b9c38a013
55b880b7-62af-407d-a158-b2919c4ba848	64f45a50-6486-4722-8195-6529bfb788fb
6cefe484-cb9f-44f2-9d71-e3c6f53d23be	f115894b-b1fc-42ae-9949-2c3822de8727
c9904c1e-0d97-4d9d-af57-0e6db104c508	79b67172-d85a-4b3a-bea3-082a38b3a832
c9904c1e-0d97-4d9d-af57-0e6db104c508	973bbb97-4df0-42d8-9d31-bc2b9c38a013
6cefe484-cb9f-44f2-9d71-e3c6f53d23be	dc300d1f-d8a8-4521-9fad-7f227519d315
dc300d1f-d8a8-4521-9fad-7f227519d315	86fc8cd4-57c5-47dc-aa27-2354c397a09a
cf536853-7027-4300-92d9-6e37d76cdd65	186e9c8a-f356-4d60-83c7-358c7fbecfca
33c2018c-45f5-40b2-a110-530e248957b3	e43f3cd3-0f39-4908-be37-7267f0bfbe80
d7747279-e890-48c6-8a45-439c330c931c	84951bf9-ec6a-44eb-82aa-1cc61488ab22
6cefe484-cb9f-44f2-9d71-e3c6f53d23be	f712e44f-7301-4b39-b03a-259ec653b76c
6cefe484-cb9f-44f2-9d71-e3c6f53d23be	38c36278-df54-44c5-bdc5-fa4bff33d858
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
bf682049-f0bf-47f4-958b-99cca93eb319	\N	password	ce8e8317-400d-4b3c-99aa-b00ef402a6f0	1681537367833	\N	{"value":"yBA+RQy13MYFq5uCZf9swqdC+SUav9ZxQO/YqTJt9E5mBZAWkytUf5cjwuKOdoTX2P9qLbQTRmDR0FAbk1nSVg==","salt":"dI0T1vSa2ONdo3JiOshrJg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
37a853ee-340f-4684-9e3d-240eb604269c	\N	password	ad918d69-8328-4795-884a-98db5bf1e72e	1681546435261	My password	{"value":"IpMupp9W9lIMo8eQDgWsdOCpG3AWz/p4gz5JLGEYhLQ9X1+QBTv8p5PbZIadAt5d0LuXfBRZkIbn0Of0zsXm3A==","salt":"rzEgQTwuOBp3I/GbB9AJ0Q==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
ab03fa33-65e5-464a-85fa-c08c6027bda6	\N	password	9c494b4d-2069-4efb-b9d9-d74d4568e10b	1681546465583	My password	{"value":"0dQOprcGcCjZUZohB0XTOiWrHlyU+gZH0hnh3X816K300qBJRagjgZtJRDkXFdaedxF+XZFDqN9a9vLCvFy61w==","salt":"I2Sps5M5Limr/8PbUPmQJA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
87f8e0ec-3ff9-4e67-9036-1e43d8f1045a	\N	password	96d81d84-06f7-4f92-a4f5-f149a2e12385	1682929516758	My password	{"value":"yxNQ7j7B6obd52veUi54edcGY1wFnKDsaV2ebQm3heAG5whCFLRyLwNNSFoSiYN47W12bBX65gvL7YUVPKdLPg==","salt":"ITGAZZgtkKwVhpE+NC9nSA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
db428c7a-7ec8-46b8-b932-0e597dcad5e7	\N	password	0eb8f40f-9797-489f-b9b2-299f22f68f9b	1682929812828	My password	{"value":"LD/DhPn781yCVhcEJejIGhvcrQ6GKlDYqzGPK3mtKuhKsU6z1mFdABaBluyjrGvfb7miB9l+ED82JYqmZS8Mrg==","salt":"EAqij2fuFuFdEP9zMmf5rg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
ae0e4f5f-89f8-4148-9251-5cc956213dd4	\N	password	a3d473f6-668d-4144-82ab-4a5bb9d786dd	1682929882779	My password	{"value":"HzFZ+Af9bYpvyPd213hSkrB1A6sFilzdNhL7WczHLwWlRYHiPedTM1dypOqTRZF90oy7kwG9V7A+IEyGE6NGHw==","salt":"Fqnfe0XL0feXP109MiZ7Gg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
97e730a5-da9a-4133-a86c-acc4545babfe	\N	password	c127b5e1-d543-4550-8123-f3ed9f572cb2	1683134133831	\N	{"value":"7OnnOPVsB+YWU3Cz63XSGcDKtV9FgyFFlNZtzFHc6RXwRQsdi1yk5ATzvwHTPUq6fU5MYBZ2ikNtYdTNulgTjg==","salt":"6PUpk2ebY17ZWVr2eI7z7g==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
c09cd967-c251-41b6-a4f3-113a468de5a4	\N	password	87165d91-1653-4159-b2ca-6c7f89675bb2	1683184611795	\N	{"value":"wIbamOa5xXTVJK6GQJVtD1wJmKMDsdYk7NUtzy1/qKcqyLy5Hem+bNZ2E8CQ7nmWdyL3YWuw6XD2oJ9kXDaHnA==","salt":"tLxYhCmDxtF3SLwh7Z84Bg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2023-04-15 05:42:37.978528	1	EXECUTED	8:bda77d94bf90182a1e30c24f1c155ec7	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.8.0	\N	\N	1537356656
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2023-04-15 05:42:38.000059	2	MARK_RAN	8:1ecb330f30986693d1cba9ab579fa219	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.8.0	\N	\N	1537356656
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2023-04-15 05:42:38.105581	3	EXECUTED	8:cb7ace19bc6d959f305605d255d4c843	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.8.0	\N	\N	1537356656
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2023-04-15 05:42:38.114233	4	EXECUTED	8:80230013e961310e6872e871be424a63	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.8.0	\N	\N	1537356656
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2023-04-15 05:42:38.354578	5	EXECUTED	8:67f4c20929126adc0c8e9bf48279d244	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.8.0	\N	\N	1537356656
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2023-04-15 05:42:38.357882	6	MARK_RAN	8:7311018b0b8179ce14628ab412bb6783	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.8.0	\N	\N	1537356656
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2023-04-15 05:42:38.60812	7	EXECUTED	8:037ba1216c3640f8785ee6b8e7c8e3c1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.8.0	\N	\N	1537356656
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2023-04-15 05:42:38.616436	8	MARK_RAN	8:7fe6ffe4af4df289b3157de32c624263	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.8.0	\N	\N	1537356656
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2023-04-15 05:42:38.634213	9	EXECUTED	8:9c136bc3187083a98745c7d03bc8a303	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.8.0	\N	\N	1537356656
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2023-04-15 05:42:38.87979	10	EXECUTED	8:b5f09474dca81fb56a97cf5b6553d331	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.8.0	\N	\N	1537356656
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2023-04-15 05:42:39.023858	11	EXECUTED	8:ca924f31bd2a3b219fdcfe78c82dacf4	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	1537356656
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2023-04-15 05:42:39.028498	12	MARK_RAN	8:8acad7483e106416bcfa6f3b824a16cd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	1537356656
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2023-04-15 05:42:39.089685	13	EXECUTED	8:9b1266d17f4f87c78226f5055408fd5e	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	1537356656
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-04-15 05:42:39.135599	14	EXECUTED	8:d80ec4ab6dbfe573550ff72396c7e910	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.8.0	\N	\N	1537356656
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-04-15 05:42:39.139045	15	MARK_RAN	8:d86eb172171e7c20b9c849b584d147b2	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	1537356656
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-04-15 05:42:39.141319	16	MARK_RAN	8:5735f46f0fa60689deb0ecdc2a0dea22	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.8.0	\N	\N	1537356656
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2023-04-15 05:42:39.147246	17	EXECUTED	8:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.8.0	\N	\N	1537356656
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2023-04-15 05:42:39.243148	18	EXECUTED	8:5c1a8fd2014ac7fc43b90a700f117b23	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.8.0	\N	\N	1537356656
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2023-04-15 05:42:39.345009	19	EXECUTED	8:1f6c2c2dfc362aff4ed75b3f0ef6b331	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.8.0	\N	\N	1537356656
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2023-04-15 05:42:39.352255	20	EXECUTED	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.8.0	\N	\N	1537356656
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-04-15 05:42:40.211007	45	EXECUTED	8:a164ae073c56ffdbc98a615493609a52	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.8.0	\N	\N	1537356656
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2023-04-15 05:42:39.357164	21	MARK_RAN	8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.8.0	\N	\N	1537356656
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2023-04-15 05:42:39.364101	22	MARK_RAN	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.8.0	\N	\N	1537356656
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2023-04-15 05:42:39.41902	23	EXECUTED	8:d9fa18ffa355320395b86270680dd4fe	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.8.0	\N	\N	1537356656
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2023-04-15 05:42:39.428726	24	EXECUTED	8:90cff506fedb06141ffc1c71c4a1214c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.8.0	\N	\N	1537356656
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2023-04-15 05:42:39.431983	25	MARK_RAN	8:11a788aed4961d6d29c427c063af828c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.8.0	\N	\N	1537356656
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2023-04-15 05:42:39.477623	26	EXECUTED	8:a4218e51e1faf380518cce2af5d39b43	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.8.0	\N	\N	1537356656
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2023-04-15 05:42:39.614054	27	EXECUTED	8:d9e9a1bfaa644da9952456050f07bbdc	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.8.0	\N	\N	1537356656
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2023-04-15 05:42:39.619022	28	EXECUTED	8:d1bf991a6163c0acbfe664b615314505	update tableName=RESOURCE_SERVER_POLICY		\N	4.8.0	\N	\N	1537356656
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2023-04-15 05:42:39.742811	29	EXECUTED	8:88a743a1e87ec5e30bf603da68058a8c	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.8.0	\N	\N	1537356656
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2023-04-15 05:42:39.777524	30	EXECUTED	8:c5517863c875d325dea463d00ec26d7a	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.8.0	\N	\N	1537356656
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2023-04-15 05:42:39.825577	31	EXECUTED	8:ada8b4833b74a498f376d7136bc7d327	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.8.0	\N	\N	1537356656
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2023-04-15 05:42:39.840119	32	EXECUTED	8:b9b73c8ea7299457f99fcbb825c263ba	customChange		\N	4.8.0	\N	\N	1537356656
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-04-15 05:42:39.848924	33	EXECUTED	8:07724333e625ccfcfc5adc63d57314f3	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	1537356656
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-04-15 05:42:39.851282	34	MARK_RAN	8:8b6fd445958882efe55deb26fc541a7b	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.8.0	\N	\N	1537356656
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-04-15 05:42:39.912078	35	EXECUTED	8:29b29cfebfd12600897680147277a9d7	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.8.0	\N	\N	1537356656
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2023-04-15 05:42:39.922646	36	EXECUTED	8:73ad77ca8fd0410c7f9f15a471fa52bc	addColumn tableName=REALM		\N	4.8.0	\N	\N	1537356656
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2023-04-15 05:42:39.936739	37	EXECUTED	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	1537356656
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2023-04-15 05:42:39.943982	38	EXECUTED	8:27180251182e6c31846c2ddab4bc5781	addColumn tableName=FED_USER_CONSENT		\N	4.8.0	\N	\N	1537356656
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2023-04-15 05:42:39.953409	39	EXECUTED	8:d56f201bfcfa7a1413eb3e9bc02978f9	addColumn tableName=IDENTITY_PROVIDER		\N	4.8.0	\N	\N	1537356656
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-04-15 05:42:39.956838	40	MARK_RAN	8:91f5522bf6afdc2077dfab57fbd3455c	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.8.0	\N	\N	1537356656
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-04-15 05:42:39.964163	41	MARK_RAN	8:0f01b554f256c22caeb7d8aee3a1cdc8	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.8.0	\N	\N	1537356656
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2023-04-15 05:42:39.975911	42	EXECUTED	8:ab91cf9cee415867ade0e2df9651a947	customChange		\N	4.8.0	\N	\N	1537356656
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2023-04-15 05:42:40.197023	43	EXECUTED	8:ceac9b1889e97d602caf373eadb0d4b7	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.8.0	\N	\N	1537356656
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2023-04-15 05:42:40.202539	44	EXECUTED	8:84b986e628fe8f7fd8fd3c275c5259f2	addColumn tableName=USER_ENTITY		\N	4.8.0	\N	\N	1537356656
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-04-15 05:42:40.223934	46	EXECUTED	8:70a2b4f1f4bd4dbf487114bdb1810e64	customChange		\N	4.8.0	\N	\N	1537356656
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-04-15 05:42:40.226118	47	MARK_RAN	8:7be68b71d2f5b94b8df2e824f2860fa2	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.8.0	\N	\N	1537356656
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-04-15 05:42:40.307278	48	EXECUTED	8:bab7c631093c3861d6cf6144cd944982	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.8.0	\N	\N	1537356656
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2023-04-15 05:42:40.317436	49	EXECUTED	8:fa809ac11877d74d76fe40869916daad	addColumn tableName=REALM		\N	4.8.0	\N	\N	1537356656
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2023-04-15 05:42:40.403042	50	EXECUTED	8:fac23540a40208f5f5e326f6ceb4d291	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.8.0	\N	\N	1537356656
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2023-04-15 05:42:40.472696	51	EXECUTED	8:2612d1b8a97e2b5588c346e817307593	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.8.0	\N	\N	1537356656
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2023-04-15 05:42:40.476554	52	EXECUTED	8:9842f155c5db2206c88bcb5d1046e941	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	1537356656
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2023-04-15 05:42:40.484908	53	EXECUTED	8:2e12e06e45498406db72d5b3da5bbc76	update tableName=REALM		\N	4.8.0	\N	\N	1537356656
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2023-04-15 05:42:40.491869	54	EXECUTED	8:33560e7c7989250c40da3abdabdc75a4	update tableName=CLIENT		\N	4.8.0	\N	\N	1537356656
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-04-15 05:42:40.509563	55	EXECUTED	8:87a8d8542046817a9107c7eb9cbad1cd	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.8.0	\N	\N	1537356656
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-04-15 05:42:40.524078	56	EXECUTED	8:3ea08490a70215ed0088c273d776311e	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.8.0	\N	\N	1537356656
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-04-15 05:42:40.568316	57	EXECUTED	8:2d56697c8723d4592ab608ce14b6ed68	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.8.0	\N	\N	1537356656
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2023-04-15 05:42:40.829868	58	EXECUTED	8:3e423e249f6068ea2bbe48bf907f9d86	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.8.0	\N	\N	1537356656
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2023-04-15 05:42:40.888693	59	EXECUTED	8:15cabee5e5df0ff099510a0fc03e4103	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.8.0	\N	\N	1537356656
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2023-04-15 05:42:40.909073	60	EXECUTED	8:4b80200af916ac54d2ffbfc47918ab0e	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.8.0	\N	\N	1537356656
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2023-04-15 05:42:40.926419	61	EXECUTED	8:66564cd5e168045d52252c5027485bbb	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.8.0	\N	\N	1537356656
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2023-04-15 05:42:40.935521	62	EXECUTED	8:1c7064fafb030222be2bd16ccf690f6f	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.8.0	\N	\N	1537356656
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2023-04-15 05:42:40.939355	63	EXECUTED	8:2de18a0dce10cdda5c7e65c9b719b6e5	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.8.0	\N	\N	1537356656
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2023-04-15 05:42:40.94241	64	EXECUTED	8:03e413dd182dcbd5c57e41c34d0ef682	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.8.0	\N	\N	1537356656
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2023-04-15 05:42:40.952282	65	EXECUTED	8:d27b42bb2571c18fbe3fe4e4fb7582a7	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.8.0	\N	\N	1537356656
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2023-04-15 05:42:40.976852	66	EXECUTED	8:698baf84d9fd0027e9192717c2154fb8	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.8.0	\N	\N	1537356656
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2023-04-15 05:42:40.985767	67	EXECUTED	8:ced8822edf0f75ef26eb51582f9a821a	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.8.0	\N	\N	1537356656
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2023-04-15 05:42:40.992831	68	EXECUTED	8:f0abba004cf429e8afc43056df06487d	addColumn tableName=REALM		\N	4.8.0	\N	\N	1537356656
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2023-04-15 05:42:41.013803	69	EXECUTED	8:6662f8b0b611caa359fcf13bf63b4e24	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.8.0	\N	\N	1537356656
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2023-04-15 05:42:41.022417	70	EXECUTED	8:9e6b8009560f684250bdbdf97670d39e	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.8.0	\N	\N	1537356656
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2023-04-15 05:42:41.029096	71	EXECUTED	8:4223f561f3b8dc655846562b57bb502e	addColumn tableName=RESOURCE_SERVER		\N	4.8.0	\N	\N	1537356656
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-04-15 05:42:41.0426	72	EXECUTED	8:215a31c398b363ce383a2b301202f29e	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	1537356656
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-04-15 05:42:41.060031	73	EXECUTED	8:83f7a671792ca98b3cbd3a1a34862d3d	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	1537356656
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-04-15 05:42:41.062145	74	MARK_RAN	8:f58ad148698cf30707a6efbdf8061aa7	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	1537356656
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-04-15 05:42:41.121956	75	EXECUTED	8:79e4fd6c6442980e58d52ffc3ee7b19c	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.8.0	\N	\N	1537356656
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2023-04-15 05:42:41.132019	76	EXECUTED	8:87af6a1e6d241ca4b15801d1f86a297d	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.8.0	\N	\N	1537356656
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-04-15 05:42:41.136333	77	EXECUTED	8:b44f8d9b7b6ea455305a6d72a200ed15	addColumn tableName=CLIENT		\N	4.8.0	\N	\N	1537356656
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-04-15 05:42:41.138332	78	MARK_RAN	8:2d8ed5aaaeffd0cb004c046b4a903ac5	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.8.0	\N	\N	1537356656
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-04-15 05:42:41.186214	79	EXECUTED	8:e290c01fcbc275326c511633f6e2acde	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.8.0	\N	\N	1537356656
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2023-04-15 05:42:41.189044	80	MARK_RAN	8:c9db8784c33cea210872ac2d805439f8	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.8.0	\N	\N	1537356656
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-04-15 05:42:41.200575	81	EXECUTED	8:95b676ce8fc546a1fcfb4c92fae4add5	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.8.0	\N	\N	1537356656
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-04-15 05:42:41.203614	82	MARK_RAN	8:38a6b2a41f5651018b1aca93a41401e5	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	1537356656
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-04-15 05:42:41.211533	83	EXECUTED	8:3fb99bcad86a0229783123ac52f7609c	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	1537356656
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-04-15 05:42:41.21766	84	MARK_RAN	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	1537356656
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2023-04-15 05:42:41.22636	85	EXECUTED	8:ab4f863f39adafd4c862f7ec01890abc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.8.0	\N	\N	1537356656
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2023-04-15 05:42:41.238603	86	EXECUTED	8:13c419a0eb336e91ee3a3bf8fda6e2a7	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.8.0	\N	\N	1537356656
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2023-04-15 05:42:41.264892	87	EXECUTED	8:e3fb1e698e0471487f51af1ed80fe3ac	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.8.0	\N	\N	1537356656
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2023-04-15 05:42:41.283919	88	EXECUTED	8:babadb686aab7b56562817e60bf0abd0	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.8.0	\N	\N	1537356656
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-04-15 05:42:41.292198	89	EXECUTED	8:72d03345fda8e2f17093d08801947773	addColumn tableName=REALM; customChange		\N	4.8.0	\N	\N	1537356656
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-04-15 05:42:41.31373	90	EXECUTED	8:61c9233951bd96ffecd9ba75f7d978a4	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.8.0	\N	\N	1537356656
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-04-15 05:42:41.321655	91	EXECUTED	8:ea82e6ad945cec250af6372767b25525	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	1537356656
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-04-15 05:42:41.346857	92	EXECUTED	8:d3f4a33f41d960ddacd7e2ef30d126b3	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.8.0	\N	\N	1537356656
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-04-15 05:42:41.349271	93	MARK_RAN	8:1284a27fbd049d65831cb6fc07c8a783	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.8.0	\N	\N	1537356656
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-04-15 05:42:41.369154	94	EXECUTED	8:9d11b619db2ae27c25853b8a37cd0dea	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.8.0	\N	\N	1537356656
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-04-15 05:42:41.373208	95	MARK_RAN	8:3002bb3997451bb9e8bac5c5cd8d6327	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.8.0	\N	\N	1537356656
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2023-04-15 05:42:41.393153	96	EXECUTED	8:dfbee0d6237a23ef4ccbb7a4e063c163	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.8.0	\N	\N	1537356656
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-04-15 05:42:41.413373	97	EXECUTED	8:75f3e372df18d38c62734eebb986b960	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	1537356656
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-04-15 05:42:41.415734	98	MARK_RAN	8:7fee73eddf84a6035691512c85637eef	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	1537356656
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-04-15 05:42:41.445728	99	MARK_RAN	8:7a11134ab12820f999fbf3bb13c3adc8	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	1537356656
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-04-15 05:42:41.455027	100	EXECUTED	8:c0f6eaac1f3be773ffe54cb5b8482b70	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	1537356656
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-04-15 05:42:41.457015	101	MARK_RAN	8:18186f0008b86e0f0f49b0c4d0e842ac	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	1537356656
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-04-15 05:42:41.464483	102	EXECUTED	8:09c2780bcb23b310a7019d217dc7b433	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.8.0	\N	\N	1537356656
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2023-04-15 05:42:41.480028	103	EXECUTED	8:276a44955eab693c970a42880197fff2	customChange		\N	4.8.0	\N	\N	1537356656
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2023-04-15 05:42:41.491659	104	EXECUTED	8:ba8ee3b694d043f2bfc1a1079d0760d7	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.8.0	\N	\N	1537356656
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2023-04-15 05:42:41.498621	105	EXECUTED	8:5e06b1d75f5d17685485e610c2851b17	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.8.0	\N	\N	1537356656
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2023-04-15 05:42:41.506934	106	EXECUTED	8:4b80546c1dc550ac552ee7b24a4ab7c0	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.8.0	\N	\N	1537356656
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2023-04-15 05:42:41.513811	107	EXECUTED	8:af510cd1bb2ab6339c45372f3e491696	customChange		\N	4.8.0	\N	\N	1537356656
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2023-04-15 05:42:41.523678	108	EXECUTED	8:05c99fc610845ef66ee812b7921af0ef	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.8.0	\N	\N	1537356656
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2023-04-15 05:42:41.525927	109	MARK_RAN	8:314e803baf2f1ec315b3464e398b8247	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.8.0	\N	\N	1537356656
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2023-04-15 05:42:41.537831	110	EXECUTED	8:56e4677e7e12556f70b604c573840100	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	1537356656
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
7b27a11d-121a-4360-960c-3ea6deb0ac35	8e27f114-b1c4-47cb-8032-138c3805716d	f
7b27a11d-121a-4360-960c-3ea6deb0ac35	49e97e25-d4dd-40c8-882f-3e894f6c59e1	t
7b27a11d-121a-4360-960c-3ea6deb0ac35	9ce86df7-ae42-4e8f-9c53-85f3901d8f4f	t
7b27a11d-121a-4360-960c-3ea6deb0ac35	b32226bf-f4fa-433f-b566-e8b8e95f686d	t
7b27a11d-121a-4360-960c-3ea6deb0ac35	a9fa8229-bcee-42fb-84c5-91b0df91a164	f
7b27a11d-121a-4360-960c-3ea6deb0ac35	7e38e21a-76ad-4b8a-8be2-da3ff54dbb90	f
7b27a11d-121a-4360-960c-3ea6deb0ac35	21b57b5b-6b2a-4700-9180-060e36c2da9e	t
7b27a11d-121a-4360-960c-3ea6deb0ac35	a3a86244-e2bc-4626-a691-36026a20eaac	t
7b27a11d-121a-4360-960c-3ea6deb0ac35	b6d65dc0-5828-49cd-8a61-51b909a95424	f
7b27a11d-121a-4360-960c-3ea6deb0ac35	b3f8a4b6-06e2-4a09-b541-9f77e2f4e970	t
aef5c390-9834-4cad-83be-4efe22893758	384ec609-a8d1-4ae4-97bf-d5e957132a5d	f
aef5c390-9834-4cad-83be-4efe22893758	284a6148-dc6d-4b68-8b5b-95ed681a3aa4	t
aef5c390-9834-4cad-83be-4efe22893758	4bcdc5f8-ddbb-4903-bdce-75740243a6de	t
aef5c390-9834-4cad-83be-4efe22893758	b1809973-dc13-4006-ba94-56f00b4e0619	t
aef5c390-9834-4cad-83be-4efe22893758	0de9b76a-bccf-4d9c-b56f-6845cb6a6387	f
aef5c390-9834-4cad-83be-4efe22893758	83878d56-5ac3-4322-afdd-7bdfc294bebd	f
aef5c390-9834-4cad-83be-4efe22893758	07e618c7-bfa6-468b-adb2-e15ba0f56d04	t
aef5c390-9834-4cad-83be-4efe22893758	5d917fd0-475a-4cfc-b28d-cc0ba8ebbc12	t
aef5c390-9834-4cad-83be-4efe22893758	5c5aa9a6-de06-4b20-b20c-3b21efd29cb3	f
aef5c390-9834-4cad-83be-4efe22893758	5df278e3-86c1-429a-af9c-ac3bb962d0ba	t
60d763c7-10e3-4490-8529-e1c97d983ade	75d202a7-0e42-4362-910b-c957479087fe	f
60d763c7-10e3-4490-8529-e1c97d983ade	0e935cb0-6e9d-45ba-8c2f-d5f2a0310b12	t
60d763c7-10e3-4490-8529-e1c97d983ade	0c21cef9-585a-404e-b8f2-fbba43b1bb79	t
60d763c7-10e3-4490-8529-e1c97d983ade	ae9bf4a6-05d1-4bef-9772-d5dc9b77710c	t
60d763c7-10e3-4490-8529-e1c97d983ade	eabf4c77-7d0b-403c-87e5-49a9243e3c8e	f
60d763c7-10e3-4490-8529-e1c97d983ade	c102a4f2-8de9-429c-88da-dd094ed17600	f
60d763c7-10e3-4490-8529-e1c97d983ade	ff5fe863-8734-4cf2-af69-f18261d53492	t
60d763c7-10e3-4490-8529-e1c97d983ade	2845c8ab-6a7b-4ca0-b83a-182fc73907dd	t
60d763c7-10e3-4490-8529-e1c97d983ade	46505150-ff79-4f47-909a-a520df58e767	f
60d763c7-10e3-4490-8529-e1c97d983ade	47600150-3aff-4e6b-8c8a-63030b7718a9	t
dd9bcc37-69c8-4b94-9737-50788f40287c	034b2113-cc61-4e5f-b921-e690ac46e24d	f
dd9bcc37-69c8-4b94-9737-50788f40287c	5a5e5838-f9cf-442a-a4d8-3c6436a2728f	t
dd9bcc37-69c8-4b94-9737-50788f40287c	2729bd3c-c919-4768-9c69-2e5152e94cd5	t
dd9bcc37-69c8-4b94-9737-50788f40287c	3dd11a2b-d310-4c68-a546-ade7fb0fbe50	t
dd9bcc37-69c8-4b94-9737-50788f40287c	85f93bf5-c148-4aee-bf72-0a9c9fca86c6	f
dd9bcc37-69c8-4b94-9737-50788f40287c	5adfbeaa-0d84-4438-8815-db1c1a01ea0c	f
dd9bcc37-69c8-4b94-9737-50788f40287c	0629b8d7-75de-457a-abf4-4d97423b1c0a	t
dd9bcc37-69c8-4b94-9737-50788f40287c	9167a5b4-dd14-4d0b-bd36-d657f743670a	t
dd9bcc37-69c8-4b94-9737-50788f40287c	a1983e8d-2811-4ed6-adfd-6b16475d96db	f
dd9bcc37-69c8-4b94-9737-50788f40287c	46d940b1-fb0d-40ad-a551-6ca1eae0e844	t
3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	99adc83f-41d2-4bab-b1d5-4fbab02b25de	f
3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	64cbd8af-432e-4175-b6fc-d737c256d24e	t
3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	6dc97505-f071-4fd4-bc01-58a56e5985eb	t
3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	e65b2bf1-e2a4-4015-8c78-cf732e9efe20	t
3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	e96c4d2e-33bb-45d7-8225-2578d24fa8b9	f
3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	4ba41e2c-1fd5-45d1-ab77-19269aaf5169	f
3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	e65232e9-5405-4fa8-abfe-e6b74891c21f	t
3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	f299ed6e-d170-41f8-b7e1-2a63406adfcc	t
3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	31da5254-ec0d-4f84-b9b5-53804d14ba82	f
3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	676a39d7-db2d-4b0c-9ee7-0fe6e629c8ac	t
0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	a2675b92-0d79-4b69-b612-2a7c20433c47	f
0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	010070ea-a6d9-45fe-9a00-918471ac3dd3	t
0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	80bad978-251c-47e3-903a-86af08c4b811	t
0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	185f848c-dd45-46ad-81ce-26c5be5c0ee7	t
0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	62334196-39d2-4539-89fd-f90101dc5e03	f
0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	99c830a1-f8f5-4c82-8577-9d43ac671636	f
0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	4700486b-5409-48ed-bea9-f0257d6d0690	t
0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	1366450b-302c-48e2-bc7a-0a1f0a66479b	t
0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	8aa30a2b-f3d5-406b-89f0-83e98d24df4a	f
0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	52c09584-d9a4-4bd6-b0ac-0fca69abc7b9	t
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
b8ccb5a5-7b30-403b-84c1-05b0af0e326b	7b27a11d-121a-4360-960c-3ea6deb0ac35	f	${role_default-roles}	default-roles-master	7b27a11d-121a-4360-960c-3ea6deb0ac35	\N	\N
03a2967e-e7fe-4135-87bf-451b8949bfa9	7b27a11d-121a-4360-960c-3ea6deb0ac35	f	${role_create-realm}	create-realm	7b27a11d-121a-4360-960c-3ea6deb0ac35	\N	\N
4d3b41f1-a8f7-4d6c-beb4-bb2fc1dbf69d	526d8a87-adcb-464b-9825-0ad9c321cfcd	t	${role_create-client}	create-client	7b27a11d-121a-4360-960c-3ea6deb0ac35	526d8a87-adcb-464b-9825-0ad9c321cfcd	\N
9c71e187-1a1b-4e24-a896-090504c4acdb	526d8a87-adcb-464b-9825-0ad9c321cfcd	t	${role_view-realm}	view-realm	7b27a11d-121a-4360-960c-3ea6deb0ac35	526d8a87-adcb-464b-9825-0ad9c321cfcd	\N
3ea2c537-6f1f-486d-83b8-168b9f452cea	526d8a87-adcb-464b-9825-0ad9c321cfcd	t	${role_view-users}	view-users	7b27a11d-121a-4360-960c-3ea6deb0ac35	526d8a87-adcb-464b-9825-0ad9c321cfcd	\N
1efb4b4d-c8b9-49c1-804b-8b2e0dbaff2b	526d8a87-adcb-464b-9825-0ad9c321cfcd	t	${role_view-clients}	view-clients	7b27a11d-121a-4360-960c-3ea6deb0ac35	526d8a87-adcb-464b-9825-0ad9c321cfcd	\N
bdfc8ba6-9b30-4f1a-9e13-d6474077243f	526d8a87-adcb-464b-9825-0ad9c321cfcd	t	${role_view-events}	view-events	7b27a11d-121a-4360-960c-3ea6deb0ac35	526d8a87-adcb-464b-9825-0ad9c321cfcd	\N
0d05e70e-a7db-4dff-b790-96e167dc2df0	526d8a87-adcb-464b-9825-0ad9c321cfcd	t	${role_view-identity-providers}	view-identity-providers	7b27a11d-121a-4360-960c-3ea6deb0ac35	526d8a87-adcb-464b-9825-0ad9c321cfcd	\N
9f6ba0a8-d570-455d-825f-20d005479f4f	526d8a87-adcb-464b-9825-0ad9c321cfcd	t	${role_view-authorization}	view-authorization	7b27a11d-121a-4360-960c-3ea6deb0ac35	526d8a87-adcb-464b-9825-0ad9c321cfcd	\N
17459b0c-6b5b-452d-affb-0e580e193458	526d8a87-adcb-464b-9825-0ad9c321cfcd	t	${role_manage-realm}	manage-realm	7b27a11d-121a-4360-960c-3ea6deb0ac35	526d8a87-adcb-464b-9825-0ad9c321cfcd	\N
ce7fc10c-7a57-4f97-b319-bad9d1c080b5	526d8a87-adcb-464b-9825-0ad9c321cfcd	t	${role_manage-users}	manage-users	7b27a11d-121a-4360-960c-3ea6deb0ac35	526d8a87-adcb-464b-9825-0ad9c321cfcd	\N
70214213-6747-4e40-aa41-4a6d51bc10a3	526d8a87-adcb-464b-9825-0ad9c321cfcd	t	${role_manage-clients}	manage-clients	7b27a11d-121a-4360-960c-3ea6deb0ac35	526d8a87-adcb-464b-9825-0ad9c321cfcd	\N
5e7e1fc5-d840-4df5-a938-ef891d5d7aa4	526d8a87-adcb-464b-9825-0ad9c321cfcd	t	${role_manage-events}	manage-events	7b27a11d-121a-4360-960c-3ea6deb0ac35	526d8a87-adcb-464b-9825-0ad9c321cfcd	\N
a3c2a6f0-b77f-4fcc-bbda-80c68a223e86	526d8a87-adcb-464b-9825-0ad9c321cfcd	t	${role_manage-identity-providers}	manage-identity-providers	7b27a11d-121a-4360-960c-3ea6deb0ac35	526d8a87-adcb-464b-9825-0ad9c321cfcd	\N
bca37b76-d483-4471-8cd1-1d5823d1c647	526d8a87-adcb-464b-9825-0ad9c321cfcd	t	${role_manage-authorization}	manage-authorization	7b27a11d-121a-4360-960c-3ea6deb0ac35	526d8a87-adcb-464b-9825-0ad9c321cfcd	\N
5eaf1f4b-110b-4de4-897b-c1f93b052597	526d8a87-adcb-464b-9825-0ad9c321cfcd	t	${role_query-users}	query-users	7b27a11d-121a-4360-960c-3ea6deb0ac35	526d8a87-adcb-464b-9825-0ad9c321cfcd	\N
16230dc6-0d4c-46c0-895d-914b77f563c7	526d8a87-adcb-464b-9825-0ad9c321cfcd	t	${role_query-clients}	query-clients	7b27a11d-121a-4360-960c-3ea6deb0ac35	526d8a87-adcb-464b-9825-0ad9c321cfcd	\N
5aaca63d-9aeb-41c9-96ac-04c00f742c3c	526d8a87-adcb-464b-9825-0ad9c321cfcd	t	${role_query-realms}	query-realms	7b27a11d-121a-4360-960c-3ea6deb0ac35	526d8a87-adcb-464b-9825-0ad9c321cfcd	\N
05a76e40-581d-410f-82aa-3e2596b6247f	dd9bcc37-69c8-4b94-9737-50788f40287c	f	${role_default-roles}	default-roles-pdt	dd9bcc37-69c8-4b94-9737-50788f40287c	\N	\N
7e1ecf5b-4752-46d6-886a-98a2803b5a6c	413eabd5-1505-4190-902c-29bb9bc63de2	t	${role_create-client}	create-client	7b27a11d-121a-4360-960c-3ea6deb0ac35	413eabd5-1505-4190-902c-29bb9bc63de2	\N
a00b830e-9926-4d93-acaa-ffcc7141c3cf	413eabd5-1505-4190-902c-29bb9bc63de2	t	${role_view-realm}	view-realm	7b27a11d-121a-4360-960c-3ea6deb0ac35	413eabd5-1505-4190-902c-29bb9bc63de2	\N
7a187b80-360d-4098-b65f-9196b41f4471	413eabd5-1505-4190-902c-29bb9bc63de2	t	${role_view-users}	view-users	7b27a11d-121a-4360-960c-3ea6deb0ac35	413eabd5-1505-4190-902c-29bb9bc63de2	\N
066f8ee4-d038-4bd9-bbff-1341923fec5c	413eabd5-1505-4190-902c-29bb9bc63de2	t	${role_view-clients}	view-clients	7b27a11d-121a-4360-960c-3ea6deb0ac35	413eabd5-1505-4190-902c-29bb9bc63de2	\N
f0734538-2a07-4579-ab89-1f5624d595b7	413eabd5-1505-4190-902c-29bb9bc63de2	t	${role_view-events}	view-events	7b27a11d-121a-4360-960c-3ea6deb0ac35	413eabd5-1505-4190-902c-29bb9bc63de2	\N
7f1f202d-848f-45fc-92e2-371e97eafeec	413eabd5-1505-4190-902c-29bb9bc63de2	t	${role_view-identity-providers}	view-identity-providers	7b27a11d-121a-4360-960c-3ea6deb0ac35	413eabd5-1505-4190-902c-29bb9bc63de2	\N
23910550-c2af-4ddf-8553-32f5944758af	413eabd5-1505-4190-902c-29bb9bc63de2	t	${role_view-authorization}	view-authorization	7b27a11d-121a-4360-960c-3ea6deb0ac35	413eabd5-1505-4190-902c-29bb9bc63de2	\N
371aff16-fd2d-4c32-b43d-5c66c879f5e6	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	f	${role_default-roles}	default-roles-pkt	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	\N	\N
5de22eb4-b9f4-4c58-b67a-abc080ff95e7	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	t	${role_create-client}	create-client	7b27a11d-121a-4360-960c-3ea6deb0ac35	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	\N
87192a27-23d4-4ebe-a3d2-26af747a6950	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	t	${role_view-realm}	view-realm	7b27a11d-121a-4360-960c-3ea6deb0ac35	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	\N
62cdc368-cc98-4a70-8450-a1e78254ca92	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	t	${role_view-users}	view-users	7b27a11d-121a-4360-960c-3ea6deb0ac35	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	\N
33c2018c-45f5-40b2-a110-530e248957b3	7b27a11d-121a-4360-960c-3ea6deb0ac35	f	${role_admin}	admin	7b27a11d-121a-4360-960c-3ea6deb0ac35	\N	\N
6cefe484-cb9f-44f2-9d71-e3c6f53d23be	60d763c7-10e3-4490-8529-e1c97d983ade	f	${role_default-roles}	default-roles-pkt2	60d763c7-10e3-4490-8529-e1c97d983ade	\N	\N
18a13f9d-6f4b-4169-a8cb-b8c0791d76fd	c9d7ba83-2724-418b-8b2d-ea3a602c723c	t	${role_create-client}	create-client	7b27a11d-121a-4360-960c-3ea6deb0ac35	c9d7ba83-2724-418b-8b2d-ea3a602c723c	\N
18b8fc16-5cef-4b54-8f27-6c49e7f18241	526d8a87-adcb-464b-9825-0ad9c321cfcd	t	${role_query-groups}	query-groups	7b27a11d-121a-4360-960c-3ea6deb0ac35	526d8a87-adcb-464b-9825-0ad9c321cfcd	\N
89b23ffe-df23-4583-ba98-a1e7def44ae2	a5c0cd4f-9960-4295-be98-18892e399260	t	${role_view-profile}	view-profile	7b27a11d-121a-4360-960c-3ea6deb0ac35	a5c0cd4f-9960-4295-be98-18892e399260	\N
198a6c51-db3a-48f9-8e04-898e9b50c392	a5c0cd4f-9960-4295-be98-18892e399260	t	${role_manage-account}	manage-account	7b27a11d-121a-4360-960c-3ea6deb0ac35	a5c0cd4f-9960-4295-be98-18892e399260	\N
a2291ef4-9f5f-4b54-83c6-da3308345235	a5c0cd4f-9960-4295-be98-18892e399260	t	${role_manage-account-links}	manage-account-links	7b27a11d-121a-4360-960c-3ea6deb0ac35	a5c0cd4f-9960-4295-be98-18892e399260	\N
2fd1dadc-ff02-4497-84ad-d7c3601773d4	a5c0cd4f-9960-4295-be98-18892e399260	t	${role_view-applications}	view-applications	7b27a11d-121a-4360-960c-3ea6deb0ac35	a5c0cd4f-9960-4295-be98-18892e399260	\N
23dee463-d21f-415e-90ce-9cb6fead4157	a5c0cd4f-9960-4295-be98-18892e399260	t	${role_view-consent}	view-consent	7b27a11d-121a-4360-960c-3ea6deb0ac35	a5c0cd4f-9960-4295-be98-18892e399260	\N
3710b0f8-671b-43fa-bb1b-10d637f20426	a5c0cd4f-9960-4295-be98-18892e399260	t	${role_manage-consent}	manage-consent	7b27a11d-121a-4360-960c-3ea6deb0ac35	a5c0cd4f-9960-4295-be98-18892e399260	\N
86632318-809f-4392-b0a7-608347dca4d5	a5c0cd4f-9960-4295-be98-18892e399260	t	${role_view-groups}	view-groups	7b27a11d-121a-4360-960c-3ea6deb0ac35	a5c0cd4f-9960-4295-be98-18892e399260	\N
834590d7-48e2-4d94-b068-6282d3556546	a5c0cd4f-9960-4295-be98-18892e399260	t	${role_delete-account}	delete-account	7b27a11d-121a-4360-960c-3ea6deb0ac35	a5c0cd4f-9960-4295-be98-18892e399260	\N
d5b840cd-a9b9-4e86-a18e-237b5792f74f	cad6ab25-5328-4e82-baa9-50a954478705	t	${role_read-token}	read-token	7b27a11d-121a-4360-960c-3ea6deb0ac35	cad6ab25-5328-4e82-baa9-50a954478705	\N
c289cf1b-cc1f-42ed-b910-5095264f2a4d	526d8a87-adcb-464b-9825-0ad9c321cfcd	t	${role_impersonation}	impersonation	7b27a11d-121a-4360-960c-3ea6deb0ac35	526d8a87-adcb-464b-9825-0ad9c321cfcd	\N
88bbd399-61ca-4793-8f16-510b85549f03	7b27a11d-121a-4360-960c-3ea6deb0ac35	f	${role_offline-access}	offline_access	7b27a11d-121a-4360-960c-3ea6deb0ac35	\N	\N
1024bb37-bfc7-4d95-8ec9-7d25dd4fdae0	7b27a11d-121a-4360-960c-3ea6deb0ac35	f	${role_uma_authorization}	uma_authorization	7b27a11d-121a-4360-960c-3ea6deb0ac35	\N	\N
ac66a7f0-4852-4954-91c0-1cfbd4b998ce	aef5c390-9834-4cad-83be-4efe22893758	f	${role_default-roles}	default-roles-hcmut	aef5c390-9834-4cad-83be-4efe22893758	\N	\N
d906b022-99b6-4be1-9354-233cdd4b9505	cc7cc122-1036-41cc-9b96-6787f169a971	t	${role_create-client}	create-client	7b27a11d-121a-4360-960c-3ea6deb0ac35	cc7cc122-1036-41cc-9b96-6787f169a971	\N
f6163a5b-9afd-4f65-b621-4ac9c81abb97	cc7cc122-1036-41cc-9b96-6787f169a971	t	${role_view-realm}	view-realm	7b27a11d-121a-4360-960c-3ea6deb0ac35	cc7cc122-1036-41cc-9b96-6787f169a971	\N
7c60fea7-af22-4d4e-b6f4-23749238857b	cc7cc122-1036-41cc-9b96-6787f169a971	t	${role_view-users}	view-users	7b27a11d-121a-4360-960c-3ea6deb0ac35	cc7cc122-1036-41cc-9b96-6787f169a971	\N
4034b444-933c-4a38-aa29-55408a32e0ae	cc7cc122-1036-41cc-9b96-6787f169a971	t	${role_view-clients}	view-clients	7b27a11d-121a-4360-960c-3ea6deb0ac35	cc7cc122-1036-41cc-9b96-6787f169a971	\N
e5a59136-3be0-4505-8fdd-fe722b5720ca	cc7cc122-1036-41cc-9b96-6787f169a971	t	${role_view-events}	view-events	7b27a11d-121a-4360-960c-3ea6deb0ac35	cc7cc122-1036-41cc-9b96-6787f169a971	\N
b4308ea3-ee17-4909-b248-753a94eca917	cc7cc122-1036-41cc-9b96-6787f169a971	t	${role_view-identity-providers}	view-identity-providers	7b27a11d-121a-4360-960c-3ea6deb0ac35	cc7cc122-1036-41cc-9b96-6787f169a971	\N
a595394f-64da-4da9-9169-c9ccba0cba8a	cc7cc122-1036-41cc-9b96-6787f169a971	t	${role_view-authorization}	view-authorization	7b27a11d-121a-4360-960c-3ea6deb0ac35	cc7cc122-1036-41cc-9b96-6787f169a971	\N
c4da7ee1-e887-433b-8e58-f645c366c5bd	cc7cc122-1036-41cc-9b96-6787f169a971	t	${role_manage-realm}	manage-realm	7b27a11d-121a-4360-960c-3ea6deb0ac35	cc7cc122-1036-41cc-9b96-6787f169a971	\N
8023abc7-cc5e-47c2-b194-50e0d859df3a	cc7cc122-1036-41cc-9b96-6787f169a971	t	${role_manage-users}	manage-users	7b27a11d-121a-4360-960c-3ea6deb0ac35	cc7cc122-1036-41cc-9b96-6787f169a971	\N
a891dce1-f248-4a2d-ba69-eab87cfdf0b2	cc7cc122-1036-41cc-9b96-6787f169a971	t	${role_manage-clients}	manage-clients	7b27a11d-121a-4360-960c-3ea6deb0ac35	cc7cc122-1036-41cc-9b96-6787f169a971	\N
9ad219f1-9108-4daf-8bc1-0e4c4185bce4	cc7cc122-1036-41cc-9b96-6787f169a971	t	${role_manage-events}	manage-events	7b27a11d-121a-4360-960c-3ea6deb0ac35	cc7cc122-1036-41cc-9b96-6787f169a971	\N
00bac9a3-c98d-44e9-89c0-31c18496ada1	413eabd5-1505-4190-902c-29bb9bc63de2	t	${role_manage-realm}	manage-realm	7b27a11d-121a-4360-960c-3ea6deb0ac35	413eabd5-1505-4190-902c-29bb9bc63de2	\N
af609d01-125e-4ba0-aa18-6f72e3155a95	413eabd5-1505-4190-902c-29bb9bc63de2	t	${role_manage-users}	manage-users	7b27a11d-121a-4360-960c-3ea6deb0ac35	413eabd5-1505-4190-902c-29bb9bc63de2	\N
de150fac-2d9c-4f64-b79d-f78585879c22	413eabd5-1505-4190-902c-29bb9bc63de2	t	${role_manage-clients}	manage-clients	7b27a11d-121a-4360-960c-3ea6deb0ac35	413eabd5-1505-4190-902c-29bb9bc63de2	\N
18f0ded3-4ba7-43b4-9811-737f74d4c9b3	413eabd5-1505-4190-902c-29bb9bc63de2	t	${role_manage-events}	manage-events	7b27a11d-121a-4360-960c-3ea6deb0ac35	413eabd5-1505-4190-902c-29bb9bc63de2	\N
94ab3797-17dc-45e0-aae8-93daec6153ea	413eabd5-1505-4190-902c-29bb9bc63de2	t	${role_manage-identity-providers}	manage-identity-providers	7b27a11d-121a-4360-960c-3ea6deb0ac35	413eabd5-1505-4190-902c-29bb9bc63de2	\N
fe89ce5f-9d36-43bf-aaac-4e011cf03a56	413eabd5-1505-4190-902c-29bb9bc63de2	t	${role_manage-authorization}	manage-authorization	7b27a11d-121a-4360-960c-3ea6deb0ac35	413eabd5-1505-4190-902c-29bb9bc63de2	\N
8a06219f-0c52-4b12-9f67-27d022ba745d	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	t	${role_view-clients}	view-clients	7b27a11d-121a-4360-960c-3ea6deb0ac35	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	\N
eac101bc-97f8-4420-aabe-3bd1e5be1253	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	t	${role_view-events}	view-events	7b27a11d-121a-4360-960c-3ea6deb0ac35	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	\N
faeb47f6-9d0f-4ae8-909d-065094d2b785	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	t	${role_view-identity-providers}	view-identity-providers	7b27a11d-121a-4360-960c-3ea6deb0ac35	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	\N
32083aff-148a-45ad-982b-f1d5af5b6768	c9d7ba83-2724-418b-8b2d-ea3a602c723c	t	${role_view-realm}	view-realm	7b27a11d-121a-4360-960c-3ea6deb0ac35	c9d7ba83-2724-418b-8b2d-ea3a602c723c	\N
3a8e3f51-734c-4df4-9451-e5459c99aba8	cc7cc122-1036-41cc-9b96-6787f169a971	t	${role_manage-identity-providers}	manage-identity-providers	7b27a11d-121a-4360-960c-3ea6deb0ac35	cc7cc122-1036-41cc-9b96-6787f169a971	\N
767aa1f2-2a35-4a02-8a39-1e7ff137e0c8	cc7cc122-1036-41cc-9b96-6787f169a971	t	${role_manage-authorization}	manage-authorization	7b27a11d-121a-4360-960c-3ea6deb0ac35	cc7cc122-1036-41cc-9b96-6787f169a971	\N
558e4cf2-3d1b-4f07-9829-8034ee23e7ef	cc7cc122-1036-41cc-9b96-6787f169a971	t	${role_query-users}	query-users	7b27a11d-121a-4360-960c-3ea6deb0ac35	cc7cc122-1036-41cc-9b96-6787f169a971	\N
8152d047-23ef-4969-8aa6-5d7f3e119f7f	cc7cc122-1036-41cc-9b96-6787f169a971	t	${role_query-clients}	query-clients	7b27a11d-121a-4360-960c-3ea6deb0ac35	cc7cc122-1036-41cc-9b96-6787f169a971	\N
0f1cf823-dc36-4bf3-b3b8-d5ac587dea6b	cc7cc122-1036-41cc-9b96-6787f169a971	t	${role_query-realms}	query-realms	7b27a11d-121a-4360-960c-3ea6deb0ac35	cc7cc122-1036-41cc-9b96-6787f169a971	\N
7ad23bc5-e709-47f1-bf42-db9959f0cc1e	cc7cc122-1036-41cc-9b96-6787f169a971	t	${role_query-groups}	query-groups	7b27a11d-121a-4360-960c-3ea6deb0ac35	cc7cc122-1036-41cc-9b96-6787f169a971	\N
a1df3e91-7146-4b67-a8d2-34228da2c413	3c1f54e6-677d-4390-833e-c6fddac239b0	t	${role_realm-admin}	realm-admin	aef5c390-9834-4cad-83be-4efe22893758	3c1f54e6-677d-4390-833e-c6fddac239b0	\N
68af0a9c-c9ce-4979-8534-6517ad123d39	3c1f54e6-677d-4390-833e-c6fddac239b0	t	${role_create-client}	create-client	aef5c390-9834-4cad-83be-4efe22893758	3c1f54e6-677d-4390-833e-c6fddac239b0	\N
b8fd220b-bb82-4e89-a2d0-ba6904b556f4	3c1f54e6-677d-4390-833e-c6fddac239b0	t	${role_view-realm}	view-realm	aef5c390-9834-4cad-83be-4efe22893758	3c1f54e6-677d-4390-833e-c6fddac239b0	\N
4184d2a9-0585-4116-9cbd-867053917ea4	3c1f54e6-677d-4390-833e-c6fddac239b0	t	${role_view-users}	view-users	aef5c390-9834-4cad-83be-4efe22893758	3c1f54e6-677d-4390-833e-c6fddac239b0	\N
37713e42-e38f-42c1-a863-9a905e06a024	3c1f54e6-677d-4390-833e-c6fddac239b0	t	${role_view-clients}	view-clients	aef5c390-9834-4cad-83be-4efe22893758	3c1f54e6-677d-4390-833e-c6fddac239b0	\N
019a5596-dbec-4489-8c38-b5d2173163a6	3c1f54e6-677d-4390-833e-c6fddac239b0	t	${role_view-events}	view-events	aef5c390-9834-4cad-83be-4efe22893758	3c1f54e6-677d-4390-833e-c6fddac239b0	\N
7f984901-2eac-48ad-b062-e670eebeba7d	3c1f54e6-677d-4390-833e-c6fddac239b0	t	${role_view-identity-providers}	view-identity-providers	aef5c390-9834-4cad-83be-4efe22893758	3c1f54e6-677d-4390-833e-c6fddac239b0	\N
513dd410-ab09-493c-b363-1baa5eac6fcb	3c1f54e6-677d-4390-833e-c6fddac239b0	t	${role_view-authorization}	view-authorization	aef5c390-9834-4cad-83be-4efe22893758	3c1f54e6-677d-4390-833e-c6fddac239b0	\N
aafe9c46-4d23-4c40-bfe9-7a15c81748e4	3c1f54e6-677d-4390-833e-c6fddac239b0	t	${role_manage-realm}	manage-realm	aef5c390-9834-4cad-83be-4efe22893758	3c1f54e6-677d-4390-833e-c6fddac239b0	\N
698d07ee-4c63-4cb7-a4e0-09e87a03fca3	3c1f54e6-677d-4390-833e-c6fddac239b0	t	${role_manage-users}	manage-users	aef5c390-9834-4cad-83be-4efe22893758	3c1f54e6-677d-4390-833e-c6fddac239b0	\N
553d5ca4-024a-4b28-bd5e-2a2a45b9b001	3c1f54e6-677d-4390-833e-c6fddac239b0	t	${role_manage-clients}	manage-clients	aef5c390-9834-4cad-83be-4efe22893758	3c1f54e6-677d-4390-833e-c6fddac239b0	\N
2117de04-3e64-45f8-aec7-3921166946c5	3c1f54e6-677d-4390-833e-c6fddac239b0	t	${role_manage-events}	manage-events	aef5c390-9834-4cad-83be-4efe22893758	3c1f54e6-677d-4390-833e-c6fddac239b0	\N
4268a7b4-39fa-422c-9e6e-d645b7aa905e	413eabd5-1505-4190-902c-29bb9bc63de2	t	${role_query-users}	query-users	7b27a11d-121a-4360-960c-3ea6deb0ac35	413eabd5-1505-4190-902c-29bb9bc63de2	\N
815bd30c-b033-49fb-b4da-7b1318590402	413eabd5-1505-4190-902c-29bb9bc63de2	t	${role_query-clients}	query-clients	7b27a11d-121a-4360-960c-3ea6deb0ac35	413eabd5-1505-4190-902c-29bb9bc63de2	\N
5a1adf07-04fb-4cea-bb6e-8346923127bb	413eabd5-1505-4190-902c-29bb9bc63de2	t	${role_query-realms}	query-realms	7b27a11d-121a-4360-960c-3ea6deb0ac35	413eabd5-1505-4190-902c-29bb9bc63de2	\N
b41a65e1-986d-4aba-80bb-2e098d051c2e	413eabd5-1505-4190-902c-29bb9bc63de2	t	${role_query-groups}	query-groups	7b27a11d-121a-4360-960c-3ea6deb0ac35	413eabd5-1505-4190-902c-29bb9bc63de2	\N
a39e131d-4967-4eb9-a123-4dbc0c15fa1b	269d9728-9023-4b46-8512-4820bf9d4331	t	${role_realm-admin}	realm-admin	dd9bcc37-69c8-4b94-9737-50788f40287c	269d9728-9023-4b46-8512-4820bf9d4331	\N
3b45968a-434d-49bb-b56a-915a16f6b54e	269d9728-9023-4b46-8512-4820bf9d4331	t	${role_create-client}	create-client	dd9bcc37-69c8-4b94-9737-50788f40287c	269d9728-9023-4b46-8512-4820bf9d4331	\N
8c7b831b-6c9a-40e3-8503-df6c17dcc62f	269d9728-9023-4b46-8512-4820bf9d4331	t	${role_view-realm}	view-realm	dd9bcc37-69c8-4b94-9737-50788f40287c	269d9728-9023-4b46-8512-4820bf9d4331	\N
537bbcc7-3a81-4308-a137-b271738fd0c5	269d9728-9023-4b46-8512-4820bf9d4331	t	${role_view-users}	view-users	dd9bcc37-69c8-4b94-9737-50788f40287c	269d9728-9023-4b46-8512-4820bf9d4331	\N
2072529b-697e-44b3-8e6c-46c49fdd3661	269d9728-9023-4b46-8512-4820bf9d4331	t	${role_view-clients}	view-clients	dd9bcc37-69c8-4b94-9737-50788f40287c	269d9728-9023-4b46-8512-4820bf9d4331	\N
51dd2216-d4a3-41e2-8aa4-8fd3e5abc072	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	t	${role_view-authorization}	view-authorization	7b27a11d-121a-4360-960c-3ea6deb0ac35	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	\N
9bcb6c87-032f-460a-bdfc-1d6cab36f709	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	t	${role_manage-realm}	manage-realm	7b27a11d-121a-4360-960c-3ea6deb0ac35	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	\N
afeb6572-efc2-464a-ac1e-dc5017b618fc	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	t	${role_manage-users}	manage-users	7b27a11d-121a-4360-960c-3ea6deb0ac35	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	\N
39e2e82d-78ed-4082-9a10-36e2d5db28a6	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	t	${role_manage-clients}	manage-clients	7b27a11d-121a-4360-960c-3ea6deb0ac35	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	\N
5bce9b38-abeb-4103-a47c-a546e28af4be	c9d7ba83-2724-418b-8b2d-ea3a602c723c	t	${role_view-users}	view-users	7b27a11d-121a-4360-960c-3ea6deb0ac35	c9d7ba83-2724-418b-8b2d-ea3a602c723c	\N
aab8e412-b1f5-4b0f-84d6-13a13b34aa26	c9d7ba83-2724-418b-8b2d-ea3a602c723c	t	${role_view-clients}	view-clients	7b27a11d-121a-4360-960c-3ea6deb0ac35	c9d7ba83-2724-418b-8b2d-ea3a602c723c	\N
37cb8f80-2a01-40fb-abbd-b3eb0e346440	3c1f54e6-677d-4390-833e-c6fddac239b0	t	${role_manage-identity-providers}	manage-identity-providers	aef5c390-9834-4cad-83be-4efe22893758	3c1f54e6-677d-4390-833e-c6fddac239b0	\N
1c11aacd-2ca3-407c-b450-f1ec7a133aee	3c1f54e6-677d-4390-833e-c6fddac239b0	t	${role_manage-authorization}	manage-authorization	aef5c390-9834-4cad-83be-4efe22893758	3c1f54e6-677d-4390-833e-c6fddac239b0	\N
b9851010-e731-4d2a-8718-ac74af9890e8	3c1f54e6-677d-4390-833e-c6fddac239b0	t	${role_query-users}	query-users	aef5c390-9834-4cad-83be-4efe22893758	3c1f54e6-677d-4390-833e-c6fddac239b0	\N
45654ae9-960e-4643-8307-0c8302e4901d	3c1f54e6-677d-4390-833e-c6fddac239b0	t	${role_query-clients}	query-clients	aef5c390-9834-4cad-83be-4efe22893758	3c1f54e6-677d-4390-833e-c6fddac239b0	\N
2fc0fc9e-e9b2-46bc-a634-5a12229eb3b5	3c1f54e6-677d-4390-833e-c6fddac239b0	t	${role_query-realms}	query-realms	aef5c390-9834-4cad-83be-4efe22893758	3c1f54e6-677d-4390-833e-c6fddac239b0	\N
ae8b3429-9094-4852-9385-d4f0362ab031	3c1f54e6-677d-4390-833e-c6fddac239b0	t	${role_query-groups}	query-groups	aef5c390-9834-4cad-83be-4efe22893758	3c1f54e6-677d-4390-833e-c6fddac239b0	\N
d66862e0-7345-424a-a580-a33474730071	928149f2-e5f0-433f-8627-3b365ba78f43	t	${role_view-profile}	view-profile	aef5c390-9834-4cad-83be-4efe22893758	928149f2-e5f0-433f-8627-3b365ba78f43	\N
afd67c44-349f-4abc-bc91-3f7ac5f736cf	928149f2-e5f0-433f-8627-3b365ba78f43	t	${role_manage-account}	manage-account	aef5c390-9834-4cad-83be-4efe22893758	928149f2-e5f0-433f-8627-3b365ba78f43	\N
196f5b64-bdde-4dc8-8809-a3ec07e9f0a8	928149f2-e5f0-433f-8627-3b365ba78f43	t	${role_manage-account-links}	manage-account-links	aef5c390-9834-4cad-83be-4efe22893758	928149f2-e5f0-433f-8627-3b365ba78f43	\N
f338dde8-7b33-419c-b061-74e4631ca104	928149f2-e5f0-433f-8627-3b365ba78f43	t	${role_view-applications}	view-applications	aef5c390-9834-4cad-83be-4efe22893758	928149f2-e5f0-433f-8627-3b365ba78f43	\N
f2770a4c-ada4-426a-8b9e-607f117dbc2f	928149f2-e5f0-433f-8627-3b365ba78f43	t	${role_view-consent}	view-consent	aef5c390-9834-4cad-83be-4efe22893758	928149f2-e5f0-433f-8627-3b365ba78f43	\N
5ffe55e3-4c11-49bc-ae9f-abc57ca03246	928149f2-e5f0-433f-8627-3b365ba78f43	t	${role_manage-consent}	manage-consent	aef5c390-9834-4cad-83be-4efe22893758	928149f2-e5f0-433f-8627-3b365ba78f43	\N
6c5334fd-75ea-4e27-944a-0c672ad49c45	928149f2-e5f0-433f-8627-3b365ba78f43	t	${role_view-groups}	view-groups	aef5c390-9834-4cad-83be-4efe22893758	928149f2-e5f0-433f-8627-3b365ba78f43	\N
8f70f0f4-b928-48c3-8db1-db7f34f5380f	928149f2-e5f0-433f-8627-3b365ba78f43	t	${role_delete-account}	delete-account	aef5c390-9834-4cad-83be-4efe22893758	928149f2-e5f0-433f-8627-3b365ba78f43	\N
09063bff-0218-4423-b788-7b4cd6904bd7	cc7cc122-1036-41cc-9b96-6787f169a971	t	${role_impersonation}	impersonation	7b27a11d-121a-4360-960c-3ea6deb0ac35	cc7cc122-1036-41cc-9b96-6787f169a971	\N
1f5396a4-ac4e-44fb-98e9-f9b8f3c2f212	3c1f54e6-677d-4390-833e-c6fddac239b0	t	${role_impersonation}	impersonation	aef5c390-9834-4cad-83be-4efe22893758	3c1f54e6-677d-4390-833e-c6fddac239b0	\N
6c66f372-ce18-4cbd-83d2-5db9c0b6a510	5063e93f-ce2b-48db-a18c-84fecf2e76b5	t	${role_read-token}	read-token	aef5c390-9834-4cad-83be-4efe22893758	5063e93f-ce2b-48db-a18c-84fecf2e76b5	\N
895aa141-91e5-4e76-b743-ae223b55b302	aef5c390-9834-4cad-83be-4efe22893758	f	${role_offline-access}	offline_access	aef5c390-9834-4cad-83be-4efe22893758	\N	\N
4603cefd-ab55-41d1-b2fc-a9f273ae24a3	aef5c390-9834-4cad-83be-4efe22893758	f	${role_uma_authorization}	uma_authorization	aef5c390-9834-4cad-83be-4efe22893758	\N	\N
ced8dca4-72f0-4e77-ad98-1ae94b79e2c8	aef5c390-9834-4cad-83be-4efe22893758	f		unit_normal	aef5c390-9834-4cad-83be-4efe22893758	\N	\N
e8226ad1-1c32-4114-8bcb-0981fad71456	aef5c390-9834-4cad-83be-4efe22893758	f		unit_admin	aef5c390-9834-4cad-83be-4efe22893758	\N	\N
b738dad2-673f-4dc7-be69-48d4205fcf61	aef5c390-9834-4cad-83be-4efe22893758	f		admin	aef5c390-9834-4cad-83be-4efe22893758	\N	\N
f783d762-a141-4e81-aa23-b89eede2821e	269d9728-9023-4b46-8512-4820bf9d4331	t	${role_view-events}	view-events	dd9bcc37-69c8-4b94-9737-50788f40287c	269d9728-9023-4b46-8512-4820bf9d4331	\N
1a36586e-20f4-4719-9bc5-657133880d8d	269d9728-9023-4b46-8512-4820bf9d4331	t	${role_view-identity-providers}	view-identity-providers	dd9bcc37-69c8-4b94-9737-50788f40287c	269d9728-9023-4b46-8512-4820bf9d4331	\N
adf948ee-6364-4bd9-a81a-36477adc69b4	269d9728-9023-4b46-8512-4820bf9d4331	t	${role_view-authorization}	view-authorization	dd9bcc37-69c8-4b94-9737-50788f40287c	269d9728-9023-4b46-8512-4820bf9d4331	\N
edc871ee-91e8-4dbf-a8a7-3e84fa38306b	269d9728-9023-4b46-8512-4820bf9d4331	t	${role_manage-realm}	manage-realm	dd9bcc37-69c8-4b94-9737-50788f40287c	269d9728-9023-4b46-8512-4820bf9d4331	\N
eebf7ed8-65c2-4f8a-953a-87fca99a3402	269d9728-9023-4b46-8512-4820bf9d4331	t	${role_manage-users}	manage-users	dd9bcc37-69c8-4b94-9737-50788f40287c	269d9728-9023-4b46-8512-4820bf9d4331	\N
46a652d4-cf47-41ef-81cd-bfd0cf81587a	269d9728-9023-4b46-8512-4820bf9d4331	t	${role_manage-clients}	manage-clients	dd9bcc37-69c8-4b94-9737-50788f40287c	269d9728-9023-4b46-8512-4820bf9d4331	\N
32764a9c-1d50-4117-9241-034fc8d349cc	269d9728-9023-4b46-8512-4820bf9d4331	t	${role_manage-events}	manage-events	dd9bcc37-69c8-4b94-9737-50788f40287c	269d9728-9023-4b46-8512-4820bf9d4331	\N
35436b22-5d4b-4bdf-b3fd-cc4fd6aac0d0	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	t	${role_manage-events}	manage-events	7b27a11d-121a-4360-960c-3ea6deb0ac35	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	\N
d3f4c47b-5166-4741-9f56-aca93f622b04	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	t	${role_manage-identity-providers}	manage-identity-providers	7b27a11d-121a-4360-960c-3ea6deb0ac35	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	\N
9d17d1b2-aed5-4bad-a245-81fdef6608a1	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	t	${role_manage-authorization}	manage-authorization	7b27a11d-121a-4360-960c-3ea6deb0ac35	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	\N
899186ca-e455-4458-92d6-a31a4600a5cb	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	t	${role_query-users}	query-users	7b27a11d-121a-4360-960c-3ea6deb0ac35	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	\N
6808a954-311b-427f-a43b-66413edb55de	c9d7ba83-2724-418b-8b2d-ea3a602c723c	t	${role_view-events}	view-events	7b27a11d-121a-4360-960c-3ea6deb0ac35	c9d7ba83-2724-418b-8b2d-ea3a602c723c	\N
a5d4b119-9eda-4b7e-8eba-9145e32cb814	c9d7ba83-2724-418b-8b2d-ea3a602c723c	t	${role_view-identity-providers}	view-identity-providers	7b27a11d-121a-4360-960c-3ea6deb0ac35	c9d7ba83-2724-418b-8b2d-ea3a602c723c	\N
edf7b943-8f1d-48a1-87a0-b1c9d779e814	269d9728-9023-4b46-8512-4820bf9d4331	t	${role_manage-identity-providers}	manage-identity-providers	dd9bcc37-69c8-4b94-9737-50788f40287c	269d9728-9023-4b46-8512-4820bf9d4331	\N
fb85a95f-e5b4-4c24-b476-b498f72dac28	269d9728-9023-4b46-8512-4820bf9d4331	t	${role_manage-authorization}	manage-authorization	dd9bcc37-69c8-4b94-9737-50788f40287c	269d9728-9023-4b46-8512-4820bf9d4331	\N
3a510bc8-a3fa-4f30-8486-55db08e7f293	ce857b6b-099f-4727-a8e4-51203afebea3	t	${role_manage-account-links}	manage-account-links	dd9bcc37-69c8-4b94-9737-50788f40287c	ce857b6b-099f-4727-a8e4-51203afebea3	\N
3249fe48-8f99-4c42-b658-1daae0148153	269d9728-9023-4b46-8512-4820bf9d4331	t	${role_query-users}	query-users	dd9bcc37-69c8-4b94-9737-50788f40287c	269d9728-9023-4b46-8512-4820bf9d4331	\N
78f084a4-275b-4c0c-afe5-9b8e5f870608	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	t	${role_query-clients}	query-clients	7b27a11d-121a-4360-960c-3ea6deb0ac35	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	\N
172df765-17b5-4e97-8af0-00dd7e7b5f66	269d9728-9023-4b46-8512-4820bf9d4331	t	${role_query-clients}	query-clients	dd9bcc37-69c8-4b94-9737-50788f40287c	269d9728-9023-4b46-8512-4820bf9d4331	\N
9152a0d8-c308-41e5-8763-2d45dfc05d72	ce857b6b-099f-4727-a8e4-51203afebea3	t	${role_view-applications}	view-applications	dd9bcc37-69c8-4b94-9737-50788f40287c	ce857b6b-099f-4727-a8e4-51203afebea3	\N
0e67e38a-b1ce-409b-87a6-c7e310a46dbc	269d9728-9023-4b46-8512-4820bf9d4331	t	${role_query-realms}	query-realms	dd9bcc37-69c8-4b94-9737-50788f40287c	269d9728-9023-4b46-8512-4820bf9d4331	\N
27aceaeb-ea2a-4515-b8cf-408ad73a31be	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	t	${role_query-realms}	query-realms	7b27a11d-121a-4360-960c-3ea6deb0ac35	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	\N
87326405-397a-4ace-84cf-29b06c249f0b	269d9728-9023-4b46-8512-4820bf9d4331	t	${role_query-groups}	query-groups	dd9bcc37-69c8-4b94-9737-50788f40287c	269d9728-9023-4b46-8512-4820bf9d4331	\N
001a6d1f-cd90-4002-9fce-79b6e2425099	ce857b6b-099f-4727-a8e4-51203afebea3	t	${role_view-consent}	view-consent	dd9bcc37-69c8-4b94-9737-50788f40287c	ce857b6b-099f-4727-a8e4-51203afebea3	\N
f9a607e8-ce89-4c3e-903d-30633b7553b6	ce857b6b-099f-4727-a8e4-51203afebea3	t	${role_view-profile}	view-profile	dd9bcc37-69c8-4b94-9737-50788f40287c	ce857b6b-099f-4727-a8e4-51203afebea3	\N
baacdcc4-db27-4994-8bf4-e9b5adb1c76e	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	t	${role_query-groups}	query-groups	7b27a11d-121a-4360-960c-3ea6deb0ac35	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	\N
e6602492-d78e-43cd-8c93-de3b68a4f7e5	ce857b6b-099f-4727-a8e4-51203afebea3	t	${role_manage-account}	manage-account	dd9bcc37-69c8-4b94-9737-50788f40287c	ce857b6b-099f-4727-a8e4-51203afebea3	\N
d8da3f3a-2a47-4094-a1fc-e0c779859267	ce857b6b-099f-4727-a8e4-51203afebea3	t	${role_manage-consent}	manage-consent	dd9bcc37-69c8-4b94-9737-50788f40287c	ce857b6b-099f-4727-a8e4-51203afebea3	\N
8beb7a92-5aa8-4efe-a756-bacb1c70e9fc	ce857b6b-099f-4727-a8e4-51203afebea3	t	${role_view-groups}	view-groups	dd9bcc37-69c8-4b94-9737-50788f40287c	ce857b6b-099f-4727-a8e4-51203afebea3	\N
2dff6093-3bef-424c-b29e-ae7e048f8c91	548af2e3-5c3a-4f3b-8549-3b72fa039d22	t	${role_realm-admin}	realm-admin	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	548af2e3-5c3a-4f3b-8549-3b72fa039d22	\N
c85583d1-b143-40b4-a877-d92d421df670	ce857b6b-099f-4727-a8e4-51203afebea3	t	${role_delete-account}	delete-account	dd9bcc37-69c8-4b94-9737-50788f40287c	ce857b6b-099f-4727-a8e4-51203afebea3	\N
7dc2b691-b8c0-47ab-ac42-0cb969305cc2	413eabd5-1505-4190-902c-29bb9bc63de2	t	${role_impersonation}	impersonation	7b27a11d-121a-4360-960c-3ea6deb0ac35	413eabd5-1505-4190-902c-29bb9bc63de2	\N
d3066b7d-8b8f-465e-93ab-285bad072e3b	548af2e3-5c3a-4f3b-8549-3b72fa039d22	t	${role_create-client}	create-client	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	548af2e3-5c3a-4f3b-8549-3b72fa039d22	\N
6243ccbb-5fe1-4bdb-9a27-fe162d442819	269d9728-9023-4b46-8512-4820bf9d4331	t	${role_impersonation}	impersonation	dd9bcc37-69c8-4b94-9737-50788f40287c	269d9728-9023-4b46-8512-4820bf9d4331	\N
f2e051f4-bb75-4fc4-b54a-2f2ad97eb255	548af2e3-5c3a-4f3b-8549-3b72fa039d22	t	${role_view-realm}	view-realm	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	548af2e3-5c3a-4f3b-8549-3b72fa039d22	\N
5eea857f-7bd2-4378-ab58-c9efa0e4855f	203a5e14-bbbd-40f9-b641-f1ea67c467d9	t	${role_read-token}	read-token	dd9bcc37-69c8-4b94-9737-50788f40287c	203a5e14-bbbd-40f9-b641-f1ea67c467d9	\N
675268db-75ce-4a67-bed9-1da409972038	548af2e3-5c3a-4f3b-8549-3b72fa039d22	t	${role_view-users}	view-users	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	548af2e3-5c3a-4f3b-8549-3b72fa039d22	\N
7829b6ca-e83a-4612-b385-1c355b58c9c9	dd9bcc37-69c8-4b94-9737-50788f40287c	f	${role_offline-access}	offline_access	dd9bcc37-69c8-4b94-9737-50788f40287c	\N	\N
e2ac4260-80a6-41f6-b390-cf240cb01c70	548af2e3-5c3a-4f3b-8549-3b72fa039d22	t	${role_view-clients}	view-clients	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	548af2e3-5c3a-4f3b-8549-3b72fa039d22	\N
04471fda-d5f3-4f63-8ad9-107cf6185c5c	dd9bcc37-69c8-4b94-9737-50788f40287c	f	${role_uma_authorization}	uma_authorization	dd9bcc37-69c8-4b94-9737-50788f40287c	\N	\N
aea8bad2-a0b7-44ca-8f60-b072cfdbf11f	dd9bcc37-69c8-4b94-9737-50788f40287c	f	\N	unit_manager	dd9bcc37-69c8-4b94-9737-50788f40287c	\N	\N
8d1b3ff7-1b94-412a-8ccd-7f026b7c7f7d	c9d7ba83-2724-418b-8b2d-ea3a602c723c	t	${role_view-authorization}	view-authorization	7b27a11d-121a-4360-960c-3ea6deb0ac35	c9d7ba83-2724-418b-8b2d-ea3a602c723c	\N
3c9b5662-b752-4673-9f81-e38dd77b2468	dd9bcc37-69c8-4b94-9737-50788f40287c	f	\N	unit_normal	dd9bcc37-69c8-4b94-9737-50788f40287c	\N	\N
38c88e5e-d537-414d-80a1-b634b0baa348	c9d7ba83-2724-418b-8b2d-ea3a602c723c	t	${role_manage-realm}	manage-realm	7b27a11d-121a-4360-960c-3ea6deb0ac35	c9d7ba83-2724-418b-8b2d-ea3a602c723c	\N
3266881f-97ee-4de3-9270-2674accb2ead	c9d7ba83-2724-418b-8b2d-ea3a602c723c	t	${role_manage-users}	manage-users	7b27a11d-121a-4360-960c-3ea6deb0ac35	c9d7ba83-2724-418b-8b2d-ea3a602c723c	\N
a98f247e-7faf-4df3-9de9-15cd3351ddf4	548af2e3-5c3a-4f3b-8549-3b72fa039d22	t	${role_view-events}	view-events	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	548af2e3-5c3a-4f3b-8549-3b72fa039d22	\N
75dcb1b0-e8d6-4908-bf4e-f0fc5a9551b4	548af2e3-5c3a-4f3b-8549-3b72fa039d22	t	${role_view-identity-providers}	view-identity-providers	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	548af2e3-5c3a-4f3b-8549-3b72fa039d22	\N
c1171177-4541-4e46-972b-738a558d1b66	548af2e3-5c3a-4f3b-8549-3b72fa039d22	t	${role_view-authorization}	view-authorization	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	548af2e3-5c3a-4f3b-8549-3b72fa039d22	\N
b3ccb899-18c9-4f15-8eb3-3947f3814696	548af2e3-5c3a-4f3b-8549-3b72fa039d22	t	${role_manage-realm}	manage-realm	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	548af2e3-5c3a-4f3b-8549-3b72fa039d22	\N
be88497f-549d-40ce-a585-7255a292acee	548af2e3-5c3a-4f3b-8549-3b72fa039d22	t	${role_manage-users}	manage-users	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	548af2e3-5c3a-4f3b-8549-3b72fa039d22	\N
5ea0049b-2fce-44b6-ba7f-f56c334f59b3	548af2e3-5c3a-4f3b-8549-3b72fa039d22	t	${role_manage-clients}	manage-clients	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	548af2e3-5c3a-4f3b-8549-3b72fa039d22	\N
4a6b43f9-05c4-461b-b3e5-362435f6c624	548af2e3-5c3a-4f3b-8549-3b72fa039d22	t	${role_manage-events}	manage-events	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	548af2e3-5c3a-4f3b-8549-3b72fa039d22	\N
00e0ac6c-bf0c-4aeb-83d8-ccb008a2d517	548af2e3-5c3a-4f3b-8549-3b72fa039d22	t	${role_manage-identity-providers}	manage-identity-providers	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	548af2e3-5c3a-4f3b-8549-3b72fa039d22	\N
f7b6ba11-17a8-4fc7-a3eb-0540fe9786bf	548af2e3-5c3a-4f3b-8549-3b72fa039d22	t	${role_manage-authorization}	manage-authorization	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	548af2e3-5c3a-4f3b-8549-3b72fa039d22	\N
e2450042-8705-47d7-8d40-85e2628e5f54	548af2e3-5c3a-4f3b-8549-3b72fa039d22	t	${role_query-users}	query-users	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	548af2e3-5c3a-4f3b-8549-3b72fa039d22	\N
c0cccc31-98d6-4c0e-b2b0-c9069ddc5f8d	548af2e3-5c3a-4f3b-8549-3b72fa039d22	t	${role_query-clients}	query-clients	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	548af2e3-5c3a-4f3b-8549-3b72fa039d22	\N
f104298b-c8c7-45e4-9aeb-fe279ee695d4	548af2e3-5c3a-4f3b-8549-3b72fa039d22	t	${role_query-realms}	query-realms	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	548af2e3-5c3a-4f3b-8549-3b72fa039d22	\N
70ae22c5-bd13-474f-8f0d-a871255880bf	548af2e3-5c3a-4f3b-8549-3b72fa039d22	t	${role_query-groups}	query-groups	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	548af2e3-5c3a-4f3b-8549-3b72fa039d22	\N
9a50c6d0-45f5-425b-ae4b-3cce30e0c8f3	40e8770f-aeae-4711-a208-8f8f4cd71021	t	${role_view-profile}	view-profile	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	40e8770f-aeae-4711-a208-8f8f4cd71021	\N
4ec7c7fb-668d-40a5-817c-7a149add92ad	40e8770f-aeae-4711-a208-8f8f4cd71021	t	${role_manage-account}	manage-account	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	40e8770f-aeae-4711-a208-8f8f4cd71021	\N
6b4a0249-534d-4d4f-a224-5fcd6fa11c4a	40e8770f-aeae-4711-a208-8f8f4cd71021	t	${role_manage-account-links}	manage-account-links	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	40e8770f-aeae-4711-a208-8f8f4cd71021	\N
bcc09e3b-fbeb-4ef1-b3e6-3940582e9ac2	40e8770f-aeae-4711-a208-8f8f4cd71021	t	${role_view-applications}	view-applications	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	40e8770f-aeae-4711-a208-8f8f4cd71021	\N
7e91ce23-69a4-4a8d-a049-488e27d61413	40e8770f-aeae-4711-a208-8f8f4cd71021	t	${role_view-consent}	view-consent	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	40e8770f-aeae-4711-a208-8f8f4cd71021	\N
5b5a63be-7f3d-4940-804b-6016f528ab42	c9d7ba83-2724-418b-8b2d-ea3a602c723c	t	${role_manage-clients}	manage-clients	7b27a11d-121a-4360-960c-3ea6deb0ac35	c9d7ba83-2724-418b-8b2d-ea3a602c723c	\N
0e49cbff-35a2-45b7-86b3-7a69d6525ddb	c9d7ba83-2724-418b-8b2d-ea3a602c723c	t	${role_manage-events}	manage-events	7b27a11d-121a-4360-960c-3ea6deb0ac35	c9d7ba83-2724-418b-8b2d-ea3a602c723c	\N
5586ddbe-ef8b-4403-8533-51a0aaa7fc98	c9d7ba83-2724-418b-8b2d-ea3a602c723c	t	${role_manage-identity-providers}	manage-identity-providers	7b27a11d-121a-4360-960c-3ea6deb0ac35	c9d7ba83-2724-418b-8b2d-ea3a602c723c	\N
876ac072-998f-4014-bc95-a193782f38c0	c9d7ba83-2724-418b-8b2d-ea3a602c723c	t	${role_manage-authorization}	manage-authorization	7b27a11d-121a-4360-960c-3ea6deb0ac35	c9d7ba83-2724-418b-8b2d-ea3a602c723c	\N
6b1accf4-3374-46cb-807f-0cc872127601	c9d7ba83-2724-418b-8b2d-ea3a602c723c	t	${role_query-users}	query-users	7b27a11d-121a-4360-960c-3ea6deb0ac35	c9d7ba83-2724-418b-8b2d-ea3a602c723c	\N
c67a6fa0-9e06-49b9-837c-862edc756da5	c9d7ba83-2724-418b-8b2d-ea3a602c723c	t	${role_query-clients}	query-clients	7b27a11d-121a-4360-960c-3ea6deb0ac35	c9d7ba83-2724-418b-8b2d-ea3a602c723c	\N
13054329-2d19-4da6-9d09-06dfed9ffce4	c9d7ba83-2724-418b-8b2d-ea3a602c723c	t	${role_query-realms}	query-realms	7b27a11d-121a-4360-960c-3ea6deb0ac35	c9d7ba83-2724-418b-8b2d-ea3a602c723c	\N
50dbef80-3c88-4e12-8a42-fecc097e336a	c9d7ba83-2724-418b-8b2d-ea3a602c723c	t	${role_query-groups}	query-groups	7b27a11d-121a-4360-960c-3ea6deb0ac35	c9d7ba83-2724-418b-8b2d-ea3a602c723c	\N
d7747279-e890-48c6-8a45-439c330c931c	194d9d32-bc5c-405b-bbdd-94cc13279160	t	${role_realm-admin}	realm-admin	60d763c7-10e3-4490-8529-e1c97d983ade	194d9d32-bc5c-405b-bbdd-94cc13279160	\N
625f7485-8d18-4e80-abfa-608bc9bff5fe	40e8770f-aeae-4711-a208-8f8f4cd71021	t	${role_manage-consent}	manage-consent	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	40e8770f-aeae-4711-a208-8f8f4cd71021	\N
e999b0df-1d05-4440-a78d-a6dd4110cb64	40e8770f-aeae-4711-a208-8f8f4cd71021	t	${role_view-groups}	view-groups	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	40e8770f-aeae-4711-a208-8f8f4cd71021	\N
84daafbb-df50-4986-9add-8265c40fbddf	40e8770f-aeae-4711-a208-8f8f4cd71021	t	${role_delete-account}	delete-account	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	40e8770f-aeae-4711-a208-8f8f4cd71021	\N
6617c5f0-4e01-4c93-a9a2-683609e97e37	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	t	${role_impersonation}	impersonation	7b27a11d-121a-4360-960c-3ea6deb0ac35	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	\N
28967433-11e5-456b-87b8-c95a4f4eb254	548af2e3-5c3a-4f3b-8549-3b72fa039d22	t	${role_impersonation}	impersonation	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	548af2e3-5c3a-4f3b-8549-3b72fa039d22	\N
b8519939-89bb-44f1-b1a8-33312f4e7f64	7e9ddf81-ecb6-4337-8d3f-90ad988bd702	t	${role_read-token}	read-token	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	7e9ddf81-ecb6-4337-8d3f-90ad988bd702	\N
9e661049-5ad1-49c1-86ab-6bd73695482a	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	f	${role_offline-access}	offline_access	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	\N	\N
cc0554d7-6667-4732-b7f3-eebcb8ee23dd	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	f	${role_uma_authorization}	uma_authorization	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	\N	\N
f026a185-0e3c-47e0-9e21-9bedddf925a7	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	f	\N	unit_manager	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	\N	\N
7a58b91a-f229-499d-bd11-588f0b8cbd55	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	f	\N	unit_normal	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	\N	\N
be65478e-4a23-4887-92f6-dec5cdce3b77	194d9d32-bc5c-405b-bbdd-94cc13279160	t	${role_create-client}	create-client	60d763c7-10e3-4490-8529-e1c97d983ade	194d9d32-bc5c-405b-bbdd-94cc13279160	\N
f0535e5d-55c0-4d5f-8499-dffd07234da3	194d9d32-bc5c-405b-bbdd-94cc13279160	t	${role_view-realm}	view-realm	60d763c7-10e3-4490-8529-e1c97d983ade	194d9d32-bc5c-405b-bbdd-94cc13279160	\N
c9904c1e-0d97-4d9d-af57-0e6db104c508	194d9d32-bc5c-405b-bbdd-94cc13279160	t	${role_view-users}	view-users	60d763c7-10e3-4490-8529-e1c97d983ade	194d9d32-bc5c-405b-bbdd-94cc13279160	\N
55b880b7-62af-407d-a158-b2919c4ba848	194d9d32-bc5c-405b-bbdd-94cc13279160	t	${role_view-clients}	view-clients	60d763c7-10e3-4490-8529-e1c97d983ade	194d9d32-bc5c-405b-bbdd-94cc13279160	\N
3498538c-a9c2-4d44-9d2d-e4159a022d23	194d9d32-bc5c-405b-bbdd-94cc13279160	t	${role_view-events}	view-events	60d763c7-10e3-4490-8529-e1c97d983ade	194d9d32-bc5c-405b-bbdd-94cc13279160	\N
7f8d0b99-1847-48df-b5d8-1686bdd3d40f	194d9d32-bc5c-405b-bbdd-94cc13279160	t	${role_view-identity-providers}	view-identity-providers	60d763c7-10e3-4490-8529-e1c97d983ade	194d9d32-bc5c-405b-bbdd-94cc13279160	\N
167b23ba-0c31-4589-ac4f-4728fc7effe4	194d9d32-bc5c-405b-bbdd-94cc13279160	t	${role_view-authorization}	view-authorization	60d763c7-10e3-4490-8529-e1c97d983ade	194d9d32-bc5c-405b-bbdd-94cc13279160	\N
bdf85ffb-cd50-4225-8c22-eff83d49b1b7	194d9d32-bc5c-405b-bbdd-94cc13279160	t	${role_manage-realm}	manage-realm	60d763c7-10e3-4490-8529-e1c97d983ade	194d9d32-bc5c-405b-bbdd-94cc13279160	\N
70ac8100-37ff-42a6-bcc7-12b5756aa26c	194d9d32-bc5c-405b-bbdd-94cc13279160	t	${role_manage-users}	manage-users	60d763c7-10e3-4490-8529-e1c97d983ade	194d9d32-bc5c-405b-bbdd-94cc13279160	\N
3365b9b3-8795-4e6f-8bab-f55b109dbb66	194d9d32-bc5c-405b-bbdd-94cc13279160	t	${role_manage-clients}	manage-clients	60d763c7-10e3-4490-8529-e1c97d983ade	194d9d32-bc5c-405b-bbdd-94cc13279160	\N
6c72de52-2d6e-457a-828e-e2a79360cf51	194d9d32-bc5c-405b-bbdd-94cc13279160	t	${role_manage-events}	manage-events	60d763c7-10e3-4490-8529-e1c97d983ade	194d9d32-bc5c-405b-bbdd-94cc13279160	\N
0fd4a3db-274a-40aa-ac9e-be71456ef5a8	194d9d32-bc5c-405b-bbdd-94cc13279160	t	${role_manage-identity-providers}	manage-identity-providers	60d763c7-10e3-4490-8529-e1c97d983ade	194d9d32-bc5c-405b-bbdd-94cc13279160	\N
09522afe-5ad1-4094-96a2-e3ba3b80985b	194d9d32-bc5c-405b-bbdd-94cc13279160	t	${role_manage-authorization}	manage-authorization	60d763c7-10e3-4490-8529-e1c97d983ade	194d9d32-bc5c-405b-bbdd-94cc13279160	\N
79b67172-d85a-4b3a-bea3-082a38b3a832	194d9d32-bc5c-405b-bbdd-94cc13279160	t	${role_query-users}	query-users	60d763c7-10e3-4490-8529-e1c97d983ade	194d9d32-bc5c-405b-bbdd-94cc13279160	\N
64f45a50-6486-4722-8195-6529bfb788fb	194d9d32-bc5c-405b-bbdd-94cc13279160	t	${role_query-clients}	query-clients	60d763c7-10e3-4490-8529-e1c97d983ade	194d9d32-bc5c-405b-bbdd-94cc13279160	\N
d1f5235e-6545-4b3a-960f-6b7636dfd046	194d9d32-bc5c-405b-bbdd-94cc13279160	t	${role_query-realms}	query-realms	60d763c7-10e3-4490-8529-e1c97d983ade	194d9d32-bc5c-405b-bbdd-94cc13279160	\N
973bbb97-4df0-42d8-9d31-bc2b9c38a013	194d9d32-bc5c-405b-bbdd-94cc13279160	t	${role_query-groups}	query-groups	60d763c7-10e3-4490-8529-e1c97d983ade	194d9d32-bc5c-405b-bbdd-94cc13279160	\N
f115894b-b1fc-42ae-9949-2c3822de8727	1933ba2e-6c06-4466-b1c5-44b87f23a311	t	${role_view-profile}	view-profile	60d763c7-10e3-4490-8529-e1c97d983ade	1933ba2e-6c06-4466-b1c5-44b87f23a311	\N
dc300d1f-d8a8-4521-9fad-7f227519d315	1933ba2e-6c06-4466-b1c5-44b87f23a311	t	${role_manage-account}	manage-account	60d763c7-10e3-4490-8529-e1c97d983ade	1933ba2e-6c06-4466-b1c5-44b87f23a311	\N
86fc8cd4-57c5-47dc-aa27-2354c397a09a	1933ba2e-6c06-4466-b1c5-44b87f23a311	t	${role_manage-account-links}	manage-account-links	60d763c7-10e3-4490-8529-e1c97d983ade	1933ba2e-6c06-4466-b1c5-44b87f23a311	\N
6d56c0ec-97b0-4154-86f8-f58ad84b0bc5	1933ba2e-6c06-4466-b1c5-44b87f23a311	t	${role_view-applications}	view-applications	60d763c7-10e3-4490-8529-e1c97d983ade	1933ba2e-6c06-4466-b1c5-44b87f23a311	\N
186e9c8a-f356-4d60-83c7-358c7fbecfca	1933ba2e-6c06-4466-b1c5-44b87f23a311	t	${role_view-consent}	view-consent	60d763c7-10e3-4490-8529-e1c97d983ade	1933ba2e-6c06-4466-b1c5-44b87f23a311	\N
cf536853-7027-4300-92d9-6e37d76cdd65	1933ba2e-6c06-4466-b1c5-44b87f23a311	t	${role_manage-consent}	manage-consent	60d763c7-10e3-4490-8529-e1c97d983ade	1933ba2e-6c06-4466-b1c5-44b87f23a311	\N
e3358812-d872-4d44-be6a-97172bbc9184	1933ba2e-6c06-4466-b1c5-44b87f23a311	t	${role_view-groups}	view-groups	60d763c7-10e3-4490-8529-e1c97d983ade	1933ba2e-6c06-4466-b1c5-44b87f23a311	\N
ce5218ad-6c8d-478b-b015-a85c3b11b05f	1933ba2e-6c06-4466-b1c5-44b87f23a311	t	${role_delete-account}	delete-account	60d763c7-10e3-4490-8529-e1c97d983ade	1933ba2e-6c06-4466-b1c5-44b87f23a311	\N
e43f3cd3-0f39-4908-be37-7267f0bfbe80	c9d7ba83-2724-418b-8b2d-ea3a602c723c	t	${role_impersonation}	impersonation	7b27a11d-121a-4360-960c-3ea6deb0ac35	c9d7ba83-2724-418b-8b2d-ea3a602c723c	\N
84951bf9-ec6a-44eb-82aa-1cc61488ab22	194d9d32-bc5c-405b-bbdd-94cc13279160	t	${role_impersonation}	impersonation	60d763c7-10e3-4490-8529-e1c97d983ade	194d9d32-bc5c-405b-bbdd-94cc13279160	\N
8e21bf0e-190d-4a5f-b2b9-93563c41c356	11512b0d-f605-437f-ba6e-2d241ee0002e	t	${role_read-token}	read-token	60d763c7-10e3-4490-8529-e1c97d983ade	11512b0d-f605-437f-ba6e-2d241ee0002e	\N
f712e44f-7301-4b39-b03a-259ec653b76c	60d763c7-10e3-4490-8529-e1c97d983ade	f	${role_offline-access}	offline_access	60d763c7-10e3-4490-8529-e1c97d983ade	\N	\N
38c36278-df54-44c5-bdc5-fa4bff33d858	60d763c7-10e3-4490-8529-e1c97d983ade	f	${role_uma_authorization}	uma_authorization	60d763c7-10e3-4490-8529-e1c97d983ade	\N	\N
279b14fe-fd08-4072-b5a5-8a929ad90b22	60d763c7-10e3-4490-8529-e1c97d983ade	f	\N	unit_manager	60d763c7-10e3-4490-8529-e1c97d983ade	\N	\N
6f5e8d7e-8984-4720-877b-12aa0ffcae54	60d763c7-10e3-4490-8529-e1c97d983ade	f	\N	unit_normal	60d763c7-10e3-4490-8529-e1c97d983ade	\N	\N
68435a4f-b7d8-47a3-8894-d11f7be0c21c	8cd3c0b7-149b-461d-b4db-987d93c12289	t	${role_query-users}	query-users	7b27a11d-121a-4360-960c-3ea6deb0ac35	8cd3c0b7-149b-461d-b4db-987d93c12289	\N
59395d5c-7206-4e49-b8d9-d9d2edfa40ee	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	f	${role_default-roles}	default-roles-pit	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	\N	\N
3619975c-b8c3-4ab3-876f-ddda3041fdd1	8cd3c0b7-149b-461d-b4db-987d93c12289	t	${role_create-client}	create-client	7b27a11d-121a-4360-960c-3ea6deb0ac35	8cd3c0b7-149b-461d-b4db-987d93c12289	\N
3475b62d-d922-4ce3-bbe4-5f02abf76be3	8cd3c0b7-149b-461d-b4db-987d93c12289	t	${role_view-realm}	view-realm	7b27a11d-121a-4360-960c-3ea6deb0ac35	8cd3c0b7-149b-461d-b4db-987d93c12289	\N
57a835b6-34c5-4063-b98e-da63927b2184	8cd3c0b7-149b-461d-b4db-987d93c12289	t	${role_view-users}	view-users	7b27a11d-121a-4360-960c-3ea6deb0ac35	8cd3c0b7-149b-461d-b4db-987d93c12289	\N
0548776a-cdbb-4dec-b4ec-f99942f4ff1a	8cd3c0b7-149b-461d-b4db-987d93c12289	t	${role_view-clients}	view-clients	7b27a11d-121a-4360-960c-3ea6deb0ac35	8cd3c0b7-149b-461d-b4db-987d93c12289	\N
6bf6ccce-666f-47d8-9240-3f4de97104c1	8cd3c0b7-149b-461d-b4db-987d93c12289	t	${role_view-events}	view-events	7b27a11d-121a-4360-960c-3ea6deb0ac35	8cd3c0b7-149b-461d-b4db-987d93c12289	\N
8f5e7777-bac8-4d10-8fd2-60a5b2353e0b	8cd3c0b7-149b-461d-b4db-987d93c12289	t	${role_view-identity-providers}	view-identity-providers	7b27a11d-121a-4360-960c-3ea6deb0ac35	8cd3c0b7-149b-461d-b4db-987d93c12289	\N
d7cb0209-8cf7-47e0-8158-0cbf511cf6d7	8cd3c0b7-149b-461d-b4db-987d93c12289	t	${role_view-authorization}	view-authorization	7b27a11d-121a-4360-960c-3ea6deb0ac35	8cd3c0b7-149b-461d-b4db-987d93c12289	\N
6777789d-0db0-4ecd-8f10-ff07a7e426a5	8cd3c0b7-149b-461d-b4db-987d93c12289	t	${role_manage-realm}	manage-realm	7b27a11d-121a-4360-960c-3ea6deb0ac35	8cd3c0b7-149b-461d-b4db-987d93c12289	\N
580f0c52-1d3d-4d3e-b021-8be2503a0c1a	8cd3c0b7-149b-461d-b4db-987d93c12289	t	${role_manage-users}	manage-users	7b27a11d-121a-4360-960c-3ea6deb0ac35	8cd3c0b7-149b-461d-b4db-987d93c12289	\N
eb013ef5-275c-4932-82e5-7a8befa79038	8cd3c0b7-149b-461d-b4db-987d93c12289	t	${role_manage-clients}	manage-clients	7b27a11d-121a-4360-960c-3ea6deb0ac35	8cd3c0b7-149b-461d-b4db-987d93c12289	\N
e7325562-5302-4947-94a1-fc9d707873c5	8cd3c0b7-149b-461d-b4db-987d93c12289	t	${role_manage-events}	manage-events	7b27a11d-121a-4360-960c-3ea6deb0ac35	8cd3c0b7-149b-461d-b4db-987d93c12289	\N
19bbbcab-263e-4828-ba93-d571c2402dd3	8cd3c0b7-149b-461d-b4db-987d93c12289	t	${role_manage-identity-providers}	manage-identity-providers	7b27a11d-121a-4360-960c-3ea6deb0ac35	8cd3c0b7-149b-461d-b4db-987d93c12289	\N
fa8ad817-0f87-4eae-a6d2-a49bbc0fe48d	8cd3c0b7-149b-461d-b4db-987d93c12289	t	${role_manage-authorization}	manage-authorization	7b27a11d-121a-4360-960c-3ea6deb0ac35	8cd3c0b7-149b-461d-b4db-987d93c12289	\N
fc110243-c897-44f0-9d39-35edf94a6ae4	8cd3c0b7-149b-461d-b4db-987d93c12289	t	${role_query-clients}	query-clients	7b27a11d-121a-4360-960c-3ea6deb0ac35	8cd3c0b7-149b-461d-b4db-987d93c12289	\N
1ae3fb38-fd96-447f-976e-f06351f880fd	8cd3c0b7-149b-461d-b4db-987d93c12289	t	${role_query-realms}	query-realms	7b27a11d-121a-4360-960c-3ea6deb0ac35	8cd3c0b7-149b-461d-b4db-987d93c12289	\N
f0b90130-b95d-4170-a482-0a718821cac9	8cd3c0b7-149b-461d-b4db-987d93c12289	t	${role_query-groups}	query-groups	7b27a11d-121a-4360-960c-3ea6deb0ac35	8cd3c0b7-149b-461d-b4db-987d93c12289	\N
d0584d18-daf5-4a0c-81ed-56185f1030a3	5eea5d8c-eae1-4307-adb6-da4e0148ee74	t	${role_realm-admin}	realm-admin	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	5eea5d8c-eae1-4307-adb6-da4e0148ee74	\N
66d88f89-753b-4b66-b9c3-99d1ab96f3da	5eea5d8c-eae1-4307-adb6-da4e0148ee74	t	${role_create-client}	create-client	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	5eea5d8c-eae1-4307-adb6-da4e0148ee74	\N
9dc98665-41b0-421e-b08d-db04bd2f1dbb	5eea5d8c-eae1-4307-adb6-da4e0148ee74	t	${role_view-realm}	view-realm	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	5eea5d8c-eae1-4307-adb6-da4e0148ee74	\N
765ae24b-cd44-46da-8326-fa6910507670	5eea5d8c-eae1-4307-adb6-da4e0148ee74	t	${role_view-users}	view-users	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	5eea5d8c-eae1-4307-adb6-da4e0148ee74	\N
10778f58-fff4-4205-8682-7be1bd5abab9	5eea5d8c-eae1-4307-adb6-da4e0148ee74	t	${role_view-clients}	view-clients	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	5eea5d8c-eae1-4307-adb6-da4e0148ee74	\N
d46e1e1f-cad9-41d3-b4f5-2124d0e2e9a0	5eea5d8c-eae1-4307-adb6-da4e0148ee74	t	${role_view-events}	view-events	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	5eea5d8c-eae1-4307-adb6-da4e0148ee74	\N
cccb4440-ed5a-48d3-9545-ddebbf54be65	5eea5d8c-eae1-4307-adb6-da4e0148ee74	t	${role_view-identity-providers}	view-identity-providers	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	5eea5d8c-eae1-4307-adb6-da4e0148ee74	\N
25d996c0-d67a-46d8-8e39-1088ff6049ab	5eea5d8c-eae1-4307-adb6-da4e0148ee74	t	${role_view-authorization}	view-authorization	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	5eea5d8c-eae1-4307-adb6-da4e0148ee74	\N
6319acc8-7b01-4fcc-8bf9-2638a843c544	5eea5d8c-eae1-4307-adb6-da4e0148ee74	t	${role_manage-realm}	manage-realm	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	5eea5d8c-eae1-4307-adb6-da4e0148ee74	\N
cad4d988-3539-4eaf-8162-57054dd90ef3	5eea5d8c-eae1-4307-adb6-da4e0148ee74	t	${role_manage-users}	manage-users	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	5eea5d8c-eae1-4307-adb6-da4e0148ee74	\N
c49a5eca-5054-44bd-9b55-ffce15eafe21	5eea5d8c-eae1-4307-adb6-da4e0148ee74	t	${role_manage-clients}	manage-clients	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	5eea5d8c-eae1-4307-adb6-da4e0148ee74	\N
d6be918c-48c7-4a6e-bfdc-c83718301583	5eea5d8c-eae1-4307-adb6-da4e0148ee74	t	${role_manage-events}	manage-events	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	5eea5d8c-eae1-4307-adb6-da4e0148ee74	\N
ef2ab335-e5d9-4be7-8ea0-34daf894f3e0	5eea5d8c-eae1-4307-adb6-da4e0148ee74	t	${role_manage-identity-providers}	manage-identity-providers	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	5eea5d8c-eae1-4307-adb6-da4e0148ee74	\N
01e08629-94a5-4834-a540-f4ced33a5c4f	5eea5d8c-eae1-4307-adb6-da4e0148ee74	t	${role_manage-authorization}	manage-authorization	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	5eea5d8c-eae1-4307-adb6-da4e0148ee74	\N
58f467e4-7f9e-4d0e-b1eb-d100b875c62f	5eea5d8c-eae1-4307-adb6-da4e0148ee74	t	${role_query-users}	query-users	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	5eea5d8c-eae1-4307-adb6-da4e0148ee74	\N
1af929a8-b957-454e-8d72-839a8ac0d03e	5eea5d8c-eae1-4307-adb6-da4e0148ee74	t	${role_query-clients}	query-clients	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	5eea5d8c-eae1-4307-adb6-da4e0148ee74	\N
fa777f94-0fe8-4135-b86f-15e187f07dfb	5eea5d8c-eae1-4307-adb6-da4e0148ee74	t	${role_query-realms}	query-realms	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	5eea5d8c-eae1-4307-adb6-da4e0148ee74	\N
869f2b98-cb12-4eaa-8bf1-67e9ea33dc36	5eea5d8c-eae1-4307-adb6-da4e0148ee74	t	${role_query-groups}	query-groups	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	5eea5d8c-eae1-4307-adb6-da4e0148ee74	\N
dbbb6001-fe61-40e2-a16b-f0d342e43cbe	1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	t	${role_view-profile}	view-profile	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	\N
b700ec19-beee-4bcf-a551-2f77324382f0	1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	t	${role_manage-account}	manage-account	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	\N
9d6ffade-87a7-433a-b0b7-d5ba6da80945	1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	t	${role_manage-account-links}	manage-account-links	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	\N
f6e75afd-835a-49f6-b953-78309bc30579	1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	t	${role_view-applications}	view-applications	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	\N
b7323e6f-caa1-41a6-891c-b345a59b8bad	1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	t	${role_view-consent}	view-consent	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	\N
f952a9bb-84ff-43f7-a01b-ab9982983d41	1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	t	${role_manage-consent}	manage-consent	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	\N
3f9419a9-d844-4e50-8ce2-81b2c793d2e7	1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	t	${role_view-groups}	view-groups	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	\N
0c2fc767-9939-4329-a516-543399899b1d	1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	t	${role_delete-account}	delete-account	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	\N
a30189b5-86ef-4328-b0f4-0f841b1eccd2	8cd3c0b7-149b-461d-b4db-987d93c12289	t	${role_impersonation}	impersonation	7b27a11d-121a-4360-960c-3ea6deb0ac35	8cd3c0b7-149b-461d-b4db-987d93c12289	\N
c990371b-415a-471d-ac6c-89402f8d042c	5eea5d8c-eae1-4307-adb6-da4e0148ee74	t	${role_impersonation}	impersonation	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	5eea5d8c-eae1-4307-adb6-da4e0148ee74	\N
6cd19b3e-bf7f-47b8-b9ff-4a36f9151bc7	fcd3d799-45ca-49dc-8ba5-5a40a7b2db98	t	${role_read-token}	read-token	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	fcd3d799-45ca-49dc-8ba5-5a40a7b2db98	\N
84202fcf-efde-4d05-976f-c37cedd95876	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	f	${role_offline-access}	offline_access	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	\N	\N
109a67b1-6092-4d73-b42b-d2e4e07791ee	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	f	${role_uma_authorization}	uma_authorization	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	\N	\N
9562cca4-39a5-4356-8b08-c84e9d9900b7	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	f	\N	unit_manager	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	\N	\N
4493b23d-a704-4c35-b33b-8e4a3a728faf	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	f	\N	unit_normal	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	\N	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.migration_model (id, version, update_time) FROM stdin;
7pksd	20.0.5	1681537361
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
3e6459e6-dc79-47e6-a76e-a23008366a88	audience resolve	openid-connect	oidc-audience-resolve-mapper	b6ffcb90-757d-4454-bc80-afead1b60dc4	\N
f251d6f5-18e0-4771-8df7-5e57fa6b4796	locale	openid-connect	oidc-usermodel-attribute-mapper	c4c6722f-da0c-4d9a-a651-f3ff1c34f74a	\N
50c48537-adc6-4e57-8264-fcdf89993f1b	role list	saml	saml-role-list-mapper	\N	49e97e25-d4dd-40c8-882f-3e894f6c59e1
94d06ff4-6040-4f4e-89b4-a92ff09e5d9d	full name	openid-connect	oidc-full-name-mapper	\N	9ce86df7-ae42-4e8f-9c53-85f3901d8f4f
1f90ef85-dd0d-4ffa-b778-55a0e7439922	family name	openid-connect	oidc-usermodel-property-mapper	\N	9ce86df7-ae42-4e8f-9c53-85f3901d8f4f
23ab97e5-862e-4a4f-9f8e-a3510446a0b2	given name	openid-connect	oidc-usermodel-property-mapper	\N	9ce86df7-ae42-4e8f-9c53-85f3901d8f4f
aa9f7863-2049-44ac-a69a-76c08d8c3ed6	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	9ce86df7-ae42-4e8f-9c53-85f3901d8f4f
493c3ee6-bf4c-4092-9fc1-fe99662b04ec	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	9ce86df7-ae42-4e8f-9c53-85f3901d8f4f
18e3f826-fb5b-45d9-a8cb-202a80b28c52	username	openid-connect	oidc-usermodel-property-mapper	\N	9ce86df7-ae42-4e8f-9c53-85f3901d8f4f
acb44df9-49e4-489d-9ffb-da8b758c32c8	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	9ce86df7-ae42-4e8f-9c53-85f3901d8f4f
56988037-3147-43f2-8eab-1a5bffa86bcd	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	9ce86df7-ae42-4e8f-9c53-85f3901d8f4f
47d9dcdb-dbb6-458f-a826-9b4ce597b9f3	website	openid-connect	oidc-usermodel-attribute-mapper	\N	9ce86df7-ae42-4e8f-9c53-85f3901d8f4f
1ccc417a-9815-4bcd-adbd-411c38f186a9	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	9ce86df7-ae42-4e8f-9c53-85f3901d8f4f
8227a139-478f-4089-be2a-b46b1ff1ec4e	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	9ce86df7-ae42-4e8f-9c53-85f3901d8f4f
85c711a2-3650-4962-98b2-d99d593a53b4	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	9ce86df7-ae42-4e8f-9c53-85f3901d8f4f
c1b46ffa-2b25-41e6-8a79-bbd8289507a0	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	9ce86df7-ae42-4e8f-9c53-85f3901d8f4f
28a2042d-e559-4f82-9927-33101525fa4a	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	9ce86df7-ae42-4e8f-9c53-85f3901d8f4f
c613c303-7422-46d8-bc39-9a38285ce0e3	email	openid-connect	oidc-usermodel-property-mapper	\N	b32226bf-f4fa-433f-b566-e8b8e95f686d
fa7ede02-1a9b-4ff1-bcc3-27e0530e04ad	email verified	openid-connect	oidc-usermodel-property-mapper	\N	b32226bf-f4fa-433f-b566-e8b8e95f686d
a63a3198-052e-41bf-bef4-be9a93c7ce30	address	openid-connect	oidc-address-mapper	\N	a9fa8229-bcee-42fb-84c5-91b0df91a164
18ef8a40-331b-452e-9939-1616d9ec55bb	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	7e38e21a-76ad-4b8a-8be2-da3ff54dbb90
69d3e901-c343-420b-82d4-f4c17965f492	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	7e38e21a-76ad-4b8a-8be2-da3ff54dbb90
a46a09f5-84e2-4924-98f6-45d6c9fc7030	audience resolve	openid-connect	oidc-audience-resolve-mapper	01cdc332-278c-4884-9386-3bc62a7c2df9	\N
011dcd91-7756-4868-b85a-5a9bcabf564f	role list	saml	saml-role-list-mapper	\N	5a5e5838-f9cf-442a-a4d8-3c6436a2728f
29a897a2-8b35-417b-ad13-013f349a06b0	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	21b57b5b-6b2a-4700-9180-060e36c2da9e
e298384a-5b35-4c99-bac4-47ab17c84691	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	a3a86244-e2bc-4626-a691-36026a20eaac
0e237006-c8e4-4028-8023-f723459a9795	upn	openid-connect	oidc-usermodel-property-mapper	\N	b6d65dc0-5828-49cd-8a61-51b909a95424
3aa3b39a-5638-441c-a696-ea1a76c441d6	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	b6d65dc0-5828-49cd-8a61-51b909a95424
d0d2ed69-e8cb-4e1d-a842-504c5287d8c4	acr loa level	openid-connect	oidc-acr-mapper	\N	b3f8a4b6-06e2-4a09-b541-9f77e2f4e970
badc0fa6-447e-4e34-93bb-bb8603ad5808	audience resolve	openid-connect	oidc-audience-resolve-mapper	42d7f3cb-b3bf-4a0b-a6ec-068cf3f8478f	\N
cbfa9e94-ef60-494c-ae12-447f00c7db0d	role list	saml	saml-role-list-mapper	\N	284a6148-dc6d-4b68-8b5b-95ed681a3aa4
cb34b6d5-000a-403f-a940-61eb69dd19ac	full name	openid-connect	oidc-full-name-mapper	\N	4bcdc5f8-ddbb-4903-bdce-75740243a6de
c223f960-55cb-4f5e-9907-371b61bcd50a	family name	openid-connect	oidc-usermodel-property-mapper	\N	4bcdc5f8-ddbb-4903-bdce-75740243a6de
c9b13a07-e5b5-4d7e-a64c-544f5815610d	given name	openid-connect	oidc-usermodel-property-mapper	\N	4bcdc5f8-ddbb-4903-bdce-75740243a6de
cb044a5a-fc71-412e-bec2-33fa1d859c16	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	4bcdc5f8-ddbb-4903-bdce-75740243a6de
2f0df46a-f82b-4054-8ff6-123945142c07	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	4bcdc5f8-ddbb-4903-bdce-75740243a6de
5883b107-16ad-479e-b51b-85b9f5448071	username	openid-connect	oidc-usermodel-property-mapper	\N	4bcdc5f8-ddbb-4903-bdce-75740243a6de
cfefde3d-2209-49d9-a930-b6d6b7eba5f9	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	4bcdc5f8-ddbb-4903-bdce-75740243a6de
eb0b5d78-183f-4318-a3ba-140e01e7574e	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	4bcdc5f8-ddbb-4903-bdce-75740243a6de
7b22c474-e551-4511-b650-abb36a5f5949	website	openid-connect	oidc-usermodel-attribute-mapper	\N	4bcdc5f8-ddbb-4903-bdce-75740243a6de
75a87884-b611-4541-9f08-ed5b5b6074f5	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	4bcdc5f8-ddbb-4903-bdce-75740243a6de
9e3f1ed1-9a55-446e-a91a-9842ae7c9c96	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	4bcdc5f8-ddbb-4903-bdce-75740243a6de
5c28c851-ed4f-43b0-a871-09221a3d298b	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	4bcdc5f8-ddbb-4903-bdce-75740243a6de
7e6730f6-75f5-4bd0-9551-93049d33acdd	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	4bcdc5f8-ddbb-4903-bdce-75740243a6de
8b781952-b3bc-4e2f-97f5-875388136dc1	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	4bcdc5f8-ddbb-4903-bdce-75740243a6de
076b3ba1-40bd-4ebd-a3e8-b3f48810058f	email	openid-connect	oidc-usermodel-property-mapper	\N	b1809973-dc13-4006-ba94-56f00b4e0619
642e4c18-3233-4993-87bf-297901caf788	email verified	openid-connect	oidc-usermodel-property-mapper	\N	b1809973-dc13-4006-ba94-56f00b4e0619
4de1ef1d-3fe8-4943-b88c-8a536e6aedef	address	openid-connect	oidc-address-mapper	\N	0de9b76a-bccf-4d9c-b56f-6845cb6a6387
873b6db5-1288-48ac-a360-0d31169c385d	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	83878d56-5ac3-4322-afdd-7bdfc294bebd
7b32a539-c2cf-46fc-a8a5-8f792b3bb3df	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	83878d56-5ac3-4322-afdd-7bdfc294bebd
d6591afa-9a26-479a-a718-de8435572dbf	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	07e618c7-bfa6-468b-adb2-e15ba0f56d04
a1ffc491-dc22-4252-9bd0-790c71698798	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	07e618c7-bfa6-468b-adb2-e15ba0f56d04
cc935fb7-a854-4929-ae46-c63ae77d3c37	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	5d917fd0-475a-4cfc-b28d-cc0ba8ebbc12
565690dd-ec32-4efd-a826-afb492558a08	upn	openid-connect	oidc-usermodel-property-mapper	\N	5c5aa9a6-de06-4b20-b20c-3b21efd29cb3
3729f154-435c-4480-bc68-4e779c27fa6c	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	5c5aa9a6-de06-4b20-b20c-3b21efd29cb3
97906230-1a56-4cf2-b07d-f0d75113d6d1	acr loa level	openid-connect	oidc-acr-mapper	\N	5df278e3-86c1-429a-af9c-ac3bb962d0ba
3cda03ab-fe3d-4c56-a109-a79a12fb7657	locale	openid-connect	oidc-usermodel-attribute-mapper	02a8082a-7107-4805-991d-5bd6f4aea9ff	\N
4fe34817-327b-4f04-b0c9-0c94404ddae9	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	21b57b5b-6b2a-4700-9180-060e36c2da9e
22a735d3-5aee-434a-b7d2-d37718dbe3c2	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	07e618c7-bfa6-468b-adb2-e15ba0f56d04
7fa000e8-9ae9-44a8-8d2a-4cc1275b4f59	full name	openid-connect	oidc-full-name-mapper	\N	2729bd3c-c919-4768-9c69-2e5152e94cd5
c789491f-ef49-4409-a489-8bf9032d1822	family name	openid-connect	oidc-usermodel-property-mapper	\N	2729bd3c-c919-4768-9c69-2e5152e94cd5
7fe7df76-092f-4400-a323-1c92c93ee8b5	given name	openid-connect	oidc-usermodel-property-mapper	\N	2729bd3c-c919-4768-9c69-2e5152e94cd5
2b0ad430-839f-4c15-9f44-838025e0f6ad	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	2729bd3c-c919-4768-9c69-2e5152e94cd5
1317fb97-d2f4-4647-95b0-f462b8cca17e	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	2729bd3c-c919-4768-9c69-2e5152e94cd5
08a47d89-1a98-4753-8f09-e7acd458ad30	username	openid-connect	oidc-usermodel-property-mapper	\N	2729bd3c-c919-4768-9c69-2e5152e94cd5
5ccca390-3c3b-42cd-9e95-18b62a0f4d0a	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	2729bd3c-c919-4768-9c69-2e5152e94cd5
85b2b5d1-0a2f-40e8-826a-e9b11de73cc7	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	2729bd3c-c919-4768-9c69-2e5152e94cd5
8d41e5b5-3bbe-41b1-8fb3-689441421bb2	website	openid-connect	oidc-usermodel-attribute-mapper	\N	2729bd3c-c919-4768-9c69-2e5152e94cd5
59ff9bce-d347-4520-89f0-697bc37e4c13	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	2729bd3c-c919-4768-9c69-2e5152e94cd5
20cab531-5ac0-4568-b00c-5109e00314b6	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	2729bd3c-c919-4768-9c69-2e5152e94cd5
b96bc57e-fc21-4dd3-a1fd-6d27623da665	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	2729bd3c-c919-4768-9c69-2e5152e94cd5
3dedc4d4-b6f0-4154-8107-7e1110ba31dc	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	2729bd3c-c919-4768-9c69-2e5152e94cd5
ae3d6603-3219-442a-850d-9b89efb369b0	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	2729bd3c-c919-4768-9c69-2e5152e94cd5
939c9c30-1833-47d4-bee6-c49df4a51ed4	email	openid-connect	oidc-usermodel-property-mapper	\N	3dd11a2b-d310-4c68-a546-ade7fb0fbe50
b253f36d-ad01-40cc-84b9-0ba215567b8b	email verified	openid-connect	oidc-usermodel-property-mapper	\N	3dd11a2b-d310-4c68-a546-ade7fb0fbe50
ca5a0c18-6bdc-475f-adf0-2d56b66b8a1b	address	openid-connect	oidc-address-mapper	\N	85f93bf5-c148-4aee-bf72-0a9c9fca86c6
59404bb6-f8d3-4fef-b95e-d25e5b9d55c0	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	5adfbeaa-0d84-4438-8815-db1c1a01ea0c
1fda047f-de59-4d3c-9704-47233fdba955	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	5adfbeaa-0d84-4438-8815-db1c1a01ea0c
2ac876c2-821c-4376-9a1a-bc92c9fd4ef4	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	0629b8d7-75de-457a-abf4-4d97423b1c0a
04929c2f-309b-44c5-bd57-981edd942ddc	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	0629b8d7-75de-457a-abf4-4d97423b1c0a
ac29a94b-5a1d-44b1-a856-f36c6cd0649b	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	9167a5b4-dd14-4d0b-bd36-d657f743670a
47a6d6dd-2be0-443f-aae0-a35b43ed4500	upn	openid-connect	oidc-usermodel-property-mapper	\N	a1983e8d-2811-4ed6-adfd-6b16475d96db
5ae4de5d-0f3f-444c-abf2-46e9b3fa31c1	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	a1983e8d-2811-4ed6-adfd-6b16475d96db
a695aa98-db82-429e-a005-641996bc9609	acr loa level	openid-connect	oidc-acr-mapper	\N	46d940b1-fb0d-40ad-a551-6ca1eae0e844
2791528c-9c0c-4f84-8a89-cbb052e2c398	locale	openid-connect	oidc-usermodel-attribute-mapper	962887df-3902-4556-923d-622a6e793de3	\N
ddbf32bb-55c4-46a8-8705-4debef607818	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	0629b8d7-75de-457a-abf4-4d97423b1c0a
05ed0204-b10a-4837-afec-a0155b8e51f5	audience resolve	openid-connect	oidc-audience-resolve-mapper	055aed68-db28-4769-a5a2-3896b6383f81	\N
14206120-8d0d-4441-a9e2-2f3f508efad0	role list	saml	saml-role-list-mapper	\N	010070ea-a6d9-45fe-9a00-918471ac3dd3
0c9cc4ec-2454-4b82-944f-6752b1a520c2	full name	openid-connect	oidc-full-name-mapper	\N	80bad978-251c-47e3-903a-86af08c4b811
a8ffdbe1-03a3-4d6f-918b-b5720af58686	family name	openid-connect	oidc-usermodel-property-mapper	\N	80bad978-251c-47e3-903a-86af08c4b811
2a8ced17-8a73-4ae0-ba9a-1319c2234c4a	given name	openid-connect	oidc-usermodel-property-mapper	\N	80bad978-251c-47e3-903a-86af08c4b811
648d583d-d860-4926-90b5-86a1214976d2	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	80bad978-251c-47e3-903a-86af08c4b811
5793e25d-071c-43e2-b254-d9ddcec29b28	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	80bad978-251c-47e3-903a-86af08c4b811
4a60d031-5c2e-4ec2-93a9-dba34fceb718	username	openid-connect	oidc-usermodel-property-mapper	\N	80bad978-251c-47e3-903a-86af08c4b811
9825417e-455c-4ed3-9d41-835c15818b36	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	80bad978-251c-47e3-903a-86af08c4b811
ccf7f435-1a0c-4a92-b3cd-d821f84b1b28	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	80bad978-251c-47e3-903a-86af08c4b811
dd9f550e-f19e-4a99-8320-ba11a52f6417	website	openid-connect	oidc-usermodel-attribute-mapper	\N	80bad978-251c-47e3-903a-86af08c4b811
ae924403-a880-4539-8472-26cd40adb7cc	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	80bad978-251c-47e3-903a-86af08c4b811
48b9d9bd-eb37-4fab-8a22-9d28082d7be0	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	80bad978-251c-47e3-903a-86af08c4b811
977af4b6-8524-4432-838a-222dfce02eb7	audience resolve	openid-connect	oidc-audience-resolve-mapper	fe783fd4-f23f-4777-9958-15ba12be6fb9	\N
1077c412-6db0-41d1-861f-25458c2d193b	role list	saml	saml-role-list-mapper	\N	0e935cb0-6e9d-45ba-8c2f-d5f2a0310b12
6309066c-c5d1-4b0f-b20b-0d71f6771dcb	full name	openid-connect	oidc-full-name-mapper	\N	0c21cef9-585a-404e-b8f2-fbba43b1bb79
9906ca77-733e-4517-aa2c-aa3a44a4378a	family name	openid-connect	oidc-usermodel-property-mapper	\N	0c21cef9-585a-404e-b8f2-fbba43b1bb79
12bde678-1b5d-4e73-8d8a-31dc75934268	given name	openid-connect	oidc-usermodel-property-mapper	\N	0c21cef9-585a-404e-b8f2-fbba43b1bb79
4fcf7561-81cd-43f4-bacd-afa4fb418d45	email	openid-connect	oidc-usermodel-property-mapper	\N	e65b2bf1-e2a4-4015-8c78-cf732e9efe20
394c933a-531a-4d1d-bf5a-d671f71f3c80	audience resolve	openid-connect	oidc-audience-resolve-mapper	bd8261f7-9d01-4003-a5b5-c344168aa641	\N
d4540cc4-4f51-4550-8151-4fef7147c5d1	role list	saml	saml-role-list-mapper	\N	64cbd8af-432e-4175-b6fc-d737c256d24e
993d52cd-ab28-4983-8216-040cd8b32cea	full name	openid-connect	oidc-full-name-mapper	\N	6dc97505-f071-4fd4-bc01-58a56e5985eb
a47655ba-80f3-4296-8957-b5110e2038ad	family name	openid-connect	oidc-usermodel-property-mapper	\N	6dc97505-f071-4fd4-bc01-58a56e5985eb
162f2ffc-6e2b-4728-8c6e-cc91d98ed7b9	given name	openid-connect	oidc-usermodel-property-mapper	\N	6dc97505-f071-4fd4-bc01-58a56e5985eb
05882515-e627-4dd7-a5da-25675753211e	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	6dc97505-f071-4fd4-bc01-58a56e5985eb
1ef802dc-51a3-446a-b07c-17600d60aa69	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	6dc97505-f071-4fd4-bc01-58a56e5985eb
be8d22c4-5f47-4cfb-8072-8e6210d3ab16	username	openid-connect	oidc-usermodel-property-mapper	\N	6dc97505-f071-4fd4-bc01-58a56e5985eb
db6ae03a-810e-4b16-af37-c5ff674aae7c	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	6dc97505-f071-4fd4-bc01-58a56e5985eb
f5cc6a77-f811-4cd1-a1f8-c5e87f011147	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	6dc97505-f071-4fd4-bc01-58a56e5985eb
426f7ea3-aa27-4ca8-89c2-4c299d107125	website	openid-connect	oidc-usermodel-attribute-mapper	\N	6dc97505-f071-4fd4-bc01-58a56e5985eb
a3432896-6dfc-4d2d-9ce3-c505bce5fa41	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	6dc97505-f071-4fd4-bc01-58a56e5985eb
6ff40474-ed25-4e9a-b6c0-d5c11961047b	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	6dc97505-f071-4fd4-bc01-58a56e5985eb
10b48857-c9d4-4fdf-98e9-a4848b85d1fe	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	6dc97505-f071-4fd4-bc01-58a56e5985eb
d7801b63-f2ee-4e08-bbf1-c5283c339ab7	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	6dc97505-f071-4fd4-bc01-58a56e5985eb
427f3fdd-1456-4466-be23-8f9d6775bd9e	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	6dc97505-f071-4fd4-bc01-58a56e5985eb
827dcba8-fb07-4d31-895e-094b796dd6e6	email verified	openid-connect	oidc-usermodel-property-mapper	\N	e65b2bf1-e2a4-4015-8c78-cf732e9efe20
f5256121-043d-446a-9364-46f7fbc90e55	address	openid-connect	oidc-address-mapper	\N	e96c4d2e-33bb-45d7-8225-2578d24fa8b9
28f69014-99fb-4bac-9602-822918b7f3f0	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	4ba41e2c-1fd5-45d1-ab77-19269aaf5169
5627d1e0-6fde-4772-9b73-53d743afb539	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	4ba41e2c-1fd5-45d1-ab77-19269aaf5169
402a7f4b-5b9a-4a5d-b2da-323829a203ae	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	e65232e9-5405-4fa8-abfe-e6b74891c21f
492e91d7-1296-4c77-99cf-e225ec01f4cf	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	e65232e9-5405-4fa8-abfe-e6b74891c21f
d3898266-92a4-450d-86c5-d44727c74888	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	f299ed6e-d170-41f8-b7e1-2a63406adfcc
a6bbffc1-2d70-4f00-b6b2-ce19eae0d318	upn	openid-connect	oidc-usermodel-property-mapper	\N	31da5254-ec0d-4f84-b9b5-53804d14ba82
876a1d99-58b1-4a5f-a2af-3c85db0836f6	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	31da5254-ec0d-4f84-b9b5-53804d14ba82
a89e78b8-461c-469f-bed1-7003f30e4e04	acr loa level	openid-connect	oidc-acr-mapper	\N	676a39d7-db2d-4b0c-9ee7-0fe6e629c8ac
1c0ea23a-db2c-4428-97bb-373cdbeb8b48	locale	openid-connect	oidc-usermodel-attribute-mapper	fc659080-6f8b-4b2f-b7d8-ef7b5b859603	\N
ba9e6d86-f8fb-4a2a-9af2-a66e4921a6d1	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	e65232e9-5405-4fa8-abfe-e6b74891c21f
1ec1c95e-fe21-4f1c-a587-81dde8af7755	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	80bad978-251c-47e3-903a-86af08c4b811
12d42f78-7543-4083-a0be-5a230b33c92e	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	80bad978-251c-47e3-903a-86af08c4b811
8266b691-ebfb-4ad2-b325-88d888f82458	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	80bad978-251c-47e3-903a-86af08c4b811
ad786509-4d92-4612-a43c-cc67b00ae2c7	email	openid-connect	oidc-usermodel-property-mapper	\N	185f848c-dd45-46ad-81ce-26c5be5c0ee7
81a4ed4e-49c0-4116-b02f-90957607fc89	email verified	openid-connect	oidc-usermodel-property-mapper	\N	185f848c-dd45-46ad-81ce-26c5be5c0ee7
1929b434-dad4-46f2-9216-6f1ca6568048	address	openid-connect	oidc-address-mapper	\N	62334196-39d2-4539-89fd-f90101dc5e03
ae9a8265-9f28-49eb-aedd-f37a32c3299e	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	99c830a1-f8f5-4c82-8577-9d43ac671636
4cf3a3a8-95ac-4dde-9ff6-dfbb371d028e	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	99c830a1-f8f5-4c82-8577-9d43ac671636
0784d824-f286-47e3-a335-f4da5fa75621	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	4700486b-5409-48ed-bea9-f0257d6d0690
547cd825-abb8-4ea2-9d2f-12eef6fd8f81	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	4700486b-5409-48ed-bea9-f0257d6d0690
362e4366-8ec4-4d19-918b-d6a431b31364	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	1366450b-302c-48e2-bc7a-0a1f0a66479b
2632ef44-0641-476e-8213-b71968fe7ef9	upn	openid-connect	oidc-usermodel-property-mapper	\N	8aa30a2b-f3d5-406b-89f0-83e98d24df4a
60f8756a-ce28-4a3e-a246-06220bce2886	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	8aa30a2b-f3d5-406b-89f0-83e98d24df4a
8b90402f-ec86-4ddb-b708-227bbc334bb5	acr loa level	openid-connect	oidc-acr-mapper	\N	52c09584-d9a4-4bd6-b0ac-0fca69abc7b9
aa9be537-e3ff-41bd-8f51-753806ed9720	locale	openid-connect	oidc-usermodel-attribute-mapper	7a818d10-f579-486b-a765-914f257898e4	\N
8bc81b4a-32ac-46f6-957e-3f90ee7a1bdc	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	4700486b-5409-48ed-bea9-f0257d6d0690
a9f358c3-0eb0-4c63-a4c9-75e1fc7d9cb7	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	0c21cef9-585a-404e-b8f2-fbba43b1bb79
2288f707-0348-4331-8bb5-217a6b6f30b7	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	0c21cef9-585a-404e-b8f2-fbba43b1bb79
7b75648f-9913-4a86-a801-276dc6a04530	username	openid-connect	oidc-usermodel-property-mapper	\N	0c21cef9-585a-404e-b8f2-fbba43b1bb79
d02e3c83-f7f7-4d37-a2a2-cbee43a43420	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	0c21cef9-585a-404e-b8f2-fbba43b1bb79
37b45677-a252-4445-b77e-1940c39564cd	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	0c21cef9-585a-404e-b8f2-fbba43b1bb79
149a0cbc-8ef3-4a07-add4-d639857e9b63	website	openid-connect	oidc-usermodel-attribute-mapper	\N	0c21cef9-585a-404e-b8f2-fbba43b1bb79
bcbe0973-e9d3-4a36-a686-4c7a52fc416d	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	0c21cef9-585a-404e-b8f2-fbba43b1bb79
4270c557-26da-4a85-922c-09708c8cee10	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	0c21cef9-585a-404e-b8f2-fbba43b1bb79
c76a7968-0ee3-4a8d-8eb8-d9be0b7c3443	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	0c21cef9-585a-404e-b8f2-fbba43b1bb79
2d802eff-6e2c-450a-a161-932da82c5eee	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	0c21cef9-585a-404e-b8f2-fbba43b1bb79
4d3fbe49-9523-4cc6-989d-7973d14543e2	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	0c21cef9-585a-404e-b8f2-fbba43b1bb79
4f40e9b1-1e14-4336-a8b4-86d3aa1941bf	email	openid-connect	oidc-usermodel-property-mapper	\N	ae9bf4a6-05d1-4bef-9772-d5dc9b77710c
1d8af63a-ff8f-40a1-9ac8-316724afab93	email verified	openid-connect	oidc-usermodel-property-mapper	\N	ae9bf4a6-05d1-4bef-9772-d5dc9b77710c
8a2a2f22-06bb-4cbd-a9e2-64cebbc410d7	address	openid-connect	oidc-address-mapper	\N	eabf4c77-7d0b-403c-87e5-49a9243e3c8e
0e4e6f18-a40c-43ef-b9b4-2fdb5cd55463	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	c102a4f2-8de9-429c-88da-dd094ed17600
7c7da812-2837-46df-aa34-a62d47228d9d	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	c102a4f2-8de9-429c-88da-dd094ed17600
c48649ce-02d6-4c07-892d-ea1602aa6a25	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	ff5fe863-8734-4cf2-af69-f18261d53492
e43f6ab1-7e9d-406b-9f02-ff6e6b32c936	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	ff5fe863-8734-4cf2-af69-f18261d53492
32fc973a-c53d-4492-8339-385582c2a5f8	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	2845c8ab-6a7b-4ca0-b83a-182fc73907dd
e20068b5-8c1d-4a10-9092-9f147cae8f07	upn	openid-connect	oidc-usermodel-property-mapper	\N	46505150-ff79-4f47-909a-a520df58e767
00220872-c30a-498e-9179-634556fcd97e	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	46505150-ff79-4f47-909a-a520df58e767
b02c7ccb-b292-47f6-a5f9-2aea22d89f40	acr loa level	openid-connect	oidc-acr-mapper	\N	47600150-3aff-4e6b-8c8a-63030b7718a9
0c89f3bc-6134-4874-8728-35b797a836d2	locale	openid-connect	oidc-usermodel-attribute-mapper	8b95af71-6ef9-4cd2-8165-6bf8e2b397ab	\N
46616f08-d5a4-4c41-8a41-1ddbd3d771ff	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	ff5fe863-8734-4cf2-af69-f18261d53492
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
f251d6f5-18e0-4771-8df7-5e57fa6b4796	true	userinfo.token.claim
f251d6f5-18e0-4771-8df7-5e57fa6b4796	locale	user.attribute
f251d6f5-18e0-4771-8df7-5e57fa6b4796	true	id.token.claim
f251d6f5-18e0-4771-8df7-5e57fa6b4796	true	access.token.claim
f251d6f5-18e0-4771-8df7-5e57fa6b4796	locale	claim.name
f251d6f5-18e0-4771-8df7-5e57fa6b4796	String	jsonType.label
50c48537-adc6-4e57-8264-fcdf89993f1b	false	single
50c48537-adc6-4e57-8264-fcdf89993f1b	Basic	attribute.nameformat
50c48537-adc6-4e57-8264-fcdf89993f1b	Role	attribute.name
18e3f826-fb5b-45d9-a8cb-202a80b28c52	true	userinfo.token.claim
18e3f826-fb5b-45d9-a8cb-202a80b28c52	username	user.attribute
18e3f826-fb5b-45d9-a8cb-202a80b28c52	true	id.token.claim
18e3f826-fb5b-45d9-a8cb-202a80b28c52	true	access.token.claim
18e3f826-fb5b-45d9-a8cb-202a80b28c52	preferred_username	claim.name
18e3f826-fb5b-45d9-a8cb-202a80b28c52	String	jsonType.label
1ccc417a-9815-4bcd-adbd-411c38f186a9	true	userinfo.token.claim
1ccc417a-9815-4bcd-adbd-411c38f186a9	gender	user.attribute
1ccc417a-9815-4bcd-adbd-411c38f186a9	true	id.token.claim
1ccc417a-9815-4bcd-adbd-411c38f186a9	true	access.token.claim
1ccc417a-9815-4bcd-adbd-411c38f186a9	gender	claim.name
1ccc417a-9815-4bcd-adbd-411c38f186a9	String	jsonType.label
1f90ef85-dd0d-4ffa-b778-55a0e7439922	true	userinfo.token.claim
1f90ef85-dd0d-4ffa-b778-55a0e7439922	lastName	user.attribute
1f90ef85-dd0d-4ffa-b778-55a0e7439922	true	id.token.claim
1f90ef85-dd0d-4ffa-b778-55a0e7439922	true	access.token.claim
1f90ef85-dd0d-4ffa-b778-55a0e7439922	family_name	claim.name
1f90ef85-dd0d-4ffa-b778-55a0e7439922	String	jsonType.label
23ab97e5-862e-4a4f-9f8e-a3510446a0b2	true	userinfo.token.claim
23ab97e5-862e-4a4f-9f8e-a3510446a0b2	firstName	user.attribute
23ab97e5-862e-4a4f-9f8e-a3510446a0b2	true	id.token.claim
23ab97e5-862e-4a4f-9f8e-a3510446a0b2	true	access.token.claim
23ab97e5-862e-4a4f-9f8e-a3510446a0b2	given_name	claim.name
23ab97e5-862e-4a4f-9f8e-a3510446a0b2	String	jsonType.label
28a2042d-e559-4f82-9927-33101525fa4a	true	userinfo.token.claim
28a2042d-e559-4f82-9927-33101525fa4a	updatedAt	user.attribute
28a2042d-e559-4f82-9927-33101525fa4a	true	id.token.claim
28a2042d-e559-4f82-9927-33101525fa4a	true	access.token.claim
28a2042d-e559-4f82-9927-33101525fa4a	updated_at	claim.name
28a2042d-e559-4f82-9927-33101525fa4a	long	jsonType.label
47d9dcdb-dbb6-458f-a826-9b4ce597b9f3	true	userinfo.token.claim
47d9dcdb-dbb6-458f-a826-9b4ce597b9f3	website	user.attribute
47d9dcdb-dbb6-458f-a826-9b4ce597b9f3	true	id.token.claim
47d9dcdb-dbb6-458f-a826-9b4ce597b9f3	true	access.token.claim
47d9dcdb-dbb6-458f-a826-9b4ce597b9f3	website	claim.name
47d9dcdb-dbb6-458f-a826-9b4ce597b9f3	String	jsonType.label
493c3ee6-bf4c-4092-9fc1-fe99662b04ec	true	userinfo.token.claim
493c3ee6-bf4c-4092-9fc1-fe99662b04ec	nickname	user.attribute
493c3ee6-bf4c-4092-9fc1-fe99662b04ec	true	id.token.claim
493c3ee6-bf4c-4092-9fc1-fe99662b04ec	true	access.token.claim
493c3ee6-bf4c-4092-9fc1-fe99662b04ec	nickname	claim.name
493c3ee6-bf4c-4092-9fc1-fe99662b04ec	String	jsonType.label
56988037-3147-43f2-8eab-1a5bffa86bcd	true	userinfo.token.claim
56988037-3147-43f2-8eab-1a5bffa86bcd	picture	user.attribute
56988037-3147-43f2-8eab-1a5bffa86bcd	true	id.token.claim
56988037-3147-43f2-8eab-1a5bffa86bcd	true	access.token.claim
56988037-3147-43f2-8eab-1a5bffa86bcd	picture	claim.name
56988037-3147-43f2-8eab-1a5bffa86bcd	String	jsonType.label
8227a139-478f-4089-be2a-b46b1ff1ec4e	true	userinfo.token.claim
8227a139-478f-4089-be2a-b46b1ff1ec4e	birthdate	user.attribute
8227a139-478f-4089-be2a-b46b1ff1ec4e	true	id.token.claim
8227a139-478f-4089-be2a-b46b1ff1ec4e	true	access.token.claim
8227a139-478f-4089-be2a-b46b1ff1ec4e	birthdate	claim.name
8227a139-478f-4089-be2a-b46b1ff1ec4e	String	jsonType.label
85c711a2-3650-4962-98b2-d99d593a53b4	true	userinfo.token.claim
85c711a2-3650-4962-98b2-d99d593a53b4	zoneinfo	user.attribute
85c711a2-3650-4962-98b2-d99d593a53b4	true	id.token.claim
85c711a2-3650-4962-98b2-d99d593a53b4	true	access.token.claim
85c711a2-3650-4962-98b2-d99d593a53b4	zoneinfo	claim.name
85c711a2-3650-4962-98b2-d99d593a53b4	String	jsonType.label
94d06ff4-6040-4f4e-89b4-a92ff09e5d9d	true	userinfo.token.claim
94d06ff4-6040-4f4e-89b4-a92ff09e5d9d	true	id.token.claim
94d06ff4-6040-4f4e-89b4-a92ff09e5d9d	true	access.token.claim
aa9f7863-2049-44ac-a69a-76c08d8c3ed6	true	userinfo.token.claim
aa9f7863-2049-44ac-a69a-76c08d8c3ed6	middleName	user.attribute
aa9f7863-2049-44ac-a69a-76c08d8c3ed6	true	id.token.claim
aa9f7863-2049-44ac-a69a-76c08d8c3ed6	true	access.token.claim
aa9f7863-2049-44ac-a69a-76c08d8c3ed6	middle_name	claim.name
aa9f7863-2049-44ac-a69a-76c08d8c3ed6	String	jsonType.label
acb44df9-49e4-489d-9ffb-da8b758c32c8	true	userinfo.token.claim
acb44df9-49e4-489d-9ffb-da8b758c32c8	profile	user.attribute
acb44df9-49e4-489d-9ffb-da8b758c32c8	true	id.token.claim
acb44df9-49e4-489d-9ffb-da8b758c32c8	true	access.token.claim
acb44df9-49e4-489d-9ffb-da8b758c32c8	profile	claim.name
acb44df9-49e4-489d-9ffb-da8b758c32c8	String	jsonType.label
c1b46ffa-2b25-41e6-8a79-bbd8289507a0	true	userinfo.token.claim
c1b46ffa-2b25-41e6-8a79-bbd8289507a0	locale	user.attribute
c1b46ffa-2b25-41e6-8a79-bbd8289507a0	true	id.token.claim
c1b46ffa-2b25-41e6-8a79-bbd8289507a0	true	access.token.claim
c1b46ffa-2b25-41e6-8a79-bbd8289507a0	locale	claim.name
c1b46ffa-2b25-41e6-8a79-bbd8289507a0	String	jsonType.label
c613c303-7422-46d8-bc39-9a38285ce0e3	true	userinfo.token.claim
c613c303-7422-46d8-bc39-9a38285ce0e3	email	user.attribute
c613c303-7422-46d8-bc39-9a38285ce0e3	true	id.token.claim
c613c303-7422-46d8-bc39-9a38285ce0e3	true	access.token.claim
c613c303-7422-46d8-bc39-9a38285ce0e3	email	claim.name
c613c303-7422-46d8-bc39-9a38285ce0e3	String	jsonType.label
fa7ede02-1a9b-4ff1-bcc3-27e0530e04ad	true	userinfo.token.claim
fa7ede02-1a9b-4ff1-bcc3-27e0530e04ad	emailVerified	user.attribute
fa7ede02-1a9b-4ff1-bcc3-27e0530e04ad	true	id.token.claim
fa7ede02-1a9b-4ff1-bcc3-27e0530e04ad	true	access.token.claim
fa7ede02-1a9b-4ff1-bcc3-27e0530e04ad	email_verified	claim.name
fa7ede02-1a9b-4ff1-bcc3-27e0530e04ad	boolean	jsonType.label
a63a3198-052e-41bf-bef4-be9a93c7ce30	formatted	user.attribute.formatted
a63a3198-052e-41bf-bef4-be9a93c7ce30	country	user.attribute.country
a63a3198-052e-41bf-bef4-be9a93c7ce30	postal_code	user.attribute.postal_code
a63a3198-052e-41bf-bef4-be9a93c7ce30	true	userinfo.token.claim
a63a3198-052e-41bf-bef4-be9a93c7ce30	street	user.attribute.street
a63a3198-052e-41bf-bef4-be9a93c7ce30	true	id.token.claim
a63a3198-052e-41bf-bef4-be9a93c7ce30	region	user.attribute.region
a63a3198-052e-41bf-bef4-be9a93c7ce30	true	access.token.claim
a63a3198-052e-41bf-bef4-be9a93c7ce30	locality	user.attribute.locality
18ef8a40-331b-452e-9939-1616d9ec55bb	true	userinfo.token.claim
18ef8a40-331b-452e-9939-1616d9ec55bb	phoneNumber	user.attribute
18ef8a40-331b-452e-9939-1616d9ec55bb	true	id.token.claim
18ef8a40-331b-452e-9939-1616d9ec55bb	true	access.token.claim
18ef8a40-331b-452e-9939-1616d9ec55bb	phone_number	claim.name
18ef8a40-331b-452e-9939-1616d9ec55bb	String	jsonType.label
69d3e901-c343-420b-82d4-f4c17965f492	true	userinfo.token.claim
69d3e901-c343-420b-82d4-f4c17965f492	phoneNumberVerified	user.attribute
69d3e901-c343-420b-82d4-f4c17965f492	true	id.token.claim
69d3e901-c343-420b-82d4-f4c17965f492	true	access.token.claim
69d3e901-c343-420b-82d4-f4c17965f492	phone_number_verified	claim.name
69d3e901-c343-420b-82d4-f4c17965f492	boolean	jsonType.label
4fe34817-327b-4f04-b0c9-0c94404ddae9	true	multivalued
011dcd91-7756-4868-b85a-5a9bcabf564f	false	single
4fe34817-327b-4f04-b0c9-0c94404ddae9	true	access.token.claim
011dcd91-7756-4868-b85a-5a9bcabf564f	Basic	attribute.nameformat
4fe34817-327b-4f04-b0c9-0c94404ddae9	String	jsonType.label
011dcd91-7756-4868-b85a-5a9bcabf564f	Role	attribute.name
08a47d89-1a98-4753-8f09-e7acd458ad30	true	userinfo.token.claim
08a47d89-1a98-4753-8f09-e7acd458ad30	username	user.attribute
08a47d89-1a98-4753-8f09-e7acd458ad30	true	id.token.claim
08a47d89-1a98-4753-8f09-e7acd458ad30	true	access.token.claim
0e237006-c8e4-4028-8023-f723459a9795	true	userinfo.token.claim
0e237006-c8e4-4028-8023-f723459a9795	username	user.attribute
0e237006-c8e4-4028-8023-f723459a9795	true	id.token.claim
0e237006-c8e4-4028-8023-f723459a9795	true	access.token.claim
0e237006-c8e4-4028-8023-f723459a9795	upn	claim.name
0e237006-c8e4-4028-8023-f723459a9795	String	jsonType.label
3aa3b39a-5638-441c-a696-ea1a76c441d6	true	multivalued
3aa3b39a-5638-441c-a696-ea1a76c441d6	foo	user.attribute
3aa3b39a-5638-441c-a696-ea1a76c441d6	true	id.token.claim
3aa3b39a-5638-441c-a696-ea1a76c441d6	true	access.token.claim
3aa3b39a-5638-441c-a696-ea1a76c441d6	groups	claim.name
3aa3b39a-5638-441c-a696-ea1a76c441d6	String	jsonType.label
d0d2ed69-e8cb-4e1d-a842-504c5287d8c4	true	id.token.claim
d0d2ed69-e8cb-4e1d-a842-504c5287d8c4	true	access.token.claim
cbfa9e94-ef60-494c-ae12-447f00c7db0d	false	single
cbfa9e94-ef60-494c-ae12-447f00c7db0d	Basic	attribute.nameformat
cbfa9e94-ef60-494c-ae12-447f00c7db0d	Role	attribute.name
2f0df46a-f82b-4054-8ff6-123945142c07	true	userinfo.token.claim
2f0df46a-f82b-4054-8ff6-123945142c07	nickname	user.attribute
2f0df46a-f82b-4054-8ff6-123945142c07	true	id.token.claim
2f0df46a-f82b-4054-8ff6-123945142c07	true	access.token.claim
2f0df46a-f82b-4054-8ff6-123945142c07	nickname	claim.name
2f0df46a-f82b-4054-8ff6-123945142c07	String	jsonType.label
5883b107-16ad-479e-b51b-85b9f5448071	true	userinfo.token.claim
5883b107-16ad-479e-b51b-85b9f5448071	username	user.attribute
5883b107-16ad-479e-b51b-85b9f5448071	true	id.token.claim
5883b107-16ad-479e-b51b-85b9f5448071	true	access.token.claim
5883b107-16ad-479e-b51b-85b9f5448071	preferred_username	claim.name
5883b107-16ad-479e-b51b-85b9f5448071	String	jsonType.label
5c28c851-ed4f-43b0-a871-09221a3d298b	true	userinfo.token.claim
5c28c851-ed4f-43b0-a871-09221a3d298b	zoneinfo	user.attribute
5c28c851-ed4f-43b0-a871-09221a3d298b	true	id.token.claim
5c28c851-ed4f-43b0-a871-09221a3d298b	true	access.token.claim
5c28c851-ed4f-43b0-a871-09221a3d298b	zoneinfo	claim.name
5c28c851-ed4f-43b0-a871-09221a3d298b	String	jsonType.label
75a87884-b611-4541-9f08-ed5b5b6074f5	true	userinfo.token.claim
75a87884-b611-4541-9f08-ed5b5b6074f5	gender	user.attribute
75a87884-b611-4541-9f08-ed5b5b6074f5	true	id.token.claim
75a87884-b611-4541-9f08-ed5b5b6074f5	true	access.token.claim
75a87884-b611-4541-9f08-ed5b5b6074f5	gender	claim.name
75a87884-b611-4541-9f08-ed5b5b6074f5	String	jsonType.label
7b22c474-e551-4511-b650-abb36a5f5949	true	userinfo.token.claim
7b22c474-e551-4511-b650-abb36a5f5949	website	user.attribute
7b22c474-e551-4511-b650-abb36a5f5949	true	id.token.claim
7b22c474-e551-4511-b650-abb36a5f5949	true	access.token.claim
7b22c474-e551-4511-b650-abb36a5f5949	website	claim.name
7b22c474-e551-4511-b650-abb36a5f5949	String	jsonType.label
7e6730f6-75f5-4bd0-9551-93049d33acdd	true	userinfo.token.claim
7e6730f6-75f5-4bd0-9551-93049d33acdd	locale	user.attribute
7e6730f6-75f5-4bd0-9551-93049d33acdd	true	id.token.claim
7e6730f6-75f5-4bd0-9551-93049d33acdd	true	access.token.claim
7e6730f6-75f5-4bd0-9551-93049d33acdd	locale	claim.name
7e6730f6-75f5-4bd0-9551-93049d33acdd	String	jsonType.label
8b781952-b3bc-4e2f-97f5-875388136dc1	true	userinfo.token.claim
8b781952-b3bc-4e2f-97f5-875388136dc1	updatedAt	user.attribute
8b781952-b3bc-4e2f-97f5-875388136dc1	true	id.token.claim
8b781952-b3bc-4e2f-97f5-875388136dc1	true	access.token.claim
8b781952-b3bc-4e2f-97f5-875388136dc1	updated_at	claim.name
8b781952-b3bc-4e2f-97f5-875388136dc1	long	jsonType.label
9e3f1ed1-9a55-446e-a91a-9842ae7c9c96	true	userinfo.token.claim
9e3f1ed1-9a55-446e-a91a-9842ae7c9c96	birthdate	user.attribute
9e3f1ed1-9a55-446e-a91a-9842ae7c9c96	true	id.token.claim
9e3f1ed1-9a55-446e-a91a-9842ae7c9c96	true	access.token.claim
9e3f1ed1-9a55-446e-a91a-9842ae7c9c96	birthdate	claim.name
9e3f1ed1-9a55-446e-a91a-9842ae7c9c96	String	jsonType.label
c223f960-55cb-4f5e-9907-371b61bcd50a	true	userinfo.token.claim
c223f960-55cb-4f5e-9907-371b61bcd50a	lastName	user.attribute
c223f960-55cb-4f5e-9907-371b61bcd50a	true	id.token.claim
c223f960-55cb-4f5e-9907-371b61bcd50a	true	access.token.claim
c223f960-55cb-4f5e-9907-371b61bcd50a	family_name	claim.name
c223f960-55cb-4f5e-9907-371b61bcd50a	String	jsonType.label
c9b13a07-e5b5-4d7e-a64c-544f5815610d	true	userinfo.token.claim
c9b13a07-e5b5-4d7e-a64c-544f5815610d	firstName	user.attribute
c9b13a07-e5b5-4d7e-a64c-544f5815610d	true	id.token.claim
c9b13a07-e5b5-4d7e-a64c-544f5815610d	true	access.token.claim
c9b13a07-e5b5-4d7e-a64c-544f5815610d	given_name	claim.name
c9b13a07-e5b5-4d7e-a64c-544f5815610d	String	jsonType.label
cb044a5a-fc71-412e-bec2-33fa1d859c16	true	userinfo.token.claim
cb044a5a-fc71-412e-bec2-33fa1d859c16	middleName	user.attribute
cb044a5a-fc71-412e-bec2-33fa1d859c16	true	id.token.claim
cb044a5a-fc71-412e-bec2-33fa1d859c16	true	access.token.claim
cb044a5a-fc71-412e-bec2-33fa1d859c16	middle_name	claim.name
cb044a5a-fc71-412e-bec2-33fa1d859c16	String	jsonType.label
cb34b6d5-000a-403f-a940-61eb69dd19ac	true	userinfo.token.claim
cb34b6d5-000a-403f-a940-61eb69dd19ac	true	id.token.claim
cb34b6d5-000a-403f-a940-61eb69dd19ac	true	access.token.claim
cfefde3d-2209-49d9-a930-b6d6b7eba5f9	true	userinfo.token.claim
cfefde3d-2209-49d9-a930-b6d6b7eba5f9	profile	user.attribute
cfefde3d-2209-49d9-a930-b6d6b7eba5f9	true	id.token.claim
cfefde3d-2209-49d9-a930-b6d6b7eba5f9	true	access.token.claim
cfefde3d-2209-49d9-a930-b6d6b7eba5f9	profile	claim.name
cfefde3d-2209-49d9-a930-b6d6b7eba5f9	String	jsonType.label
eb0b5d78-183f-4318-a3ba-140e01e7574e	true	userinfo.token.claim
eb0b5d78-183f-4318-a3ba-140e01e7574e	picture	user.attribute
eb0b5d78-183f-4318-a3ba-140e01e7574e	true	id.token.claim
eb0b5d78-183f-4318-a3ba-140e01e7574e	true	access.token.claim
eb0b5d78-183f-4318-a3ba-140e01e7574e	picture	claim.name
eb0b5d78-183f-4318-a3ba-140e01e7574e	String	jsonType.label
076b3ba1-40bd-4ebd-a3e8-b3f48810058f	true	userinfo.token.claim
076b3ba1-40bd-4ebd-a3e8-b3f48810058f	email	user.attribute
076b3ba1-40bd-4ebd-a3e8-b3f48810058f	true	id.token.claim
076b3ba1-40bd-4ebd-a3e8-b3f48810058f	true	access.token.claim
076b3ba1-40bd-4ebd-a3e8-b3f48810058f	email	claim.name
076b3ba1-40bd-4ebd-a3e8-b3f48810058f	String	jsonType.label
642e4c18-3233-4993-87bf-297901caf788	true	userinfo.token.claim
642e4c18-3233-4993-87bf-297901caf788	emailVerified	user.attribute
642e4c18-3233-4993-87bf-297901caf788	true	id.token.claim
642e4c18-3233-4993-87bf-297901caf788	true	access.token.claim
642e4c18-3233-4993-87bf-297901caf788	email_verified	claim.name
642e4c18-3233-4993-87bf-297901caf788	boolean	jsonType.label
4de1ef1d-3fe8-4943-b88c-8a536e6aedef	formatted	user.attribute.formatted
4de1ef1d-3fe8-4943-b88c-8a536e6aedef	country	user.attribute.country
4de1ef1d-3fe8-4943-b88c-8a536e6aedef	postal_code	user.attribute.postal_code
4de1ef1d-3fe8-4943-b88c-8a536e6aedef	true	userinfo.token.claim
4de1ef1d-3fe8-4943-b88c-8a536e6aedef	street	user.attribute.street
4de1ef1d-3fe8-4943-b88c-8a536e6aedef	true	id.token.claim
4de1ef1d-3fe8-4943-b88c-8a536e6aedef	region	user.attribute.region
4de1ef1d-3fe8-4943-b88c-8a536e6aedef	true	access.token.claim
4de1ef1d-3fe8-4943-b88c-8a536e6aedef	locality	user.attribute.locality
7b32a539-c2cf-46fc-a8a5-8f792b3bb3df	true	userinfo.token.claim
7b32a539-c2cf-46fc-a8a5-8f792b3bb3df	phoneNumberVerified	user.attribute
7b32a539-c2cf-46fc-a8a5-8f792b3bb3df	true	id.token.claim
7b32a539-c2cf-46fc-a8a5-8f792b3bb3df	true	access.token.claim
7b32a539-c2cf-46fc-a8a5-8f792b3bb3df	phone_number_verified	claim.name
7b32a539-c2cf-46fc-a8a5-8f792b3bb3df	boolean	jsonType.label
873b6db5-1288-48ac-a360-0d31169c385d	true	userinfo.token.claim
873b6db5-1288-48ac-a360-0d31169c385d	phoneNumber	user.attribute
873b6db5-1288-48ac-a360-0d31169c385d	true	id.token.claim
873b6db5-1288-48ac-a360-0d31169c385d	true	access.token.claim
873b6db5-1288-48ac-a360-0d31169c385d	phone_number	claim.name
873b6db5-1288-48ac-a360-0d31169c385d	String	jsonType.label
22a735d3-5aee-434a-b7d2-d37718dbe3c2	true	multivalued
08a47d89-1a98-4753-8f09-e7acd458ad30	preferred_username	claim.name
22a735d3-5aee-434a-b7d2-d37718dbe3c2	true	access.token.claim
22a735d3-5aee-434a-b7d2-d37718dbe3c2	String	jsonType.label
d6591afa-9a26-479a-a718-de8435572dbf	true	multivalued
d6591afa-9a26-479a-a718-de8435572dbf	foo	user.attribute
d6591afa-9a26-479a-a718-de8435572dbf	true	access.token.claim
d6591afa-9a26-479a-a718-de8435572dbf	resource_access.${client_id}.roles	claim.name
d6591afa-9a26-479a-a718-de8435572dbf	String	jsonType.label
3729f154-435c-4480-bc68-4e779c27fa6c	true	multivalued
3729f154-435c-4480-bc68-4e779c27fa6c	foo	user.attribute
3729f154-435c-4480-bc68-4e779c27fa6c	true	id.token.claim
3729f154-435c-4480-bc68-4e779c27fa6c	true	access.token.claim
3729f154-435c-4480-bc68-4e779c27fa6c	groups	claim.name
3729f154-435c-4480-bc68-4e779c27fa6c	String	jsonType.label
565690dd-ec32-4efd-a826-afb492558a08	true	userinfo.token.claim
565690dd-ec32-4efd-a826-afb492558a08	username	user.attribute
565690dd-ec32-4efd-a826-afb492558a08	true	id.token.claim
565690dd-ec32-4efd-a826-afb492558a08	true	access.token.claim
565690dd-ec32-4efd-a826-afb492558a08	upn	claim.name
565690dd-ec32-4efd-a826-afb492558a08	String	jsonType.label
97906230-1a56-4cf2-b07d-f0d75113d6d1	true	id.token.claim
97906230-1a56-4cf2-b07d-f0d75113d6d1	true	access.token.claim
3cda03ab-fe3d-4c56-a109-a79a12fb7657	true	userinfo.token.claim
3cda03ab-fe3d-4c56-a109-a79a12fb7657	locale	user.attribute
3cda03ab-fe3d-4c56-a109-a79a12fb7657	true	id.token.claim
3cda03ab-fe3d-4c56-a109-a79a12fb7657	true	access.token.claim
3cda03ab-fe3d-4c56-a109-a79a12fb7657	locale	claim.name
3cda03ab-fe3d-4c56-a109-a79a12fb7657	String	jsonType.label
4fe34817-327b-4f04-b0c9-0c94404ddae9	roles	claim.name
4fe34817-327b-4f04-b0c9-0c94404ddae9	true	userinfo.token.claim
4fe34817-327b-4f04-b0c9-0c94404ddae9	true	id.token.claim
22a735d3-5aee-434a-b7d2-d37718dbe3c2	roles	claim.name
22a735d3-5aee-434a-b7d2-d37718dbe3c2	true	userinfo.token.claim
22a735d3-5aee-434a-b7d2-d37718dbe3c2	true	id.token.claim
08a47d89-1a98-4753-8f09-e7acd458ad30	String	jsonType.label
1317fb97-d2f4-4647-95b0-f462b8cca17e	true	userinfo.token.claim
1317fb97-d2f4-4647-95b0-f462b8cca17e	nickname	user.attribute
1317fb97-d2f4-4647-95b0-f462b8cca17e	true	id.token.claim
1317fb97-d2f4-4647-95b0-f462b8cca17e	true	access.token.claim
1317fb97-d2f4-4647-95b0-f462b8cca17e	nickname	claim.name
1317fb97-d2f4-4647-95b0-f462b8cca17e	String	jsonType.label
20cab531-5ac0-4568-b00c-5109e00314b6	true	userinfo.token.claim
20cab531-5ac0-4568-b00c-5109e00314b6	birthdate	user.attribute
20cab531-5ac0-4568-b00c-5109e00314b6	true	id.token.claim
20cab531-5ac0-4568-b00c-5109e00314b6	true	access.token.claim
20cab531-5ac0-4568-b00c-5109e00314b6	birthdate	claim.name
20cab531-5ac0-4568-b00c-5109e00314b6	String	jsonType.label
2b0ad430-839f-4c15-9f44-838025e0f6ad	true	userinfo.token.claim
2b0ad430-839f-4c15-9f44-838025e0f6ad	middleName	user.attribute
2b0ad430-839f-4c15-9f44-838025e0f6ad	true	id.token.claim
2b0ad430-839f-4c15-9f44-838025e0f6ad	true	access.token.claim
2b0ad430-839f-4c15-9f44-838025e0f6ad	middle_name	claim.name
2b0ad430-839f-4c15-9f44-838025e0f6ad	String	jsonType.label
3dedc4d4-b6f0-4154-8107-7e1110ba31dc	true	userinfo.token.claim
3dedc4d4-b6f0-4154-8107-7e1110ba31dc	locale	user.attribute
3dedc4d4-b6f0-4154-8107-7e1110ba31dc	true	id.token.claim
3dedc4d4-b6f0-4154-8107-7e1110ba31dc	true	access.token.claim
3dedc4d4-b6f0-4154-8107-7e1110ba31dc	locale	claim.name
3dedc4d4-b6f0-4154-8107-7e1110ba31dc	String	jsonType.label
59ff9bce-d347-4520-89f0-697bc37e4c13	true	userinfo.token.claim
59ff9bce-d347-4520-89f0-697bc37e4c13	gender	user.attribute
59ff9bce-d347-4520-89f0-697bc37e4c13	true	id.token.claim
59ff9bce-d347-4520-89f0-697bc37e4c13	true	access.token.claim
59ff9bce-d347-4520-89f0-697bc37e4c13	gender	claim.name
59ff9bce-d347-4520-89f0-697bc37e4c13	String	jsonType.label
5ccca390-3c3b-42cd-9e95-18b62a0f4d0a	true	userinfo.token.claim
5ccca390-3c3b-42cd-9e95-18b62a0f4d0a	profile	user.attribute
5ccca390-3c3b-42cd-9e95-18b62a0f4d0a	true	id.token.claim
5ccca390-3c3b-42cd-9e95-18b62a0f4d0a	true	access.token.claim
5ccca390-3c3b-42cd-9e95-18b62a0f4d0a	profile	claim.name
5ccca390-3c3b-42cd-9e95-18b62a0f4d0a	String	jsonType.label
7fa000e8-9ae9-44a8-8d2a-4cc1275b4f59	true	userinfo.token.claim
7fa000e8-9ae9-44a8-8d2a-4cc1275b4f59	true	id.token.claim
7fa000e8-9ae9-44a8-8d2a-4cc1275b4f59	true	access.token.claim
7fe7df76-092f-4400-a323-1c92c93ee8b5	true	userinfo.token.claim
7fe7df76-092f-4400-a323-1c92c93ee8b5	firstName	user.attribute
7fe7df76-092f-4400-a323-1c92c93ee8b5	true	id.token.claim
7fe7df76-092f-4400-a323-1c92c93ee8b5	true	access.token.claim
7fe7df76-092f-4400-a323-1c92c93ee8b5	given_name	claim.name
7fe7df76-092f-4400-a323-1c92c93ee8b5	String	jsonType.label
85b2b5d1-0a2f-40e8-826a-e9b11de73cc7	true	userinfo.token.claim
85b2b5d1-0a2f-40e8-826a-e9b11de73cc7	picture	user.attribute
85b2b5d1-0a2f-40e8-826a-e9b11de73cc7	true	id.token.claim
85b2b5d1-0a2f-40e8-826a-e9b11de73cc7	true	access.token.claim
85b2b5d1-0a2f-40e8-826a-e9b11de73cc7	picture	claim.name
85b2b5d1-0a2f-40e8-826a-e9b11de73cc7	String	jsonType.label
8d41e5b5-3bbe-41b1-8fb3-689441421bb2	true	userinfo.token.claim
8d41e5b5-3bbe-41b1-8fb3-689441421bb2	website	user.attribute
8d41e5b5-3bbe-41b1-8fb3-689441421bb2	true	id.token.claim
8d41e5b5-3bbe-41b1-8fb3-689441421bb2	true	access.token.claim
8d41e5b5-3bbe-41b1-8fb3-689441421bb2	website	claim.name
8d41e5b5-3bbe-41b1-8fb3-689441421bb2	String	jsonType.label
ae3d6603-3219-442a-850d-9b89efb369b0	true	userinfo.token.claim
ae3d6603-3219-442a-850d-9b89efb369b0	updatedAt	user.attribute
ae3d6603-3219-442a-850d-9b89efb369b0	true	id.token.claim
ae3d6603-3219-442a-850d-9b89efb369b0	true	access.token.claim
ae3d6603-3219-442a-850d-9b89efb369b0	updated_at	claim.name
ae3d6603-3219-442a-850d-9b89efb369b0	long	jsonType.label
b96bc57e-fc21-4dd3-a1fd-6d27623da665	true	userinfo.token.claim
b96bc57e-fc21-4dd3-a1fd-6d27623da665	zoneinfo	user.attribute
b96bc57e-fc21-4dd3-a1fd-6d27623da665	true	id.token.claim
b96bc57e-fc21-4dd3-a1fd-6d27623da665	true	access.token.claim
b96bc57e-fc21-4dd3-a1fd-6d27623da665	zoneinfo	claim.name
b96bc57e-fc21-4dd3-a1fd-6d27623da665	String	jsonType.label
c789491f-ef49-4409-a489-8bf9032d1822	true	userinfo.token.claim
c789491f-ef49-4409-a489-8bf9032d1822	lastName	user.attribute
c789491f-ef49-4409-a489-8bf9032d1822	true	id.token.claim
c789491f-ef49-4409-a489-8bf9032d1822	true	access.token.claim
c789491f-ef49-4409-a489-8bf9032d1822	family_name	claim.name
c789491f-ef49-4409-a489-8bf9032d1822	String	jsonType.label
939c9c30-1833-47d4-bee6-c49df4a51ed4	true	userinfo.token.claim
939c9c30-1833-47d4-bee6-c49df4a51ed4	email	user.attribute
939c9c30-1833-47d4-bee6-c49df4a51ed4	true	id.token.claim
939c9c30-1833-47d4-bee6-c49df4a51ed4	true	access.token.claim
939c9c30-1833-47d4-bee6-c49df4a51ed4	email	claim.name
939c9c30-1833-47d4-bee6-c49df4a51ed4	String	jsonType.label
b253f36d-ad01-40cc-84b9-0ba215567b8b	true	userinfo.token.claim
b253f36d-ad01-40cc-84b9-0ba215567b8b	emailVerified	user.attribute
b253f36d-ad01-40cc-84b9-0ba215567b8b	true	id.token.claim
b253f36d-ad01-40cc-84b9-0ba215567b8b	true	access.token.claim
b253f36d-ad01-40cc-84b9-0ba215567b8b	email_verified	claim.name
b253f36d-ad01-40cc-84b9-0ba215567b8b	boolean	jsonType.label
ca5a0c18-6bdc-475f-adf0-2d56b66b8a1b	formatted	user.attribute.formatted
ca5a0c18-6bdc-475f-adf0-2d56b66b8a1b	country	user.attribute.country
ca5a0c18-6bdc-475f-adf0-2d56b66b8a1b	postal_code	user.attribute.postal_code
ca5a0c18-6bdc-475f-adf0-2d56b66b8a1b	true	userinfo.token.claim
ca5a0c18-6bdc-475f-adf0-2d56b66b8a1b	street	user.attribute.street
ca5a0c18-6bdc-475f-adf0-2d56b66b8a1b	true	id.token.claim
ca5a0c18-6bdc-475f-adf0-2d56b66b8a1b	region	user.attribute.region
ca5a0c18-6bdc-475f-adf0-2d56b66b8a1b	true	access.token.claim
ca5a0c18-6bdc-475f-adf0-2d56b66b8a1b	locality	user.attribute.locality
1fda047f-de59-4d3c-9704-47233fdba955	true	userinfo.token.claim
1fda047f-de59-4d3c-9704-47233fdba955	phoneNumberVerified	user.attribute
1fda047f-de59-4d3c-9704-47233fdba955	true	id.token.claim
1fda047f-de59-4d3c-9704-47233fdba955	true	access.token.claim
1fda047f-de59-4d3c-9704-47233fdba955	phone_number_verified	claim.name
1fda047f-de59-4d3c-9704-47233fdba955	boolean	jsonType.label
59404bb6-f8d3-4fef-b95e-d25e5b9d55c0	true	userinfo.token.claim
59404bb6-f8d3-4fef-b95e-d25e5b9d55c0	phoneNumber	user.attribute
59404bb6-f8d3-4fef-b95e-d25e5b9d55c0	true	id.token.claim
59404bb6-f8d3-4fef-b95e-d25e5b9d55c0	true	access.token.claim
59404bb6-f8d3-4fef-b95e-d25e5b9d55c0	phone_number	claim.name
59404bb6-f8d3-4fef-b95e-d25e5b9d55c0	String	jsonType.label
2ac876c2-821c-4376-9a1a-bc92c9fd4ef4	true	multivalued
2ac876c2-821c-4376-9a1a-bc92c9fd4ef4	foo	user.attribute
2ac876c2-821c-4376-9a1a-bc92c9fd4ef4	true	access.token.claim
2ac876c2-821c-4376-9a1a-bc92c9fd4ef4	resource_access.${client_id}.roles	claim.name
2ac876c2-821c-4376-9a1a-bc92c9fd4ef4	String	jsonType.label
ddbf32bb-55c4-46a8-8705-4debef607818	true	multivalued
ddbf32bb-55c4-46a8-8705-4debef607818	foo	user.attribute
ddbf32bb-55c4-46a8-8705-4debef607818	true	access.token.claim
ddbf32bb-55c4-46a8-8705-4debef607818	String	jsonType.label
47a6d6dd-2be0-443f-aae0-a35b43ed4500	true	userinfo.token.claim
47a6d6dd-2be0-443f-aae0-a35b43ed4500	username	user.attribute
47a6d6dd-2be0-443f-aae0-a35b43ed4500	true	id.token.claim
47a6d6dd-2be0-443f-aae0-a35b43ed4500	true	access.token.claim
47a6d6dd-2be0-443f-aae0-a35b43ed4500	upn	claim.name
47a6d6dd-2be0-443f-aae0-a35b43ed4500	String	jsonType.label
5ae4de5d-0f3f-444c-abf2-46e9b3fa31c1	true	multivalued
5ae4de5d-0f3f-444c-abf2-46e9b3fa31c1	foo	user.attribute
5ae4de5d-0f3f-444c-abf2-46e9b3fa31c1	true	id.token.claim
5ae4de5d-0f3f-444c-abf2-46e9b3fa31c1	true	access.token.claim
5ae4de5d-0f3f-444c-abf2-46e9b3fa31c1	groups	claim.name
5ae4de5d-0f3f-444c-abf2-46e9b3fa31c1	String	jsonType.label
a695aa98-db82-429e-a005-641996bc9609	true	id.token.claim
a695aa98-db82-429e-a005-641996bc9609	true	access.token.claim
2791528c-9c0c-4f84-8a89-cbb052e2c398	true	userinfo.token.claim
2791528c-9c0c-4f84-8a89-cbb052e2c398	locale	user.attribute
2791528c-9c0c-4f84-8a89-cbb052e2c398	true	id.token.claim
2791528c-9c0c-4f84-8a89-cbb052e2c398	true	access.token.claim
2791528c-9c0c-4f84-8a89-cbb052e2c398	locale	claim.name
2791528c-9c0c-4f84-8a89-cbb052e2c398	String	jsonType.label
d4540cc4-4f51-4550-8151-4fef7147c5d1	false	single
d4540cc4-4f51-4550-8151-4fef7147c5d1	Basic	attribute.nameformat
d4540cc4-4f51-4550-8151-4fef7147c5d1	Role	attribute.name
ddbf32bb-55c4-46a8-8705-4debef607818	roles	claim.name
ddbf32bb-55c4-46a8-8705-4debef607818	true	userinfo.token.claim
05882515-e627-4dd7-a5da-25675753211e	true	userinfo.token.claim
05882515-e627-4dd7-a5da-25675753211e	middleName	user.attribute
05882515-e627-4dd7-a5da-25675753211e	true	id.token.claim
05882515-e627-4dd7-a5da-25675753211e	true	access.token.claim
05882515-e627-4dd7-a5da-25675753211e	middle_name	claim.name
05882515-e627-4dd7-a5da-25675753211e	String	jsonType.label
10b48857-c9d4-4fdf-98e9-a4848b85d1fe	true	userinfo.token.claim
10b48857-c9d4-4fdf-98e9-a4848b85d1fe	zoneinfo	user.attribute
10b48857-c9d4-4fdf-98e9-a4848b85d1fe	true	id.token.claim
10b48857-c9d4-4fdf-98e9-a4848b85d1fe	true	access.token.claim
10b48857-c9d4-4fdf-98e9-a4848b85d1fe	zoneinfo	claim.name
10b48857-c9d4-4fdf-98e9-a4848b85d1fe	String	jsonType.label
162f2ffc-6e2b-4728-8c6e-cc91d98ed7b9	true	userinfo.token.claim
162f2ffc-6e2b-4728-8c6e-cc91d98ed7b9	firstName	user.attribute
162f2ffc-6e2b-4728-8c6e-cc91d98ed7b9	true	id.token.claim
162f2ffc-6e2b-4728-8c6e-cc91d98ed7b9	true	access.token.claim
162f2ffc-6e2b-4728-8c6e-cc91d98ed7b9	given_name	claim.name
162f2ffc-6e2b-4728-8c6e-cc91d98ed7b9	String	jsonType.label
1ef802dc-51a3-446a-b07c-17600d60aa69	true	userinfo.token.claim
1ef802dc-51a3-446a-b07c-17600d60aa69	nickname	user.attribute
1ef802dc-51a3-446a-b07c-17600d60aa69	true	id.token.claim
1ef802dc-51a3-446a-b07c-17600d60aa69	true	access.token.claim
1ef802dc-51a3-446a-b07c-17600d60aa69	nickname	claim.name
1ef802dc-51a3-446a-b07c-17600d60aa69	String	jsonType.label
426f7ea3-aa27-4ca8-89c2-4c299d107125	true	userinfo.token.claim
426f7ea3-aa27-4ca8-89c2-4c299d107125	website	user.attribute
426f7ea3-aa27-4ca8-89c2-4c299d107125	true	id.token.claim
426f7ea3-aa27-4ca8-89c2-4c299d107125	true	access.token.claim
426f7ea3-aa27-4ca8-89c2-4c299d107125	website	claim.name
426f7ea3-aa27-4ca8-89c2-4c299d107125	String	jsonType.label
427f3fdd-1456-4466-be23-8f9d6775bd9e	true	userinfo.token.claim
427f3fdd-1456-4466-be23-8f9d6775bd9e	updatedAt	user.attribute
427f3fdd-1456-4466-be23-8f9d6775bd9e	true	id.token.claim
427f3fdd-1456-4466-be23-8f9d6775bd9e	true	access.token.claim
427f3fdd-1456-4466-be23-8f9d6775bd9e	updated_at	claim.name
427f3fdd-1456-4466-be23-8f9d6775bd9e	long	jsonType.label
6ff40474-ed25-4e9a-b6c0-d5c11961047b	true	userinfo.token.claim
6ff40474-ed25-4e9a-b6c0-d5c11961047b	birthdate	user.attribute
6ff40474-ed25-4e9a-b6c0-d5c11961047b	true	id.token.claim
6ff40474-ed25-4e9a-b6c0-d5c11961047b	true	access.token.claim
6ff40474-ed25-4e9a-b6c0-d5c11961047b	birthdate	claim.name
6ff40474-ed25-4e9a-b6c0-d5c11961047b	String	jsonType.label
993d52cd-ab28-4983-8216-040cd8b32cea	true	userinfo.token.claim
993d52cd-ab28-4983-8216-040cd8b32cea	true	id.token.claim
993d52cd-ab28-4983-8216-040cd8b32cea	true	access.token.claim
a3432896-6dfc-4d2d-9ce3-c505bce5fa41	true	userinfo.token.claim
a3432896-6dfc-4d2d-9ce3-c505bce5fa41	gender	user.attribute
a3432896-6dfc-4d2d-9ce3-c505bce5fa41	true	id.token.claim
a3432896-6dfc-4d2d-9ce3-c505bce5fa41	true	access.token.claim
a3432896-6dfc-4d2d-9ce3-c505bce5fa41	gender	claim.name
a3432896-6dfc-4d2d-9ce3-c505bce5fa41	String	jsonType.label
a47655ba-80f3-4296-8957-b5110e2038ad	true	userinfo.token.claim
a47655ba-80f3-4296-8957-b5110e2038ad	lastName	user.attribute
a47655ba-80f3-4296-8957-b5110e2038ad	true	id.token.claim
a47655ba-80f3-4296-8957-b5110e2038ad	true	access.token.claim
a47655ba-80f3-4296-8957-b5110e2038ad	family_name	claim.name
a47655ba-80f3-4296-8957-b5110e2038ad	String	jsonType.label
be8d22c4-5f47-4cfb-8072-8e6210d3ab16	true	userinfo.token.claim
be8d22c4-5f47-4cfb-8072-8e6210d3ab16	username	user.attribute
be8d22c4-5f47-4cfb-8072-8e6210d3ab16	true	id.token.claim
be8d22c4-5f47-4cfb-8072-8e6210d3ab16	true	access.token.claim
be8d22c4-5f47-4cfb-8072-8e6210d3ab16	preferred_username	claim.name
be8d22c4-5f47-4cfb-8072-8e6210d3ab16	String	jsonType.label
d7801b63-f2ee-4e08-bbf1-c5283c339ab7	true	userinfo.token.claim
d7801b63-f2ee-4e08-bbf1-c5283c339ab7	locale	user.attribute
d7801b63-f2ee-4e08-bbf1-c5283c339ab7	true	id.token.claim
d7801b63-f2ee-4e08-bbf1-c5283c339ab7	true	access.token.claim
d7801b63-f2ee-4e08-bbf1-c5283c339ab7	locale	claim.name
d7801b63-f2ee-4e08-bbf1-c5283c339ab7	String	jsonType.label
db6ae03a-810e-4b16-af37-c5ff674aae7c	true	userinfo.token.claim
db6ae03a-810e-4b16-af37-c5ff674aae7c	profile	user.attribute
db6ae03a-810e-4b16-af37-c5ff674aae7c	true	id.token.claim
db6ae03a-810e-4b16-af37-c5ff674aae7c	true	access.token.claim
db6ae03a-810e-4b16-af37-c5ff674aae7c	profile	claim.name
db6ae03a-810e-4b16-af37-c5ff674aae7c	String	jsonType.label
f5cc6a77-f811-4cd1-a1f8-c5e87f011147	true	userinfo.token.claim
f5cc6a77-f811-4cd1-a1f8-c5e87f011147	picture	user.attribute
f5cc6a77-f811-4cd1-a1f8-c5e87f011147	true	id.token.claim
f5cc6a77-f811-4cd1-a1f8-c5e87f011147	true	access.token.claim
f5cc6a77-f811-4cd1-a1f8-c5e87f011147	picture	claim.name
f5cc6a77-f811-4cd1-a1f8-c5e87f011147	String	jsonType.label
4fcf7561-81cd-43f4-bacd-afa4fb418d45	true	userinfo.token.claim
4fcf7561-81cd-43f4-bacd-afa4fb418d45	email	user.attribute
4fcf7561-81cd-43f4-bacd-afa4fb418d45	true	id.token.claim
4fcf7561-81cd-43f4-bacd-afa4fb418d45	true	access.token.claim
4fcf7561-81cd-43f4-bacd-afa4fb418d45	email	claim.name
4fcf7561-81cd-43f4-bacd-afa4fb418d45	String	jsonType.label
827dcba8-fb07-4d31-895e-094b796dd6e6	true	userinfo.token.claim
827dcba8-fb07-4d31-895e-094b796dd6e6	emailVerified	user.attribute
827dcba8-fb07-4d31-895e-094b796dd6e6	true	id.token.claim
827dcba8-fb07-4d31-895e-094b796dd6e6	true	access.token.claim
827dcba8-fb07-4d31-895e-094b796dd6e6	email_verified	claim.name
827dcba8-fb07-4d31-895e-094b796dd6e6	boolean	jsonType.label
f5256121-043d-446a-9364-46f7fbc90e55	formatted	user.attribute.formatted
f5256121-043d-446a-9364-46f7fbc90e55	country	user.attribute.country
f5256121-043d-446a-9364-46f7fbc90e55	postal_code	user.attribute.postal_code
f5256121-043d-446a-9364-46f7fbc90e55	true	userinfo.token.claim
f5256121-043d-446a-9364-46f7fbc90e55	street	user.attribute.street
f5256121-043d-446a-9364-46f7fbc90e55	true	id.token.claim
f5256121-043d-446a-9364-46f7fbc90e55	region	user.attribute.region
f5256121-043d-446a-9364-46f7fbc90e55	true	access.token.claim
f5256121-043d-446a-9364-46f7fbc90e55	locality	user.attribute.locality
28f69014-99fb-4bac-9602-822918b7f3f0	true	userinfo.token.claim
28f69014-99fb-4bac-9602-822918b7f3f0	phoneNumber	user.attribute
28f69014-99fb-4bac-9602-822918b7f3f0	true	id.token.claim
28f69014-99fb-4bac-9602-822918b7f3f0	true	access.token.claim
28f69014-99fb-4bac-9602-822918b7f3f0	phone_number	claim.name
28f69014-99fb-4bac-9602-822918b7f3f0	String	jsonType.label
5627d1e0-6fde-4772-9b73-53d743afb539	true	userinfo.token.claim
5627d1e0-6fde-4772-9b73-53d743afb539	phoneNumberVerified	user.attribute
5627d1e0-6fde-4772-9b73-53d743afb539	true	id.token.claim
5627d1e0-6fde-4772-9b73-53d743afb539	true	access.token.claim
5627d1e0-6fde-4772-9b73-53d743afb539	phone_number_verified	claim.name
5627d1e0-6fde-4772-9b73-53d743afb539	boolean	jsonType.label
402a7f4b-5b9a-4a5d-b2da-323829a203ae	true	multivalued
402a7f4b-5b9a-4a5d-b2da-323829a203ae	foo	user.attribute
402a7f4b-5b9a-4a5d-b2da-323829a203ae	true	access.token.claim
402a7f4b-5b9a-4a5d-b2da-323829a203ae	resource_access.${client_id}.roles	claim.name
402a7f4b-5b9a-4a5d-b2da-323829a203ae	String	jsonType.label
ba9e6d86-f8fb-4a2a-9af2-a66e4921a6d1	true	multivalued
ba9e6d86-f8fb-4a2a-9af2-a66e4921a6d1	foo	user.attribute
ba9e6d86-f8fb-4a2a-9af2-a66e4921a6d1	true	access.token.claim
ba9e6d86-f8fb-4a2a-9af2-a66e4921a6d1	String	jsonType.label
876a1d99-58b1-4a5f-a2af-3c85db0836f6	true	multivalued
876a1d99-58b1-4a5f-a2af-3c85db0836f6	foo	user.attribute
876a1d99-58b1-4a5f-a2af-3c85db0836f6	true	id.token.claim
876a1d99-58b1-4a5f-a2af-3c85db0836f6	true	access.token.claim
876a1d99-58b1-4a5f-a2af-3c85db0836f6	groups	claim.name
876a1d99-58b1-4a5f-a2af-3c85db0836f6	String	jsonType.label
a6bbffc1-2d70-4f00-b6b2-ce19eae0d318	true	userinfo.token.claim
a6bbffc1-2d70-4f00-b6b2-ce19eae0d318	username	user.attribute
a6bbffc1-2d70-4f00-b6b2-ce19eae0d318	true	id.token.claim
a6bbffc1-2d70-4f00-b6b2-ce19eae0d318	true	access.token.claim
a6bbffc1-2d70-4f00-b6b2-ce19eae0d318	upn	claim.name
a6bbffc1-2d70-4f00-b6b2-ce19eae0d318	String	jsonType.label
a89e78b8-461c-469f-bed1-7003f30e4e04	true	id.token.claim
a89e78b8-461c-469f-bed1-7003f30e4e04	true	access.token.claim
1c0ea23a-db2c-4428-97bb-373cdbeb8b48	true	userinfo.token.claim
1c0ea23a-db2c-4428-97bb-373cdbeb8b48	locale	user.attribute
1c0ea23a-db2c-4428-97bb-373cdbeb8b48	true	id.token.claim
1c0ea23a-db2c-4428-97bb-373cdbeb8b48	true	access.token.claim
1c0ea23a-db2c-4428-97bb-373cdbeb8b48	locale	claim.name
1c0ea23a-db2c-4428-97bb-373cdbeb8b48	String	jsonType.label
ba9e6d86-f8fb-4a2a-9af2-a66e4921a6d1	roles	claim.name
ba9e6d86-f8fb-4a2a-9af2-a66e4921a6d1	true	userinfo.token.claim
14206120-8d0d-4441-a9e2-2f3f508efad0	false	single
14206120-8d0d-4441-a9e2-2f3f508efad0	Basic	attribute.nameformat
14206120-8d0d-4441-a9e2-2f3f508efad0	Role	attribute.name
0c9cc4ec-2454-4b82-944f-6752b1a520c2	true	userinfo.token.claim
0c9cc4ec-2454-4b82-944f-6752b1a520c2	true	id.token.claim
0c9cc4ec-2454-4b82-944f-6752b1a520c2	true	access.token.claim
12d42f78-7543-4083-a0be-5a230b33c92e	true	userinfo.token.claim
12d42f78-7543-4083-a0be-5a230b33c92e	locale	user.attribute
12d42f78-7543-4083-a0be-5a230b33c92e	true	id.token.claim
12d42f78-7543-4083-a0be-5a230b33c92e	true	access.token.claim
12d42f78-7543-4083-a0be-5a230b33c92e	locale	claim.name
12d42f78-7543-4083-a0be-5a230b33c92e	String	jsonType.label
1ec1c95e-fe21-4f1c-a587-81dde8af7755	true	userinfo.token.claim
1ec1c95e-fe21-4f1c-a587-81dde8af7755	zoneinfo	user.attribute
1ec1c95e-fe21-4f1c-a587-81dde8af7755	true	id.token.claim
1ec1c95e-fe21-4f1c-a587-81dde8af7755	true	access.token.claim
1ec1c95e-fe21-4f1c-a587-81dde8af7755	zoneinfo	claim.name
1ec1c95e-fe21-4f1c-a587-81dde8af7755	String	jsonType.label
2a8ced17-8a73-4ae0-ba9a-1319c2234c4a	true	userinfo.token.claim
2a8ced17-8a73-4ae0-ba9a-1319c2234c4a	firstName	user.attribute
2a8ced17-8a73-4ae0-ba9a-1319c2234c4a	true	id.token.claim
2a8ced17-8a73-4ae0-ba9a-1319c2234c4a	true	access.token.claim
2a8ced17-8a73-4ae0-ba9a-1319c2234c4a	given_name	claim.name
2a8ced17-8a73-4ae0-ba9a-1319c2234c4a	String	jsonType.label
48b9d9bd-eb37-4fab-8a22-9d28082d7be0	true	userinfo.token.claim
48b9d9bd-eb37-4fab-8a22-9d28082d7be0	birthdate	user.attribute
48b9d9bd-eb37-4fab-8a22-9d28082d7be0	true	id.token.claim
48b9d9bd-eb37-4fab-8a22-9d28082d7be0	true	access.token.claim
48b9d9bd-eb37-4fab-8a22-9d28082d7be0	birthdate	claim.name
48b9d9bd-eb37-4fab-8a22-9d28082d7be0	String	jsonType.label
4a60d031-5c2e-4ec2-93a9-dba34fceb718	true	userinfo.token.claim
1077c412-6db0-41d1-861f-25458c2d193b	false	single
4a60d031-5c2e-4ec2-93a9-dba34fceb718	username	user.attribute
4a60d031-5c2e-4ec2-93a9-dba34fceb718	true	id.token.claim
4a60d031-5c2e-4ec2-93a9-dba34fceb718	true	access.token.claim
4a60d031-5c2e-4ec2-93a9-dba34fceb718	preferred_username	claim.name
4a60d031-5c2e-4ec2-93a9-dba34fceb718	String	jsonType.label
5793e25d-071c-43e2-b254-d9ddcec29b28	true	userinfo.token.claim
5793e25d-071c-43e2-b254-d9ddcec29b28	nickname	user.attribute
5793e25d-071c-43e2-b254-d9ddcec29b28	true	id.token.claim
5793e25d-071c-43e2-b254-d9ddcec29b28	true	access.token.claim
5793e25d-071c-43e2-b254-d9ddcec29b28	nickname	claim.name
5793e25d-071c-43e2-b254-d9ddcec29b28	String	jsonType.label
648d583d-d860-4926-90b5-86a1214976d2	true	userinfo.token.claim
648d583d-d860-4926-90b5-86a1214976d2	middleName	user.attribute
648d583d-d860-4926-90b5-86a1214976d2	true	id.token.claim
648d583d-d860-4926-90b5-86a1214976d2	true	access.token.claim
648d583d-d860-4926-90b5-86a1214976d2	middle_name	claim.name
648d583d-d860-4926-90b5-86a1214976d2	String	jsonType.label
8266b691-ebfb-4ad2-b325-88d888f82458	true	userinfo.token.claim
8266b691-ebfb-4ad2-b325-88d888f82458	updatedAt	user.attribute
8266b691-ebfb-4ad2-b325-88d888f82458	true	id.token.claim
8266b691-ebfb-4ad2-b325-88d888f82458	true	access.token.claim
8266b691-ebfb-4ad2-b325-88d888f82458	updated_at	claim.name
8266b691-ebfb-4ad2-b325-88d888f82458	long	jsonType.label
9825417e-455c-4ed3-9d41-835c15818b36	true	userinfo.token.claim
9825417e-455c-4ed3-9d41-835c15818b36	profile	user.attribute
9825417e-455c-4ed3-9d41-835c15818b36	true	id.token.claim
9825417e-455c-4ed3-9d41-835c15818b36	true	access.token.claim
9825417e-455c-4ed3-9d41-835c15818b36	profile	claim.name
9825417e-455c-4ed3-9d41-835c15818b36	String	jsonType.label
a8ffdbe1-03a3-4d6f-918b-b5720af58686	true	userinfo.token.claim
a8ffdbe1-03a3-4d6f-918b-b5720af58686	lastName	user.attribute
a8ffdbe1-03a3-4d6f-918b-b5720af58686	true	id.token.claim
a8ffdbe1-03a3-4d6f-918b-b5720af58686	true	access.token.claim
a8ffdbe1-03a3-4d6f-918b-b5720af58686	family_name	claim.name
a8ffdbe1-03a3-4d6f-918b-b5720af58686	String	jsonType.label
ae924403-a880-4539-8472-26cd40adb7cc	true	userinfo.token.claim
ae924403-a880-4539-8472-26cd40adb7cc	gender	user.attribute
ae924403-a880-4539-8472-26cd40adb7cc	true	id.token.claim
ae924403-a880-4539-8472-26cd40adb7cc	true	access.token.claim
ae924403-a880-4539-8472-26cd40adb7cc	gender	claim.name
ae924403-a880-4539-8472-26cd40adb7cc	String	jsonType.label
ccf7f435-1a0c-4a92-b3cd-d821f84b1b28	true	userinfo.token.claim
ccf7f435-1a0c-4a92-b3cd-d821f84b1b28	picture	user.attribute
ccf7f435-1a0c-4a92-b3cd-d821f84b1b28	true	id.token.claim
ccf7f435-1a0c-4a92-b3cd-d821f84b1b28	true	access.token.claim
ccf7f435-1a0c-4a92-b3cd-d821f84b1b28	picture	claim.name
ccf7f435-1a0c-4a92-b3cd-d821f84b1b28	String	jsonType.label
dd9f550e-f19e-4a99-8320-ba11a52f6417	true	userinfo.token.claim
dd9f550e-f19e-4a99-8320-ba11a52f6417	website	user.attribute
dd9f550e-f19e-4a99-8320-ba11a52f6417	true	id.token.claim
dd9f550e-f19e-4a99-8320-ba11a52f6417	true	access.token.claim
dd9f550e-f19e-4a99-8320-ba11a52f6417	website	claim.name
dd9f550e-f19e-4a99-8320-ba11a52f6417	String	jsonType.label
81a4ed4e-49c0-4116-b02f-90957607fc89	true	userinfo.token.claim
81a4ed4e-49c0-4116-b02f-90957607fc89	emailVerified	user.attribute
81a4ed4e-49c0-4116-b02f-90957607fc89	true	id.token.claim
81a4ed4e-49c0-4116-b02f-90957607fc89	true	access.token.claim
81a4ed4e-49c0-4116-b02f-90957607fc89	email_verified	claim.name
81a4ed4e-49c0-4116-b02f-90957607fc89	boolean	jsonType.label
ad786509-4d92-4612-a43c-cc67b00ae2c7	true	userinfo.token.claim
ad786509-4d92-4612-a43c-cc67b00ae2c7	email	user.attribute
ad786509-4d92-4612-a43c-cc67b00ae2c7	true	id.token.claim
ad786509-4d92-4612-a43c-cc67b00ae2c7	true	access.token.claim
ad786509-4d92-4612-a43c-cc67b00ae2c7	email	claim.name
ad786509-4d92-4612-a43c-cc67b00ae2c7	String	jsonType.label
1929b434-dad4-46f2-9216-6f1ca6568048	formatted	user.attribute.formatted
1929b434-dad4-46f2-9216-6f1ca6568048	country	user.attribute.country
1929b434-dad4-46f2-9216-6f1ca6568048	postal_code	user.attribute.postal_code
1929b434-dad4-46f2-9216-6f1ca6568048	true	userinfo.token.claim
1929b434-dad4-46f2-9216-6f1ca6568048	street	user.attribute.street
1929b434-dad4-46f2-9216-6f1ca6568048	true	id.token.claim
1929b434-dad4-46f2-9216-6f1ca6568048	region	user.attribute.region
1929b434-dad4-46f2-9216-6f1ca6568048	true	access.token.claim
1929b434-dad4-46f2-9216-6f1ca6568048	locality	user.attribute.locality
4cf3a3a8-95ac-4dde-9ff6-dfbb371d028e	true	userinfo.token.claim
4cf3a3a8-95ac-4dde-9ff6-dfbb371d028e	phoneNumberVerified	user.attribute
4cf3a3a8-95ac-4dde-9ff6-dfbb371d028e	true	id.token.claim
4cf3a3a8-95ac-4dde-9ff6-dfbb371d028e	true	access.token.claim
4cf3a3a8-95ac-4dde-9ff6-dfbb371d028e	phone_number_verified	claim.name
4cf3a3a8-95ac-4dde-9ff6-dfbb371d028e	boolean	jsonType.label
ae9a8265-9f28-49eb-aedd-f37a32c3299e	true	userinfo.token.claim
ae9a8265-9f28-49eb-aedd-f37a32c3299e	phoneNumber	user.attribute
ae9a8265-9f28-49eb-aedd-f37a32c3299e	true	id.token.claim
ae9a8265-9f28-49eb-aedd-f37a32c3299e	true	access.token.claim
ae9a8265-9f28-49eb-aedd-f37a32c3299e	phone_number	claim.name
ae9a8265-9f28-49eb-aedd-f37a32c3299e	String	jsonType.label
0784d824-f286-47e3-a335-f4da5fa75621	true	multivalued
0784d824-f286-47e3-a335-f4da5fa75621	foo	user.attribute
0784d824-f286-47e3-a335-f4da5fa75621	true	access.token.claim
0784d824-f286-47e3-a335-f4da5fa75621	resource_access.${client_id}.roles	claim.name
0784d824-f286-47e3-a335-f4da5fa75621	String	jsonType.label
8bc81b4a-32ac-46f6-957e-3f90ee7a1bdc	true	multivalued
8bc81b4a-32ac-46f6-957e-3f90ee7a1bdc	foo	user.attribute
8bc81b4a-32ac-46f6-957e-3f90ee7a1bdc	true	access.token.claim
8bc81b4a-32ac-46f6-957e-3f90ee7a1bdc	String	jsonType.label
2632ef44-0641-476e-8213-b71968fe7ef9	true	userinfo.token.claim
2632ef44-0641-476e-8213-b71968fe7ef9	username	user.attribute
2632ef44-0641-476e-8213-b71968fe7ef9	true	id.token.claim
2632ef44-0641-476e-8213-b71968fe7ef9	true	access.token.claim
2632ef44-0641-476e-8213-b71968fe7ef9	upn	claim.name
2632ef44-0641-476e-8213-b71968fe7ef9	String	jsonType.label
60f8756a-ce28-4a3e-a246-06220bce2886	true	multivalued
60f8756a-ce28-4a3e-a246-06220bce2886	foo	user.attribute
60f8756a-ce28-4a3e-a246-06220bce2886	true	id.token.claim
60f8756a-ce28-4a3e-a246-06220bce2886	true	access.token.claim
60f8756a-ce28-4a3e-a246-06220bce2886	groups	claim.name
60f8756a-ce28-4a3e-a246-06220bce2886	String	jsonType.label
8b90402f-ec86-4ddb-b708-227bbc334bb5	true	id.token.claim
8b90402f-ec86-4ddb-b708-227bbc334bb5	true	access.token.claim
aa9be537-e3ff-41bd-8f51-753806ed9720	true	userinfo.token.claim
aa9be537-e3ff-41bd-8f51-753806ed9720	locale	user.attribute
aa9be537-e3ff-41bd-8f51-753806ed9720	true	id.token.claim
aa9be537-e3ff-41bd-8f51-753806ed9720	true	access.token.claim
aa9be537-e3ff-41bd-8f51-753806ed9720	locale	claim.name
aa9be537-e3ff-41bd-8f51-753806ed9720	String	jsonType.label
8bc81b4a-32ac-46f6-957e-3f90ee7a1bdc	roles	claim.name
8bc81b4a-32ac-46f6-957e-3f90ee7a1bdc	true	userinfo.token.claim
1077c412-6db0-41d1-861f-25458c2d193b	Basic	attribute.nameformat
1077c412-6db0-41d1-861f-25458c2d193b	Role	attribute.name
12bde678-1b5d-4e73-8d8a-31dc75934268	true	userinfo.token.claim
12bde678-1b5d-4e73-8d8a-31dc75934268	firstName	user.attribute
12bde678-1b5d-4e73-8d8a-31dc75934268	true	id.token.claim
12bde678-1b5d-4e73-8d8a-31dc75934268	true	access.token.claim
12bde678-1b5d-4e73-8d8a-31dc75934268	given_name	claim.name
12bde678-1b5d-4e73-8d8a-31dc75934268	String	jsonType.label
149a0cbc-8ef3-4a07-add4-d639857e9b63	true	userinfo.token.claim
149a0cbc-8ef3-4a07-add4-d639857e9b63	website	user.attribute
149a0cbc-8ef3-4a07-add4-d639857e9b63	true	id.token.claim
149a0cbc-8ef3-4a07-add4-d639857e9b63	true	access.token.claim
149a0cbc-8ef3-4a07-add4-d639857e9b63	website	claim.name
149a0cbc-8ef3-4a07-add4-d639857e9b63	String	jsonType.label
2288f707-0348-4331-8bb5-217a6b6f30b7	true	userinfo.token.claim
2288f707-0348-4331-8bb5-217a6b6f30b7	nickname	user.attribute
2288f707-0348-4331-8bb5-217a6b6f30b7	true	id.token.claim
2288f707-0348-4331-8bb5-217a6b6f30b7	true	access.token.claim
2288f707-0348-4331-8bb5-217a6b6f30b7	nickname	claim.name
2288f707-0348-4331-8bb5-217a6b6f30b7	String	jsonType.label
2d802eff-6e2c-450a-a161-932da82c5eee	true	userinfo.token.claim
2d802eff-6e2c-450a-a161-932da82c5eee	locale	user.attribute
2d802eff-6e2c-450a-a161-932da82c5eee	true	id.token.claim
2d802eff-6e2c-450a-a161-932da82c5eee	true	access.token.claim
2d802eff-6e2c-450a-a161-932da82c5eee	locale	claim.name
2d802eff-6e2c-450a-a161-932da82c5eee	String	jsonType.label
37b45677-a252-4445-b77e-1940c39564cd	true	userinfo.token.claim
37b45677-a252-4445-b77e-1940c39564cd	picture	user.attribute
37b45677-a252-4445-b77e-1940c39564cd	true	id.token.claim
37b45677-a252-4445-b77e-1940c39564cd	true	access.token.claim
37b45677-a252-4445-b77e-1940c39564cd	picture	claim.name
37b45677-a252-4445-b77e-1940c39564cd	String	jsonType.label
4270c557-26da-4a85-922c-09708c8cee10	true	userinfo.token.claim
4270c557-26da-4a85-922c-09708c8cee10	birthdate	user.attribute
4270c557-26da-4a85-922c-09708c8cee10	true	id.token.claim
4270c557-26da-4a85-922c-09708c8cee10	true	access.token.claim
4270c557-26da-4a85-922c-09708c8cee10	birthdate	claim.name
4270c557-26da-4a85-922c-09708c8cee10	String	jsonType.label
4d3fbe49-9523-4cc6-989d-7973d14543e2	true	userinfo.token.claim
4d3fbe49-9523-4cc6-989d-7973d14543e2	updatedAt	user.attribute
4d3fbe49-9523-4cc6-989d-7973d14543e2	true	id.token.claim
4d3fbe49-9523-4cc6-989d-7973d14543e2	true	access.token.claim
4d3fbe49-9523-4cc6-989d-7973d14543e2	updated_at	claim.name
4d3fbe49-9523-4cc6-989d-7973d14543e2	long	jsonType.label
6309066c-c5d1-4b0f-b20b-0d71f6771dcb	true	userinfo.token.claim
6309066c-c5d1-4b0f-b20b-0d71f6771dcb	true	id.token.claim
6309066c-c5d1-4b0f-b20b-0d71f6771dcb	true	access.token.claim
7b75648f-9913-4a86-a801-276dc6a04530	true	userinfo.token.claim
7b75648f-9913-4a86-a801-276dc6a04530	username	user.attribute
7b75648f-9913-4a86-a801-276dc6a04530	true	id.token.claim
7b75648f-9913-4a86-a801-276dc6a04530	true	access.token.claim
7b75648f-9913-4a86-a801-276dc6a04530	preferred_username	claim.name
7b75648f-9913-4a86-a801-276dc6a04530	String	jsonType.label
9906ca77-733e-4517-aa2c-aa3a44a4378a	true	userinfo.token.claim
9906ca77-733e-4517-aa2c-aa3a44a4378a	lastName	user.attribute
9906ca77-733e-4517-aa2c-aa3a44a4378a	true	id.token.claim
9906ca77-733e-4517-aa2c-aa3a44a4378a	true	access.token.claim
9906ca77-733e-4517-aa2c-aa3a44a4378a	family_name	claim.name
9906ca77-733e-4517-aa2c-aa3a44a4378a	String	jsonType.label
a9f358c3-0eb0-4c63-a4c9-75e1fc7d9cb7	true	userinfo.token.claim
a9f358c3-0eb0-4c63-a4c9-75e1fc7d9cb7	middleName	user.attribute
a9f358c3-0eb0-4c63-a4c9-75e1fc7d9cb7	true	id.token.claim
a9f358c3-0eb0-4c63-a4c9-75e1fc7d9cb7	true	access.token.claim
a9f358c3-0eb0-4c63-a4c9-75e1fc7d9cb7	middle_name	claim.name
a9f358c3-0eb0-4c63-a4c9-75e1fc7d9cb7	String	jsonType.label
bcbe0973-e9d3-4a36-a686-4c7a52fc416d	true	userinfo.token.claim
bcbe0973-e9d3-4a36-a686-4c7a52fc416d	gender	user.attribute
bcbe0973-e9d3-4a36-a686-4c7a52fc416d	true	id.token.claim
bcbe0973-e9d3-4a36-a686-4c7a52fc416d	true	access.token.claim
bcbe0973-e9d3-4a36-a686-4c7a52fc416d	gender	claim.name
bcbe0973-e9d3-4a36-a686-4c7a52fc416d	String	jsonType.label
c76a7968-0ee3-4a8d-8eb8-d9be0b7c3443	true	userinfo.token.claim
c76a7968-0ee3-4a8d-8eb8-d9be0b7c3443	zoneinfo	user.attribute
c76a7968-0ee3-4a8d-8eb8-d9be0b7c3443	true	id.token.claim
c76a7968-0ee3-4a8d-8eb8-d9be0b7c3443	true	access.token.claim
c76a7968-0ee3-4a8d-8eb8-d9be0b7c3443	zoneinfo	claim.name
c76a7968-0ee3-4a8d-8eb8-d9be0b7c3443	String	jsonType.label
d02e3c83-f7f7-4d37-a2a2-cbee43a43420	true	userinfo.token.claim
d02e3c83-f7f7-4d37-a2a2-cbee43a43420	profile	user.attribute
d02e3c83-f7f7-4d37-a2a2-cbee43a43420	true	id.token.claim
d02e3c83-f7f7-4d37-a2a2-cbee43a43420	true	access.token.claim
d02e3c83-f7f7-4d37-a2a2-cbee43a43420	profile	claim.name
d02e3c83-f7f7-4d37-a2a2-cbee43a43420	String	jsonType.label
1d8af63a-ff8f-40a1-9ac8-316724afab93	true	userinfo.token.claim
1d8af63a-ff8f-40a1-9ac8-316724afab93	emailVerified	user.attribute
1d8af63a-ff8f-40a1-9ac8-316724afab93	true	id.token.claim
1d8af63a-ff8f-40a1-9ac8-316724afab93	true	access.token.claim
1d8af63a-ff8f-40a1-9ac8-316724afab93	email_verified	claim.name
1d8af63a-ff8f-40a1-9ac8-316724afab93	boolean	jsonType.label
4f40e9b1-1e14-4336-a8b4-86d3aa1941bf	true	userinfo.token.claim
4f40e9b1-1e14-4336-a8b4-86d3aa1941bf	email	user.attribute
4f40e9b1-1e14-4336-a8b4-86d3aa1941bf	true	id.token.claim
4f40e9b1-1e14-4336-a8b4-86d3aa1941bf	true	access.token.claim
4f40e9b1-1e14-4336-a8b4-86d3aa1941bf	email	claim.name
4f40e9b1-1e14-4336-a8b4-86d3aa1941bf	String	jsonType.label
8a2a2f22-06bb-4cbd-a9e2-64cebbc410d7	formatted	user.attribute.formatted
8a2a2f22-06bb-4cbd-a9e2-64cebbc410d7	country	user.attribute.country
8a2a2f22-06bb-4cbd-a9e2-64cebbc410d7	postal_code	user.attribute.postal_code
8a2a2f22-06bb-4cbd-a9e2-64cebbc410d7	true	userinfo.token.claim
8a2a2f22-06bb-4cbd-a9e2-64cebbc410d7	street	user.attribute.street
8a2a2f22-06bb-4cbd-a9e2-64cebbc410d7	true	id.token.claim
8a2a2f22-06bb-4cbd-a9e2-64cebbc410d7	region	user.attribute.region
8a2a2f22-06bb-4cbd-a9e2-64cebbc410d7	true	access.token.claim
8a2a2f22-06bb-4cbd-a9e2-64cebbc410d7	locality	user.attribute.locality
0e4e6f18-a40c-43ef-b9b4-2fdb5cd55463	true	userinfo.token.claim
0e4e6f18-a40c-43ef-b9b4-2fdb5cd55463	phoneNumber	user.attribute
0e4e6f18-a40c-43ef-b9b4-2fdb5cd55463	true	id.token.claim
0e4e6f18-a40c-43ef-b9b4-2fdb5cd55463	true	access.token.claim
0e4e6f18-a40c-43ef-b9b4-2fdb5cd55463	phone_number	claim.name
0e4e6f18-a40c-43ef-b9b4-2fdb5cd55463	String	jsonType.label
7c7da812-2837-46df-aa34-a62d47228d9d	true	userinfo.token.claim
7c7da812-2837-46df-aa34-a62d47228d9d	phoneNumberVerified	user.attribute
7c7da812-2837-46df-aa34-a62d47228d9d	true	id.token.claim
7c7da812-2837-46df-aa34-a62d47228d9d	true	access.token.claim
7c7da812-2837-46df-aa34-a62d47228d9d	phone_number_verified	claim.name
7c7da812-2837-46df-aa34-a62d47228d9d	boolean	jsonType.label
46616f08-d5a4-4c41-8a41-1ddbd3d771ff	true	multivalued
46616f08-d5a4-4c41-8a41-1ddbd3d771ff	foo	user.attribute
46616f08-d5a4-4c41-8a41-1ddbd3d771ff	true	access.token.claim
46616f08-d5a4-4c41-8a41-1ddbd3d771ff	String	jsonType.label
c48649ce-02d6-4c07-892d-ea1602aa6a25	true	multivalued
c48649ce-02d6-4c07-892d-ea1602aa6a25	foo	user.attribute
c48649ce-02d6-4c07-892d-ea1602aa6a25	true	access.token.claim
c48649ce-02d6-4c07-892d-ea1602aa6a25	resource_access.${client_id}.roles	claim.name
c48649ce-02d6-4c07-892d-ea1602aa6a25	String	jsonType.label
00220872-c30a-498e-9179-634556fcd97e	true	multivalued
00220872-c30a-498e-9179-634556fcd97e	foo	user.attribute
00220872-c30a-498e-9179-634556fcd97e	true	id.token.claim
00220872-c30a-498e-9179-634556fcd97e	true	access.token.claim
00220872-c30a-498e-9179-634556fcd97e	groups	claim.name
00220872-c30a-498e-9179-634556fcd97e	String	jsonType.label
e20068b5-8c1d-4a10-9092-9f147cae8f07	true	userinfo.token.claim
e20068b5-8c1d-4a10-9092-9f147cae8f07	username	user.attribute
e20068b5-8c1d-4a10-9092-9f147cae8f07	true	id.token.claim
e20068b5-8c1d-4a10-9092-9f147cae8f07	true	access.token.claim
e20068b5-8c1d-4a10-9092-9f147cae8f07	upn	claim.name
e20068b5-8c1d-4a10-9092-9f147cae8f07	String	jsonType.label
b02c7ccb-b292-47f6-a5f9-2aea22d89f40	true	id.token.claim
b02c7ccb-b292-47f6-a5f9-2aea22d89f40	true	access.token.claim
0c89f3bc-6134-4874-8728-35b797a836d2	true	userinfo.token.claim
0c89f3bc-6134-4874-8728-35b797a836d2	locale	user.attribute
0c89f3bc-6134-4874-8728-35b797a836d2	true	id.token.claim
0c89f3bc-6134-4874-8728-35b797a836d2	true	access.token.claim
0c89f3bc-6134-4874-8728-35b797a836d2	locale	claim.name
0c89f3bc-6134-4874-8728-35b797a836d2	String	jsonType.label
46616f08-d5a4-4c41-8a41-1ddbd3d771ff	roles	claim.name
46616f08-d5a4-4c41-8a41-1ddbd3d771ff	true	userinfo.token.claim
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
aef5c390-9834-4cad-83be-4efe22893758	60	300	300	\N	\N	\N	t	f	0	\N	hcmut	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	cc7cc122-1036-41cc-9b96-6787f169a971	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	829b4dc2-aecc-4564-9525-c6febc6c909a	ad3bef9e-4215-465e-ba18-619ab2eb0f99	1361e062-8130-484a-ad92-a224025efeec	4c47edc1-f056-42a0-ad39-8214100c9b3a	bf41faa2-c8f5-4110-9f69-7f60ef2b5b97	2592000	f	900	t	f	1afcb00a-28c4-4812-a7d2-2a20f9af5cf4	0	f	0	0	ac66a7f0-4852-4954-91c0-1cfbd4b998ce
dd9bcc37-69c8-4b94-9737-50788f40287c	60	300	300	\N	\N	\N	t	f	0	\N	pdt	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	413eabd5-1505-4190-902c-29bb9bc63de2	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	2b26047b-e456-46ae-9aa1-41dffd6b9789	af075028-a3fb-4a27-a5b1-8e1592d2becb	6f62dcab-77fd-47ca-8417-f1eea131056b	449dc9b3-6836-441d-9513-b4973309e956	b5092881-7757-41ce-9a68-f18907dd1fb8	2592000	f	900	t	f	bb3039ac-e334-4b97-8314-be78a374d6d6	0	f	0	0	05a76e40-581d-410f-82aa-3e2596b6247f
3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	60	300	300	\N	\N	\N	t	f	0	\N	pkt	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	0308847b-a5ce-4fa2-b5b1-1ad7705eedb1	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	a6965485-5262-4bc0-993e-a0c871d43867	8ace4d62-8714-4538-a108-239a49c35ea5	cd5cecca-cd2b-4968-a74f-179c7e0ebf5c	c6a8f381-0a39-422d-8692-22d867bec550	3ff7dc4e-ab24-4139-a72b-57f9055cb352	2592000	f	900	t	f	4f5178cc-6084-4a21-8946-c3248dcaa318	0	f	0	0	371aff16-fd2d-4c32-b43d-5c66c879f5e6
0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	60	300	300	\N	\N	\N	t	f	0	\N	pit	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	8cd3c0b7-149b-461d-b4db-987d93c12289	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	78b93566-086f-4d3c-90af-a38b3a279cfb	aa79f132-b27e-46a8-81dd-fb371a863982	45e3c9a0-7314-420a-be52-034ca6986cd4	911ef2e4-b0f0-4414-a156-8be25524f84b	038ce04b-a210-4a86-9475-75eff4e22db8	2592000	f	900	t	f	90a58617-21a8-4f35-a88a-a4faf1c0e322	0	f	0	0	59395d5c-7206-4e49-b8d9-d9d2edfa40ee
7b27a11d-121a-4360-960c-3ea6deb0ac35	60	300	600	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	526d8a87-adcb-464b-9825-0ad9c321cfcd	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	e29f11ca-90ce-4201-8519-c7b595b4b24d	356af88b-8aed-4700-8bf2-47a15a28dd69	1df96ad9-a2ad-4514-9844-cd865d818da7	d5cb4658-e2fd-45fc-87a4-8c10f1504090	053b3985-51b0-4a4f-9143-ff14a24dedfb	2592000	f	900	t	f	29895d82-4ec3-45d1-b36a-14354d0e5172	0	f	0	0	b8ccb5a5-7b30-403b-84c1-05b0af0e326b
60d763c7-10e3-4490-8529-e1c97d983ade	60	300	300	\N	\N	\N	t	f	0	\N	pkt2	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	c9d7ba83-2724-418b-8b2d-ea3a602c723c	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	81611d87-b075-4351-9781-cded2d0f85bd	f8c9ef42-39e3-4a31-9582-0048fe5b7515	19dc4db1-2091-4e69-8490-0677e29aa32a	f6ff7085-4f59-4538-991c-8fda01e8817a	8b913b43-dc9d-44c2-bd0f-1c8eadaab7af	2592000	f	900	t	f	4f26b250-bc09-4ac9-8ba3-95d72626cd74	0	f	0	0	6cefe484-cb9f-44f2-9d71-e3c6f53d23be
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	
_browser_header.xContentTypeOptions	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	nosniff
_browser_header.xRobotsTag	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	none
_browser_header.xFrameOptions	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	SAMEORIGIN
_browser_header.contentSecurityPolicy	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	1; mode=block
_browser_header.strictTransportSecurity	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	max-age=31536000; includeSubDomains
bruteForceProtected	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	false
permanentLockout	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	false
maxFailureWaitSeconds	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	900
minimumQuickLoginWaitSeconds	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	60
waitIncrementSeconds	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	60
quickLoginCheckMilliSeconds	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	1000
maxDeltaTimeSeconds	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	43200
failureFactor	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	30
realmReusableOtpCode	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	false
defaultSignatureAlgorithm	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	RS256
offlineSessionMaxLifespanEnabled	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	false
offlineSessionMaxLifespan	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	5184000
actionTokenGeneratedByAdminLifespan	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	43200
_browser_header.contentSecurityPolicyReportOnly	aef5c390-9834-4cad-83be-4efe22893758	
_browser_header.xContentTypeOptions	aef5c390-9834-4cad-83be-4efe22893758	nosniff
_browser_header.xRobotsTag	aef5c390-9834-4cad-83be-4efe22893758	none
_browser_header.xFrameOptions	aef5c390-9834-4cad-83be-4efe22893758	SAMEORIGIN
_browser_header.contentSecurityPolicy	aef5c390-9834-4cad-83be-4efe22893758	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	aef5c390-9834-4cad-83be-4efe22893758	1; mode=block
_browser_header.strictTransportSecurity	aef5c390-9834-4cad-83be-4efe22893758	max-age=31536000; includeSubDomains
bruteForceProtected	aef5c390-9834-4cad-83be-4efe22893758	false
permanentLockout	aef5c390-9834-4cad-83be-4efe22893758	false
maxFailureWaitSeconds	aef5c390-9834-4cad-83be-4efe22893758	900
minimumQuickLoginWaitSeconds	aef5c390-9834-4cad-83be-4efe22893758	60
waitIncrementSeconds	aef5c390-9834-4cad-83be-4efe22893758	60
quickLoginCheckMilliSeconds	aef5c390-9834-4cad-83be-4efe22893758	1000
maxDeltaTimeSeconds	aef5c390-9834-4cad-83be-4efe22893758	43200
failureFactor	aef5c390-9834-4cad-83be-4efe22893758	30
realmReusableOtpCode	aef5c390-9834-4cad-83be-4efe22893758	false
defaultSignatureAlgorithm	aef5c390-9834-4cad-83be-4efe22893758	RS256
offlineSessionMaxLifespanEnabled	aef5c390-9834-4cad-83be-4efe22893758	false
offlineSessionMaxLifespan	aef5c390-9834-4cad-83be-4efe22893758	5184000
actionTokenGeneratedByAdminLifespan	aef5c390-9834-4cad-83be-4efe22893758	43200
actionTokenGeneratedByUserLifespan	aef5c390-9834-4cad-83be-4efe22893758	300
oauth2DeviceCodeLifespan	aef5c390-9834-4cad-83be-4efe22893758	600
oauth2DevicePollingInterval	aef5c390-9834-4cad-83be-4efe22893758	5
webAuthnPolicyRpEntityName	aef5c390-9834-4cad-83be-4efe22893758	keycloak
webAuthnPolicySignatureAlgorithms	aef5c390-9834-4cad-83be-4efe22893758	ES256
webAuthnPolicyRpId	aef5c390-9834-4cad-83be-4efe22893758	
webAuthnPolicyAttestationConveyancePreference	aef5c390-9834-4cad-83be-4efe22893758	not specified
webAuthnPolicyAuthenticatorAttachment	aef5c390-9834-4cad-83be-4efe22893758	not specified
webAuthnPolicyRequireResidentKey	aef5c390-9834-4cad-83be-4efe22893758	not specified
webAuthnPolicyUserVerificationRequirement	aef5c390-9834-4cad-83be-4efe22893758	not specified
webAuthnPolicyCreateTimeout	aef5c390-9834-4cad-83be-4efe22893758	0
webAuthnPolicyAvoidSameAuthenticatorRegister	aef5c390-9834-4cad-83be-4efe22893758	false
webAuthnPolicyRpEntityNamePasswordless	aef5c390-9834-4cad-83be-4efe22893758	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	aef5c390-9834-4cad-83be-4efe22893758	ES256
webAuthnPolicyRpIdPasswordless	aef5c390-9834-4cad-83be-4efe22893758	
webAuthnPolicyAttestationConveyancePreferencePasswordless	aef5c390-9834-4cad-83be-4efe22893758	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	aef5c390-9834-4cad-83be-4efe22893758	not specified
webAuthnPolicyRequireResidentKeyPasswordless	aef5c390-9834-4cad-83be-4efe22893758	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	aef5c390-9834-4cad-83be-4efe22893758	not specified
webAuthnPolicyCreateTimeoutPasswordless	aef5c390-9834-4cad-83be-4efe22893758	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	aef5c390-9834-4cad-83be-4efe22893758	false
cibaBackchannelTokenDeliveryMode	aef5c390-9834-4cad-83be-4efe22893758	poll
cibaExpiresIn	aef5c390-9834-4cad-83be-4efe22893758	120
cibaInterval	aef5c390-9834-4cad-83be-4efe22893758	5
cibaAuthRequestedUserHint	aef5c390-9834-4cad-83be-4efe22893758	login_hint
parRequestUriLifespan	aef5c390-9834-4cad-83be-4efe22893758	60
actionTokenGeneratedByUserLifespan	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	300
oauth2DeviceCodeLifespan	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	600
oauth2DevicePollingInterval	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	5
webAuthnPolicyRpEntityName	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	keycloak
webAuthnPolicySignatureAlgorithms	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	ES256
webAuthnPolicyRpId	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	
webAuthnPolicyAttestationConveyancePreference	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	not specified
webAuthnPolicyAuthenticatorAttachment	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	not specified
realmReusableOtpCode	7b27a11d-121a-4360-960c-3ea6deb0ac35	false
webAuthnPolicyUserVerificationRequirement	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	not specified
webAuthnPolicyCreateTimeout	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	0
webAuthnPolicyAvoidSameAuthenticatorRegister	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	false
webAuthnPolicyRpEntityNamePasswordless	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	ES256
webAuthnPolicyRpIdPasswordless	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	
webAuthnPolicyAttestationConveyancePreferencePasswordless	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	not specified
webAuthnPolicyRequireResidentKeyPasswordless	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	not specified
webAuthnPolicyCreateTimeoutPasswordless	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	false
cibaBackchannelTokenDeliveryMode	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	poll
cibaExpiresIn	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	120
cibaInterval	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	5
cibaAuthRequestedUserHint	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	login_hint
parRequestUriLifespan	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	60
cibaBackchannelTokenDeliveryMode	7b27a11d-121a-4360-960c-3ea6deb0ac35	poll
cibaExpiresIn	7b27a11d-121a-4360-960c-3ea6deb0ac35	120
cibaAuthRequestedUserHint	7b27a11d-121a-4360-960c-3ea6deb0ac35	login_hint
parRequestUriLifespan	7b27a11d-121a-4360-960c-3ea6deb0ac35	60
cibaInterval	7b27a11d-121a-4360-960c-3ea6deb0ac35	5
actionTokenGeneratedByUserLifespan-verify-email	7b27a11d-121a-4360-960c-3ea6deb0ac35	
actionTokenGeneratedByUserLifespan-idp-verify-account-via-email	7b27a11d-121a-4360-960c-3ea6deb0ac35	
actionTokenGeneratedByUserLifespan-reset-credentials	7b27a11d-121a-4360-960c-3ea6deb0ac35	
actionTokenGeneratedByUserLifespan-execute-actions	7b27a11d-121a-4360-960c-3ea6deb0ac35	
displayName	7b27a11d-121a-4360-960c-3ea6deb0ac35	Keycloak
displayNameHtml	7b27a11d-121a-4360-960c-3ea6deb0ac35	<div class="kc-logo-text"><span>Keycloak</span></div>
bruteForceProtected	7b27a11d-121a-4360-960c-3ea6deb0ac35	false
permanentLockout	7b27a11d-121a-4360-960c-3ea6deb0ac35	false
maxFailureWaitSeconds	7b27a11d-121a-4360-960c-3ea6deb0ac35	900
minimumQuickLoginWaitSeconds	7b27a11d-121a-4360-960c-3ea6deb0ac35	60
waitIncrementSeconds	7b27a11d-121a-4360-960c-3ea6deb0ac35	60
quickLoginCheckMilliSeconds	7b27a11d-121a-4360-960c-3ea6deb0ac35	1000
maxDeltaTimeSeconds	7b27a11d-121a-4360-960c-3ea6deb0ac35	43200
failureFactor	7b27a11d-121a-4360-960c-3ea6deb0ac35	30
actionTokenGeneratedByAdminLifespan	7b27a11d-121a-4360-960c-3ea6deb0ac35	43200
actionTokenGeneratedByUserLifespan	7b27a11d-121a-4360-960c-3ea6deb0ac35	300
oauth2DeviceCodeLifespan	7b27a11d-121a-4360-960c-3ea6deb0ac35	600
oauth2DevicePollingInterval	7b27a11d-121a-4360-960c-3ea6deb0ac35	5
defaultSignatureAlgorithm	7b27a11d-121a-4360-960c-3ea6deb0ac35	RS256
offlineSessionMaxLifespanEnabled	7b27a11d-121a-4360-960c-3ea6deb0ac35	false
offlineSessionMaxLifespan	7b27a11d-121a-4360-960c-3ea6deb0ac35	5184000
clientSessionIdleTimeout	7b27a11d-121a-4360-960c-3ea6deb0ac35	0
clientSessionMaxLifespan	7b27a11d-121a-4360-960c-3ea6deb0ac35	0
clientOfflineSessionIdleTimeout	7b27a11d-121a-4360-960c-3ea6deb0ac35	0
clientOfflineSessionMaxLifespan	7b27a11d-121a-4360-960c-3ea6deb0ac35	0
webAuthnPolicyRpEntityName	7b27a11d-121a-4360-960c-3ea6deb0ac35	keycloak
webAuthnPolicySignatureAlgorithms	7b27a11d-121a-4360-960c-3ea6deb0ac35	ES256
webAuthnPolicyRpId	7b27a11d-121a-4360-960c-3ea6deb0ac35	
webAuthnPolicyAttestationConveyancePreference	7b27a11d-121a-4360-960c-3ea6deb0ac35	not specified
webAuthnPolicyAuthenticatorAttachment	7b27a11d-121a-4360-960c-3ea6deb0ac35	not specified
webAuthnPolicyRequireResidentKey	7b27a11d-121a-4360-960c-3ea6deb0ac35	not specified
webAuthnPolicyUserVerificationRequirement	7b27a11d-121a-4360-960c-3ea6deb0ac35	not specified
webAuthnPolicyCreateTimeout	7b27a11d-121a-4360-960c-3ea6deb0ac35	0
webAuthnPolicyAvoidSameAuthenticatorRegister	7b27a11d-121a-4360-960c-3ea6deb0ac35	false
webAuthnPolicyRpEntityNamePasswordless	7b27a11d-121a-4360-960c-3ea6deb0ac35	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	7b27a11d-121a-4360-960c-3ea6deb0ac35	ES256
webAuthnPolicyRpIdPasswordless	7b27a11d-121a-4360-960c-3ea6deb0ac35	
webAuthnPolicyAttestationConveyancePreferencePasswordless	7b27a11d-121a-4360-960c-3ea6deb0ac35	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	7b27a11d-121a-4360-960c-3ea6deb0ac35	not specified
webAuthnPolicyRequireResidentKeyPasswordless	7b27a11d-121a-4360-960c-3ea6deb0ac35	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	7b27a11d-121a-4360-960c-3ea6deb0ac35	not specified
webAuthnPolicyCreateTimeoutPasswordless	7b27a11d-121a-4360-960c-3ea6deb0ac35	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	7b27a11d-121a-4360-960c-3ea6deb0ac35	false
client-policies.profiles	7b27a11d-121a-4360-960c-3ea6deb0ac35	{"profiles":[]}
client-policies.policies	7b27a11d-121a-4360-960c-3ea6deb0ac35	{"policies":[]}
_browser_header.contentSecurityPolicyReportOnly	7b27a11d-121a-4360-960c-3ea6deb0ac35	
_browser_header.xContentTypeOptions	7b27a11d-121a-4360-960c-3ea6deb0ac35	nosniff
_browser_header.xRobotsTag	7b27a11d-121a-4360-960c-3ea6deb0ac35	none
_browser_header.xFrameOptions	7b27a11d-121a-4360-960c-3ea6deb0ac35	SAMEORIGIN
_browser_header.xXSSProtection	7b27a11d-121a-4360-960c-3ea6deb0ac35	1; mode=block
_browser_header.contentSecurityPolicyReportOnly	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	
_browser_header.xContentTypeOptions	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	nosniff
_browser_header.xRobotsTag	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	none
_browser_header.xFrameOptions	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	SAMEORIGIN
_browser_header.contentSecurityPolicy	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	1; mode=block
_browser_header.strictTransportSecurity	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	max-age=31536000; includeSubDomains
bruteForceProtected	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	false
permanentLockout	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	false
maxFailureWaitSeconds	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	900
_browser_header.contentSecurityPolicyReportOnly	dd9bcc37-69c8-4b94-9737-50788f40287c	
_browser_header.xContentTypeOptions	dd9bcc37-69c8-4b94-9737-50788f40287c	nosniff
_browser_header.xRobotsTag	dd9bcc37-69c8-4b94-9737-50788f40287c	none
_browser_header.xFrameOptions	dd9bcc37-69c8-4b94-9737-50788f40287c	SAMEORIGIN
_browser_header.contentSecurityPolicy	dd9bcc37-69c8-4b94-9737-50788f40287c	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	dd9bcc37-69c8-4b94-9737-50788f40287c	1; mode=block
_browser_header.strictTransportSecurity	dd9bcc37-69c8-4b94-9737-50788f40287c	max-age=31536000; includeSubDomains
bruteForceProtected	dd9bcc37-69c8-4b94-9737-50788f40287c	false
permanentLockout	dd9bcc37-69c8-4b94-9737-50788f40287c	false
maxFailureWaitSeconds	dd9bcc37-69c8-4b94-9737-50788f40287c	900
minimumQuickLoginWaitSeconds	dd9bcc37-69c8-4b94-9737-50788f40287c	60
waitIncrementSeconds	dd9bcc37-69c8-4b94-9737-50788f40287c	60
quickLoginCheckMilliSeconds	dd9bcc37-69c8-4b94-9737-50788f40287c	1000
maxDeltaTimeSeconds	dd9bcc37-69c8-4b94-9737-50788f40287c	43200
failureFactor	dd9bcc37-69c8-4b94-9737-50788f40287c	30
realmReusableOtpCode	dd9bcc37-69c8-4b94-9737-50788f40287c	false
defaultSignatureAlgorithm	dd9bcc37-69c8-4b94-9737-50788f40287c	RS256
offlineSessionMaxLifespanEnabled	dd9bcc37-69c8-4b94-9737-50788f40287c	false
offlineSessionMaxLifespan	dd9bcc37-69c8-4b94-9737-50788f40287c	5184000
actionTokenGeneratedByAdminLifespan	dd9bcc37-69c8-4b94-9737-50788f40287c	43200
actionTokenGeneratedByUserLifespan	dd9bcc37-69c8-4b94-9737-50788f40287c	300
oauth2DeviceCodeLifespan	dd9bcc37-69c8-4b94-9737-50788f40287c	600
oauth2DevicePollingInterval	dd9bcc37-69c8-4b94-9737-50788f40287c	5
webAuthnPolicyRpEntityName	dd9bcc37-69c8-4b94-9737-50788f40287c	keycloak
webAuthnPolicySignatureAlgorithms	dd9bcc37-69c8-4b94-9737-50788f40287c	ES256
webAuthnPolicyRpId	dd9bcc37-69c8-4b94-9737-50788f40287c	
webAuthnPolicyAttestationConveyancePreference	dd9bcc37-69c8-4b94-9737-50788f40287c	not specified
webAuthnPolicyAuthenticatorAttachment	dd9bcc37-69c8-4b94-9737-50788f40287c	not specified
webAuthnPolicyRequireResidentKey	dd9bcc37-69c8-4b94-9737-50788f40287c	not specified
webAuthnPolicyUserVerificationRequirement	dd9bcc37-69c8-4b94-9737-50788f40287c	not specified
webAuthnPolicyCreateTimeout	dd9bcc37-69c8-4b94-9737-50788f40287c	0
webAuthnPolicyAvoidSameAuthenticatorRegister	dd9bcc37-69c8-4b94-9737-50788f40287c	false
webAuthnPolicyRpEntityNamePasswordless	dd9bcc37-69c8-4b94-9737-50788f40287c	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	dd9bcc37-69c8-4b94-9737-50788f40287c	ES256
webAuthnPolicyRpIdPasswordless	dd9bcc37-69c8-4b94-9737-50788f40287c	
webAuthnPolicyAttestationConveyancePreferencePasswordless	dd9bcc37-69c8-4b94-9737-50788f40287c	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	dd9bcc37-69c8-4b94-9737-50788f40287c	not specified
webAuthnPolicyRequireResidentKeyPasswordless	dd9bcc37-69c8-4b94-9737-50788f40287c	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	dd9bcc37-69c8-4b94-9737-50788f40287c	not specified
webAuthnPolicyCreateTimeoutPasswordless	dd9bcc37-69c8-4b94-9737-50788f40287c	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	dd9bcc37-69c8-4b94-9737-50788f40287c	false
cibaBackchannelTokenDeliveryMode	dd9bcc37-69c8-4b94-9737-50788f40287c	poll
cibaExpiresIn	dd9bcc37-69c8-4b94-9737-50788f40287c	120
cibaInterval	dd9bcc37-69c8-4b94-9737-50788f40287c	5
cibaAuthRequestedUserHint	dd9bcc37-69c8-4b94-9737-50788f40287c	login_hint
parRequestUriLifespan	dd9bcc37-69c8-4b94-9737-50788f40287c	60
minimumQuickLoginWaitSeconds	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	60
waitIncrementSeconds	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	60
quickLoginCheckMilliSeconds	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	1000
maxDeltaTimeSeconds	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	43200
failureFactor	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	30
realmReusableOtpCode	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	false
defaultSignatureAlgorithm	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	RS256
offlineSessionMaxLifespanEnabled	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	false
offlineSessionMaxLifespan	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	5184000
actionTokenGeneratedByAdminLifespan	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	43200
actionTokenGeneratedByUserLifespan	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	300
oauth2DeviceCodeLifespan	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	600
oauth2DevicePollingInterval	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	5
webAuthnPolicyRpEntityName	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	keycloak
webAuthnPolicySignatureAlgorithms	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	ES256
webAuthnPolicyRpId	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	
webAuthnPolicyAttestationConveyancePreference	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	not specified
webAuthnPolicyAuthenticatorAttachment	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	not specified
webAuthnPolicyRequireResidentKey	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	not specified
_browser_header.contentSecurityPolicy	7b27a11d-121a-4360-960c-3ea6deb0ac35	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.strictTransportSecurity	7b27a11d-121a-4360-960c-3ea6deb0ac35	max-age=31536000; includeSubDomains
webAuthnPolicyRequireResidentKey	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	not specified
webAuthnPolicyUserVerificationRequirement	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	not specified
webAuthnPolicyCreateTimeout	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	0
webAuthnPolicyAvoidSameAuthenticatorRegister	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	false
webAuthnPolicyRpEntityNamePasswordless	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	ES256
webAuthnPolicyRpIdPasswordless	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	
webAuthnPolicyAttestationConveyancePreferencePasswordless	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	not specified
webAuthnPolicyRequireResidentKeyPasswordless	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	not specified
webAuthnPolicyCreateTimeoutPasswordless	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	false
cibaBackchannelTokenDeliveryMode	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	poll
cibaExpiresIn	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	120
cibaInterval	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	5
cibaAuthRequestedUserHint	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	login_hint
parRequestUriLifespan	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	60
_browser_header.contentSecurityPolicyReportOnly	60d763c7-10e3-4490-8529-e1c97d983ade	
_browser_header.xContentTypeOptions	60d763c7-10e3-4490-8529-e1c97d983ade	nosniff
_browser_header.xRobotsTag	60d763c7-10e3-4490-8529-e1c97d983ade	none
_browser_header.xFrameOptions	60d763c7-10e3-4490-8529-e1c97d983ade	SAMEORIGIN
_browser_header.contentSecurityPolicy	60d763c7-10e3-4490-8529-e1c97d983ade	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	60d763c7-10e3-4490-8529-e1c97d983ade	1; mode=block
_browser_header.strictTransportSecurity	60d763c7-10e3-4490-8529-e1c97d983ade	max-age=31536000; includeSubDomains
bruteForceProtected	60d763c7-10e3-4490-8529-e1c97d983ade	false
permanentLockout	60d763c7-10e3-4490-8529-e1c97d983ade	false
maxFailureWaitSeconds	60d763c7-10e3-4490-8529-e1c97d983ade	900
minimumQuickLoginWaitSeconds	60d763c7-10e3-4490-8529-e1c97d983ade	60
waitIncrementSeconds	60d763c7-10e3-4490-8529-e1c97d983ade	60
quickLoginCheckMilliSeconds	60d763c7-10e3-4490-8529-e1c97d983ade	1000
maxDeltaTimeSeconds	60d763c7-10e3-4490-8529-e1c97d983ade	43200
failureFactor	60d763c7-10e3-4490-8529-e1c97d983ade	30
realmReusableOtpCode	60d763c7-10e3-4490-8529-e1c97d983ade	false
defaultSignatureAlgorithm	60d763c7-10e3-4490-8529-e1c97d983ade	RS256
offlineSessionMaxLifespanEnabled	60d763c7-10e3-4490-8529-e1c97d983ade	false
offlineSessionMaxLifespan	60d763c7-10e3-4490-8529-e1c97d983ade	5184000
actionTokenGeneratedByAdminLifespan	60d763c7-10e3-4490-8529-e1c97d983ade	43200
actionTokenGeneratedByUserLifespan	60d763c7-10e3-4490-8529-e1c97d983ade	300
oauth2DeviceCodeLifespan	60d763c7-10e3-4490-8529-e1c97d983ade	600
oauth2DevicePollingInterval	60d763c7-10e3-4490-8529-e1c97d983ade	5
webAuthnPolicyRpEntityName	60d763c7-10e3-4490-8529-e1c97d983ade	keycloak
webAuthnPolicySignatureAlgorithms	60d763c7-10e3-4490-8529-e1c97d983ade	ES256
webAuthnPolicyRpId	60d763c7-10e3-4490-8529-e1c97d983ade	
webAuthnPolicyAttestationConveyancePreference	60d763c7-10e3-4490-8529-e1c97d983ade	not specified
webAuthnPolicyAuthenticatorAttachment	60d763c7-10e3-4490-8529-e1c97d983ade	not specified
webAuthnPolicyRequireResidentKey	60d763c7-10e3-4490-8529-e1c97d983ade	not specified
webAuthnPolicyUserVerificationRequirement	60d763c7-10e3-4490-8529-e1c97d983ade	not specified
webAuthnPolicyCreateTimeout	60d763c7-10e3-4490-8529-e1c97d983ade	0
webAuthnPolicyAvoidSameAuthenticatorRegister	60d763c7-10e3-4490-8529-e1c97d983ade	false
webAuthnPolicyRpEntityNamePasswordless	60d763c7-10e3-4490-8529-e1c97d983ade	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	60d763c7-10e3-4490-8529-e1c97d983ade	ES256
webAuthnPolicyRpIdPasswordless	60d763c7-10e3-4490-8529-e1c97d983ade	
webAuthnPolicyAttestationConveyancePreferencePasswordless	60d763c7-10e3-4490-8529-e1c97d983ade	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	60d763c7-10e3-4490-8529-e1c97d983ade	not specified
webAuthnPolicyRequireResidentKeyPasswordless	60d763c7-10e3-4490-8529-e1c97d983ade	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	60d763c7-10e3-4490-8529-e1c97d983ade	not specified
webAuthnPolicyCreateTimeoutPasswordless	60d763c7-10e3-4490-8529-e1c97d983ade	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	60d763c7-10e3-4490-8529-e1c97d983ade	false
cibaBackchannelTokenDeliveryMode	60d763c7-10e3-4490-8529-e1c97d983ade	poll
cibaExpiresIn	60d763c7-10e3-4490-8529-e1c97d983ade	120
cibaInterval	60d763c7-10e3-4490-8529-e1c97d983ade	5
cibaAuthRequestedUserHint	60d763c7-10e3-4490-8529-e1c97d983ade	login_hint
parRequestUriLifespan	60d763c7-10e3-4490-8529-e1c97d983ade	60
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
aef5c390-9834-4cad-83be-4efe22893758	jboss-logging
dd9bcc37-69c8-4b94-9737-50788f40287c	jboss-logging
3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	jboss-logging
7b27a11d-121a-4360-960c-3ea6deb0ac35	jboss-logging
0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	jboss-logging
60d763c7-10e3-4490-8529-e1c97d983ade	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	7b27a11d-121a-4360-960c-3ea6deb0ac35
password	password	t	t	aef5c390-9834-4cad-83be-4efe22893758
password	password	t	t	dd9bcc37-69c8-4b94-9737-50788f40287c
password	password	t	t	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6
password	password	t	t	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd
password	password	t	t	60d763c7-10e3-4490-8529-e1c97d983ade
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.redirect_uris (client_id, value) FROM stdin;
a5c0cd4f-9960-4295-be98-18892e399260	/realms/master/account/*
b6ffcb90-757d-4454-bc80-afead1b60dc4	/realms/master/account/*
c4c6722f-da0c-4d9a-a651-f3ff1c34f74a	/admin/master/console/*
928149f2-e5f0-433f-8627-3b365ba78f43	/realms/hcmut/account/*
42d7f3cb-b3bf-4a0b-a6ec-068cf3f8478f	/realms/hcmut/account/*
02a8082a-7107-4805-991d-5bd6f4aea9ff	/admin/hcmut/console/*
417002ee-8613-452e-b8f0-f8c218f6652d	https://ducluong.monster/*
417002ee-8613-452e-b8f0-f8c218f6652d	http://localhost:3000/*
417002ee-8613-452e-b8f0-f8c218f6652d	http://192.168.170.112:3000/*
2562fb91-4b82-42b8-aa73-612927e02a94	https://ducluong.monster/*
2562fb91-4b82-42b8-aa73-612927e02a94	http://localhost:3000/*
2562fb91-4b82-42b8-aa73-612927e02a94	http://192.168.170.112:3000/*
77861797-fdcd-4947-a13a-3b1f38496674	http://localhost:8080/*
77861797-fdcd-4947-a13a-3b1f38496674	http://localhost:3000/*
ce857b6b-099f-4727-a8e4-51203afebea3	/realms/pdt/account/*
01cdc332-278c-4884-9386-3bc62a7c2df9	/realms/pdt/account/*
962887df-3902-4556-923d-622a6e793de3	/admin/pdt/console/*
725c3687-2ed3-4c82-ba58-0127dc67f445	http://localhost:3000/*
40e8770f-aeae-4711-a208-8f8f4cd71021	/realms/pkt/account/*
bd8261f7-9d01-4003-a5b5-c344168aa641	/realms/pkt/account/*
fc659080-6f8b-4b2f-b7d8-ef7b5b859603	/admin/pkt/console/*
ef4b8911-9bac-4af9-af11-ed4989f050f5	http://localhost:3000/*
1ec2902d-1719-4bff-abd1-ae3c59cdd1d0	/realms/pit/account/*
055aed68-db28-4769-a5a2-3896b6383f81	/realms/pit/account/*
7a818d10-f579-486b-a765-914f257898e4	/admin/pit/console/*
c83e2155-6053-4feb-9079-1c17482cfa53	http://localhost:3000/*
1933ba2e-6c06-4466-b1c5-44b87f23a311	/realms/pkt2/account/*
fe783fd4-f23f-4777-9958-15ba12be6fb9	/realms/pkt2/account/*
8b95af71-6ef9-4cd2-8165-6bf8e2b397ab	/admin/pkt2/console/*
9df70eb4-dea8-4ea0-841f-3718eced8d37	http://localhost:3000/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
3ccb1726-620b-4d47-9031-f120bad2e0f0	VERIFY_EMAIL	Verify Email	7b27a11d-121a-4360-960c-3ea6deb0ac35	t	f	VERIFY_EMAIL	50
380ad117-0979-4802-97c4-387ab1fea871	UPDATE_PROFILE	Update Profile	7b27a11d-121a-4360-960c-3ea6deb0ac35	t	f	UPDATE_PROFILE	40
04f072b1-3364-40b5-9fe7-0c72f2d709dd	CONFIGURE_TOTP	Configure OTP	7b27a11d-121a-4360-960c-3ea6deb0ac35	t	f	CONFIGURE_TOTP	10
827cd882-d5f0-439d-8a57-ad8cb67351fd	UPDATE_PASSWORD	Update Password	7b27a11d-121a-4360-960c-3ea6deb0ac35	t	f	UPDATE_PASSWORD	30
141a8e3b-1607-41fb-b9d1-885d4110849b	terms_and_conditions	Terms and Conditions	7b27a11d-121a-4360-960c-3ea6deb0ac35	f	f	terms_and_conditions	20
e3c4d9c6-a3b8-41bd-8310-c550dab63565	delete_account	Delete Account	7b27a11d-121a-4360-960c-3ea6deb0ac35	f	f	delete_account	60
65fefa2d-e740-447e-aa33-2ac9ce5a535b	update_user_locale	Update User Locale	7b27a11d-121a-4360-960c-3ea6deb0ac35	t	f	update_user_locale	1000
05e5c081-1149-433d-aed6-961fad581325	webauthn-register	Webauthn Register	7b27a11d-121a-4360-960c-3ea6deb0ac35	t	f	webauthn-register	70
b51f2c0f-d54f-47ff-967e-b809493994f5	webauthn-register-passwordless	Webauthn Register Passwordless	7b27a11d-121a-4360-960c-3ea6deb0ac35	t	f	webauthn-register-passwordless	80
5bd12357-c4a2-4aae-bdeb-04130673c2c6	VERIFY_EMAIL	Verify Email	aef5c390-9834-4cad-83be-4efe22893758	t	f	VERIFY_EMAIL	50
b690413c-12e9-41cc-b16f-fc99626fddfb	UPDATE_PROFILE	Update Profile	aef5c390-9834-4cad-83be-4efe22893758	t	f	UPDATE_PROFILE	40
1c3a8356-cf5b-4d76-b914-7b6fa87d7f35	CONFIGURE_TOTP	Configure OTP	aef5c390-9834-4cad-83be-4efe22893758	t	f	CONFIGURE_TOTP	10
2e78e293-a467-4a6a-ba2b-9a41e845daf7	UPDATE_PASSWORD	Update Password	aef5c390-9834-4cad-83be-4efe22893758	t	f	UPDATE_PASSWORD	30
47f76b08-0057-4cce-b0a2-5c5f5438c947	terms_and_conditions	Terms and Conditions	aef5c390-9834-4cad-83be-4efe22893758	f	f	terms_and_conditions	20
bc802159-e882-4346-a2f2-58a1e751b531	delete_account	Delete Account	aef5c390-9834-4cad-83be-4efe22893758	f	f	delete_account	60
536b6b11-ed87-46e9-9209-d1d0c54436cc	update_user_locale	Update User Locale	aef5c390-9834-4cad-83be-4efe22893758	t	f	update_user_locale	1000
b3276885-e79d-4e91-ad21-6ed354bcfd39	webauthn-register	Webauthn Register	aef5c390-9834-4cad-83be-4efe22893758	t	f	webauthn-register	70
947756a1-865b-4c73-83bb-ae4002e5163f	webauthn-register-passwordless	Webauthn Register Passwordless	aef5c390-9834-4cad-83be-4efe22893758	t	f	webauthn-register-passwordless	80
ac7342ca-9853-422f-9a23-faa7f78da24e	VERIFY_EMAIL	Verify Email	60d763c7-10e3-4490-8529-e1c97d983ade	t	f	VERIFY_EMAIL	50
cb84fa51-a2aa-46b8-a147-a54e917d92b5	UPDATE_PROFILE	Update Profile	60d763c7-10e3-4490-8529-e1c97d983ade	t	f	UPDATE_PROFILE	40
1e2cad5a-1141-49d1-b9fa-f58035b14428	CONFIGURE_TOTP	Configure OTP	60d763c7-10e3-4490-8529-e1c97d983ade	t	f	CONFIGURE_TOTP	10
b6b6a96e-2ac6-4b7c-815f-1a733dc97063	VERIFY_EMAIL	Verify Email	dd9bcc37-69c8-4b94-9737-50788f40287c	t	f	VERIFY_EMAIL	50
cc5eb54e-eab3-4fc3-9978-7dbbe75dc564	UPDATE_PROFILE	Update Profile	dd9bcc37-69c8-4b94-9737-50788f40287c	t	f	UPDATE_PROFILE	40
4a1a5143-b05e-4b9d-ad0b-d5e3dea02734	CONFIGURE_TOTP	Configure OTP	dd9bcc37-69c8-4b94-9737-50788f40287c	t	f	CONFIGURE_TOTP	10
8c16d9f0-d084-40dd-a4c4-7d81966f5d50	UPDATE_PASSWORD	Update Password	dd9bcc37-69c8-4b94-9737-50788f40287c	t	f	UPDATE_PASSWORD	30
8e32089d-2f7e-441b-8f43-55567f0102c6	terms_and_conditions	Terms and Conditions	dd9bcc37-69c8-4b94-9737-50788f40287c	f	f	terms_and_conditions	20
ac5ccef8-d787-4f42-9dec-580baec9b76d	delete_account	Delete Account	dd9bcc37-69c8-4b94-9737-50788f40287c	f	f	delete_account	60
f534badd-f5bd-4aa9-91f3-c0af152f2548	update_user_locale	Update User Locale	dd9bcc37-69c8-4b94-9737-50788f40287c	t	f	update_user_locale	1000
ee189c6a-f6bb-4cf6-af1b-4c506dc344c4	webauthn-register	Webauthn Register	dd9bcc37-69c8-4b94-9737-50788f40287c	t	f	webauthn-register	70
bb411f23-977e-4674-be0b-0124dd8d04f1	webauthn-register-passwordless	Webauthn Register Passwordless	dd9bcc37-69c8-4b94-9737-50788f40287c	t	f	webauthn-register-passwordless	80
633c0619-9116-45eb-8692-0864711700e8	VERIFY_EMAIL	Verify Email	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	t	f	VERIFY_EMAIL	50
22d4e892-91e5-4b46-b043-9943dedec391	UPDATE_PROFILE	Update Profile	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	t	f	UPDATE_PROFILE	40
1b835180-b688-4a7a-bfa7-a2c099cb9e02	CONFIGURE_TOTP	Configure OTP	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	t	f	CONFIGURE_TOTP	10
99678549-0f33-489d-934a-00a7ad9d3a1f	UPDATE_PASSWORD	Update Password	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	t	f	UPDATE_PASSWORD	30
6aa7829d-d964-4671-a7f3-fa89d8232e77	terms_and_conditions	Terms and Conditions	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	f	f	terms_and_conditions	20
38e71037-bc05-4bf9-ae1c-0b5a167752aa	delete_account	Delete Account	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	f	f	delete_account	60
f95c2770-b994-4716-8e2e-b1b990b97297	update_user_locale	Update User Locale	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	t	f	update_user_locale	1000
50ae6c15-96ce-419f-9104-8305358cb2ec	webauthn-register	Webauthn Register	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	t	f	webauthn-register	70
62ae6adc-4b81-42b2-94ae-6d58b1ba7b82	webauthn-register-passwordless	Webauthn Register Passwordless	3228f8dc-13bd-4a68-aea5-a2afd62d9ff6	t	f	webauthn-register-passwordless	80
21628d81-5146-446e-8c0b-c546961900a1	VERIFY_EMAIL	Verify Email	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	t	f	VERIFY_EMAIL	50
b3ca406f-ab5f-4198-92a3-7e76001cc11e	UPDATE_PROFILE	Update Profile	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	t	f	UPDATE_PROFILE	40
92d40b50-a2e3-4d91-9aaf-5792add33210	CONFIGURE_TOTP	Configure OTP	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	t	f	CONFIGURE_TOTP	10
b79312ce-5a7d-41f6-af3f-fd16dbf8a9c3	UPDATE_PASSWORD	Update Password	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	t	f	UPDATE_PASSWORD	30
df362135-744f-46b4-a667-baacdf591303	terms_and_conditions	Terms and Conditions	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	f	f	terms_and_conditions	20
11ff6acc-fec0-4e4e-9cc6-c7face8629d7	delete_account	Delete Account	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	f	f	delete_account	60
fdf27596-3c6f-4727-b35f-8410295b9093	update_user_locale	Update User Locale	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	t	f	update_user_locale	1000
34876f66-b263-4dc2-9d36-64fc1afa55e1	webauthn-register	Webauthn Register	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	t	f	webauthn-register	70
a4f72573-5fe7-4ff5-853b-5c0a17d355c0	webauthn-register-passwordless	Webauthn Register Passwordless	0ec42f6e-2c1a-4dfb-b5a3-9d398df143cd	t	f	webauthn-register-passwordless	80
3cc2734d-4254-4cda-8103-e4ca8b42c334	UPDATE_PASSWORD	Update Password	60d763c7-10e3-4490-8529-e1c97d983ade	t	f	UPDATE_PASSWORD	30
6752cc05-c910-4080-a36e-b6c27821514b	terms_and_conditions	Terms and Conditions	60d763c7-10e3-4490-8529-e1c97d983ade	f	f	terms_and_conditions	20
bf1a3b16-1ab3-40cc-9616-012f58d56a28	delete_account	Delete Account	60d763c7-10e3-4490-8529-e1c97d983ade	f	f	delete_account	60
9627aab6-f109-4afc-8d27-2f23ef776f28	update_user_locale	Update User Locale	60d763c7-10e3-4490-8529-e1c97d983ade	t	f	update_user_locale	1000
5034ec40-1333-4239-b981-134d85fed773	webauthn-register	Webauthn Register	60d763c7-10e3-4490-8529-e1c97d983ade	t	f	webauthn-register	70
78569837-f0ea-40a1-8fad-142bd49791d6	webauthn-register-passwordless	Webauthn Register Passwordless	60d763c7-10e3-4490-8529-e1c97d983ade	t	f	webauthn-register-passwordless	80
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
b6ffcb90-757d-4454-bc80-afead1b60dc4	86632318-809f-4392-b0a7-608347dca4d5
b6ffcb90-757d-4454-bc80-afead1b60dc4	198a6c51-db3a-48f9-8e04-898e9b50c392
42d7f3cb-b3bf-4a0b-a6ec-068cf3f8478f	6c5334fd-75ea-4e27-944a-0c672ad49c45
42d7f3cb-b3bf-4a0b-a6ec-068cf3f8478f	afd67c44-349f-4abc-bc91-3f7ac5f736cf
01cdc332-278c-4884-9386-3bc62a7c2df9	e6602492-d78e-43cd-8c93-de3b68a4f7e5
01cdc332-278c-4884-9386-3bc62a7c2df9	8beb7a92-5aa8-4efe-a756-bacb1c70e9fc
bd8261f7-9d01-4003-a5b5-c344168aa641	4ec7c7fb-668d-40a5-817c-7a149add92ad
bd8261f7-9d01-4003-a5b5-c344168aa641	e999b0df-1d05-4440-a78d-a6dd4110cb64
055aed68-db28-4769-a5a2-3896b6383f81	b700ec19-beee-4bcf-a551-2f77324382f0
055aed68-db28-4769-a5a2-3896b6383f81	3f9419a9-d844-4e50-8ce2-81b2c793d2e7
fe783fd4-f23f-4777-9958-15ba12be6fb9	dc300d1f-d8a8-4521-9fad-7f227519d315
fe783fd4-f23f-4777-9958-15ba12be6fb9	e3358812-d872-4d44-be6a-97172bbc9184
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
ce8e8317-400d-4b3c-99aa-b00ef402a6f0	\N	4f3393bc-2772-499d-8e9b-7ac68b6c63fa	f	t	\N	\N	\N	7b27a11d-121a-4360-960c-3ea6deb0ac35	admin	1681537367352	\N	0
ad918d69-8328-4795-884a-98db5bf1e72e	\N	9688a864-5bd6-4444-90a9-da33bef9b678	f	t	\N			aef5c390-9834-4cad-83be-4efe22893758	manh	1681546406426	\N	0
9c494b4d-2069-4efb-b9d9-d74d4568e10b	\N	ca8adcc2-10d0-425c-9067-455ff6b615c5	f	t	\N			aef5c390-9834-4cad-83be-4efe22893758	khoa	1681546448870	\N	0
96d81d84-06f7-4f92-a4f5-f149a2e12385	\N	42f9583a-2be1-4fbc-987a-f5b753cea5a2	f	t	\N			aef5c390-9834-4cad-83be-4efe22893758	manh_unit_admin	1682929502912	\N	0
0eb8f40f-9797-489f-b9b2-299f22f68f9b	\N	9dd89f6f-7725-422a-aa92-fb6ec1a95abb	f	t	\N			7b27a11d-121a-4360-960c-3ea6deb0ac35	manh_super	1682929799313	\N	0
a3d473f6-668d-4144-82ab-4a5bb9d786dd	\N	df3e0a47-3115-4a6a-a617-8ac03255b2ee	f	t	\N			aef5c390-9834-4cad-83be-4efe22893758	manh_normal	1682929868435	\N	0
c127b5e1-d543-4550-8123-f3ed9f572cb2	luongnugye@gmail.com	luongnugye@gmail.com	f	f	\N	Nguyen Trong	Duc	7b27a11d-121a-4360-960c-3ea6deb0ac35	luongnguyen	1683134133593	\N	0
87165d91-1653-4159-b2ca-6c7f89675bb2	luongnguyentrongduc@gmail.com	luongnguyentrongduc@gmail.com	f	f	\N	Nguyễn Trọng	Lương	60d763c7-10e3-4490-8529-e1c97d983ade	manh	1683184611685	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
96d81d84-06f7-4f92-a4f5-f149a2e12385	UPDATE_PASSWORD
0eb8f40f-9797-489f-b9b2-299f22f68f9b	UPDATE_PASSWORD
a3d473f6-668d-4144-82ab-4a5bb9d786dd	UPDATE_PASSWORD
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
b8ccb5a5-7b30-403b-84c1-05b0af0e326b	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
33c2018c-45f5-40b2-a110-530e248957b3	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
d906b022-99b6-4be1-9354-233cdd4b9505	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
f6163a5b-9afd-4f65-b621-4ac9c81abb97	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
7c60fea7-af22-4d4e-b6f4-23749238857b	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
4034b444-933c-4a38-aa29-55408a32e0ae	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
e5a59136-3be0-4505-8fdd-fe722b5720ca	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
b4308ea3-ee17-4909-b248-753a94eca917	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
a595394f-64da-4da9-9169-c9ccba0cba8a	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
c4da7ee1-e887-433b-8e58-f645c366c5bd	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
8023abc7-cc5e-47c2-b194-50e0d859df3a	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
a891dce1-f248-4a2d-ba69-eab87cfdf0b2	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
9ad219f1-9108-4daf-8bc1-0e4c4185bce4	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
3a8e3f51-734c-4df4-9451-e5459c99aba8	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
767aa1f2-2a35-4a02-8a39-1e7ff137e0c8	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
558e4cf2-3d1b-4f07-9829-8034ee23e7ef	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
8152d047-23ef-4969-8aa6-5d7f3e119f7f	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
0f1cf823-dc36-4bf3-b3b8-d5ac587dea6b	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
7ad23bc5-e709-47f1-bf42-db9959f0cc1e	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
ac66a7f0-4852-4954-91c0-1cfbd4b998ce	ad918d69-8328-4795-884a-98db5bf1e72e
7e1ecf5b-4752-46d6-886a-98a2803b5a6c	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
ac66a7f0-4852-4954-91c0-1cfbd4b998ce	9c494b4d-2069-4efb-b9d9-d74d4568e10b
ced8dca4-72f0-4e77-ad98-1ae94b79e2c8	9c494b4d-2069-4efb-b9d9-d74d4568e10b
e8226ad1-1c32-4114-8bcb-0981fad71456	ad918d69-8328-4795-884a-98db5bf1e72e
ac66a7f0-4852-4954-91c0-1cfbd4b998ce	96d81d84-06f7-4f92-a4f5-f149a2e12385
a00b830e-9926-4d93-acaa-ffcc7141c3cf	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
e8226ad1-1c32-4114-8bcb-0981fad71456	96d81d84-06f7-4f92-a4f5-f149a2e12385
7a187b80-360d-4098-b65f-9196b41f4471	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
b8ccb5a5-7b30-403b-84c1-05b0af0e326b	0eb8f40f-9797-489f-b9b2-299f22f68f9b
33c2018c-45f5-40b2-a110-530e248957b3	0eb8f40f-9797-489f-b9b2-299f22f68f9b
ac66a7f0-4852-4954-91c0-1cfbd4b998ce	a3d473f6-668d-4144-82ab-4a5bb9d786dd
ced8dca4-72f0-4e77-ad98-1ae94b79e2c8	a3d473f6-668d-4144-82ab-4a5bb9d786dd
066f8ee4-d038-4bd9-bbff-1341923fec5c	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
f0734538-2a07-4579-ab89-1f5624d595b7	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
7f1f202d-848f-45fc-92e2-371e97eafeec	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
23910550-c2af-4ddf-8553-32f5944758af	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
00bac9a3-c98d-44e9-89c0-31c18496ada1	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
af609d01-125e-4ba0-aa18-6f72e3155a95	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
de150fac-2d9c-4f64-b79d-f78585879c22	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
18f0ded3-4ba7-43b4-9811-737f74d4c9b3	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
94ab3797-17dc-45e0-aae8-93daec6153ea	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
fe89ce5f-9d36-43bf-aaac-4e011cf03a56	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
4268a7b4-39fa-422c-9e6e-d645b7aa905e	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
815bd30c-b033-49fb-b4da-7b1318590402	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
5a1adf07-04fb-4cea-bb6e-8346923127bb	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
b41a65e1-986d-4aba-80bb-2e098d051c2e	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
5de22eb4-b9f4-4c58-b67a-abc080ff95e7	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
87192a27-23d4-4ebe-a3d2-26af747a6950	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
62cdc368-cc98-4a70-8450-a1e78254ca92	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
8a06219f-0c52-4b12-9f67-27d022ba745d	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
eac101bc-97f8-4420-aabe-3bd1e5be1253	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
faeb47f6-9d0f-4ae8-909d-065094d2b785	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
51dd2216-d4a3-41e2-8aa4-8fd3e5abc072	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
9bcb6c87-032f-460a-bdfc-1d6cab36f709	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
afeb6572-efc2-464a-ac1e-dc5017b618fc	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
39e2e82d-78ed-4082-9a10-36e2d5db28a6	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
35436b22-5d4b-4bdf-b3fd-cc4fd6aac0d0	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
d3f4c47b-5166-4741-9f56-aca93f622b04	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
9d17d1b2-aed5-4bad-a245-81fdef6608a1	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
899186ca-e455-4458-92d6-a31a4600a5cb	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
78f084a4-275b-4c0c-afe5-9b8e5f870608	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
27aceaeb-ea2a-4515-b8cf-408ad73a31be	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
baacdcc4-db27-4994-8bf4-e9b5adb1c76e	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
3619975c-b8c3-4ab3-876f-ddda3041fdd1	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
3475b62d-d922-4ce3-bbe4-5f02abf76be3	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
57a835b6-34c5-4063-b98e-da63927b2184	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
0548776a-cdbb-4dec-b4ec-f99942f4ff1a	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
6bf6ccce-666f-47d8-9240-3f4de97104c1	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
8f5e7777-bac8-4d10-8fd2-60a5b2353e0b	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
d7cb0209-8cf7-47e0-8158-0cbf511cf6d7	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
6777789d-0db0-4ecd-8f10-ff07a7e426a5	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
580f0c52-1d3d-4d3e-b021-8be2503a0c1a	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
eb013ef5-275c-4932-82e5-7a8befa79038	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
e7325562-5302-4947-94a1-fc9d707873c5	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
19bbbcab-263e-4828-ba93-d571c2402dd3	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
fa8ad817-0f87-4eae-a6d2-a49bbc0fe48d	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
68435a4f-b7d8-47a3-8894-d11f7be0c21c	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
fc110243-c897-44f0-9d39-35edf94a6ae4	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
1ae3fb38-fd96-447f-976e-f06351f880fd	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
f0b90130-b95d-4170-a482-0a718821cac9	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
b8ccb5a5-7b30-403b-84c1-05b0af0e326b	c127b5e1-d543-4550-8123-f3ed9f572cb2
18a13f9d-6f4b-4169-a8cb-b8c0791d76fd	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
32083aff-148a-45ad-982b-f1d5af5b6768	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
5bce9b38-abeb-4103-a47c-a546e28af4be	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
aab8e412-b1f5-4b0f-84d6-13a13b34aa26	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
6808a954-311b-427f-a43b-66413edb55de	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
a5d4b119-9eda-4b7e-8eba-9145e32cb814	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
8d1b3ff7-1b94-412a-8ccd-7f026b7c7f7d	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
38c88e5e-d537-414d-80a1-b634b0baa348	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
3266881f-97ee-4de3-9270-2674accb2ead	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
5b5a63be-7f3d-4940-804b-6016f528ab42	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
0e49cbff-35a2-45b7-86b3-7a69d6525ddb	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
5586ddbe-ef8b-4403-8533-51a0aaa7fc98	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
876ac072-998f-4014-bc95-a193782f38c0	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
6b1accf4-3374-46cb-807f-0cc872127601	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
c67a6fa0-9e06-49b9-837c-862edc756da5	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
13054329-2d19-4da6-9d09-06dfed9ffce4	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
50dbef80-3c88-4e12-8a42-fecc097e336a	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
6cefe484-cb9f-44f2-9d71-e3c6f53d23be	87165d91-1653-4159-b2ca-6c7f89675bb2
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.web_origins (client_id, value) FROM stdin;
c4c6722f-da0c-4d9a-a651-f3ff1c34f74a	+
02a8082a-7107-4805-991d-5bd6f4aea9ff	+
417002ee-8613-452e-b8f0-f8c218f6652d	https://ducluong.monster
417002ee-8613-452e-b8f0-f8c218f6652d	http://192.168.170.112:3000/
417002ee-8613-452e-b8f0-f8c218f6652d	http://localhost:3000
2562fb91-4b82-42b8-aa73-612927e02a94	http://localhost:3000
77861797-fdcd-4947-a13a-3b1f38496674	http://localhost:5000
962887df-3902-4556-923d-622a6e793de3	+
725c3687-2ed3-4c82-ba58-0127dc67f445	http://localhost:3000
fc659080-6f8b-4b2f-b7d8-ef7b5b859603	+
ef4b8911-9bac-4af9-af11-ed4989f050f5	http://localhost:3000
7a818d10-f579-486b-a765-914f257898e4	+
c83e2155-6053-4feb-9079-1c17482cfa53	http://localhost:3000
8b95af71-6ef9-4cd2-8165-6bf8e2b397ab	+
9df70eb4-dea8-4ea0-841f-3718eced8d37	http://localhost:3000
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- Name: DATABASE keycloak; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE keycloak TO keycloak;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT ALL ON SCHEMA public TO keycloak;


--
-- PostgreSQL database dump complete
--

--
-- Database "lvtn" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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

--
-- Name: lvtn; Type: DATABASE; Schema: -; Owner: api_server
--

CREATE DATABASE lvtn WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE lvtn OWNER TO api_server;

\connect lvtn

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
-- Name: student_perf; Type: TABLE; Schema: public; Owner: api_server
--

CREATE TABLE public.student_perf (
    gender text,
    "race/ethnicity" text,
    "parental level of education" text,
    lunch text,
    "test preparation course" text,
    "math score" bigint,
    "reading score" bigint,
    "writing score" bigint
);


ALTER TABLE public.student_perf OWNER TO api_server;

--
-- Data for Name: student_perf; Type: TABLE DATA; Schema: public; Owner: api_server
--

COPY public.student_perf (gender, "race/ethnicity", "parental level of education", lunch, "test preparation course", "math score", "reading score", "writing score") FROM stdin;
female	group B	bachelor's degree	standard	none	72	72	74
female	group C	some college	standard	completed	69	90	88
female	group B	master's degree	standard	none	90	95	93
male	group A	associate's degree	free/reduced	none	47	57	44
male	group C	some college	standard	none	76	78	75
female	group B	associate's degree	standard	none	71	83	78
female	group B	some college	standard	completed	88	95	92
male	group B	some college	free/reduced	none	40	43	39
male	group D	high school	free/reduced	completed	64	64	67
female	group B	high school	free/reduced	none	38	60	50
male	group C	associate's degree	standard	none	58	54	52
male	group D	associate's degree	standard	none	40	52	43
female	group B	high school	standard	none	65	81	73
male	group A	some college	standard	completed	78	72	70
female	group A	master's degree	standard	none	50	53	58
female	group C	some high school	standard	none	69	75	78
male	group C	high school	standard	none	88	89	86
female	group B	some high school	free/reduced	none	18	32	28
male	group C	master's degree	free/reduced	completed	46	42	46
female	group C	associate's degree	free/reduced	none	54	58	61
male	group D	high school	standard	none	66	69	63
female	group B	some college	free/reduced	completed	65	75	70
male	group D	some college	standard	none	44	54	53
female	group C	some high school	standard	none	69	73	73
male	group D	bachelor's degree	free/reduced	completed	74	71	80
male	group A	master's degree	free/reduced	none	73	74	72
male	group B	some college	standard	none	69	54	55
female	group C	bachelor's degree	standard	none	67	69	75
male	group C	high school	standard	none	70	70	65
female	group D	master's degree	standard	none	62	70	75
female	group D	some college	standard	none	69	74	74
female	group B	some college	standard	none	63	65	61
female	group E	master's degree	free/reduced	none	56	72	65
male	group D	some college	standard	none	40	42	38
male	group E	some college	standard	none	97	87	82
male	group E	associate's degree	standard	completed	81	81	79
female	group D	associate's degree	standard	none	74	81	83
female	group D	some high school	free/reduced	none	50	64	59
female	group D	associate's degree	free/reduced	completed	75	90	88
male	group B	associate's degree	free/reduced	none	57	56	57
male	group C	associate's degree	free/reduced	none	55	61	54
female	group C	associate's degree	standard	none	58	73	68
female	group B	associate's degree	standard	none	53	58	65
male	group B	some college	free/reduced	completed	59	65	66
female	group E	associate's degree	free/reduced	none	50	56	54
male	group B	associate's degree	standard	none	65	54	57
female	group A	associate's degree	standard	completed	55	65	62
female	group C	high school	standard	none	66	71	76
female	group D	associate's degree	free/reduced	completed	57	74	76
male	group C	high school	standard	completed	82	84	82
male	group E	some college	standard	none	53	55	48
male	group E	associate's degree	free/reduced	completed	77	69	68
male	group C	some college	standard	none	53	44	42
male	group D	high school	standard	none	88	78	75
female	group C	some high school	free/reduced	completed	71	84	87
female	group C	high school	free/reduced	none	33	41	43
female	group E	associate's degree	standard	completed	82	85	86
male	group D	associate's degree	standard	none	52	55	49
male	group D	some college	standard	completed	58	59	58
female	group C	some high school	free/reduced	none	0	17	10
male	group E	bachelor's degree	free/reduced	completed	79	74	72
male	group A	some high school	free/reduced	none	39	39	34
male	group A	associate's degree	free/reduced	none	62	61	55
female	group C	associate's degree	standard	none	69	80	71
female	group D	some high school	standard	none	59	58	59
male	group B	some high school	standard	none	67	64	61
male	group D	some high school	free/reduced	none	45	37	37
female	group C	some college	standard	none	60	72	74
male	group B	associate's degree	free/reduced	none	61	58	56
female	group C	associate's degree	standard	none	39	64	57
female	group D	some college	free/reduced	completed	58	63	73
male	group D	some college	standard	completed	63	55	63
female	group A	associate's degree	free/reduced	none	41	51	48
male	group C	some high school	free/reduced	none	61	57	56
male	group C	some high school	standard	none	49	49	41
male	group B	associate's degree	free/reduced	none	44	41	38
male	group E	some high school	standard	none	30	26	22
male	group A	bachelor's degree	standard	completed	80	78	81
female	group D	some high school	standard	completed	61	74	72
female	group E	master's degree	standard	none	62	68	68
female	group B	associate's degree	standard	none	47	49	50
male	group B	high school	free/reduced	none	49	45	45
male	group A	some college	free/reduced	completed	50	47	54
male	group E	associate's degree	standard	none	72	64	63
male	group D	high school	free/reduced	none	42	39	34
female	group C	some college	standard	none	73	80	82
female	group C	some college	free/reduced	none	76	83	88
female	group D	associate's degree	standard	none	71	71	74
female	group A	some college	standard	none	58	70	67
female	group D	some high school	standard	none	73	86	82
female	group C	bachelor's degree	standard	none	65	72	74
male	group C	high school	free/reduced	none	27	34	36
male	group C	high school	standard	none	71	79	71
male	group C	associate's degree	free/reduced	completed	43	45	50
female	group B	some college	standard	none	79	86	92
male	group C	associate's degree	free/reduced	completed	78	81	82
male	group B	some high school	standard	completed	65	66	62
female	group E	some college	standard	completed	63	72	70
female	group D	some college	free/reduced	none	58	67	62
female	group D	bachelor's degree	standard	none	65	67	62
male	group B	some college	standard	none	79	67	67
male	group D	bachelor's degree	standard	completed	68	74	74
female	group D	associate's degree	standard	none	85	91	89
male	group B	high school	standard	completed	60	44	47
male	group C	some college	standard	completed	98	86	90
female	group C	some college	standard	none	58	67	72
female	group D	master's degree	standard	none	87	100	100
male	group E	associate's degree	standard	completed	66	63	64
female	group B	associate's degree	free/reduced	none	52	76	70
female	group B	some high school	standard	none	70	64	72
female	group D	associate's degree	free/reduced	completed	77	89	98
male	group C	high school	standard	none	62	55	49
male	group A	associate's degree	standard	none	54	53	47
female	group D	some college	standard	none	51	58	54
female	group E	bachelor's degree	standard	completed	99	100	100
male	group C	high school	standard	none	84	77	74
female	group B	bachelor's degree	free/reduced	none	75	85	82
female	group D	bachelor's degree	standard	none	78	82	79
female	group D	some high school	standard	none	51	63	61
female	group C	some college	standard	none	55	69	65
female	group C	bachelor's degree	standard	completed	79	92	89
male	group B	associate's degree	standard	completed	91	89	92
female	group C	some college	standard	completed	88	93	93
male	group D	high school	free/reduced	none	63	57	56
male	group E	some college	standard	none	83	80	73
female	group B	high school	standard	none	87	95	86
male	group B	some high school	standard	none	72	68	67
male	group D	some college	standard	completed	65	77	74
male	group D	master's degree	standard	none	82	82	74
female	group A	bachelor's degree	standard	none	51	49	51
male	group D	master's degree	standard	none	89	84	82
male	group C	some high school	free/reduced	completed	53	37	40
male	group E	some college	free/reduced	completed	87	74	70
female	group C	some college	standard	completed	75	81	84
male	group D	bachelor's degree	free/reduced	completed	74	79	75
male	group C	bachelor's degree	standard	none	58	55	48
male	group B	some high school	standard	completed	51	54	41
male	group E	high school	standard	none	70	55	56
female	group C	associate's degree	standard	none	59	66	67
male	group D	some college	standard	completed	71	61	69
female	group D	some high school	standard	none	76	72	71
female	group C	some college	free/reduced	none	59	62	64
female	group E	some college	free/reduced	completed	42	55	54
male	group A	high school	standard	none	57	43	47
male	group D	some college	standard	none	88	73	78
female	group C	some college	free/reduced	none	22	39	33
male	group B	some high school	standard	none	88	84	75
male	group C	associate's degree	free/reduced	none	73	68	66
female	group D	bachelor's degree	standard	completed	68	75	81
male	group E	associate's degree	free/reduced	completed	100	100	93
male	group A	some high school	standard	completed	62	67	69
male	group A	bachelor's degree	standard	none	77	67	68
female	group B	associate's degree	standard	completed	59	70	66
male	group D	bachelor's degree	standard	none	54	49	47
male	group D	some high school	standard	none	62	67	61
female	group C	some college	standard	completed	70	89	88
female	group E	high school	free/reduced	completed	66	74	78
male	group B	some college	free/reduced	none	60	60	60
female	group B	associate's degree	standard	completed	61	86	87
male	group D	associate's degree	free/reduced	none	66	62	64
male	group B	associate's degree	free/reduced	completed	82	78	74
female	group E	some college	free/reduced	completed	75	88	85
male	group B	master's degree	free/reduced	none	49	53	52
male	group C	high school	standard	none	52	53	49
female	group E	master's degree	standard	none	81	92	91
female	group C	bachelor's degree	standard	completed	96	100	100
male	group C	high school	free/reduced	completed	53	51	51
female	group B	master's degree	free/reduced	completed	58	76	78
female	group B	high school	standard	completed	68	83	78
female	group C	some college	free/reduced	completed	67	75	70
male	group A	high school	standard	completed	72	73	74
male	group E	some high school	standard	none	94	88	78
female	group D	some college	standard	none	79	86	81
female	group C	associate's degree	standard	none	63	67	70
female	group C	bachelor's degree	free/reduced	completed	43	51	54
female	group C	master's degree	standard	completed	81	91	87
female	group B	high school	free/reduced	completed	46	54	58
female	group C	associate's degree	standard	completed	71	77	77
female	group B	master's degree	free/reduced	completed	52	70	62
female	group D	some high school	standard	completed	97	100	100
male	group C	master's degree	free/reduced	completed	62	68	75
female	group C	some college	free/reduced	none	46	64	66
female	group E	high school	standard	none	50	50	47
female	group D	associate's degree	standard	none	65	69	70
male	group C	some high school	free/reduced	completed	45	52	49
male	group C	associate's degree	free/reduced	completed	65	67	65
male	group E	high school	standard	none	80	76	65
male	group D	some high school	standard	completed	62	66	68
male	group B	some high school	free/reduced	none	48	52	45
female	group C	bachelor's degree	standard	none	77	88	87
female	group E	associate's degree	standard	none	66	65	69
male	group D	some college	standard	completed	76	83	79
female	group B	some high school	standard	none	62	64	66
male	group D	some college	standard	completed	77	62	62
female	group C	master's degree	standard	completed	69	84	85
male	group D	associate's degree	standard	none	61	55	52
male	group C	some high school	free/reduced	completed	59	69	65
male	group E	high school	free/reduced	none	55	56	51
female	group B	some college	free/reduced	none	45	53	55
female	group B	bachelor's degree	free/reduced	none	78	79	76
female	group C	associate's degree	standard	completed	67	84	86
female	group D	some college	free/reduced	none	65	81	77
male	group C	associate's degree	standard	none	69	77	69
female	group B	associate's degree	standard	none	57	69	68
male	group C	some college	standard	none	59	41	42
male	group D	some high school	standard	completed	74	71	78
male	group E	bachelor's degree	standard	none	82	62	62
male	group E	high school	standard	completed	81	80	76
female	group B	some college	free/reduced	none	74	81	76
female	group B	some college	free/reduced	none	58	61	66
male	group D	some high school	free/reduced	completed	80	79	79
male	group C	some college	free/reduced	none	35	28	27
female	group C	high school	free/reduced	none	42	62	60
male	group C	associate's degree	free/reduced	completed	60	51	56
male	group E	high school	standard	completed	87	91	81
male	group B	some high school	standard	completed	84	83	75
female	group E	associate's degree	free/reduced	completed	83	86	88
female	group C	high school	free/reduced	none	34	42	39
male	group B	high school	free/reduced	none	66	77	70
male	group B	some high school	standard	completed	61	56	56
female	group D	high school	standard	completed	56	68	74
male	group B	associate's degree	standard	none	87	85	73
female	group C	some high school	free/reduced	none	55	65	62
male	group D	some high school	standard	none	86	80	75
female	group B	associate's degree	standard	completed	52	66	73
female	group E	master's degree	free/reduced	none	45	56	54
female	group C	some college	standard	none	72	72	71
male	group D	high school	standard	none	57	50	54
male	group A	some high school	free/reduced	none	68	72	64
female	group C	some college	standard	completed	88	95	94
male	group D	some college	standard	none	76	64	66
male	group C	associate's degree	standard	none	46	43	42
female	group B	bachelor's degree	standard	none	67	86	83
male	group E	some high school	standard	none	92	87	78
male	group C	bachelor's degree	standard	completed	83	82	84
male	group D	associate's degree	standard	none	80	75	77
male	group D	bachelor's degree	free/reduced	none	63	66	67
female	group D	some high school	standard	completed	64	60	74
male	group B	some college	standard	none	54	52	51
male	group C	associate's degree	standard	none	84	80	80
male	group D	high school	free/reduced	completed	73	68	66
female	group E	bachelor's degree	standard	none	80	83	83
female	group D	high school	standard	none	56	52	55
male	group E	some college	standard	none	59	51	43
male	group D	some high school	standard	none	75	74	69
male	group C	associate's degree	standard	none	85	76	71
male	group E	associate's degree	standard	none	89	76	74
female	group B	high school	standard	completed	58	70	68
female	group B	high school	standard	none	65	64	62
male	group C	high school	standard	none	68	60	53
male	group A	some high school	standard	completed	47	49	49
female	group D	some college	free/reduced	none	71	83	83
female	group B	some high school	standard	completed	60	70	70
male	group D	master's degree	standard	none	80	80	72
male	group D	high school	standard	none	54	52	52
female	group E	some college	standard	none	62	73	70
female	group C	associate's degree	free/reduced	none	64	73	68
male	group C	associate's degree	standard	completed	78	77	77
female	group B	some college	standard	none	70	75	78
female	group C	master's degree	free/reduced	completed	65	81	81
female	group C	some high school	free/reduced	completed	64	79	77
male	group C	some college	standard	completed	79	79	78
female	group C	some high school	free/reduced	none	44	50	51
female	group E	high school	standard	none	99	93	90
male	group D	high school	standard	none	76	73	68
male	group D	some high school	free/reduced	none	59	42	41
female	group C	bachelor's degree	standard	none	63	75	81
female	group D	high school	standard	none	69	72	77
female	group D	associate's degree	standard	completed	88	92	95
female	group E	some college	free/reduced	none	71	76	70
male	group C	bachelor's degree	standard	none	69	63	61
male	group C	some college	standard	none	58	49	42
female	group D	associate's degree	free/reduced	none	47	53	58
female	group D	some college	standard	none	65	70	71
male	group B	some college	standard	completed	88	85	76
male	group C	bachelor's degree	standard	none	83	78	73
female	group C	some high school	standard	completed	85	92	93
female	group E	high school	standard	completed	59	63	75
female	group C	some high school	free/reduced	none	65	86	80
male	group B	bachelor's degree	free/reduced	none	73	56	57
male	group D	high school	standard	none	53	52	42
male	group D	high school	standard	none	45	48	46
female	group D	bachelor's degree	free/reduced	none	73	79	84
female	group D	some college	free/reduced	completed	70	78	78
female	group B	some high school	standard	none	37	46	46
male	group B	associate's degree	standard	completed	81	82	82
male	group E	associate's degree	standard	completed	97	82	88
female	group B	some high school	standard	none	67	89	82
male	group B	bachelor's degree	free/reduced	none	88	75	76
male	group E	some high school	standard	completed	77	76	77
male	group C	associate's degree	standard	none	76	70	68
male	group D	some high school	standard	none	86	73	70
male	group C	some high school	standard	completed	63	60	57
female	group E	bachelor's degree	standard	none	65	73	75
male	group D	high school	free/reduced	completed	78	77	80
male	group B	associate's degree	free/reduced	none	67	62	60
male	group A	some high school	standard	completed	46	41	43
male	group E	associate's degree	standard	completed	71	74	68
male	group C	high school	free/reduced	completed	40	46	50
male	group D	associate's degree	free/reduced	none	90	87	75
male	group A	some college	free/reduced	completed	81	78	81
male	group D	some high school	free/reduced	none	56	54	52
female	group C	associate's degree	standard	completed	67	84	81
male	group B	associate's degree	standard	none	80	76	64
female	group C	associate's degree	standard	completed	74	75	83
male	group A	some college	standard	none	69	67	69
male	group E	some college	standard	completed	99	87	81
male	group C	some high school	standard	none	51	52	44
female	group B	associate's degree	free/reduced	none	53	71	67
female	group D	high school	free/reduced	none	49	57	52
female	group B	associate's degree	standard	none	73	76	80
male	group B	bachelor's degree	standard	none	66	60	57
male	group D	bachelor's degree	standard	completed	67	61	68
female	group C	associate's degree	free/reduced	completed	68	67	69
female	group C	bachelor's degree	standard	completed	59	64	75
male	group C	high school	standard	none	71	66	65
female	group D	master's degree	standard	completed	77	82	91
male	group C	associate's degree	standard	none	83	72	78
male	group B	bachelor's degree	standard	none	63	71	69
female	group D	associate's degree	free/reduced	none	56	65	63
female	group C	high school	free/reduced	completed	67	79	84
female	group E	high school	standard	none	75	86	79
female	group C	some college	standard	none	71	81	80
female	group C	some high school	free/reduced	none	43	53	53
female	group C	high school	free/reduced	none	41	46	43
female	group C	some college	standard	none	82	90	94
male	group C	some college	standard	none	61	61	62
male	group A	some college	free/reduced	none	28	23	19
male	group C	associate's degree	standard	completed	82	75	77
female	group B	some high school	standard	none	41	55	51
male	group C	high school	standard	none	71	60	61
male	group C	associate's degree	standard	none	47	37	35
male	group E	associate's degree	standard	completed	62	56	53
male	group B	associate's degree	standard	none	90	78	81
female	group C	bachelor's degree	standard	none	83	93	95
female	group B	some college	free/reduced	none	61	68	66
male	group D	some high school	standard	completed	76	70	69
male	group C	associate's degree	standard	none	49	51	43
female	group B	some high school	free/reduced	none	24	38	27
female	group D	some high school	free/reduced	completed	35	55	60
male	group C	high school	free/reduced	none	58	61	52
female	group C	high school	standard	none	61	73	63
female	group B	high school	standard	completed	69	76	74
male	group D	associate's degree	standard	completed	67	72	67
male	group D	some college	standard	none	79	73	67
female	group C	high school	standard	none	72	80	75
male	group B	some college	standard	none	62	61	57
female	group C	bachelor's degree	standard	completed	77	94	95
male	group D	high school	free/reduced	none	75	74	66
male	group E	associate's degree	standard	none	87	74	76
female	group B	bachelor's degree	standard	none	52	65	69
male	group E	some college	standard	none	66	57	52
female	group C	some college	standard	completed	63	78	80
female	group C	associate's degree	standard	none	46	58	57
female	group C	some college	standard	none	59	71	70
female	group B	bachelor's degree	standard	none	61	72	70
male	group A	associate's degree	standard	none	63	61	61
female	group C	some college	free/reduced	completed	42	66	69
male	group D	some college	free/reduced	none	59	62	61
female	group D	some college	standard	none	80	90	89
female	group B	high school	standard	none	58	62	59
male	group B	some high school	standard	completed	85	84	78
female	group C	some college	standard	none	52	58	58
female	group D	some high school	free/reduced	none	27	34	32
male	group C	some college	standard	none	59	60	58
male	group A	bachelor's degree	free/reduced	completed	49	58	60
male	group C	high school	standard	completed	69	58	53
male	group C	bachelor's degree	free/reduced	none	61	66	61
female	group A	some high school	free/reduced	none	44	64	58
female	group D	some high school	standard	none	73	84	85
male	group E	some college	standard	none	84	77	71
female	group C	some college	free/reduced	completed	45	73	70
male	group D	some high school	standard	none	74	74	72
female	group D	some college	standard	completed	82	97	96
female	group D	bachelor's degree	standard	none	59	70	73
male	group E	associate's degree	free/reduced	none	46	43	41
female	group D	some high school	standard	none	80	90	82
female	group D	master's degree	free/reduced	completed	85	95	100
female	group A	some high school	standard	none	71	83	77
male	group A	bachelor's degree	standard	none	66	64	62
female	group B	associate's degree	standard	none	80	86	83
male	group C	associate's degree	standard	completed	87	100	95
male	group C	master's degree	free/reduced	none	79	81	71
female	group E	some high school	free/reduced	none	38	49	45
female	group A	some high school	free/reduced	none	38	43	43
female	group E	some college	standard	none	67	76	75
female	group E	bachelor's degree	standard	none	64	73	70
female	group C	associate's degree	free/reduced	none	57	78	67
female	group D	high school	standard	none	62	64	64
male	group D	master's degree	standard	none	73	70	75
male	group E	some high school	free/reduced	completed	73	67	59
female	group D	some college	standard	none	77	68	77
male	group E	some college	standard	none	76	67	67
male	group C	associate's degree	standard	completed	57	54	56
female	group C	some high school	standard	completed	65	74	77
male	group A	high school	free/reduced	none	48	45	41
female	group B	high school	free/reduced	none	50	67	63
female	group C	associate's degree	standard	none	85	89	95
male	group B	some high school	standard	none	74	63	57
male	group D	some high school	standard	none	60	59	54
female	group C	some high school	standard	completed	59	54	67
male	group A	some college	standard	none	53	43	43
female	group A	some college	free/reduced	none	49	65	55
female	group D	high school	standard	completed	88	99	100
female	group C	high school	standard	none	54	59	62
female	group C	some high school	standard	none	63	73	68
male	group B	associate's degree	standard	completed	65	65	63
female	group B	associate's degree	standard	none	82	80	77
female	group D	high school	free/reduced	completed	52	57	56
male	group D	associate's degree	standard	completed	87	84	85
female	group D	master's degree	standard	completed	70	71	74
male	group E	some college	standard	completed	84	83	78
male	group D	associate's degree	standard	none	71	66	60
male	group B	some high school	standard	completed	63	67	67
female	group C	bachelor's degree	free/reduced	completed	51	72	79
male	group E	high school	standard	none	84	73	69
male	group C	bachelor's degree	standard	completed	71	74	68
male	group C	associate's degree	standard	none	74	73	67
male	group D	some college	standard	none	68	59	62
male	group E	high school	free/reduced	completed	57	56	54
female	group C	associate's degree	free/reduced	completed	82	93	93
female	group D	high school	standard	completed	57	58	64
female	group D	master's degree	free/reduced	completed	47	58	67
female	group A	some high school	standard	completed	59	85	80
male	group B	some college	free/reduced	none	41	39	34
female	group C	some college	free/reduced	none	62	67	62
male	group C	bachelor's degree	standard	none	86	83	86
male	group C	some high school	free/reduced	none	69	71	65
male	group A	some high school	free/reduced	none	65	59	53
male	group C	some high school	free/reduced	none	68	63	54
male	group C	associate's degree	free/reduced	none	64	66	59
female	group C	high school	standard	none	61	72	70
male	group C	high school	standard	none	61	56	55
female	group A	some high school	free/reduced	none	47	59	50
male	group C	some high school	standard	none	73	66	66
male	group C	some college	free/reduced	completed	50	48	53
male	group D	associate's degree	standard	none	75	68	64
male	group D	associate's degree	free/reduced	none	75	66	73
male	group C	high school	standard	none	70	56	51
male	group D	some high school	standard	completed	89	88	82
female	group C	some college	standard	completed	67	81	79
female	group D	high school	standard	none	78	81	80
female	group A	some high school	free/reduced	none	59	73	69
female	group B	associate's degree	standard	none	73	83	76
male	group A	some high school	free/reduced	none	79	82	73
female	group C	some high school	standard	completed	67	74	77
male	group D	some college	free/reduced	none	69	66	60
male	group C	high school	standard	completed	86	81	80
male	group B	high school	standard	none	47	46	42
male	group B	associate's degree	standard	none	81	73	72
female	group C	some college	free/reduced	completed	64	85	85
female	group E	some college	standard	none	100	92	97
female	group C	associate's degree	free/reduced	none	65	77	74
male	group C	some college	free/reduced	none	65	58	49
female	group C	associate's degree	free/reduced	none	53	61	62
male	group C	bachelor's degree	free/reduced	none	37	56	47
female	group D	bachelor's degree	standard	none	79	89	89
male	group D	associate's degree	free/reduced	none	53	54	48
female	group E	bachelor's degree	standard	none	100	100	100
male	group B	high school	standard	completed	72	65	68
male	group C	bachelor's degree	free/reduced	none	53	58	55
male	group B	some college	free/reduced	none	54	54	45
female	group E	some college	standard	none	71	70	76
female	group C	some college	free/reduced	none	77	90	91
male	group A	bachelor's degree	standard	completed	75	58	62
female	group C	some college	standard	none	84	87	91
female	group D	associate's degree	free/reduced	none	26	31	38
male	group A	high school	free/reduced	completed	72	67	65
female	group A	high school	free/reduced	completed	77	88	85
male	group C	some college	standard	none	91	74	76
female	group C	associate's degree	standard	completed	83	85	90
female	group C	high school	standard	none	63	69	74
female	group C	associate's degree	standard	completed	68	86	84
female	group D	some high school	standard	none	59	67	61
female	group B	associate's degree	standard	completed	90	90	91
female	group D	bachelor's degree	standard	completed	71	76	83
male	group E	bachelor's degree	standard	completed	76	62	66
male	group D	associate's degree	standard	none	80	68	72
female	group D	master's degree	standard	none	55	64	70
male	group E	associate's degree	standard	none	76	71	67
male	group B	high school	standard	completed	73	71	68
female	group D	associate's degree	free/reduced	none	52	59	56
male	group C	some college	free/reduced	none	68	68	61
male	group A	high school	standard	none	59	52	46
female	group B	associate's degree	standard	none	49	52	54
male	group C	high school	standard	none	70	74	71
male	group D	some college	free/reduced	none	61	47	56
female	group C	associate's degree	free/reduced	none	60	75	74
male	group B	some high school	standard	completed	64	53	57
male	group A	associate's degree	free/reduced	completed	79	82	82
female	group A	associate's degree	free/reduced	none	65	85	76
female	group C	associate's degree	standard	none	64	64	70
female	group C	some college	standard	none	83	83	90
female	group C	bachelor's degree	standard	none	81	88	90
female	group B	high school	standard	none	54	64	68
male	group D	high school	standard	completed	68	64	66
female	group C	some college	standard	none	54	48	52
female	group D	some college	free/reduced	completed	59	78	76
female	group B	some high school	standard	none	66	69	68
male	group E	some college	standard	none	76	71	72
female	group D	master's degree	standard	none	74	79	82
female	group B	associate's degree	standard	completed	94	87	92
male	group C	some college	free/reduced	none	63	61	54
female	group E	associate's degree	standard	completed	95	89	92
female	group D	master's degree	free/reduced	none	40	59	54
female	group B	some high school	standard	none	82	82	80
male	group A	high school	standard	none	68	70	66
male	group B	bachelor's degree	free/reduced	none	55	59	54
male	group C	master's degree	standard	none	79	78	77
female	group C	bachelor's degree	standard	none	86	92	87
male	group D	some college	standard	none	76	71	73
male	group A	some high school	standard	none	64	50	43
male	group D	some high school	free/reduced	none	62	49	52
female	group B	some high school	standard	completed	54	61	62
female	group B	master's degree	free/reduced	completed	77	97	94
female	group C	some high school	standard	completed	76	87	85
female	group D	some college	standard	none	74	89	84
female	group E	some college	standard	completed	66	74	73
female	group D	some high school	standard	completed	66	78	78
female	group B	high school	free/reduced	completed	67	78	79
male	group D	some college	standard	none	71	49	52
female	group C	associate's degree	standard	none	91	86	84
male	group D	bachelor's degree	standard	none	69	58	57
male	group C	master's degree	free/reduced	none	54	59	50
male	group C	high school	standard	completed	53	52	49
male	group E	some college	standard	none	68	60	59
male	group C	some high school	free/reduced	completed	56	61	60
female	group C	high school	free/reduced	none	36	53	43
female	group D	bachelor's degree	free/reduced	none	29	41	47
female	group C	associate's degree	standard	none	62	74	70
female	group C	associate's degree	standard	completed	68	67	73
female	group C	some high school	standard	none	47	54	53
male	group E	associate's degree	standard	completed	62	61	58
female	group E	associate's degree	standard	completed	79	88	94
male	group B	high school	standard	completed	73	69	68
female	group C	bachelor's degree	free/reduced	completed	66	83	83
male	group C	associate's degree	standard	completed	51	60	58
female	group D	high school	standard	none	51	66	62
male	group E	bachelor's degree	standard	completed	85	66	71
male	group A	associate's degree	standard	completed	97	92	86
male	group C	high school	standard	completed	75	69	68
male	group D	associate's degree	free/reduced	completed	79	82	80
female	group C	associate's degree	standard	none	81	77	79
female	group D	associate's degree	standard	none	82	95	89
female	group D	master's degree	standard	none	64	63	66
male	group E	some high school	free/reduced	completed	78	83	80
female	group A	some high school	standard	completed	92	100	97
male	group C	high school	standard	completed	72	67	64
female	group C	high school	free/reduced	none	62	67	64
male	group C	master's degree	standard	none	79	72	69
male	group C	some high school	free/reduced	none	79	76	65
male	group B	bachelor's degree	free/reduced	completed	87	90	88
female	group B	associate's degree	standard	none	40	48	50
male	group D	some college	free/reduced	none	77	62	64
male	group E	associate's degree	standard	none	53	45	40
female	group C	some college	free/reduced	none	32	39	33
male	group A	high school	standard	none	71	74	64
female	group C	associate's degree	standard	completed	55	72	79
male	group C	master's degree	free/reduced	none	61	67	66
female	group B	associate's degree	free/reduced	none	53	70	70
male	group D	some high school	standard	none	73	66	62
female	group D	some college	standard	completed	74	75	79
female	group C	some college	standard	none	63	74	74
male	group C	bachelor's degree	standard	completed	96	90	92
female	group D	some college	free/reduced	completed	63	80	80
male	group B	bachelor's degree	free/reduced	none	48	51	46
male	group B	associate's degree	standard	none	48	43	45
female	group E	bachelor's degree	free/reduced	completed	92	100	100
female	group D	master's degree	free/reduced	completed	61	71	78
male	group B	high school	free/reduced	none	63	48	47
male	group D	bachelor's degree	free/reduced	none	68	68	67
male	group B	some college	standard	completed	71	75	70
male	group A	bachelor's degree	standard	none	91	96	92
female	group C	some college	standard	none	53	62	56
female	group C	high school	free/reduced	completed	50	66	64
female	group E	high school	standard	none	74	81	71
male	group A	associate's degree	free/reduced	completed	40	55	53
male	group A	some college	standard	completed	61	51	52
female	group B	high school	standard	none	81	91	89
female	group B	some college	free/reduced	completed	48	56	58
female	group D	master's degree	standard	none	53	61	68
female	group D	some high school	standard	none	81	97	96
female	group E	some high school	standard	none	77	79	80
female	group D	bachelor's degree	free/reduced	none	63	73	78
female	group D	associate's degree	standard	completed	73	75	80
female	group D	some college	standard	none	69	77	77
female	group C	associate's degree	standard	none	65	76	76
female	group A	high school	standard	none	55	73	73
female	group C	bachelor's degree	free/reduced	none	44	63	62
female	group C	some college	standard	none	54	64	65
female	group A	some high school	standard	none	48	66	65
male	group C	some college	free/reduced	none	58	57	54
male	group A	some high school	standard	none	71	62	50
male	group E	bachelor's degree	standard	none	68	68	64
female	group E	high school	standard	none	74	76	73
female	group C	bachelor's degree	standard	completed	92	100	99
female	group C	bachelor's degree	standard	completed	56	79	72
male	group B	high school	free/reduced	none	30	24	15
male	group A	some high school	standard	none	53	54	48
female	group D	high school	standard	none	69	77	73
female	group D	some high school	standard	none	65	82	81
female	group D	master's degree	standard	none	54	60	63
female	group C	high school	standard	none	29	29	30
female	group E	some college	standard	none	76	78	80
male	group D	high school	free/reduced	none	60	57	51
male	group D	master's degree	free/reduced	completed	84	89	90
male	group C	some high school	standard	none	75	72	62
female	group C	associate's degree	standard	none	85	84	82
female	group C	master's degree	free/reduced	none	40	58	54
female	group E	some college	standard	none	61	64	62
female	group B	associate's degree	standard	none	58	63	65
male	group D	some college	free/reduced	completed	69	60	63
female	group C	some college	standard	none	58	59	66
male	group C	bachelor's degree	standard	completed	94	90	91
female	group C	associate's degree	standard	none	65	77	74
female	group A	associate's degree	standard	none	82	93	93
female	group C	high school	standard	none	60	68	72
female	group E	bachelor's degree	standard	none	37	45	38
male	group D	bachelor's degree	standard	none	88	78	83
male	group D	master's degree	standard	none	95	81	84
male	group C	associate's degree	free/reduced	completed	65	73	68
female	group C	high school	free/reduced	none	35	61	54
male	group B	bachelor's degree	free/reduced	none	62	63	56
male	group C	high school	free/reduced	completed	58	51	52
male	group A	some college	standard	completed	100	96	86
female	group E	bachelor's degree	free/reduced	none	61	58	62
male	group D	some college	standard	completed	100	97	99
male	group B	associate's degree	free/reduced	completed	69	70	63
male	group D	associate's degree	standard	none	61	48	46
male	group D	some college	free/reduced	none	49	57	46
female	group C	some high school	standard	completed	44	51	55
male	group D	some college	standard	none	67	64	70
male	group B	high school	standard	none	79	60	65
female	group B	bachelor's degree	standard	completed	66	74	81
female	group C	high school	standard	none	75	88	85
male	group D	some high school	standard	none	84	84	80
female	group B	high school	free/reduced	completed	67	80	81
female	group D	some high school	standard	completed	80	92	88
male	group E	some college	standard	none	86	76	74
female	group D	associate's degree	standard	none	76	74	73
male	group D	high school	standard	none	41	52	51
female	group D	associate's degree	free/reduced	completed	74	88	90
female	group B	some high school	free/reduced	none	72	81	79
female	group E	high school	standard	completed	74	79	80
male	group B	high school	standard	none	70	65	60
female	group B	bachelor's degree	standard	completed	65	81	81
female	group D	associate's degree	standard	none	59	70	65
female	group E	high school	free/reduced	none	64	62	68
female	group B	high school	standard	none	50	53	55
female	group D	some college	standard	completed	69	79	81
male	group C	some high school	free/reduced	completed	51	56	53
female	group A	high school	standard	completed	68	80	76
female	group D	some college	standard	completed	85	86	98
female	group A	associate's degree	standard	completed	65	70	74
female	group B	some high school	standard	none	73	79	79
female	group B	some college	standard	none	62	67	67
male	group C	associate's degree	free/reduced	none	77	67	64
male	group D	some high school	standard	none	69	66	61
female	group D	associate's degree	free/reduced	none	43	60	58
male	group D	associate's degree	standard	none	90	87	85
male	group C	some college	free/reduced	none	74	77	73
male	group C	some high school	standard	none	73	66	63
female	group D	some college	free/reduced	none	55	71	69
female	group C	high school	standard	none	65	69	67
male	group D	associate's degree	standard	none	80	63	63
female	group C	some high school	free/reduced	completed	50	60	60
female	group C	some college	free/reduced	completed	63	73	71
female	group B	bachelor's degree	free/reduced	none	77	85	87
male	group C	some college	standard	none	73	74	61
male	group D	associate's degree	standard	completed	81	72	77
female	group C	high school	free/reduced	none	66	76	68
male	group D	associate's degree	free/reduced	none	52	57	50
female	group C	some college	standard	none	69	78	76
female	group C	associate's degree	standard	completed	65	84	84
female	group D	high school	standard	completed	69	77	78
female	group B	some college	standard	completed	50	64	66
female	group E	some college	standard	completed	73	78	76
female	group C	some high school	standard	completed	70	82	76
male	group D	associate's degree	free/reduced	none	81	75	78
male	group D	some college	free/reduced	none	63	61	60
female	group D	high school	standard	none	67	72	74
male	group B	high school	standard	none	60	68	60
male	group B	high school	standard	none	62	55	54
female	group C	some high school	free/reduced	completed	29	40	44
male	group B	some college	standard	completed	62	66	68
female	group E	master's degree	standard	completed	94	99	100
male	group E	some college	standard	completed	85	75	68
male	group D	associate's degree	free/reduced	none	77	78	73
male	group A	high school	free/reduced	none	53	58	44
male	group E	some college	free/reduced	none	93	90	83
female	group C	associate's degree	standard	none	49	53	53
female	group E	associate's degree	free/reduced	none	73	76	78
female	group C	bachelor's degree	free/reduced	completed	66	74	81
female	group D	associate's degree	standard	none	77	77	73
female	group C	some high school	standard	none	49	63	56
female	group D	some college	free/reduced	none	79	89	86
female	group C	associate's degree	standard	completed	75	82	90
female	group A	bachelor's degree	standard	none	59	72	70
female	group D	associate's degree	standard	completed	57	78	79
male	group C	high school	free/reduced	none	66	66	59
female	group E	bachelor's degree	standard	completed	79	81	82
female	group B	some high school	standard	none	57	67	72
male	group A	bachelor's degree	standard	completed	87	84	87
female	group D	some college	standard	none	63	64	67
female	group B	some high school	free/reduced	completed	59	63	64
male	group A	bachelor's degree	free/reduced	none	62	72	65
male	group D	high school	standard	none	46	34	36
male	group C	some college	standard	none	66	59	52
male	group D	high school	standard	none	89	87	79
female	group D	associate's degree	free/reduced	completed	42	61	58
male	group C	some college	standard	completed	93	84	90
female	group E	some high school	standard	completed	80	85	85
female	group D	some college	standard	none	98	100	99
male	group D	master's degree	standard	none	81	81	84
female	group B	some high school	standard	completed	60	70	74
female	group B	associate's degree	free/reduced	completed	76	94	87
male	group C	associate's degree	standard	completed	73	78	72
female	group C	associate's degree	standard	completed	96	96	99
female	group C	high school	standard	none	76	76	74
male	group E	associate's degree	free/reduced	completed	91	73	80
female	group C	some college	free/reduced	none	62	72	70
male	group D	some high school	free/reduced	completed	55	59	59
female	group B	some high school	free/reduced	completed	74	90	88
male	group C	high school	standard	none	50	48	42
male	group B	some college	standard	none	47	43	41
male	group E	some college	standard	completed	81	74	71
female	group E	associate's degree	standard	completed	65	75	77
male	group E	some high school	standard	completed	68	51	57
female	group D	high school	free/reduced	none	73	92	84
male	group C	some college	standard	none	53	39	37
female	group B	associate's degree	free/reduced	completed	68	77	80
male	group A	some high school	free/reduced	none	55	46	43
female	group C	some college	standard	completed	87	89	94
male	group D	some high school	standard	none	55	47	44
female	group E	some college	free/reduced	none	53	58	57
male	group C	master's degree	standard	none	67	57	59
male	group C	associate's degree	standard	none	92	79	84
female	group B	some college	free/reduced	completed	53	66	73
male	group D	associate's degree	standard	none	81	71	73
male	group C	high school	free/reduced	none	61	60	55
male	group D	bachelor's degree	standard	none	80	73	72
female	group A	associate's degree	free/reduced	none	37	57	56
female	group C	high school	standard	none	81	84	82
female	group C	associate's degree	standard	completed	59	73	72
male	group B	some college	free/reduced	none	55	55	47
male	group D	associate's degree	standard	none	72	79	74
male	group D	high school	standard	none	69	75	71
male	group C	some college	standard	none	69	64	68
female	group C	bachelor's degree	free/reduced	none	50	60	59
male	group B	some college	standard	completed	87	84	86
male	group D	some high school	standard	completed	71	69	68
male	group E	some college	standard	none	68	72	65
male	group C	master's degree	free/reduced	completed	79	77	75
female	group C	some high school	standard	completed	77	90	85
male	group C	associate's degree	free/reduced	none	58	55	53
female	group E	associate's degree	standard	none	84	95	92
male	group D	some college	standard	none	55	58	52
male	group E	bachelor's degree	free/reduced	completed	70	68	72
female	group D	some college	free/reduced	completed	52	59	65
male	group B	some college	standard	completed	69	77	77
female	group C	high school	free/reduced	none	53	72	64
female	group D	some high school	standard	none	48	58	54
male	group D	some high school	standard	completed	78	81	86
female	group B	high school	standard	none	62	62	63
male	group D	some college	standard	none	60	63	59
female	group B	high school	standard	none	74	72	72
female	group C	high school	standard	completed	58	75	77
male	group B	high school	standard	completed	76	62	60
female	group D	some high school	standard	none	68	71	75
male	group A	some college	free/reduced	none	58	60	57
male	group B	high school	standard	none	52	48	49
male	group D	bachelor's degree	standard	none	75	73	74
female	group B	some high school	free/reduced	completed	52	67	72
female	group C	bachelor's degree	free/reduced	none	62	78	79
male	group B	some college	standard	none	66	65	60
female	group B	some high school	free/reduced	none	49	58	55
female	group B	high school	standard	none	66	72	70
female	group C	some college	free/reduced	none	35	44	43
female	group A	some college	standard	completed	72	79	82
male	group E	associate's degree	standard	completed	94	85	82
female	group D	associate's degree	free/reduced	none	46	56	57
female	group B	master's degree	standard	none	77	90	84
female	group B	high school	free/reduced	completed	76	85	82
female	group C	associate's degree	standard	completed	52	59	62
male	group C	bachelor's degree	standard	completed	91	81	79
female	group B	some high school	standard	completed	32	51	44
female	group E	some high school	free/reduced	none	72	79	77
female	group B	some college	standard	none	19	38	32
male	group C	associate's degree	free/reduced	none	68	65	61
female	group C	master's degree	free/reduced	none	52	65	61
female	group B	high school	standard	none	48	62	60
female	group D	some college	free/reduced	none	60	66	70
male	group D	high school	free/reduced	none	66	74	69
male	group E	some high school	standard	completed	89	84	77
female	group B	high school	standard	none	42	52	51
female	group E	associate's degree	free/reduced	completed	57	68	73
male	group D	high school	standard	none	70	70	70
female	group E	associate's degree	free/reduced	none	70	84	81
male	group E	some college	standard	none	69	60	54
female	group C	associate's degree	standard	none	52	55	57
male	group C	some high school	standard	completed	67	73	68
male	group C	some high school	standard	completed	76	80	73
female	group E	associate's degree	standard	none	87	94	95
female	group B	some college	standard	none	82	85	87
female	group C	some college	standard	none	73	76	78
male	group A	some college	free/reduced	none	75	81	74
female	group D	some college	free/reduced	none	64	74	75
female	group E	high school	free/reduced	none	41	45	40
male	group C	high school	standard	none	90	75	69
male	group B	bachelor's degree	standard	none	59	54	51
male	group A	some high school	standard	none	51	31	36
male	group A	high school	free/reduced	none	45	47	49
female	group C	master's degree	standard	completed	54	64	67
male	group E	some high school	standard	completed	87	84	76
female	group C	high school	standard	none	72	80	83
male	group B	some high school	standard	completed	94	86	87
female	group A	bachelor's degree	standard	none	45	59	64
male	group D	bachelor's degree	free/reduced	completed	61	70	76
female	group B	high school	free/reduced	none	60	72	68
female	group C	some high school	standard	none	77	91	88
female	group A	some high school	standard	completed	85	90	92
female	group D	bachelor's degree	free/reduced	none	78	90	93
male	group E	some college	free/reduced	completed	49	52	51
female	group B	high school	free/reduced	none	71	87	82
female	group C	some high school	free/reduced	none	48	58	52
male	group C	high school	standard	none	62	67	58
female	group C	associate's degree	free/reduced	completed	56	68	70
female	group C	some high school	standard	none	65	69	76
female	group D	some high school	free/reduced	completed	69	86	81
male	group B	some high school	standard	none	68	54	53
female	group A	some college	free/reduced	none	61	60	57
female	group C	bachelor's degree	free/reduced	completed	74	86	89
male	group A	bachelor's degree	standard	none	64	60	58
female	group B	high school	standard	completed	77	82	89
male	group B	some college	standard	none	58	50	45
female	group C	high school	standard	completed	60	64	74
male	group E	high school	standard	none	73	64	57
female	group A	high school	standard	completed	75	82	79
male	group B	associate's degree	free/reduced	completed	58	57	53
female	group C	associate's degree	standard	none	66	77	73
female	group D	high school	free/reduced	none	39	52	46
male	group C	some high school	standard	none	64	58	51
female	group B	high school	free/reduced	completed	23	44	36
male	group B	some college	free/reduced	completed	74	77	76
female	group D	some high school	free/reduced	completed	40	65	64
male	group E	master's degree	standard	none	90	85	84
male	group C	master's degree	standard	completed	91	85	85
male	group D	high school	standard	none	64	54	50
female	group C	high school	standard	none	59	72	68
male	group D	associate's degree	standard	none	80	75	69
male	group C	master's degree	standard	none	71	67	67
female	group A	high school	standard	none	61	68	63
female	group E	some college	standard	none	87	85	93
male	group E	some high school	standard	none	82	67	61
male	group C	some high school	standard	none	62	64	55
female	group B	bachelor's degree	standard	none	97	97	96
male	group B	some college	free/reduced	none	75	68	65
female	group C	bachelor's degree	standard	none	65	79	81
male	group B	high school	standard	completed	52	49	46
male	group C	associate's degree	free/reduced	none	87	73	72
female	group C	associate's degree	standard	none	53	62	53
female	group E	master's degree	free/reduced	none	81	86	87
male	group D	bachelor's degree	free/reduced	completed	39	42	38
female	group C	some college	standard	completed	71	71	80
male	group C	associate's degree	standard	none	97	93	91
male	group D	some college	standard	completed	82	82	88
male	group C	high school	free/reduced	none	59	53	52
male	group B	associate's degree	standard	none	61	42	41
male	group E	associate's degree	free/reduced	completed	78	74	72
male	group C	associate's degree	free/reduced	none	49	51	51
male	group B	high school	standard	none	59	58	47
female	group C	some college	standard	completed	70	72	76
male	group B	associate's degree	standard	completed	82	84	78
male	group E	associate's degree	free/reduced	none	90	90	82
female	group C	bachelor's degree	free/reduced	none	43	62	61
male	group C	some college	free/reduced	none	80	64	66
male	group D	some college	standard	none	81	82	84
male	group C	some high school	standard	none	57	61	54
female	group D	some high school	standard	none	59	72	80
female	group D	associate's degree	standard	none	64	76	74
male	group C	bachelor's degree	standard	completed	63	64	66
female	group E	bachelor's degree	standard	completed	71	70	70
female	group B	high school	free/reduced	none	64	73	71
male	group D	bachelor's degree	free/reduced	none	55	46	44
female	group E	associate's degree	standard	none	51	51	54
female	group C	associate's degree	standard	completed	62	76	80
female	group E	associate's degree	standard	completed	93	100	95
male	group C	high school	free/reduced	none	54	72	59
female	group D	some college	free/reduced	none	69	65	74
male	group D	high school	free/reduced	none	44	51	48
female	group E	some college	standard	completed	86	85	91
female	group E	associate's degree	standard	none	85	92	85
female	group A	master's degree	free/reduced	none	50	67	73
male	group D	some high school	standard	completed	88	74	75
female	group E	associate's degree	standard	none	59	62	69
female	group E	some high school	free/reduced	none	32	34	38
male	group B	high school	free/reduced	none	36	29	27
female	group B	some high school	free/reduced	completed	63	78	79
male	group D	associate's degree	standard	completed	67	54	63
female	group D	some high school	standard	completed	65	78	82
male	group D	master's degree	standard	none	85	84	89
female	group C	master's degree	standard	none	73	78	74
female	group A	high school	free/reduced	completed	34	48	41
female	group D	bachelor's degree	free/reduced	completed	93	100	100
female	group D	some high school	free/reduced	none	67	84	84
male	group D	some college	standard	none	88	77	77
male	group B	high school	standard	none	57	48	51
female	group D	some college	standard	completed	79	84	91
female	group C	bachelor's degree	free/reduced	none	67	75	72
male	group E	bachelor's degree	standard	completed	70	64	70
male	group D	bachelor's degree	free/reduced	none	50	42	48
female	group A	some college	standard	none	69	84	82
female	group C	bachelor's degree	standard	completed	52	61	66
female	group C	bachelor's degree	free/reduced	completed	47	62	66
female	group B	associate's degree	free/reduced	none	46	61	55
female	group E	some college	standard	none	68	70	66
male	group E	bachelor's degree	standard	completed	100	100	100
female	group C	high school	standard	none	44	61	52
female	group C	associate's degree	standard	completed	57	77	80
male	group B	some college	standard	completed	91	96	91
male	group D	high school	free/reduced	none	69	70	67
female	group C	high school	free/reduced	none	35	53	46
male	group D	high school	standard	none	72	66	66
female	group B	associate's degree	free/reduced	none	54	65	65
male	group D	high school	free/reduced	none	74	70	69
male	group E	some high school	standard	completed	74	64	60
male	group E	associate's degree	free/reduced	none	64	56	52
female	group D	high school	free/reduced	completed	65	61	71
male	group E	associate's degree	free/reduced	completed	46	43	44
female	group C	some high school	free/reduced	none	48	56	51
male	group C	some college	free/reduced	completed	67	74	70
male	group D	some college	free/reduced	none	62	57	62
male	group D	associate's degree	free/reduced	completed	61	71	73
male	group C	bachelor's degree	free/reduced	completed	70	75	74
male	group C	associate's degree	standard	completed	98	87	90
male	group D	some college	free/reduced	none	70	63	58
male	group A	associate's degree	standard	none	67	57	53
female	group E	high school	free/reduced	none	57	58	57
male	group D	some college	standard	completed	85	81	85
male	group D	some high school	standard	completed	77	68	69
male	group C	master's degree	free/reduced	completed	72	66	72
female	group D	master's degree	standard	none	78	91	96
male	group C	high school	standard	none	81	66	64
male	group A	some high school	free/reduced	completed	61	62	61
female	group B	high school	standard	none	58	68	61
female	group C	associate's degree	standard	none	54	61	58
male	group B	high school	standard	none	82	82	80
female	group D	some college	free/reduced	none	49	58	60
male	group B	some high school	free/reduced	completed	49	50	52
female	group E	high school	free/reduced	completed	57	75	73
male	group E	high school	standard	none	94	73	71
female	group D	some college	standard	completed	75	77	83
female	group E	some high school	free/reduced	none	74	74	72
male	group C	high school	standard	completed	58	52	54
female	group C	some college	standard	none	62	69	69
male	group E	associate's degree	standard	none	72	57	62
male	group C	some college	standard	none	84	87	81
female	group D	master's degree	standard	none	92	100	100
female	group D	high school	standard	none	45	63	59
male	group C	high school	standard	none	75	81	71
female	group A	some college	standard	none	56	58	64
female	group D	some high school	free/reduced	none	48	54	53
female	group E	associate's degree	standard	none	100	100	100
female	group C	some high school	free/reduced	completed	65	76	75
male	group D	some college	standard	none	72	57	58
female	group D	some college	standard	none	62	70	72
male	group A	some high school	standard	completed	66	68	64
male	group C	some college	standard	none	63	63	60
female	group E	associate's degree	standard	none	68	76	67
female	group B	bachelor's degree	standard	none	75	84	80
female	group D	bachelor's degree	standard	none	89	100	100
male	group C	some high school	standard	completed	78	72	69
female	group A	high school	free/reduced	completed	53	50	60
female	group D	some college	free/reduced	none	49	65	61
female	group A	some college	standard	none	54	63	67
female	group C	some college	standard	completed	64	82	77
male	group B	some college	free/reduced	completed	60	62	60
male	group C	associate's degree	standard	none	62	65	58
male	group D	high school	standard	completed	55	41	48
female	group C	associate's degree	standard	none	91	95	94
female	group B	high school	free/reduced	none	8	24	23
male	group D	some high school	standard	none	81	78	78
male	group B	some high school	standard	completed	79	85	86
female	group A	some college	standard	completed	78	87	91
female	group C	some high school	standard	none	74	75	82
male	group A	high school	standard	none	57	51	54
female	group C	associate's degree	standard	none	40	59	51
male	group E	some high school	standard	completed	81	75	76
female	group A	some high school	free/reduced	none	44	45	45
female	group D	some college	free/reduced	completed	67	86	83
male	group E	high school	free/reduced	completed	86	81	75
female	group B	some high school	standard	completed	65	82	78
female	group D	associate's degree	free/reduced	none	55	76	76
female	group D	bachelor's degree	free/reduced	none	62	72	74
male	group A	high school	standard	none	63	63	62
female	group E	master's degree	standard	completed	88	99	95
male	group C	high school	free/reduced	none	62	55	55
female	group C	high school	free/reduced	completed	59	71	65
female	group D	some college	standard	completed	68	78	77
female	group D	some college	free/reduced	none	77	86	86
\.


--
-- PostgreSQL database dump complete
--

--
-- Database "metadata" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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

--
-- Name: metadata; Type: DATABASE; Schema: -; Owner: api_server
--

CREATE DATABASE metadata WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE metadata OWNER TO api_server;

\connect metadata

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
-- Name: blocks; Type: TABLE; Schema: public; Owner: api_server
--

CREATE TABLE public.blocks (
    name text NOT NULL,
    display_name text,
    description text,
    created_by text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.blocks OWNER TO api_server;

--
-- Name: units; Type: TABLE; Schema: public; Owner: api_server
--

CREATE TABLE public.units (
    realm_id text,
    owner_id text,
    name text NOT NULL,
    display_name text NOT NULL,
    description text,
    url text,
    parent_name text,
    created_by text
);


ALTER TABLE public.units OWNER TO api_server;

--
-- Data for Name: blocks; Type: TABLE DATA; Schema: public; Owner: api_server
--

COPY public.blocks (name, display_name, description, created_by, created_at, updated_at) FROM stdin;
nganh_dao_tao	Ngành đào tạo	Các ngành đào tạo trong khóa 2019	ce8e8317-400d-4b3c-99aa-b00ef402a6f0	2023-04-28 08:48:37.849891+00	2023-04-28 08:48:37.849891+00
something_in_here	Something in Here	Các ngành đào tạo trong khóa 2019	ce8e8317-400d-4b3c-99aa-b00ef402a6f0	2023-04-28 09:40:32.368269+00	2023-04-28 09:40:32.368269+00
\.


--
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: api_server
--

COPY public.units (realm_id, owner_id, name, display_name, description, url, parent_name, created_by) FROM stdin;
phong_dao_tao	\N	phong_dao_tao	Phòng đào tạo	Phòng Đào tạo có trách nhiệm trong công tác tuyển sinh, quản lý chương trình đào tạo, tổ chức giảng dạy và học tập, cấp bằng tốt nghiệp cho bậc đại học, cao đẳng chính quy và không chính quy (hình thức vừa làm vừa học, đào tạo từ xa).	%!s(*string=0xc0005241d0).ducluong.monster	\N	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
pdt	\N	pdt	Phòng đào tạo	Phòng Đào tạo có trách nhiệm trong công tác tuyển sinh, quản lý chương trình đào tạo, tổ chức giảng dạy và học tập, cấp bằng tốt nghiệp cho bậc đại học, cao đẳng chính quy và không chính quy (hình thức vừa làm vừa học, đào tạo từ xa).	pdt.ducluong.monster	\N	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
26066533-0192-41d5-a160-14f7d44d380e	\N	master	Đại học Bách Khoa	Root unit	ducluong.monster	\N	61876c40-49a5-4049-869c-e3c69e72144c
pkt	\N	pkt	Phòng khảo thí	\N	pkt.ducluong.monster	master	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
pit	\N	pit	Phòng IT	Danh sách thiết bị	pit.ducluong.monster	master	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
pkt2	\N	pkt2	Phòng khảo thí 2	\N	pkt2.ducluong.monster	master	ce8e8317-400d-4b3c-99aa-b00ef402a6f0
\.


--
-- Name: blocks blocks_pkey; Type: CONSTRAINT; Schema: public; Owner: api_server
--

ALTER TABLE ONLY public.blocks
    ADD CONSTRAINT blocks_pkey PRIMARY KEY (name);


--
-- Name: units units_pkey; Type: CONSTRAINT; Schema: public; Owner: api_server
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_pkey PRIMARY KEY (name);


--
-- Name: units fk_units_children; Type: FK CONSTRAINT; Schema: public; Owner: api_server
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT fk_units_children FOREIGN KEY (parent_name) REFERENCES public.units(name) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

--
-- Database "nganh_dao_tao" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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

--
-- Name: nganh_dao_tao; Type: DATABASE; Schema: -; Owner: api_server
--

CREATE DATABASE nganh_dao_tao WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE nganh_dao_tao OWNER TO api_server;

\connect nganh_dao_tao

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

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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

--
-- PostgreSQL database dump complete
--

--
-- Database "something_in_here" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2 (Debian 15.2-1.pgdg110+1)

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

--
-- Name: something_in_here; Type: DATABASE; Schema: -; Owner: api_server
--

CREATE DATABASE something_in_here WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE something_in_here OWNER TO api_server;

\connect something_in_here

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

--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

