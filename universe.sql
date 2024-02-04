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
    name character varying(30) NOT NULL,
    constellation text,
    galaxy_types text,
    origin_of_name text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    diameter_km numeric,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_sun_au numeric,
    mass_ratio_to_earth numeric,
    star_id integer,
    is_spherical boolean,
    how_many_moons integer,
    state_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth_ly numeric,
    galaxy_id integer,
    effective_temp_k integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: state; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.state (
    state_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.state OWNER TO freecodecamp;

--
-- Name: state_state_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.state_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.state_state_id_seq OWNER TO freecodecamp;

--
-- Name: state_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.state_state_id_seq OWNED BY public.state.state_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: state state_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.state ALTER COLUMN state_id SET DEFAULT nextval('public.state_state_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Andromeda', 'spiral', NULL);
INSERT INTO public.galaxy VALUES (2, 'Bear Paw Galaxy', 'Lynx', 'elliptical', NULL);
INSERT INTO public.galaxy VALUES (3, 'Small Magellanic Cloud', 'Tucana', 'irregular', NULL);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Dorado/Mensa', 'spiral', NULL);
INSERT INTO public.galaxy VALUES (5, 'Milky Way', 'Sagittarius', 'spiral', NULL);
INSERT INTO public.galaxy VALUES (6, 'Wolf-Lundmark-Melotte', 'Cetus', 'irregular', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', false, 3474, 3);
INSERT INTO public.moon VALUES (2, 'Io', false, 3643, 5);
INSERT INTO public.moon VALUES (3, 'Europa', false, 3122, 5);
INSERT INTO public.moon VALUES (4, 'Ganymede', false, 5262, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', false, 4821, 5);
INSERT INTO public.moon VALUES (6, 'Phobos', false, 27, 4);
INSERT INTO public.moon VALUES (7, 'Deimos', false, 16, 4);
INSERT INTO public.moon VALUES (8, 'Mimas', false, 400, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', false, 500, 6);
INSERT INTO public.moon VALUES (10, 'Tethys', false, 1060, 6);
INSERT INTO public.moon VALUES (11, 'Dione', false, 1120, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', false, 1530, 6);
INSERT INTO public.moon VALUES (13, 'Titan', false, 5150, 6);
INSERT INTO public.moon VALUES (14, 'Iapetus', false, 1440, 6);
INSERT INTO public.moon VALUES (15, 'Ariel', false, 1158, 7);
INSERT INTO public.moon VALUES (16, 'Umbriel', false, 1169, 7);
INSERT INTO public.moon VALUES (17, 'Titania', false, 1576, 7);
INSERT INTO public.moon VALUES (18, 'Oberon', false, 1522, 7);
INSERT INTO public.moon VALUES (19, 'Miranda', false, 471, 7);
INSERT INTO public.moon VALUES (20, 'Triton', false, 2706, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.3871, 0.0558, 6, true, 0, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 0.7233, 0.82, 6, true, 0, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 1.0000, 1.00, 6, true, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 1.5237, 0.11, 6, true, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 5.2028, 317.9, 6, true, 95, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 9.5388, 95.17, 6, true, 83, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 19.1914, 14.56, 6, true, 27, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 30.0611, 17.24, 6, true, 14, 3);
INSERT INTO public.planet VALUES (9, 'Pluto', 39.5294, 0.0024, 6, true, 5, 1);
INSERT INTO public.planet VALUES (10, 'σ 301', NULL, NULL, 5, true, 2, 3);
INSERT INTO public.planet VALUES (11, 'ε 4087', NULL, NULL, 3, true, 99, 1);
INSERT INTO public.planet VALUES (12, 'η 940', NULL, NULL, 1, true, 45, 1);
INSERT INTO public.planet VALUES (13, 'φ 23', NULL, NULL, 2, true, 0, 3);
INSERT INTO public.planet VALUES (14, 'γ 707', NULL, NULL, 4, false, 0, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'BAT99-98', 165000, 4, 45000);
INSERT INTO public.star VALUES (2, 'VFTS 1021', 164000, 4, 39800);
INSERT INTO public.star VALUES (3, 'NGC 346', 200000, 3, 43400);
INSERT INTO public.star VALUES (4, 'AB1', 197000, 3, 79000);
INSERT INTO public.star VALUES (5, 'θ2 Orionis', 1500, 5, 34900);
INSERT INTO public.star VALUES (6, 'sun', 0.000016, 5, 5772);


--
-- Data for Name: state; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.state VALUES (1, 'solid', NULL);
INSERT INTO public.state VALUES (2, 'liquid/gas', NULL);
INSERT INTO public.state VALUES (3, 'other', NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: state_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.state_state_id_seq', 3, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: state state_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT state_pkey PRIMARY KEY (state_id);


--
-- Name: state state_state_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT state_state_id_key UNIQUE (state_id);


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
-- Name: planet planet_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_state_id_fkey FOREIGN KEY (state_id) REFERENCES public.state(state_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

