--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2021-03-22 14:42:18

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
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 3096 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


--
-- TOC entry 647 (class 1247 OID 16592)
-- Name: EnumClientStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."EnumClientStatus" AS ENUM (
    'Inativo',
    'Ativo'
);


ALTER TYPE public."EnumClientStatus" OWNER TO postgres;

--
-- TOC entry 639 (class 1247 OID 16434)
-- Name: EnumProductUnity; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."EnumProductUnity" AS ENUM (
    'CX',
    'PCT'
);


ALTER TYPE public."EnumProductUnity" OWNER TO postgres;

--
-- TOC entry 636 (class 1247 OID 16414)
-- Name: EnumUserStatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."EnumUserStatus" AS ENUM (
    'Ativo',
    'Inativo'
);


ALTER TYPE public."EnumUserStatus" OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 206 (class 1259 OID 16696)
-- Name: Client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Client" (
    cnpj integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    address text NOT NULL,
    id text NOT NULL,
    "stateReg" integer NOT NULL,
    trade text NOT NULL,
    company text NOT NULL,
    status public."EnumClientStatus",
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "sellerId" text
);


ALTER TABLE public."Client" OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16705)
-- Name: Contact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Contact" (
    cnpj integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    email text,
    id text NOT NULL,
    name text NOT NULL,
    phone integer,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Contact" OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16678)
-- Name: Industry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Industry" (
    cnpj integer NOT NULL,
    charge numeric(65,30),
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    email text NOT NULL,
    address text NOT NULL,
    id text NOT NULL,
    "stateReg" integer NOT NULL,
    name text NOT NULL,
    trade text NOT NULL,
    company text NOT NULL,
    phone integer NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Industry" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16732)
-- Name: Invoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Invoice" (
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    dir text NOT NULL,
    id text NOT NULL,
    number integer NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Invoice" OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16714)
-- Name: Order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Order" (
    acrescimos numeric(65,30),
    "clientId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    descontos numeric(65,30),
    id text NOT NULL,
    "invoiceId" text NOT NULL,
    "shippingId" text NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Order" OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16723)
-- Name: Product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Product" (
    category text NOT NULL,
    code text NOT NULL,
    color text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    pack integer NOT NULL,
    "supplierId" text NOT NULL,
    picture text,
    id text NOT NULL,
    name text NOT NULL,
    price numeric(65,30) NOT NULL,
    unity public."EnumProductUnity" NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Product" OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16687)
-- Name: Shipping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Shipping" (
    cnpj integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    email text NOT NULL,
    address text NOT NULL,
    id text NOT NULL,
    "stateReg" integer NOT NULL,
    name text NOT NULL,
    trade text NOT NULL,
    company text NOT NULL,
    phone integer NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Shipping" OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16669)
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "firstName" text,
    id text NOT NULL,
    "lastName" text,
    password text NOT NULL,
    roles text[],
    status public."EnumUserStatus" NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    username text NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16747)
-- Name: _ClientToContact; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."_ClientToContact" (
    "A" text NOT NULL,
    "B" text NOT NULL
);


ALTER TABLE public."_ClientToContact" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16741)
-- Name: _ClientToShipping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."_ClientToShipping" (
    "A" text NOT NULL,
    "B" text NOT NULL
);


ALTER TABLE public."_ClientToShipping" OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16574)
-- Name: _Migration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."_Migration" (
    revision integer NOT NULL,
    name text NOT NULL,
    datamodel text NOT NULL,
    status text NOT NULL,
    applied integer NOT NULL,
    rolled_back integer NOT NULL,
    datamodel_steps text NOT NULL,
    database_migration text NOT NULL,
    errors text NOT NULL,
    started_at timestamp(3) without time zone NOT NULL,
    finished_at timestamp(3) without time zone
);


ALTER TABLE public."_Migration" OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16572)
-- Name: _Migration_revision_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."_Migration_revision_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."_Migration_revision_seq" OWNER TO postgres;

--
-- TOC entry 3097 (class 0 OID 0)
-- Dependencies: 201
-- Name: _Migration_revision_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."_Migration_revision_seq" OWNED BY public."_Migration".revision;


--
-- TOC entry 213 (class 1259 OID 16753)
-- Name: _OrderToProduct; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."_OrderToProduct" (
    "A" text NOT NULL,
    "B" text NOT NULL
);


ALTER TABLE public."_OrderToProduct" OWNER TO postgres;

--
-- TOC entry 2916 (class 2604 OID 16577)
-- Name: _Migration revision; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_Migration" ALTER COLUMN revision SET DEFAULT nextval('public."_Migration_revision_seq"'::regclass);


--
-- TOC entry 2935 (class 2606 OID 16704)
-- Name: Client Client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Client"
    ADD CONSTRAINT "Client_pkey" PRIMARY KEY (id);


--
-- TOC entry 2937 (class 2606 OID 16713)
-- Name: Contact Contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Contact"
    ADD CONSTRAINT "Contact_pkey" PRIMARY KEY (id);


--
-- TOC entry 2931 (class 2606 OID 16686)
-- Name: Industry Industry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Industry"
    ADD CONSTRAINT "Industry_pkey" PRIMARY KEY (id);


--
-- TOC entry 2943 (class 2606 OID 16740)
-- Name: Invoice Invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Invoice"
    ADD CONSTRAINT "Invoice_pkey" PRIMARY KEY (id);


--
-- TOC entry 2939 (class 2606 OID 16722)
-- Name: Order Order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (id);


--
-- TOC entry 2941 (class 2606 OID 16731)
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);


--
-- TOC entry 2933 (class 2606 OID 16695)
-- Name: Shipping Shipping_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Shipping"
    ADD CONSTRAINT "Shipping_pkey" PRIMARY KEY (id);


--
-- TOC entry 2929 (class 2606 OID 16677)
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- TOC entry 2926 (class 2606 OID 16582)
-- Name: _Migration _Migration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_Migration"
    ADD CONSTRAINT "_Migration_pkey" PRIMARY KEY (revision);


--
-- TOC entry 2927 (class 1259 OID 16759)
-- Name: User.username_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User.username_unique" ON public."User" USING btree (username);


--
-- TOC entry 2946 (class 1259 OID 16762)
-- Name: _ClientToContact_AB_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "_ClientToContact_AB_unique" ON public."_ClientToContact" USING btree ("A", "B");


--
-- TOC entry 2947 (class 1259 OID 16763)
-- Name: _ClientToContact_B_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "_ClientToContact_B_index" ON public."_ClientToContact" USING btree ("B");


--
-- TOC entry 2944 (class 1259 OID 16760)
-- Name: _ClientToShipping_AB_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "_ClientToShipping_AB_unique" ON public."_ClientToShipping" USING btree ("A", "B");


--
-- TOC entry 2945 (class 1259 OID 16761)
-- Name: _ClientToShipping_B_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "_ClientToShipping_B_index" ON public."_ClientToShipping" USING btree ("B");


--
-- TOC entry 2948 (class 1259 OID 16764)
-- Name: _OrderToProduct_AB_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "_OrderToProduct_AB_unique" ON public."_OrderToProduct" USING btree ("A", "B");


--
-- TOC entry 2949 (class 1259 OID 16765)
-- Name: _OrderToProduct_B_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "_OrderToProduct_B_index" ON public."_OrderToProduct" USING btree ("B");


--
-- TOC entry 2950 (class 2606 OID 16766)
-- Name: Client Client_sellerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Client"
    ADD CONSTRAINT "Client_sellerId_fkey" FOREIGN KEY ("sellerId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2951 (class 2606 OID 16771)
-- Name: Order Order_clientId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_clientId_fkey" FOREIGN KEY ("clientId") REFERENCES public."Client"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2952 (class 2606 OID 16776)
-- Name: Order Order_invoiceId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_invoiceId_fkey" FOREIGN KEY ("invoiceId") REFERENCES public."Invoice"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2953 (class 2606 OID 16781)
-- Name: Order Order_shippingId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_shippingId_fkey" FOREIGN KEY ("shippingId") REFERENCES public."Shipping"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2954 (class 2606 OID 16786)
-- Name: Product Product_supplierId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_supplierId_fkey" FOREIGN KEY ("supplierId") REFERENCES public."Industry"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2957 (class 2606 OID 16801)
-- Name: _ClientToContact _ClientToContact_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_ClientToContact"
    ADD CONSTRAINT "_ClientToContact_A_fkey" FOREIGN KEY ("A") REFERENCES public."Client"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2958 (class 2606 OID 16806)
-- Name: _ClientToContact _ClientToContact_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_ClientToContact"
    ADD CONSTRAINT "_ClientToContact_B_fkey" FOREIGN KEY ("B") REFERENCES public."Contact"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2955 (class 2606 OID 16791)
-- Name: _ClientToShipping _ClientToShipping_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_ClientToShipping"
    ADD CONSTRAINT "_ClientToShipping_A_fkey" FOREIGN KEY ("A") REFERENCES public."Client"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2956 (class 2606 OID 16796)
-- Name: _ClientToShipping _ClientToShipping_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_ClientToShipping"
    ADD CONSTRAINT "_ClientToShipping_B_fkey" FOREIGN KEY ("B") REFERENCES public."Shipping"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2959 (class 2606 OID 16811)
-- Name: _OrderToProduct _OrderToProduct_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_OrderToProduct"
    ADD CONSTRAINT "_OrderToProduct_A_fkey" FOREIGN KEY ("A") REFERENCES public."Order"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2960 (class 2606 OID 16816)
-- Name: _OrderToProduct _OrderToProduct_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_OrderToProduct"
    ADD CONSTRAINT "_OrderToProduct_B_fkey" FOREIGN KEY ("B") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2021-03-22 14:42:18

--
-- PostgreSQL database dump complete
--

