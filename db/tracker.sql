--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: batches; Type: TABLE; Schema: public; Owner: westgard; Tablespace: 
--

CREATE TABLE batches (
    id integer NOT NULL,
    name text NOT NULL,
    archive_date date NOT NULL
);


ALTER TABLE batches OWNER TO westgard;

--
-- Name: files; Type: TABLE; Schema: public; Owner: westgard; Tablespace: 
--

CREATE TABLE files (
    id integer NOT NULL,
    name text NOT NULL,
    batch_id integer,
    bytes integer
);


ALTER TABLE files OWNER TO westgard;

--
-- Data for Name: batches; Type: TABLE DATA; Schema: public; Owner: westgard
--

COPY batches (id, name, archive_date) FROM stdin;
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: westgard
--

COPY files (id, name, batch_id, bytes) FROM stdin;
\.


--
-- Name: batches_pkey; Type: CONSTRAINT; Schema: public; Owner: westgard; Tablespace: 
--

ALTER TABLE ONLY batches
    ADD CONSTRAINT batches_pkey PRIMARY KEY (id);


--
-- Name: files_pkey; Type: CONSTRAINT; Schema: public; Owner: westgard; Tablespace: 
--

ALTER TABLE ONLY files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: westgard
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM westgard;
GRANT ALL ON SCHEMA public TO westgard;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

