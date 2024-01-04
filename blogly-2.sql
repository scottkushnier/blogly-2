--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)

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
-- Name: posts; Type: TABLE; Schema: public; Owner: kushnier
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    content text,
    created_at timestamp without time zone NOT NULL,
    user_id integer
);


ALTER TABLE public.posts OWNER TO kushnier;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: kushnier
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO kushnier;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kushnier
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: kushnier
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    image_url character varying(100)
);


ALTER TABLE public.users OWNER TO kushnier;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: kushnier
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO kushnier;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kushnier
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: kushnier
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: kushnier
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: kushnier
--

COPY public.posts (id, title, content, created_at, user_id) FROM stdin;
15	First Post 	hello world.	2024-01-01 14:05:00	19
16	Next Post	are you there?\r\nthen where are you??	2024-01-01 14:15:00	19
21	Hi.	I'm Betty.	2024-01-03 18:15:00	20
22	Hi again.	I'm still Betty.	2024-01-03 18:15:00	20
23	Want a raise?	You're fired!	2024-01-03 18:15:00	21
24	OK.	You can have your job back.	2024-01-03 18:15:00	21
25	On second thought...	You're still fired.	2024-01-03 18:15:00	21
26	Want Ad:	Looking for quarry worker. Apply in person.	2024-01-03 18:15:00	21
27	sfsdggds	goo goo	2024-01-03 18:15:00	22
28	dgdfg	goo..	2024-01-03 18:15:00	22
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: kushnier
--

COPY public.users (id, first_name, last_name, image_url) FROM stdin;
19	Barney	Rubble	images/barney.jpg
20	Betty	Rubble	images/betty.jpg
21	George	Slate	images/mrslate.jpg
22	Pebbles	Flintstone	images/pebbles.jpg
23	Joe	Rockhead	images/joe-rockhead.jpg
\.


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kushnier
--

SELECT pg_catalog.setval('public.posts_id_seq', 28, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kushnier
--

SELECT pg_catalog.setval('public.users_id_seq', 23, true);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: kushnier
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: kushnier
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: posts posts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kushnier
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

