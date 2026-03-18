--
-- PostgreSQL database dump
--

\restrict lt9F7xhWc1D63GTjpXQpEgSyJdVLiwh52lOROZVA0rDUEXTbh7QMG58koGpoe8r

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: assets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assets (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    equipment_type_id integer,
    unit character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.assets OWNER TO postgres;

--
-- Name: assets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.assets_id_seq OWNER TO postgres;

--
-- Name: assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assets_id_seq OWNED BY public.assets.id;


--
-- Name: assignments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assignments (
    id integer NOT NULL,
    asset_id integer,
    personnel_id integer,
    base_id integer,
    quantity integer,
    assigned_date date,
    created_by integer
);


ALTER TABLE public.assignments OWNER TO postgres;

--
-- Name: assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assignments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.assignments_id_seq OWNER TO postgres;

--
-- Name: assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assignments_id_seq OWNED BY public.assignments.id;


--
-- Name: audit_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audit_logs (
    id integer NOT NULL,
    user_id integer,
    action character varying(255),
    endpoint character varying(255),
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.audit_logs OWNER TO postgres;

--
-- Name: audit_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.audit_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.audit_logs_id_seq OWNER TO postgres;

--
-- Name: audit_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.audit_logs_id_seq OWNED BY public.audit_logs.id;


--
-- Name: bases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bases (
    id integer NOT NULL,
    base_name character varying(100) NOT NULL,
    location character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.bases OWNER TO postgres;

--
-- Name: bases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bases_id_seq OWNER TO postgres;

--
-- Name: bases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bases_id_seq OWNED BY public.bases.id;


--
-- Name: equipment_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipment_types (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text
);


ALTER TABLE public.equipment_types OWNER TO postgres;

--
-- Name: equipment_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.equipment_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.equipment_types_id_seq OWNER TO postgres;

--
-- Name: equipment_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.equipment_types_id_seq OWNED BY public.equipment_types.id;


--
-- Name: expenditures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.expenditures (
    id integer NOT NULL,
    asset_id integer,
    base_id integer,
    quantity integer,
    expended_date date,
    notes text,
    created_by integer
);


ALTER TABLE public.expenditures OWNER TO postgres;

--
-- Name: expenditures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.expenditures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.expenditures_id_seq OWNER TO postgres;

--
-- Name: expenditures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.expenditures_id_seq OWNED BY public.expenditures.id;


--
-- Name: personnel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personnel (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    rank character varying(50),
    base_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.personnel OWNER TO postgres;

--
-- Name: personnel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personnel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.personnel_id_seq OWNER TO postgres;

--
-- Name: personnel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personnel_id_seq OWNED BY public.personnel.id;


--
-- Name: purchases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchases (
    id integer NOT NULL,
    asset_id integer,
    base_id integer,
    quantity integer,
    purchase_date date,
    created_by integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.purchases OWNER TO postgres;

--
-- Name: purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.purchases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.purchases_id_seq OWNER TO postgres;

--
-- Name: purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.purchases_id_seq OWNED BY public.purchases.id;


--
-- Name: transfers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transfers (
    id integer NOT NULL,
    asset_id integer,
    from_base integer,
    to_base integer,
    quantity integer,
    transfer_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_by integer
);


ALTER TABLE public.transfers OWNER TO postgres;

--
-- Name: transfers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transfers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transfers_id_seq OWNER TO postgres;

--
-- Name: transfers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transfers_id_seq OWNED BY public.transfers.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100),
    password text,
    role character varying(20),
    base_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: assets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assets ALTER COLUMN id SET DEFAULT nextval('public.assets_id_seq'::regclass);


--
-- Name: assignments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments ALTER COLUMN id SET DEFAULT nextval('public.assignments_id_seq'::regclass);


--
-- Name: audit_logs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_logs ALTER COLUMN id SET DEFAULT nextval('public.audit_logs_id_seq'::regclass);


--
-- Name: bases id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bases ALTER COLUMN id SET DEFAULT nextval('public.bases_id_seq'::regclass);


--
-- Name: equipment_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment_types ALTER COLUMN id SET DEFAULT nextval('public.equipment_types_id_seq'::regclass);


--
-- Name: expenditures id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expenditures ALTER COLUMN id SET DEFAULT nextval('public.expenditures_id_seq'::regclass);


--
-- Name: personnel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personnel ALTER COLUMN id SET DEFAULT nextval('public.personnel_id_seq'::regclass);


--
-- Name: purchases id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases ALTER COLUMN id SET DEFAULT nextval('public.purchases_id_seq'::regclass);


--
-- Name: transfers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfers ALTER COLUMN id SET DEFAULT nextval('public.transfers_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: assets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assets (id, name, equipment_type_id, unit, created_at) FROM stdin;
1	AK-47 Rifle	1	piece	2026-03-13 23:23:13.358134
2	INSAS Rifle	1	piece	2026-03-13 23:23:13.358134
3	T-90 Tank	2	vehicle	2026-03-13 23:23:13.358134
4	Military Truck	2	vehicle	2026-03-13 23:23:13.358134
5	9mm Ammo	3	box	2026-03-13 23:23:13.358134
6	5.5 Ammo	3	box	2026-03-13 23:23:13.358134
7	Hand Grenade	3	piece	2026-03-13 23:23:13.358134
8	Field Radio	4	unit	2026-03-13 23:23:13.358134
\.


--
-- Data for Name: assignments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assignments (id, asset_id, personnel_id, base_id, quantity, assigned_date, created_by) FROM stdin;
1	1	1	1	1	2026-03-12	2
2	2	2	2	1	2026-03-12	3
3	7	3	3	2	2026-03-12	4
\.


--
-- Data for Name: audit_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audit_logs (id, user_id, action, endpoint, "timestamp") FROM stdin;
1	1	Created purchase record	/api/purchases	2026-03-14 00:42:22.629536
2	4	Transferred assets	/api/transfers	2026-03-14 00:42:22.629536
3	2	Assigned equipment	/api/assignments	2026-03-14 00:42:22.629536
\.


--
-- Data for Name: bases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bases (id, base_name, location, created_at) FROM stdin;
1	Eastern Command	Barracpore	2026-03-13 21:27:58.544876
2	Western Command	Mumbai	2026-03-13 21:27:58.544876
3	Northen Command	punjab	2026-03-13 21:27:58.544876
4	Southern Command	Chennai	2026-03-13 21:27:58.544876
\.


--
-- Data for Name: equipment_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equipment_types (id, name, description) FROM stdin;
1	Weapons	Combat firearms and rifles
2	Vehicles	Military transport and armored vehicles
3	Ammunation	Bullets, shells and explosive rounds
4	Communication	Radios and Communication devices
\.


--
-- Data for Name: expenditures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.expenditures (id, asset_id, base_id, quantity, expended_date, notes, created_by) FROM stdin;
1	5	2	50	2026-03-13	Training exercise	2
2	6	3	10	2026-03-13	Field drill	3
\.


--
-- Data for Name: personnel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personnel (id, name, rank, base_id, created_at) FROM stdin;
1	Soumya Roy	Captain	1	2026-03-13 23:45:22.418116
2	Somu Sao	Lieutenant	2	2026-03-13 23:45:22.418116
3	Madhuparna Sarkar	Major	3	2026-03-13 23:45:22.418116
4	Soibal Singh	Colonel	4	2026-03-13 23:45:22.418116
\.


--
-- Data for Name: purchases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchases (id, asset_id, base_id, quantity, purchase_date, created_by, created_at) FROM stdin;
1	1	2	100	2026-03-10	6	2026-03-14 00:14:46.236227
2	2	3	150	2026-03-11	6	2026-03-14 00:14:46.236227
3	3	4	10	2026-03-12	6	2026-03-14 00:14:46.236227
4	5	2	500	2026-03-12	6	2026-03-14 00:14:46.236227
\.


--
-- Data for Name: transfers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transfers (id, asset_id, from_base, to_base, quantity, transfer_date, created_by) FROM stdin;
1	1	1	2	20	2026-03-14 00:23:06.874615	6
2	3	1	3	100	2026-03-14 00:23:06.874615	6
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, role, base_id, created_at) FROM stdin;
1	System Admin	admin@military.com	admin123	Admin	\N	2026-03-13 23:57:25.643906
2	Commander East	eastcmd@military.com	pass123	Commander	1	2026-03-13 23:57:25.643906
3	Commander West	westcmd@military.com	pass123	Commander	2	2026-03-13 23:57:25.643906
4	Commander North	northcmd@military.com	pass123	Commander	3	2026-03-13 23:57:25.643906
5	Commander South	southcmd@military.com	pass123	Commander	4	2026-03-13 23:57:25.643906
6	Logistics Officer	logistics@military.com	pass123	Logistics	\N	2026-03-13 23:57:25.643906
\.


--
-- Name: assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assets_id_seq', 8, true);


--
-- Name: assignments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assignments_id_seq', 3, true);


--
-- Name: audit_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.audit_logs_id_seq', 3, true);


--
-- Name: bases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bases_id_seq', 12, true);


--
-- Name: equipment_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.equipment_types_id_seq', 4, true);


--
-- Name: expenditures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.expenditures_id_seq', 2, true);


--
-- Name: personnel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personnel_id_seq', 4, true);


--
-- Name: purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchases_id_seq', 4, true);


--
-- Name: transfers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transfers_id_seq', 2, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- Name: assets assets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (id);


--
-- Name: assignments assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_pkey PRIMARY KEY (id);


--
-- Name: audit_logs audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_pkey PRIMARY KEY (id);


--
-- Name: bases bases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bases
    ADD CONSTRAINT bases_pkey PRIMARY KEY (id);


--
-- Name: equipment_types equipment_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipment_types
    ADD CONSTRAINT equipment_types_pkey PRIMARY KEY (id);


--
-- Name: expenditures expenditures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expenditures
    ADD CONSTRAINT expenditures_pkey PRIMARY KEY (id);


--
-- Name: personnel personnel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personnel
    ADD CONSTRAINT personnel_pkey PRIMARY KEY (id);


--
-- Name: purchases purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (id);


--
-- Name: transfers transfers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfers
    ADD CONSTRAINT transfers_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: assets assets_equipment_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assets
    ADD CONSTRAINT assets_equipment_type_id_fkey FOREIGN KEY (equipment_type_id) REFERENCES public.equipment_types(id);


--
-- Name: assignments assignments_asset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_asset_id_fkey FOREIGN KEY (asset_id) REFERENCES public.assets(id);


--
-- Name: assignments assignments_base_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_base_id_fkey FOREIGN KEY (base_id) REFERENCES public.bases(id);


--
-- Name: assignments assignments_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: assignments assignments_personnel_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignments
    ADD CONSTRAINT assignments_personnel_id_fkey FOREIGN KEY (personnel_id) REFERENCES public.personnel(id);


--
-- Name: audit_logs audit_logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: expenditures expenditures_asset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expenditures
    ADD CONSTRAINT expenditures_asset_id_fkey FOREIGN KEY (asset_id) REFERENCES public.assets(id);


--
-- Name: expenditures expenditures_base_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expenditures
    ADD CONSTRAINT expenditures_base_id_fkey FOREIGN KEY (base_id) REFERENCES public.bases(id);


--
-- Name: expenditures expenditures_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.expenditures
    ADD CONSTRAINT expenditures_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: personnel personnel_base_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personnel
    ADD CONSTRAINT personnel_base_id_fkey FOREIGN KEY (base_id) REFERENCES public.bases(id);


--
-- Name: purchases purchases_asset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_asset_id_fkey FOREIGN KEY (asset_id) REFERENCES public.assets(id);


--
-- Name: purchases purchases_base_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_base_id_fkey FOREIGN KEY (base_id) REFERENCES public.bases(id);


--
-- Name: purchases purchases_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: transfers transfers_asset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfers
    ADD CONSTRAINT transfers_asset_id_fkey FOREIGN KEY (asset_id) REFERENCES public.assets(id);


--
-- Name: transfers transfers_created_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfers
    ADD CONSTRAINT transfers_created_by_fkey FOREIGN KEY (created_by) REFERENCES public.users(id);


--
-- Name: transfers transfers_from_base_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfers
    ADD CONSTRAINT transfers_from_base_fkey FOREIGN KEY (from_base) REFERENCES public.bases(id);


--
-- Name: transfers transfers_to_base_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transfers
    ADD CONSTRAINT transfers_to_base_fkey FOREIGN KEY (to_base) REFERENCES public.bases(id);


--
-- Name: users users_base_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_base_id_fkey FOREIGN KEY (base_id) REFERENCES public.bases(id);


--
-- PostgreSQL database dump complete
--

\unrestrict lt9F7xhWc1D63GTjpXQpEgSyJdVLiwh52lOROZVA0rDUEXTbh7QMG58koGpoe8r

