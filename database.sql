--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

-- Started on 2021-01-24 23:05:35

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
-- TOC entry 3087 (class 1262 OID 16394)
-- Name: lojaunit; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE lojaunit WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';


ALTER DATABASE lojaunit OWNER TO postgres;

\connect lojaunit

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
-- TOC entry 200 (class 1259 OID 16395)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    id integer NOT NULL,
    nome character(200) NOT NULL,
    ativo boolean NOT NULL
);


ALTER TABLE public.categoria OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16405)
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.categoria ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 202 (class 1259 OID 16407)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    id integer NOT NULL,
    cpf character(11) NOT NULL,
    nome character(200) NOT NULL,
    email character(200) NOT NULL,
    sexo character(1),
    nome_social character(200),
    apelido character(200),
    telefone character(9),
    data_nascimento date
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 3088 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN cliente.sexo; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.cliente.sexo IS 'M - Masculino
F - Feminino';


--
-- TOC entry 205 (class 1259 OID 16514)
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cliente ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 210 (class 1259 OID 16684)
-- Name: faq; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faq (
    id integer NOT NULL,
    datahora time with time zone NOT NULL,
    texto text NOT NULL,
    produto_id integer NOT NULL
);


ALTER TABLE public.faq OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16682)
-- Name: faq_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.faq ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.faq_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 212 (class 1259 OID 16704)
-- Name: forma_pagamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forma_pagamento (
    id integer NOT NULL,
    forma character varying(200) NOT NULL,
    descricao text,
    ativo boolean NOT NULL
);


ALTER TABLE public.forma_pagamento OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16702)
-- Name: forma_pagamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.forma_pagamento ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.forma_pagamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 207 (class 1259 OID 16522)
-- Name: fornecedor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fornecedor (
    id integer NOT NULL,
    cnpj character varying(20) NOT NULL,
    email character varying(200),
    endereco text,
    nome character varying(200) NOT NULL,
    telefone character varying(20)
);


ALTER TABLE public.fornecedor OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16520)
-- Name: fornecedor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fornecedor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fornecedor_id_seq OWNER TO postgres;

--
-- TOC entry 3089 (class 0 OID 0)
-- Dependencies: 206
-- Name: fornecedor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fornecedor_id_seq OWNED BY public.fornecedor.id;


--
-- TOC entry 203 (class 1259 OID 16504)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16729)
-- Name: item_venda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_venda (
    venda_id integer NOT NULL,
    produto_id integer NOT NULL,
    quantidade integer NOT NULL,
    valor_unitario double precision NOT NULL
);


ALTER TABLE public.item_venda OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16506)
-- Name: marca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marca (
    id integer NOT NULL,
    descricao character varying(255),
    nome character varying(200) NOT NULL
);


ALTER TABLE public.marca OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16531)
-- Name: marca_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.marca ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.marca_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 16748)
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produto (
    id integer NOT NULL,
    nome character varying(200) NOT NULL,
    descricao text,
    preco double precision,
    unidade character varying(20),
    categoria_id integer,
    fornecedor_id integer,
    marca_id integer
);


ALTER TABLE public.produto OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16771)
-- Name: produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.produto ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 214 (class 1259 OID 16714)
-- Name: venda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.venda (
    id integer NOT NULL,
    datahora time with time zone NOT NULL,
    cliente_id integer NOT NULL,
    formapagamento_id integer NOT NULL,
    valor double precision
);


ALTER TABLE public.venda OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16712)
-- Name: vendas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.venda ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.vendas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 2903 (class 2604 OID 16525)
-- Name: fornecedor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedor ALTER COLUMN id SET DEFAULT nextval('public.fornecedor_id_seq'::regclass);


--
-- TOC entry 3064 (class 0 OID 16395)
-- Dependencies: 200
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categoria (id, nome, ativo) FROM stdin;
1	Calçado                                                                                                                                                                                                 	t
2	Roupa                                                                                                                                                                                                   	t
3	Acessório                                                                                                                                                                                               	t
4	Eletrônico                                                                                                                                                                                              	f
12	Informática                                                                                                                                                                                             	f
13	Móveis                                                                                                                                                                                                  	t
14	Brinquedo                                                                                                                                                                                               	t
\.


--
-- TOC entry 3066 (class 0 OID 16407)
-- Dependencies: 202
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (id, cpf, nome, email, sexo, nome_social, apelido, telefone, data_nascimento) FROM stdin;
9	81253478951	Mandrake                                                                                                                                                                                                	mand@gmail                                                                                                                                                                                              	M	\N	\N	985624178	2019-12-31
2	8          	Joao                                                                                                                                                                                                    	joao@fufa.com                                                                                                                                                                                           	M	Joca                                                                                                                                                                                                    	Jocaca                                                                                                                                                                                                  	858585858	2021-04-10
5	99803459651	Juca                                                                                                                                                                                                    	juca@gmail                                                                                                                                                                                              	\N	\N	\N	\N	\N
1	03548795142	Anthony                                                                                                                                                                                                 	acdc@unit                                                                                                                                                                                               	M	Tom                                                                                                                                                                                                     	Tony                                                                                                                                                                                                    	625412548	2020-10-10
7	78997898123	Sadam                                                                                                                                                                                                   	meu@email                                                                                                                                                                                               	\N	\N	\N	\N	\N
6	12658563174	Koka Kola                                                                                                                                                                                               	koka@yahoo                                                                                                                                                                                              	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3074 (class 0 OID 16684)
-- Dependencies: 210
-- Data for Name: faq; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faq (id, datahora, texto, produto_id) FROM stdin;
1	00:00:00-03	Muito ruim, nao gostei.	1
3	00:00:00-03	mais ou menos	2
2	15:32:01-03	de boas ok	2
\.


--
-- TOC entry 3076 (class 0 OID 16704)
-- Dependencies: 212
-- Data for Name: forma_pagamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forma_pagamento (id, forma, descricao, ativo) FROM stdin;
1	Dinheiro	nada	t
2	Dinheiro	nada	t
3	Cheques	Nada	t
4	Criptomoeda	Nada	t
\.


--
-- TOC entry 3071 (class 0 OID 16522)
-- Dependencies: 207
-- Data for Name: fornecedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fornecedor (id, cnpj, email, endereco, nome, telefone) FROM stdin;
1	114568789141	leader@email.com	Rua DR Joao Santos 95 Recife	Leader	952543624
\.


--
-- TOC entry 3079 (class 0 OID 16729)
-- Dependencies: 215
-- Data for Name: item_venda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item_venda (venda_id, produto_id, quantidade, valor_unitario) FROM stdin;
1	2	1	100
1	1	2	100
\.


--
-- TOC entry 3068 (class 0 OID 16506)
-- Dependencies: 204
-- Data for Name: marca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marca (id, descricao, nome) FROM stdin;
1	BOM	Mizuno
2	FUNFOU	Nike
\.


--
-- TOC entry 3080 (class 0 OID 16748)
-- Dependencies: 216
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produto (id, nome, descricao, preco, unidade, categoria_id, fornecedor_id, marca_id) FROM stdin;
1	Camisa Nike	Camisa	70	Unidade	2	1	2
2	Nike Air	Tenis	100	Par	1	1	2
3	Mizuno Wave	Tenis	150	Par	1	1	1
\.


--
-- TOC entry 3078 (class 0 OID 16714)
-- Dependencies: 214
-- Data for Name: venda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.venda (id, datahora, cliente_id, formapagamento_id, valor) FROM stdin;
2	17:33:02-03	2	1	90
1	17:32:02-03	1	4	150
\.


--
-- TOC entry 3090 (class 0 OID 0)
-- Dependencies: 201
-- Name: categoria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categoria_id_seq', 14, true);


--
-- TOC entry 3091 (class 0 OID 0)
-- Dependencies: 205
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_id_seq', 9, true);


--
-- TOC entry 3092 (class 0 OID 0)
-- Dependencies: 209
-- Name: faq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faq_id_seq', 3, true);


--
-- TOC entry 3093 (class 0 OID 0)
-- Dependencies: 211
-- Name: forma_pagamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forma_pagamento_id_seq', 4, true);


--
-- TOC entry 3094 (class 0 OID 0)
-- Dependencies: 206
-- Name: fornecedor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fornecedor_id_seq', 2, true);


--
-- TOC entry 3095 (class 0 OID 0)
-- Dependencies: 203
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hibernate_sequence', 5, true);


--
-- TOC entry 3096 (class 0 OID 0)
-- Dependencies: 208
-- Name: marca_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.marca_id_seq', 3, true);


--
-- TOC entry 3097 (class 0 OID 0)
-- Dependencies: 217
-- Name: produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produto_id_seq', 3, true);


--
-- TOC entry 3098 (class 0 OID 0)
-- Dependencies: 213
-- Name: vendas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendas_id_seq', 2, true);


--
-- TOC entry 2905 (class 2606 OID 16404)
-- Name: categoria categoria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id);


--
-- TOC entry 2907 (class 2606 OID 16414)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- TOC entry 2913 (class 2606 OID 16624)
-- Name: fornecedor cnpj_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT cnpj_unique UNIQUE (cnpj);


--
-- TOC entry 2909 (class 2606 OID 16622)
-- Name: cliente cpf_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cpf_unique UNIQUE (cpf);


--
-- TOC entry 2917 (class 2606 OID 16691)
-- Name: faq faq_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faq
    ADD CONSTRAINT faq_pkey PRIMARY KEY (id);


--
-- TOC entry 2919 (class 2606 OID 16711)
-- Name: forma_pagamento forma_pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forma_pagamento
    ADD CONSTRAINT forma_pagamento_pkey PRIMARY KEY (id);


--
-- TOC entry 2915 (class 2606 OID 16530)
-- Name: fornecedor fornecedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fornecedor
    ADD CONSTRAINT fornecedor_pkey PRIMARY KEY (id);


--
-- TOC entry 2923 (class 2606 OID 16733)
-- Name: item_venda item_venda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_venda
    ADD CONSTRAINT item_venda_pkey PRIMARY KEY (venda_id, produto_id);


--
-- TOC entry 2911 (class 2606 OID 16513)
-- Name: marca marca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marca
    ADD CONSTRAINT marca_pkey PRIMARY KEY (id);


--
-- TOC entry 2925 (class 2606 OID 16755)
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);


--
-- TOC entry 2921 (class 2606 OID 16718)
-- Name: venda vendas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT vendas_pkey PRIMARY KEY (id);


--
-- TOC entry 2931 (class 2606 OID 16783)
-- Name: produto fk_categoria_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fk_categoria_id FOREIGN KEY (categoria_id) REFERENCES public.categoria(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2927 (class 2606 OID 16719)
-- Name: venda fk_cliente_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT fk_cliente_id FOREIGN KEY (cliente_id) REFERENCES public.cliente(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2932 (class 2606 OID 16788)
-- Name: produto fk_fornecedor_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fk_fornecedor_id FOREIGN KEY (fornecedor_id) REFERENCES public.fornecedor(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2933 (class 2606 OID 16793)
-- Name: produto fk_marca_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT fk_marca_id FOREIGN KEY (marca_id) REFERENCES public.marca(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2928 (class 2606 OID 16724)
-- Name: venda fk_pagamento_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT fk_pagamento_id FOREIGN KEY (formapagamento_id) REFERENCES public.forma_pagamento(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2926 (class 2606 OID 16778)
-- Name: faq fk_produto_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faq
    ADD CONSTRAINT fk_produto_id FOREIGN KEY (produto_id) REFERENCES public.produto(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2930 (class 2606 OID 16803)
-- Name: item_venda fk_produto_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_venda
    ADD CONSTRAINT fk_produto_id FOREIGN KEY (produto_id) REFERENCES public.produto(id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 2929 (class 2606 OID 16734)
-- Name: item_venda fk_venda_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_venda
    ADD CONSTRAINT fk_venda_id FOREIGN KEY (venda_id) REFERENCES public.venda(id) NOT VALID;


-- Completed on 2021-01-24 23:05:36

--
-- PostgreSQL database dump complete
--

