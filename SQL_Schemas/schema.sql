--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)

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
-- Name: data; Type: SCHEMA; Schema: -; Owner: dw_user
--

CREATE SCHEMA data;


ALTER SCHEMA data OWNER TO dw_user;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customers; Type: TABLE; Schema: data; Owner: dw_user
--

CREATE TABLE data.customers (
    customer_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    signup_date date NOT NULL,
    last_purchase timestamp without time zone,
    total_orders integer DEFAULT 0,
    customer_status character varying(20) DEFAULT 'active'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT customers_customer_status_check CHECK (((customer_status)::text = ANY ((ARRAY['active'::character varying, 'inactive'::character varying, 'pending'::character varying])::text[])))
);


ALTER TABLE data.customers OWNER TO dw_user;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: data; Owner: dw_user
--

CREATE SEQUENCE data.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE data.customers_customer_id_seq OWNER TO dw_user;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: data; Owner: dw_user
--

ALTER SEQUENCE data.customers_customer_id_seq OWNED BY data.customers.customer_id;


--
-- Name: logs; Type: TABLE; Schema: data; Owner: dw_user
--

CREATE TABLE data.logs (
    id integer NOT NULL,
    clientip text,
    ident text,
    username text,
    "timestamp" timestamp without time zone,
    request text,
    response integer,
    bytes integer,
    referer text,
    useragent text,
    ingested_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE data.logs OWNER TO dw_user;

--
-- Name: logs_id_seq; Type: SEQUENCE; Schema: data; Owner: dw_user
--

CREATE SEQUENCE data.logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE data.logs_id_seq OWNER TO dw_user;

--
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: data; Owner: dw_user
--

ALTER SEQUENCE data.logs_id_seq OWNED BY data.logs.id;


--
-- Name: people; Type: TABLE; Schema: data; Owner: dw_user
--

CREATE TABLE data.people (
    id integer,
    full_name text,
    age integer,
    email text,
    category text
);


ALTER TABLE data.people OWNER TO dw_user;

--
-- Name: test; Type: TABLE; Schema: data; Owner: dw_user
--

CREATE TABLE data.test (
    staff_id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    age integer NOT NULL
);


ALTER TABLE data.test OWNER TO dw_user;

--
-- Name: users; Type: TABLE; Schema: data; Owner: dw_user
--

CREATE TABLE data.users (
    id integer NOT NULL,
    name text,
    email text,
    phone text,
    company_name text,
    city text,
    lat double precision,
    ingested_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE data.users OWNER TO dw_user;

--
-- Name: customers customer_id; Type: DEFAULT; Schema: data; Owner: dw_user
--

ALTER TABLE ONLY data.customers ALTER COLUMN customer_id SET DEFAULT nextval('data.customers_customer_id_seq'::regclass);


--
-- Name: logs id; Type: DEFAULT; Schema: data; Owner: dw_user
--

ALTER TABLE ONLY data.logs ALTER COLUMN id SET DEFAULT nextval('data.logs_id_seq'::regclass);


--
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: data; Owner: dw_user
--

ALTER TABLE ONLY data.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: data; Owner: dw_user
--

ALTER TABLE ONLY data.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: data; Owner: dw_user
--

ALTER TABLE ONLY data.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- Name: test test_pkey; Type: CONSTRAINT; Schema: data; Owner: dw_user
--

ALTER TABLE ONLY data.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (staff_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: data; Owner: dw_user
--

ALTER TABLE ONLY data.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: idx_logs_clientip; Type: INDEX; Schema: data; Owner: dw_user
--

CREATE INDEX idx_logs_clientip ON data.logs USING btree (clientip);


--
-- Name: idx_logs_response; Type: INDEX; Schema: data; Owner: dw_user
--

CREATE INDEX idx_logs_response ON data.logs USING btree (response);


--
-- Name: idx_logs_timestamp; Type: INDEX; Schema: data; Owner: dw_user
--

CREATE INDEX idx_logs_timestamp ON data.logs USING btree ("timestamp");


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT CREATE ON SCHEMA public TO dw_user;


--
-- PostgreSQL database dump complete
--

