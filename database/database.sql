--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


--
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: city; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE city (
    id integer NOT NULL,
    name character varying(64),
    location geography(Point,4326),
    class character varying(10)
);


ALTER TABLE public.city OWNER TO postgres;

--
-- Name: city_time_period; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE city_time_period (
    id integer NOT NULL,
    city_id integer,
    period_name character varying(64),
    start_year integer,
    end_year integer
);


ALTER TABLE public.city_time_period OWNER TO postgres;

--
-- Name: city_history; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW city_history AS
    SELECT city.name, city.location, city.class, city_time_period.start_year, city_time_period.end_year, city_time_period.period_name FROM city, city_time_period WHERE (city.id = city_time_period.city_id);


ALTER TABLE public.city_history OWNER TO postgres;

--
-- Name: city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_id_seq OWNER TO postgres;

--
-- Name: city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE city_id_seq OWNED BY city.id;


--
-- Name: testtime_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE testtime_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.testtime_id_seq OWNER TO postgres;

--
-- Name: testtime_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE testtime_id_seq OWNED BY city_time_period.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY city ALTER COLUMN id SET DEFAULT nextval('city_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY city_time_period ALTER COLUMN id SET DEFAULT nextval('testtime_id_seq'::regclass);


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY city (id, name, location, class) FROM stdin;
3	Samarkand	0101000020E61000001CD0D2156CBD5040AC8F87BEBBD34340	major
4	Bukhara	0101000020E6100000C4D155BABB1B504012F6ED2422E24340	major
6	Tabriz	0101000020E61000006666666666264740795C548B88084340	major
7	Balkh	0101000020E61000009A99999999B950400000000000604240	major
11	Tashkent	0101000020E6100000D6C743DFDD4D514012F6ED2422A24440	major
12	Fergana	0101000020E6100000C93B873254F251405F44DB3175314440	major
13	Herat	0101000020E6100000D7A02FBDFD194F401E882CD2C42B4140	major
8	Panjikent	0101000020E61000007061DD7877E750400000000000C04340	minor
14	Kashgar	0101000020E6100000F70489EDEEFE5240AC8F87BEBBBB4340	minor
5	Ghazni	0101000020E6100000A39410ACAA1A51406666666666C64040	major
10	Qarshi	0101000020E61000003333333333735040DFC2BAF1EE6E4340	major
9	Shahrisabz	0101000020E61000005D6BEF5355B550406666666666864340	major
16	Merv	0101000020E6100000713D0AD7A3184F401041D5E8D5D44240	major
17	Kabul	0101000020E6100000A39410ACAA4A51405470784144444140	major
18	Baghdad	0101000020E610000087A3AB7477374640BBD6DEA7AAAA4040	major
19	Damascus	0101000020E6100000B821C66B5E2542401F82AAD1ABC14040	major
20	Jerusalem	0101000020E6100000AC8F87BEBB9B4140A8E0F08288C83F40	major
21	Mecca	0101000020E6100000795C548B88E843408B5242B0AA6A3540	major
22	Medina	0101000020E6100000CDCCCCCCCCCC4340581F0F7D77773840	major
23	Ctesiphon	0101000020E610000090BFB4A84F4A4640DFC5FB71FB8B4040	major
24	Istanbul	0101000020E610000014AE47E17AF43C40D4EE5701BE814440	major
25	Rome	0101000020E610000000000000000029403333333333F34440	major
26	Carthage	0101000020E610000009E066F162A924407B116DC7D46D4240	major
27	Alexandria	0101000020E61000008B5242B0AAEA3D403333333333333F40	major
28	Antioch	0101000020E610000033333333331342409A99999999194240	major
29	Iznik	0101000020E6100000D578E92631B83D40F4FDD478E9364440	major
30	Aleppo	0101000020E61000004529215855954240AC8F87BEBB1B4240	major
31	Tarsus	0101000020E610000048DE3994A17241404529215855754240	major
\.


--
-- Name: city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('city_id_seq', 31, true);


--
-- Data for Name: city_time_period; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY city_time_period (id, city_id, period_name, start_year, end_year) FROM stdin;
4	4	Bukhara	-500	2100
3	3	Samarkand	-700	2100
5	5	Ghazna	-500	1800
7	6	Tabriz	650	2100
6	5	Ghazni	1801	2100
10	7	Balkh	-129	2100
9	7	Bactra	-329	-130
8	7	Balkh	-1500	-330
11	10	Nakhshab	-300	800
12	10	Nasaf	801	1219
13	10	Qarshi	1220	2100
14	8	Panjikent	500	2100
15	9	Kesh	-700	1800
16	9	Shahrisabz	1801	2100
17	11	Chach	-500	818
18	11	Binkath	819	999
19	11	Tashkent	1000	2100
20	12	Fergana	1876	2100
21	13	Herat	-500	2100
22	14	Kashgar	-100	2100
23	16	Merv	-500	2100
24	17	Kabul	-100	2100
25	18	Baghdad	734	2100
26	19	Damascus	-1050	2100
27	20	Jerusalem	-1800	2100
28	21	Mecca	500	2100
29	22	Yathrib	-500	622
30	22	Medina	623	2100
31	23	Ctesiphon	-100	800
32	24	Byzantium	-660	329
33	24	Constantinople	330	1453
34	24	Istanbul	1454	2100
35	25	Rome	-753	2100
36	26	Carthage	-1215	-146
37	26	Carthage	-44	698
38	27	Alexandria	-331	2100
39	28	Antioch	-323	1400
40	29	Nicaea	-301	1330
41	29	Iznik	1331	2100
42	29	Antigoneia	-316	-302
43	30	Armani	-2600	-2200
44	30	Halab	-1800	-334
45	30	Beroea	-333	636
46	30	Aleppo	637	2100
47	31	Tarsus	-1700	2100
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Name: testtime_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('testtime_id_seq', 47, true);


SET search_path = topology, pg_catalog;

--
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


--
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology (id, name, srid, "precision", hasz) FROM stdin;
\.


SET search_path = public, pg_catalog;

--
-- Name: city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- Name: testtime_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY city_time_period
    ADD CONSTRAINT testtime_pkey PRIMARY KEY (id);


--
-- Name: fki_city_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_city_fk ON city_time_period USING btree (city_id);


--
-- Name: geometry_columns_delete; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE geometry_columns_delete AS ON DELETE TO geometry_columns DO INSTEAD NOTHING;


--
-- Name: geometry_columns_insert; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE geometry_columns_insert AS ON INSERT TO geometry_columns DO INSTEAD NOTHING;


--
-- Name: geometry_columns_update; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE geometry_columns_update AS ON UPDATE TO geometry_columns DO INSTEAD NOTHING;


--
-- Name: city_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY city_time_period
    ADD CONSTRAINT city_fk FOREIGN KEY (city_id) REFERENCES city(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

