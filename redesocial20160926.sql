--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.8
-- Dumped by pg_dump version 9.4.8
-- Started on 2016-09-26 13:30:31

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP DATABASE IF EXISTS redesocial;
--
-- TOC entry 2023 (class 1262 OID 30619)
-- Name: redesocial; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE redesocial WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


ALTER DATABASE redesocial OWNER TO postgres;

\connect redesocial

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 6 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2024 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 1 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2026 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 178 (class 1259 OID 30644)
-- Name: amigos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE amigos (
    serialamigos integer NOT NULL,
    userserial integer,
    amigoserial integer
);


ALTER TABLE amigos OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 30642)
-- Name: amigos_amigoserial_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE amigos_amigoserial_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE amigos_amigoserial_seq OWNER TO postgres;

--
-- TOC entry 2027 (class 0 OID 0)
-- Dependencies: 177
-- Name: amigos_amigoserial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE amigos_amigoserial_seq OWNED BY amigos.serialamigos;


--
-- TOC entry 176 (class 1259 OID 30633)
-- Name: posts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE posts (
    postserial integer NOT NULL,
    userserial integer,
    post text,
    datahora timestamp without time zone
);


ALTER TABLE posts OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 30631)
-- Name: posts_postserial_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE posts_postserial_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE posts_postserial_seq OWNER TO postgres;

--
-- TOC entry 2028 (class 0 OID 0)
-- Dependencies: 175
-- Name: posts_postserial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE posts_postserial_seq OWNED BY posts.postserial;


--
-- TOC entry 174 (class 1259 OID 30622)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuarios (
    userserial integer NOT NULL,
    username text
);


ALTER TABLE usuarios OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 30620)
-- Name: usuarios_userserial_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usuarios_userserial_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuarios_userserial_seq OWNER TO postgres;

--
-- TOC entry 2029 (class 0 OID 0)
-- Dependencies: 173
-- Name: usuarios_userserial_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usuarios_userserial_seq OWNED BY usuarios.userserial;


--
-- TOC entry 1897 (class 2604 OID 30647)
-- Name: serialamigos; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY amigos ALTER COLUMN serialamigos SET DEFAULT nextval('amigos_amigoserial_seq'::regclass);


--
-- TOC entry 1896 (class 2604 OID 30636)
-- Name: postserial; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY posts ALTER COLUMN postserial SET DEFAULT nextval('posts_postserial_seq'::regclass);


--
-- TOC entry 1895 (class 2604 OID 30625)
-- Name: userserial; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuarios ALTER COLUMN userserial SET DEFAULT nextval('usuarios_userserial_seq'::regclass);


--
-- TOC entry 2018 (class 0 OID 30644)
-- Dependencies: 178
-- Data for Name: amigos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO amigos VALUES (1, 1, 2);
INSERT INTO amigos VALUES (2, 2, 1);
INSERT INTO amigos VALUES (3, 2, 3);
INSERT INTO amigos VALUES (4, 3, 2);


--
-- TOC entry 2030 (class 0 OID 0)
-- Dependencies: 177
-- Name: amigos_amigoserial_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('amigos_amigoserial_seq', 4, true);


--
-- TOC entry 2016 (class 0 OID 30633)
-- Dependencies: 176
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO posts VALUES (3, 3, 'Post número 3', '2016-09-25 01:00:00');
INSERT INTO posts VALUES (2, 2, 'Post Número 2.', '2016-09-24 10:30:00');
INSERT INTO posts VALUES (1, 1, 'Post número 1.', '2016-09-24 10:10:00');


--
-- TOC entry 2031 (class 0 OID 0)
-- Dependencies: 175
-- Name: posts_postserial_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('posts_postserial_seq', 3, true);


--
-- TOC entry 2014 (class 0 OID 30622)
-- Dependencies: 174
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuarios VALUES (1, 'JOAO');
INSERT INTO usuarios VALUES (2, 'JOSE');
INSERT INTO usuarios VALUES (3, 'MANUEL');


--
-- TOC entry 2032 (class 0 OID 0)
-- Dependencies: 173
-- Name: usuarios_userserial_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_userserial_seq', 3, true);


--
-- TOC entry 1901 (class 2606 OID 30641)
-- Name: postserial_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT postserial_pk PRIMARY KEY (postserial);


--
-- TOC entry 1903 (class 2606 OID 30649)
-- Name: serialamigos_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY amigos
    ADD CONSTRAINT serialamigos_pk PRIMARY KEY (serialamigos);


--
-- TOC entry 1899 (class 2606 OID 30630)
-- Name: userserial_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT userserial_pk PRIMARY KEY (userserial);


--
-- TOC entry 2025 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-09-26 13:30:33

--
-- PostgreSQL database dump complete
--

