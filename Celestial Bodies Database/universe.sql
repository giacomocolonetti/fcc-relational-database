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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(256),
    has_planet boolean NOT NULL,
    description text NOT NULL,
    total_planets numeric NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(256),
    planet_id integer,
    has_life boolean NOT NULL,
    has_craters boolean NOT NULL,
    total_craters integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    name character varying(30) NOT NULL,
    last_one text
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(256),
    star_id integer,
    has_moon boolean NOT NULL,
    description text NOT NULL,
    has_life boolean NOT NULL,
    total_moons integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(256),
    galaxy_id integer,
    constellation text,
    star_type character varying(30) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_info_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, 'Our home', 123);
INSERT INTO public.galaxy VALUES (2, 'Galaxy 2', true, 'Desc', 12);
INSERT INTO public.galaxy VALUES (3, 'Galaxy 3', false, 'No aliens here', 0);
INSERT INTO public.galaxy VALUES (4, 'Another one', false, 'Guess what? No aliens here either', 0);
INSERT INTO public.galaxy VALUES (5, 'Blabla', true, 'Green atennas here', 1231);
INSERT INTO public.galaxy VALUES (6, 'Last one?', false, 'Just a galaxy with lots of black holes. Wild.', 0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, NULL, 1, true, true, NULL);
INSERT INTO public.moon VALUES (2, NULL, 1, true, true, NULL);
INSERT INTO public.moon VALUES (3, NULL, 1, true, true, NULL);
INSERT INTO public.moon VALUES (4, NULL, 1, true, true, NULL);
INSERT INTO public.moon VALUES (5, NULL, 1, true, true, NULL);
INSERT INTO public.moon VALUES (6, NULL, 1, true, true, NULL);
INSERT INTO public.moon VALUES (7, NULL, 1, true, true, NULL);
INSERT INTO public.moon VALUES (8, NULL, 1, true, true, NULL);
INSERT INTO public.moon VALUES (9, NULL, 1, true, true, NULL);
INSERT INTO public.moon VALUES (10, NULL, 1, true, true, NULL);
INSERT INTO public.moon VALUES (11, NULL, 1, true, true, NULL);
INSERT INTO public.moon VALUES (12, NULL, 1, true, true, NULL);
INSERT INTO public.moon VALUES (13, NULL, 1, true, true, NULL);
INSERT INTO public.moon VALUES (14, NULL, 1, true, true, NULL);
INSERT INTO public.moon VALUES (15, NULL, 1, true, true, NULL);
INSERT INTO public.moon VALUES (16, NULL, 1, true, true, NULL);
INSERT INTO public.moon VALUES (17, NULL, 1, true, true, NULL);
INSERT INTO public.moon VALUES (18, NULL, 1, true, true, NULL);
INSERT INTO public.moon VALUES (19, NULL, 1, true, true, NULL);
INSERT INTO public.moon VALUES (20, NULL, 1, true, true, NULL);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 'asd', NULL);
INSERT INTO public.more_info VALUES (2, 'asd', NULL);
INSERT INTO public.more_info VALUES (3, 'asd', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, true, 'very hot', false, 123);
INSERT INTO public.planet VALUES (2, 'Venus', 1, true, 'can be seen from earth', false, 12);
INSERT INTO public.planet VALUES (3, 'Earth', 1, true, 'a very nice place', true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1, true, 'a Tesla car is arriving soon', false, 2);
INSERT INTO public.planet VALUES (5, 'Jupyter', 1, true, 'very beautiful', false, 7);
INSERT INTO public.planet VALUES (8, 'Neptun', 1, true, 'another blue one', false, 4);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, true, 'a little nice guy', false, 5);
INSERT INTO public.planet VALUES (10, 'idk', 2, false, 'lala', false, 0);
INSERT INTO public.planet VALUES (11, 'Neptun', 1, true, 'another blue one', false, 4);
INSERT INTO public.planet VALUES (12, 'Pluto', 1, true, 'a little nice guy', false, 5);
INSERT INTO public.planet VALUES (14, 'idk', 2, false, 'lala', false, 0);
INSERT INTO public.planet VALUES (16, 'Neptun', 1, true, 'another blue one', false, 4);
INSERT INTO public.planet VALUES (17, 'Pluto', 1, true, 'a little nice guy', false, 5);
INSERT INTO public.planet VALUES (15, 'idk', 2, false, 'lala', false, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'sun', 1, NULL, 'Yellow Dwarf');
INSERT INTO public.star VALUES (2, 'star', 2, 'Taurus', 'White Dwarf');
INSERT INTO public.star VALUES (3, 'Giant Ball of Fire', 2, 'Leo', 'Red Giant Dwarf');
INSERT INTO public.star VALUES (4, 'Not so Giant Ball of Fire', 3, NULL, 'White Dwarf');
INSERT INTO public.star VALUES (5, 'My star names options are getting over', 4, NULL, 'Big Ball of Fire');
INSERT INTO public.star VALUES (6, 'Death Star', NULL, NULL, 'Not actually a star');


--
-- Name: more_info_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_info_id_seq', 3, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_galaxy_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key1 UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: more_info more_info_more_info_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_more_info_id_key UNIQUE (more_info_id);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

