--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer NOT NULL,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (72, 'user_1677687298901', 1, 204);
INSERT INTO public.users VALUES (63, 'user_1677687007140', 1, 86);
INSERT INTO public.users VALUES (75, 'user_1677687320605', 1, 342);
INSERT INTO public.users VALUES (62, 'user_1677687007141', 1, 950);
INSERT INTO public.users VALUES (74, 'user_1677687320606', 1, 753);
INSERT INTO public.users VALUES (65, 'user_1677687028878', 1, 1000);
INSERT INTO public.users VALUES (32, 'user_1677685328912', 0, NULL);
INSERT INTO public.users VALUES (33, 'user_1677685328911', 0, NULL);
INSERT INTO public.users VALUES (34, 'user_1677685379617', 0, NULL);
INSERT INTO public.users VALUES (35, 'user_1677685379616', 0, NULL);
INSERT INTO public.users VALUES (36, 'user_1677685724406', 0, NULL);
INSERT INTO public.users VALUES (37, 'user_1677685724405', 0, NULL);
INSERT INTO public.users VALUES (38, 'user_1677685757334', 0, NULL);
INSERT INTO public.users VALUES (39, 'user_1677685757333', 0, NULL);
INSERT INTO public.users VALUES (40, 'user_1677685895020', 0, NULL);
INSERT INTO public.users VALUES (41, 'user_1677685895020', 0, NULL);
INSERT INTO public.users VALUES (42, 'user_1677685895019', 0, NULL);
INSERT INTO public.users VALUES (43, 'user_1677686170052', 0, NULL);
INSERT INTO public.users VALUES (44, 'user_1677686170052', 0, NULL);
INSERT INTO public.users VALUES (45, 'user_1677686170051', 0, NULL);
INSERT INTO public.users VALUES (46, 'user_1677686300296', 0, NULL);
INSERT INTO public.users VALUES (47, 'user_1677686300295', 0, NULL);
INSERT INTO public.users VALUES (48, 'user_1677686542418', 0, NULL);
INSERT INTO public.users VALUES (49, 'user_1677686542417', 0, NULL);
INSERT INTO public.users VALUES (50, 'user_1677686624908', 0, NULL);
INSERT INTO public.users VALUES (51, 'user_1677686624907', 0, NULL);
INSERT INTO public.users VALUES (52, 'user_1677686631844', 0, NULL);
INSERT INTO public.users VALUES (53, 'user_1677686631843', 0, NULL);
INSERT INTO public.users VALUES (54, 'user_1677686742321', 0, NULL);
INSERT INTO public.users VALUES (55, 'user_1677686742320', 0, NULL);
INSERT INTO public.users VALUES (64, 'user_1677687028879', 1, 518);
INSERT INTO public.users VALUES (57, 'user_1677686839402', 0, 321);
INSERT INTO public.users VALUES (77, 'user_1677687330433', 1, 180);
INSERT INTO public.users VALUES (56, 'user_1677686839403', 0, 959);
INSERT INTO public.users VALUES (59, 'user_1677686932420', 1, 627);
INSERT INTO public.users VALUES (67, 'user_1677687116865', 1, 753);
INSERT INTO public.users VALUES (76, 'user_1677687330434', 1, 624);
INSERT INTO public.users VALUES (58, 'user_1677686932421', 1, 854);
INSERT INTO public.users VALUES (66, 'user_1677687116866', 1, 136);
INSERT INTO public.users VALUES (31, 'Giacomo', 1, 11);
INSERT INTO public.users VALUES (61, 'user_1677686943804', 1, 82);
INSERT INTO public.users VALUES (79, 'user_1677687348130', 1, 743);
INSERT INTO public.users VALUES (69, 'user_1677687249494', 1, 525);
INSERT INTO public.users VALUES (60, 'user_1677686943805', 1, 387);
INSERT INTO public.users VALUES (78, 'user_1677687348131', 1, 360);
INSERT INTO public.users VALUES (68, 'user_1677687249495', 1, 914);
INSERT INTO public.users VALUES (71, 'user_1677687268933', 1, 40);
INSERT INTO public.users VALUES (70, 'user_1677687268934', 1, 396);
INSERT INTO public.users VALUES (73, 'user_1677687298900', 1, 35);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 79, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

