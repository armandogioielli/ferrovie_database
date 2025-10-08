--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2025-10-09 00:17:01

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
-- TOC entry 232 (class 1259 OID 84039)
-- Name: biglietto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.biglietto (
    id_biglietto integer NOT NULL,
    numero_biglietto character varying(20) NOT NULL,
    ticket uuid NOT NULL,
    prezzo numeric(8,2) NOT NULL,
    classe character varying(20),
    fila integer,
    lettera_posto character(1),
    numero_carrozza integer,
    data_validita date,
    data_validazione date,
    validato boolean DEFAULT false,
    id_prenotazione integer NOT NULL,
    stazione_partenza integer NOT NULL,
    stazione_arrivo integer NOT NULL
);


ALTER TABLE public.biglietto OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 84038)
-- Name: biglietto_id_biglietto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.biglietto_id_biglietto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.biglietto_id_biglietto_seq OWNER TO postgres;

--
-- TOC entry 3536 (class 0 OID 0)
-- Dependencies: 231
-- Name: biglietto_id_biglietto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.biglietto_id_biglietto_seq OWNED BY public.biglietto.id_biglietto;


--
-- TOC entry 212 (class 1259 OID 83904)
-- Name: comune; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comune (
    id_comune integer NOT NULL,
    nome character varying(50) NOT NULL,
    provincia integer NOT NULL
);


ALTER TABLE public.comune OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 83903)
-- Name: comune_id_comune_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comune_id_comune_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comune_id_comune_seq OWNER TO postgres;

--
-- TOC entry 3537 (class 0 OID 0)
-- Dependencies: 211
-- Name: comune_id_comune_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comune_id_comune_seq OWNED BY public.comune.id_comune;


--
-- TOC entry 237 (class 1259 OID 84114)
-- Name: dipendente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dipendente (
    matricola character varying(20) NOT NULL,
    nome character varying(50) NOT NULL,
    cognome character varying(50) NOT NULL,
    sesso character(1),
    data_nascita date,
    data_assunzione date NOT NULL,
    ruolo integer,
    CONSTRAINT dipendente_sesso_check CHECK ((sesso = ANY (ARRAY['M'::bpchar, 'F'::bpchar])))
);


ALTER TABLE public.dipendente OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 83950)
-- Name: indirizzo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.indirizzo (
    id_indirizzo integer NOT NULL,
    via character varying(100) NOT NULL,
    civico character varying(10),
    cap character(5),
    id_provincia integer NOT NULL,
    id_comune integer NOT NULL,
    latitudine numeric(9,6),
    longitudine numeric(9,6)
);


ALTER TABLE public.indirizzo OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 83949)
-- Name: indirizzo_id_indirizzo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.indirizzo_id_indirizzo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indirizzo_id_indirizzo_seq OWNER TO postgres;

--
-- TOC entry 3538 (class 0 OID 0)
-- Dependencies: 221
-- Name: indirizzo_id_indirizzo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.indirizzo_id_indirizzo_seq OWNED BY public.indirizzo.id_indirizzo;


--
-- TOC entry 238 (class 1259 OID 84125)
-- Name: lavora; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lavora (
    matricola character varying(20) NOT NULL,
    id_tratta integer NOT NULL
);


ALTER TABLE public.lavora OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 83967)
-- Name: passeggero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passeggero (
    id_passeggero integer NOT NULL,
    nome character varying(50) NOT NULL,
    cognome character varying(50) NOT NULL,
    sesso character(1),
    data_nascita date,
    telefono character varying(20),
    email character varying(100),
    id_indirizzo integer,
    CONSTRAINT passeggero_sesso_check CHECK ((sesso = ANY (ARRAY['M'::bpchar, 'F'::bpchar])))
);


ALTER TABLE public.passeggero OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 83966)
-- Name: passeggero_id_passeggero_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.passeggero_id_passeggero_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.passeggero_id_passeggero_seq OWNER TO postgres;

--
-- TOC entry 3539 (class 0 OID 0)
-- Dependencies: 223
-- Name: passeggero_id_passeggero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.passeggero_id_passeggero_seq OWNED BY public.passeggero.id_passeggero;


--
-- TOC entry 225 (class 1259 OID 83979)
-- Name: persona_fisica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persona_fisica (
    id_passeggero integer NOT NULL,
    codice_fiscale character(16) NOT NULL
);


ALTER TABLE public.persona_fisica OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 84004)
-- Name: prenotazione; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prenotazione (
    id_prenotazione integer NOT NULL,
    numero_prenotazione character varying(20) NOT NULL,
    data_prenotazione date NOT NULL,
    data_partenza date NOT NULL,
    ora_partenza time without time zone,
    importo numeric(8,2),
    numero_passeggeri integer,
    numero_cambi integer DEFAULT 0,
    stato_prenotazione integer,
    id_passeggero integer NOT NULL,
    CONSTRAINT prenotazione_numero_passeggeri_check CHECK ((numero_passeggeri > 0))
);


ALTER TABLE public.prenotazione OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 84003)
-- Name: prenotazione_id_prenotazione_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prenotazione_id_prenotazione_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prenotazione_id_prenotazione_seq OWNER TO postgres;

--
-- TOC entry 3540 (class 0 OID 0)
-- Dependencies: 227
-- Name: prenotazione_id_prenotazione_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prenotazione_id_prenotazione_seq OWNED BY public.prenotazione.id_prenotazione;


--
-- TOC entry 210 (class 1259 OID 83897)
-- Name: provincia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provincia (
    id_provincia integer NOT NULL,
    sigla character varying(2) NOT NULL,
    denominazione character varying(50) NOT NULL
);


ALTER TABLE public.provincia OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 83896)
-- Name: provincia_id_provincia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.provincia_id_provincia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.provincia_id_provincia_seq OWNER TO postgres;

--
-- TOC entry 3541 (class 0 OID 0)
-- Dependencies: 209
-- Name: provincia_id_provincia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.provincia_id_provincia_seq OWNED BY public.provincia.id_provincia;


--
-- TOC entry 220 (class 1259 OID 83941)
-- Name: ruolo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ruolo (
    id_ruolo integer NOT NULL,
    denominazione character varying(50) NOT NULL,
    postazione character varying(50)
);


ALTER TABLE public.ruolo OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 83940)
-- Name: ruolo_id_ruolo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ruolo_id_ruolo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ruolo_id_ruolo_seq OWNER TO postgres;

--
-- TOC entry 3542 (class 0 OID 0)
-- Dependencies: 219
-- Name: ruolo_id_ruolo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ruolo_id_ruolo_seq OWNED BY public.ruolo.id_ruolo;


--
-- TOC entry 226 (class 1259 OID 83991)
-- Name: soggetto_giuridico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.soggetto_giuridico (
    id_passeggero integer NOT NULL,
    partita_iva character(11) NOT NULL,
    pec character varying(100)
);


ALTER TABLE public.soggetto_giuridico OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 83933)
-- Name: statoprenotazione; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statoprenotazione (
    id_stato integer NOT NULL,
    stato character varying(20) NOT NULL,
    CONSTRAINT statoprenotazione_stato_check CHECK (((stato)::text = ANY ((ARRAY['IN PAGAMENTO'::character varying, 'PAGATA'::character varying, 'SCADUTA'::character varying])::text[])))
);


ALTER TABLE public.statoprenotazione OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 83932)
-- Name: statoprenotazione_id_stato_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.statoprenotazione_id_stato_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.statoprenotazione_id_stato_seq OWNER TO postgres;

--
-- TOC entry 3543 (class 0 OID 0)
-- Dependencies: 217
-- Name: statoprenotazione_id_stato_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.statoprenotazione_id_stato_seq OWNED BY public.statoprenotazione.id_stato;


--
-- TOC entry 230 (class 1259 OID 84025)
-- Name: stazione; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stazione (
    id_stazione integer NOT NULL,
    denominazione character varying(100) NOT NULL,
    numero_binari integer,
    capolinea boolean DEFAULT false,
    id_indirizzo integer,
    CONSTRAINT stazione_numero_binari_check CHECK ((numero_binari > 0))
);


ALTER TABLE public.stazione OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 84024)
-- Name: stazione_id_stazione_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stazione_id_stazione_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stazione_id_stazione_seq OWNER TO postgres;

--
-- TOC entry 3544 (class 0 OID 0)
-- Dependencies: 229
-- Name: stazione_id_stazione_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stazione_id_stazione_seq OWNED BY public.stazione.id_stazione;


--
-- TOC entry 216 (class 1259 OID 83925)
-- Name: tipoalimentazione; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipoalimentazione (
    id_alimentazione integer NOT NULL,
    tipo character varying(20) NOT NULL,
    CONSTRAINT tipoalimentazione_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['ELETTRICO'::character varying, 'DIESEL'::character varying, 'IBRIDO'::character varying])::text[])))
);


ALTER TABLE public.tipoalimentazione OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 83924)
-- Name: tipoalimentazione_id_alimentazione_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipoalimentazione_id_alimentazione_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipoalimentazione_id_alimentazione_seq OWNER TO postgres;

--
-- TOC entry 3545 (class 0 OID 0)
-- Dependencies: 215
-- Name: tipoalimentazione_id_alimentazione_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipoalimentazione_id_alimentazione_seq OWNED BY public.tipoalimentazione.id_alimentazione;


--
-- TOC entry 214 (class 1259 OID 83916)
-- Name: tipologiatreno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipologiatreno (
    id_tipologia integer NOT NULL,
    descrizione character varying(50) NOT NULL
);


ALTER TABLE public.tipologiatreno OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 83915)
-- Name: tipologiatreno_id_tipologia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipologiatreno_id_tipologia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipologiatreno_id_tipologia_seq OWNER TO postgres;

--
-- TOC entry 3546 (class 0 OID 0)
-- Dependencies: 213
-- Name: tipologiatreno_id_tipologia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipologiatreno_id_tipologia_seq OWNED BY public.tipologiatreno.id_tipologia;


--
-- TOC entry 234 (class 1259 OID 84064)
-- Name: tratta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tratta (
    id_tratta integer NOT NULL,
    tipologia character varying(50),
    data_inizio date NOT NULL,
    data_fine date,
    posti_disponibili integer,
    orario_partenza time without time zone,
    orario_arrivo time without time zone,
    id_stazione_partenza integer NOT NULL,
    id_stazione_arrivo integer NOT NULL,
    CONSTRAINT tratta_posti_disponibili_check CHECK ((posti_disponibili >= 0))
);


ALTER TABLE public.tratta OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 84063)
-- Name: tratta_id_tratta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tratta_id_tratta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tratta_id_tratta_seq OWNER TO postgres;

--
-- TOC entry 3547 (class 0 OID 0)
-- Dependencies: 233
-- Name: tratta_id_tratta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tratta_id_tratta_seq OWNED BY public.tratta.id_tratta;


--
-- TOC entry 235 (class 1259 OID 84081)
-- Name: treno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.treno (
    matricola character varying(20) NOT NULL,
    tipologia character varying(50),
    numero_carrozze integer,
    numero_posti integer,
    capienza integer,
    id_tipologia integer,
    id_alimentazione integer,
    anno_costruzione integer,
    CONSTRAINT treno_capienza_check CHECK ((capienza > 0)),
    CONSTRAINT treno_numero_carrozze_check CHECK ((numero_carrozze > 0)),
    CONSTRAINT treno_numero_posti_check CHECK ((numero_posti > 0))
);


ALTER TABLE public.treno OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 84099)
-- Name: viaggia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.viaggia (
    id_tratta integer NOT NULL,
    matricola_treno character varying(20) NOT NULL
);


ALTER TABLE public.viaggia OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 84140)
-- Name: vw_biglietti_disponibili; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_biglietti_disponibili AS
 SELECT t.id_tratta,
    sp.denominazione AS stazione_partenza,
    sa.denominazione AS stazione_arrivo,
    tr.tipologia AS tipo_treno,
    tr.matricola AS matricola_treno,
    tr.numero_posti,
    tr.capienza,
    (tr.capienza - count(b.id_biglietto)) AS posti_disponibili,
    t.data_inizio,
    t.data_fine,
    t.orario_partenza,
    t.orario_arrivo
   FROM (((((public.tratta t
     JOIN public.stazione sp ON ((t.id_stazione_partenza = sp.id_stazione)))
     JOIN public.stazione sa ON ((t.id_stazione_arrivo = sa.id_stazione)))
     JOIN public.viaggia v ON ((t.id_tratta = v.id_tratta)))
     JOIN public.treno tr ON (((v.matricola_treno)::text = (tr.matricola)::text)))
     LEFT JOIN public.biglietto b ON ((b.id_prenotazione IN ( SELECT prenotazione.id_prenotazione
           FROM public.prenotazione))))
  GROUP BY t.id_tratta, sp.denominazione, sa.denominazione, tr.tipologia, tr.matricola, tr.numero_posti, tr.capienza, t.data_inizio, t.data_fine, t.orario_partenza, t.orario_arrivo;


ALTER TABLE public.vw_biglietti_disponibili OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 84160)
-- Name: vw_personale_tratta; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_personale_tratta AS
 SELECT t.id_tratta,
    sp.denominazione AS stazione_partenza,
    sa.denominazione AS stazione_arrivo,
    d.matricola,
    d.nome,
    d.cognome,
    r.denominazione AS ruolo
   FROM (((((public.dipendente d
     JOIN public.ruolo r ON ((d.ruolo = r.id_ruolo)))
     JOIN public.lavora l ON (((d.matricola)::text = (l.matricola)::text)))
     JOIN public.tratta t ON ((l.id_tratta = t.id_tratta)))
     JOIN public.stazione sp ON ((t.id_stazione_partenza = sp.id_stazione)))
     JOIN public.stazione sa ON ((t.id_stazione_arrivo = sa.id_stazione)));


ALTER TABLE public.vw_personale_tratta OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 84145)
-- Name: vw_storico_prenotazioni; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_storico_prenotazioni AS
 SELECT p.id_passeggero,
    p.numero_prenotazione,
    p.data_prenotazione,
    p.data_partenza,
    s.stato,
    count(b.id_biglietto) AS numero_biglietti,
    sum(b.prezzo) AS importo_totale
   FROM ((public.prenotazione p
     JOIN public.statoprenotazione s ON ((p.stato_prenotazione = s.id_stato)))
     LEFT JOIN public.biglietto b ON ((p.id_prenotazione = b.id_prenotazione)))
  GROUP BY p.id_passeggero, p.numero_prenotazione, p.data_prenotazione, p.data_partenza, s.stato;


ALTER TABLE public.vw_storico_prenotazioni OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 84155)
-- Name: vw_treni_in_servizio; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_treni_in_servizio AS
 SELECT tr.matricola,
    tr.tipologia,
    ta.tipo AS alimentazione,
    t.id_tratta,
    sp.denominazione AS stazione_partenza,
    sa.denominazione AS stazione_arrivo,
    t.orario_partenza,
    t.orario_arrivo,
    t.data_inizio,
    t.data_fine
   FROM (((((public.treno tr
     JOIN public.tipoalimentazione ta ON ((tr.id_alimentazione = ta.id_alimentazione)))
     JOIN public.viaggia v ON (((tr.matricola)::text = (v.matricola_treno)::text)))
     JOIN public.tratta t ON ((v.id_tratta = t.id_tratta)))
     JOIN public.stazione sp ON ((t.id_stazione_partenza = sp.id_stazione)))
     JOIN public.stazione sa ON ((t.id_stazione_arrivo = sa.id_stazione)))
  WHERE ((CURRENT_DATE >= t.data_inizio) AND (CURRENT_DATE <= COALESCE(t.data_fine, '9999-12-31'::date)));


ALTER TABLE public.vw_treni_in_servizio OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 84150)
-- Name: vw_verifica_biglietto; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_verifica_biglietto AS
 SELECT b.numero_biglietto,
    b.ticket,
    b.validato,
    b.data_validita,
    sp.denominazione AS stazione_partenza,
    sa.denominazione AS stazione_arrivo,
        CASE
            WHEN (b.validato = true) THEN 'VALIDATO'::text
            WHEN (b.data_validita < CURRENT_DATE) THEN 'SCADUTO'::text
            ELSE 'VALIDO'::text
        END AS stato_biglietto
   FROM ((public.biglietto b
     JOIN public.stazione sp ON ((b.stazione_partenza = sp.id_stazione)))
     JOIN public.stazione sa ON ((b.stazione_arrivo = sa.id_stazione)));


ALTER TABLE public.vw_verifica_biglietto OWNER TO postgres;

--
-- TOC entry 3280 (class 2604 OID 84042)
-- Name: biglietto id_biglietto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biglietto ALTER COLUMN id_biglietto SET DEFAULT nextval('public.biglietto_id_biglietto_seq'::regclass);


--
-- TOC entry 3264 (class 2604 OID 83907)
-- Name: comune id_comune; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comune ALTER COLUMN id_comune SET DEFAULT nextval('public.comune_id_comune_seq'::regclass);


--
-- TOC entry 3271 (class 2604 OID 83953)
-- Name: indirizzo id_indirizzo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indirizzo ALTER COLUMN id_indirizzo SET DEFAULT nextval('public.indirizzo_id_indirizzo_seq'::regclass);


--
-- TOC entry 3272 (class 2604 OID 83970)
-- Name: passeggero id_passeggero; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passeggero ALTER COLUMN id_passeggero SET DEFAULT nextval('public.passeggero_id_passeggero_seq'::regclass);


--
-- TOC entry 3274 (class 2604 OID 84007)
-- Name: prenotazione id_prenotazione; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prenotazione ALTER COLUMN id_prenotazione SET DEFAULT nextval('public.prenotazione_id_prenotazione_seq'::regclass);


--
-- TOC entry 3263 (class 2604 OID 83900)
-- Name: provincia id_provincia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provincia ALTER COLUMN id_provincia SET DEFAULT nextval('public.provincia_id_provincia_seq'::regclass);


--
-- TOC entry 3270 (class 2604 OID 83944)
-- Name: ruolo id_ruolo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruolo ALTER COLUMN id_ruolo SET DEFAULT nextval('public.ruolo_id_ruolo_seq'::regclass);


--
-- TOC entry 3268 (class 2604 OID 83936)
-- Name: statoprenotazione id_stato; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statoprenotazione ALTER COLUMN id_stato SET DEFAULT nextval('public.statoprenotazione_id_stato_seq'::regclass);


--
-- TOC entry 3277 (class 2604 OID 84028)
-- Name: stazione id_stazione; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stazione ALTER COLUMN id_stazione SET DEFAULT nextval('public.stazione_id_stazione_seq'::regclass);


--
-- TOC entry 3266 (class 2604 OID 83928)
-- Name: tipoalimentazione id_alimentazione; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipoalimentazione ALTER COLUMN id_alimentazione SET DEFAULT nextval('public.tipoalimentazione_id_alimentazione_seq'::regclass);


--
-- TOC entry 3265 (class 2604 OID 83919)
-- Name: tipologiatreno id_tipologia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipologiatreno ALTER COLUMN id_tipologia SET DEFAULT nextval('public.tipologiatreno_id_tipologia_seq'::regclass);


--
-- TOC entry 3282 (class 2604 OID 84067)
-- Name: tratta id_tratta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratta ALTER COLUMN id_tratta SET DEFAULT nextval('public.tratta_id_tratta_seq'::regclass);


--
-- TOC entry 3524 (class 0 OID 84039)
-- Dependencies: 232
-- Data for Name: biglietto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.biglietto (id_biglietto, numero_biglietto, ticket, prezzo, classe, fila, lettera_posto, numero_carrozza, data_validita, data_validazione, validato, id_prenotazione, stazione_partenza, stazione_arrivo) FROM stdin;
1	BT001	67ee0ed0-b123-434d-9597-52dfdb67e3e1	25.50	Economy	5	A	1	2025-09-10	2025-09-10	t	1	1	2
2	BT002	9d0fc5dc-9c67-495b-83df-f4df253a7454	50.00	Business	3	B	2	2025-09-12	2025-09-12	t	2	3	4
3	BT003	dd7446e2-918f-40e3-8cd0-8597797620db	35.00	Economy	10	C	1	2025-09-15	2025-09-15	t	3	5	6
4	BT004	6989223f-bacc-4fd5-ae94-033884b2570a	70.00	First	2	D	3	2025-09-18	2025-09-18	t	4	7	8
5	BT005	e04b2fe4-6857-4a82-a3c7-bd5c4e7142fb	40.00	Economy	8	E	2	2025-09-20	2025-09-20	t	5	9	10
6	BT006	43dc9949-d94a-4644-8063-a5a5d47c4cfe	60.00	Business	4	F	3	2025-09-22	2025-09-22	t	6	11	12
7	BT007	a5e7562e-b71b-4af1-bba0-cee9cc62fce8	30.00	Economy	6	G	1	2025-09-25	2025-09-25	t	7	1	3
8	BT008	cc6bfc93-91cc-4893-adaa-35bcda900260	55.50	Business	5	H	2	2025-09-28	2025-09-28	t	8	2	4
9	BT009	2aa8c897-9b21-4a68-856e-354dbe5b651b	45.00	Economy	7	I	1	2025-09-30	2025-09-30	t	9	5	7
10	BT010	d12efb4a-d38e-446e-acde-017bebe36142	80.00	First	1	J	3	2025-10-02	2025-10-02	t	10	3	6
11	BT011	bc81e9b9-7b1d-4fdb-a716-2265c1f77d87	65.00	Business	4	K	2	2025-10-05	2025-10-05	t	11	7	9
12	BT012	bd721f30-a72f-4a22-8c77-a8ddefa68334	75.00	First	2	L	3	2025-10-08	2025-10-08	t	12	1	4
13	BT013	f3dbcec3-c420-4181-978d-eea460def999	50.00	Economy	3	M	1	2025-10-10	2025-10-10	t	13	2	5
14	BT014	54bfbdff-04f4-4aed-9231-ac22d314c3f3	60.00	Business	5	N	2	2025-10-12	2025-10-12	t	14	3	6
15	BT015	dce685ce-e0cc-4d6b-a8d3-b65b61a881d8	85.00	First	1	O	3	2025-10-15	2025-10-15	t	15	4	7
16	BT016	a844a805-302d-4681-bf25-412fbba0d145	55.00	Economy	6	P	1	2025-10-18	2025-10-18	t	16	5	8
17	BT017	e959e9c1-fc4e-4722-948b-75074a7a7383	45.00	Economy	7	Q	1	2025-10-20	2025-10-20	t	17	6	9
18	BT018	e9935b59-0801-4598-b336-fc9293f82154	110.00	Business	2	R	2	2025-10-22	2025-10-22	t	18	7	10
19	BT019	ef6e8b75-c3e1-4a30-9473-1621d4b5dc42	95.00	First	1	S	3	2025-10-25	2025-10-25	t	19	8	11
20	BT020	8fae012c-f298-42ae-8083-781a8773da25	120.00	Business	2	T	2	2025-10-28	2025-10-28	t	20	9	12
\.


--
-- TOC entry 3504 (class 0 OID 83904)
-- Dependencies: 212
-- Data for Name: comune; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comune (id_comune, nome, provincia) FROM stdin;
1	Roma	1
2	Fiumicino	1
3	Milano	2
4	Monza	2
5	Napoli	3
6	Pozzuoli	3
7	Torino	4
8	Alessandria	4
9	Firenze	5
10	Prato	5
11	Venezia	6
12	Mestre	6
13	Bologna	7
14	Modena	7
15	Genova	8
16	Savona	8
17	Palermo	9
18	Monreale	9
19	Catania	10
20	Acireale	10
\.


--
-- TOC entry 3529 (class 0 OID 84114)
-- Dependencies: 237
-- Data for Name: dipendente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dipendente (matricola, nome, cognome, sesso, data_nascita, data_assunzione, ruolo) FROM stdin;
D001	Marco	Rossi	M	1980-05-12	2005-06-01	1
D002	Anna	Bianchi	F	1985-03-20	2010-09-15	2
D003	Luca	Verdi	M	1975-11-05	2000-01-10	3
D004	Sara	Neri	F	1990-06-17	2015-03-20	4
D005	Alessandro	Galli	M	1992-12-30	2017-08-01	5
D006	Chiara	Costa	F	1988-08-21	2012-05-18	6
D007	Stefano	Fontana	M	1983-09-15	2008-07-22	7
D008	Martina	Ferrari	F	1995-07-10	2020-02-10	8
D009	Davide	Marini	M	1978-02-25	2003-04-05	9
D010	Elisa	Barbieri	F	1991-01-08	2016-11-11	10
D011	Andrea	Rinaldi	M	1984-04-14	2009-12-01	11
D012	Valentina	Romano	F	1987-09-09	2011-06-15	12
D013	Matteo	Moretti	M	1993-10-22	2018-09-03	13
D014	Federica	Conti	F	1982-03-30	2007-05-07	14
D015	Simone	De Luca	M	1979-06-06	2002-01-15	15
D016	Ilaria	Grassi	F	1994-12-12	2019-04-18	16
D017	Riccardo	Bellini	M	1981-11-11	2006-07-25	17
D018	Giulia	Longo	F	1990-05-05	2015-09-19	18
D019	Marco	Marchetti	M	1986-08-18	2013-03-30	19
D020	Elena	Villa	F	1992-02-28	2017-12-12	20
\.


--
-- TOC entry 3514 (class 0 OID 83950)
-- Dependencies: 222
-- Data for Name: indirizzo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.indirizzo (id_indirizzo, via, civico, cap, id_provincia, id_comune, latitudine, longitudine) FROM stdin;
1	Via Roma	1	00100	1	1	41.902782	12.496366
2	Via Milano	10	20100	2	3	45.464211	9.191383
3	Via Napoli	5	80100	3	5	40.851798	14.268120
4	Via Torino	7	10100	4	7	45.070339	7.686864
5	Via Firenze	2	50100	5	9	43.769562	11.255814
6	Via Venezia	8	30100	6	11	45.440847	12.315515
7	Via Bologna	12	40100	7	13	44.494887	11.342616
8	Via Genova	6	16100	8	15	44.405650	8.946256
9	Via Palermo	4	90100	9	17	38.115688	13.361267
10	Via Catania	9	95100	10	19	37.507877	15.083030
11	Via Mestre	11	30172	6	12	45.495000	12.229000
12	Via Modena	3	41100	7	14	44.647128	10.925227
13	Via Savona	14	17100	8	16	44.309060	8.477180
14	Via Monreale	15	90046	9	18	38.080000	13.298000
15	Via Acireale	16	95024	10	20	37.583000	15.255000
16	Via Lecce	17	73100	17	17	40.351000	18.174000
17	Via Arezzo	18	52100	18	18	43.463000	11.879000
18	Via Livorno	19	57100	19	19	43.548000	10.310000
19	Via Perugia	20	06100	20	20	43.112000	12.388000
20	Via Brescia	20	25100	15	15	45.541000	10.211000
\.


--
-- TOC entry 3530 (class 0 OID 84125)
-- Dependencies: 238
-- Data for Name: lavora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lavora (matricola, id_tratta) FROM stdin;
D001	1
D002	2
D003	3
D004	4
D005	5
D006	6
D007	7
D008	8
D009	9
D010	10
D011	11
D012	12
D013	13
D014	14
D015	15
D016	16
D017	17
D018	18
D019	19
D020	20
\.


--
-- TOC entry 3516 (class 0 OID 83967)
-- Dependencies: 224
-- Data for Name: passeggero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.passeggero (id_passeggero, nome, cognome, sesso, data_nascita, telefono, email, id_indirizzo) FROM stdin;
1	Mario	Rossi	M	1980-05-12	0601234567	mario.rossi@example.com	1
2	Lucia	Bianchi	F	1990-03-20	0265432109	lucia.bianchi@example.com	2
3	Giuseppe	Verdi	M	1975-11-05	0812345678	giuseppe.verdi@example.com	3
4	Francesca	Neri	F	1985-06-17	0119876543	francesca.neri@example.com	4
5	Alessandro	Galli	M	1992-12-30	0551234567	alessandro.galli@example.com	5
6	Chiara	Costa	F	1988-08-21	0419876543	chiara.costa@example.com	6
7	Luca	Fontana	M	1983-09-15	0511234567	luca.fontana@example.com	7
8	Martina	Ferrari	F	1995-07-10	0109876543	martina.ferrari@example.com	8
9	Stefano	Marini	M	1978-02-25	0911234567	stefano.marini@example.com	9
10	Elisa	Barbieri	F	1991-01-08	0959876543	elisa.barbieri@example.com	10
11	Andrea	Rinaldi	M	1984-04-14	0451234567	andrea.rinaldi@example.com	11
12	Sara	Romano	F	1987-09-09	0499876543	sara.romano@example.com	12
13	Davide	Moretti	M	1993-10-22	0591234567	davide.moretti@example.com	13
14	Valentina	Conti	F	1982-03-30	0199876543	valentina.conti@example.com	14
15	Matteo	De Luca	M	1979-06-06	0101234567	matteo.deluca@example.com	15
16	Federica	Grassi	F	1994-12-12	0819876543	federica.grassi@example.com	16
17	Simone	Bellini	M	1981-11-11	0561234567	simone.bellini@example.com	17
18	Ilaria	Longo	F	1990-05-05	0579876543	ilaria.longo@example.com	18
19	Riccardo	Marchetti	M	1986-08-18	0301234567	riccardo.marchetti@example.com	19
20	Giulia	Villa	F	1992-02-28	0759876543	giulia.villa@example.com	20
\.


--
-- TOC entry 3517 (class 0 OID 83979)
-- Dependencies: 225
-- Data for Name: persona_fisica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.persona_fisica (id_passeggero, codice_fiscale) FROM stdin;
1	RSSMRA80A12H501U
2	BNCLCU90C60F205X
3	VRDGPP75E05F839S
4	NRIFNC85H57G273Y
5	GLLLSD92T30D612Z
6	CSTCHR88M61L736W
7	FNTLCU83P15B325D
8	FRRMTN95L10C351K
9	MRNSTF78B25F839R
10	BRBELS91A08C351L
11	RNLNDR84D14H501M
12	RMNSRA87P09F205N
13	MRTDVD93R22G273V
14	CNTVLN82C30L736B
15	DLCMTE79H06C351X
16	GRSFDR94T12A609S
17	BLNSMN81P11D612F
18	LNGLRI90E05D612K
19	MRCRCD86M18F205J
20	VLLGLL92B28H501Q
\.


--
-- TOC entry 3520 (class 0 OID 84004)
-- Dependencies: 228
-- Data for Name: prenotazione; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prenotazione (id_prenotazione, numero_prenotazione, data_prenotazione, data_partenza, ora_partenza, importo, numero_passeggeri, numero_cambi, stato_prenotazione, id_passeggero) FROM stdin;
1	PNR001	2025-09-01	2025-09-10	08:30:00	50.00	1	0	1	1
2	PNR002	2025-09-02	2025-09-12	09:00:00	75.00	2	0	2	2
3	PNR003	2025-09-03	2025-09-15	14:30:00	60.50	1	1	3	3
4	PNR004	2025-09-04	2025-09-18	07:15:00	90.00	3	0	1	4
5	PNR005	2025-09-05	2025-09-20	16:00:00	45.00	1	0	2	5
6	PNR006	2025-09-06	2025-09-22	12:00:00	120.00	2	1	3	6
7	PNR007	2025-09-07	2025-09-25	10:30:00	35.50	1	0	1	7
8	PNR008	2025-09-08	2025-09-28	15:45:00	55.00	2	0	2	8
9	PNR009	2025-09-09	2025-09-30	11:00:00	65.00	1	1	3	9
10	PNR010	2025-09-10	2025-10-02	09:30:00	80.00	2	0	1	10
11	PNR011	2025-09-11	2025-10-05	13:15:00	70.00	1	0	2	11
12	PNR012	2025-09-12	2025-10-08	17:00:00	95.00	3	0	3	12
13	PNR013	2025-09-13	2025-10-10	08:00:00	50.00	1	0	1	13
14	PNR014	2025-09-14	2025-10-12	12:30:00	60.00	1	1	2	14
15	PNR015	2025-09-15	2025-10-15	14:00:00	85.00	2	0	3	15
16	PNR016	2025-09-16	2025-10-18	16:30:00	55.50	1	0	1	16
17	PNR017	2025-09-17	2025-10-20	09:45:00	45.00	1	0	2	17
18	PNR018	2025-09-18	2025-10-22	07:30:00	110.00	2	1	3	18
19	PNR019	2025-09-19	2025-10-25	15:00:00	95.00	3	0	1	19
20	PNR020	2025-09-20	2025-10-28	18:15:00	120.00	2	0	2	20
\.


--
-- TOC entry 3502 (class 0 OID 83897)
-- Dependencies: 210
-- Data for Name: provincia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.provincia (id_provincia, sigla, denominazione) FROM stdin;
1	RM	Roma
2	MI	Milano
3	NA	Napoli
4	TO	Torino
5	FI	Firenze
6	VE	Venezia
7	BO	Bologna
8	GE	Genova
9	PA	Palermo
10	CT	Catania
11	VR	Verona
12	PD	Padova
13	AN	Ancona
14	TR	Trieste
15	BS	Brescia
16	SA	Salerno
17	LE	Lecce
18	AR	Arezzo
19	LI	Livorno
20	PG	Perugia
\.


--
-- TOC entry 3512 (class 0 OID 83941)
-- Dependencies: 220
-- Data for Name: ruolo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ruolo (id_ruolo, denominazione, postazione) FROM stdin;
1	Macchinista	Locomotiva
2	CapoTreno	Carrozza 1
3	Controllore	Carrozza 2
4	AddettoBiglietteria	Stazione
5	PersonalePulizia	Treno
6	AddettoManutenzione	Deposito
7	ResponsabileTurno	Stazione Centrale
8	AssistenteViaggio	Treno
9	CapoStazione	Ufficio
10	AddettoSicurezza	Treno
11	TecnicoSegnalamento	Stazione
12	CoordinatoreTurni	Stazione Centrale
13	ImpiegatoUfficio	Stazione
14	AutistaShuttle	Treno Locale
15	PersonaleRistorazione	Treno
16	AddettoInformazioni	Stazione
17	AddettoBinari	Stazione
18	CapoPersonale	Stazione
19	AssistenteViaggioNotte	Treno Notte
20	AddettoEmergenze	Treno
\.


--
-- TOC entry 3518 (class 0 OID 83991)
-- Dependencies: 226
-- Data for Name: soggetto_giuridico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.soggetto_giuridico (id_passeggero, partita_iva, pec) FROM stdin;
1	12345678901	azienda1@pec.it
2	12345678902	azienda2@pec.it
3	12345678903	azienda3@pec.it
4	12345678904	azienda4@pec.it
5	12345678905	azienda5@pec.it
6	12345678906	azienda6@pec.it
7	12345678907	azienda7@pec.it
8	12345678908	azienda8@pec.it
9	12345678909	azienda9@pec.it
10	12345678910	azienda10@pec.it
11	12345678911	azienda11@pec.it
12	12345678912	azienda12@pec.it
13	12345678913	azienda13@pec.it
14	12345678914	azienda14@pec.it
15	12345678915	azienda15@pec.it
16	12345678916	azienda16@pec.it
17	12345678917	azienda17@pec.it
18	12345678918	azienda18@pec.it
19	12345678919	azienda19@pec.it
20	12345678920	azienda20@pec.it
\.


--
-- TOC entry 3510 (class 0 OID 83933)
-- Dependencies: 218
-- Data for Name: statoprenotazione; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.statoprenotazione (id_stato, stato) FROM stdin;
1	IN PAGAMENTO
2	PAGATA
3	SCADUTA
\.


--
-- TOC entry 3522 (class 0 OID 84025)
-- Dependencies: 230
-- Data for Name: stazione; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stazione (id_stazione, denominazione, numero_binari, capolinea, id_indirizzo) FROM stdin;
1	Roma Termini	20	t	1
2	Milano Centrale	24	t	3
3	Napoli Centrale	15	t	5
4	Torino Porta Nuova	18	t	7
5	Firenze Santa Maria Novella	12	t	9
6	Venezia Mestre	10	f	11
7	Bologna Centrale	14	t	13
8	Genova Piazza Principe	11	t	15
9	Palermo Centrale	9	t	17
10	Catania Centrale	8	t	19
11	Fiumicino Aeroporto	6	f	2
12	Monza	4	f	4
13	Pozzuoli	3	f	6
14	Alessandria	5	f	8
15	Prato Centrale	7	f	10
16	Mestre Centro	6	f	12
17	Modena	5	f	14
18	Savona	4	f	16
19	Monreale	3	f	18
20	Acireale	2	f	20
\.


--
-- TOC entry 3508 (class 0 OID 83925)
-- Dependencies: 216
-- Data for Name: tipoalimentazione; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipoalimentazione (id_alimentazione, tipo) FROM stdin;
1	ELETTRICO
2	DIESEL
3	IBRIDO
\.


--
-- TOC entry 3506 (class 0 OID 83916)
-- Dependencies: 214
-- Data for Name: tipologiatreno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipologiatreno (id_tipologia, descrizione) FROM stdin;
1	Frecciarossa
2	Frecciargento
3	Intercity
4	Regionale Veloce
5	Regionale
6	Alta Velocita
7	Eurostar
8	Notte
9	Cargo
10	Shuttle
11	Treno Turistico
12	Pendolino
13	Espresso
14	Intercity Notte
15	Metropolitano
16	Treno Locale
17	Rapido
18	Speciale
19	Storia
20	Treno Panoramico
\.


--
-- TOC entry 3526 (class 0 OID 84064)
-- Dependencies: 234
-- Data for Name: tratta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tratta (id_tratta, tipologia, data_inizio, data_fine, posti_disponibili, orario_partenza, orario_arrivo, id_stazione_partenza, id_stazione_arrivo) FROM stdin;
1	Regionale	2025-09-10	2025-12-31	100	08:30:00	10:30:00	1	2
2	Intercity	2025-09-12	2025-12-31	80	09:00:00	11:00:00	3	4
3	Frecciarossa	2025-09-15	2025-12-31	120	14:30:00	16:30:00	5	6
4	Regionale Veloce	2025-09-18	2025-12-31	60	07:15:00	09:15:00	7	8
5	Regionale	2025-09-20	2025-12-31	90	16:00:00	18:00:00	9	10
6	Intercity	2025-09-22	2025-12-31	100	12:00:00	14:00:00	11	12
7	Frecciarossa	2025-09-25	2025-12-31	110	10:30:00	12:30:00	1	3
8	Regionale	2025-09-28	2025-12-31	70	15:45:00	17:45:00	2	4
9	Regionale Veloce	2025-09-30	2025-12-31	85	11:00:00	13:00:00	5	7
10	Intercity	2025-10-02	2025-12-31	120	09:30:00	11:30:00	3	6
11	Frecciarossa	2025-10-05	2025-12-31	90	13:15:00	15:15:00	7	9
12	Regionale	2025-10-08	2025-12-31	60	17:00:00	19:00:00	1	4
13	Regionale Veloce	2025-10-10	2025-12-31	100	08:00:00	10:00:00	2	5
14	Intercity	2025-10-12	2025-12-31	80	12:30:00	14:30:00	3	6
15	Frecciarossa	2025-10-15	2025-12-31	110	14:00:00	16:00:00	4	7
16	Regionale	2025-10-18	2025-12-31	70	16:30:00	18:30:00	5	8
17	Intercity	2025-10-20	2025-12-31	90	09:45:00	11:45:00	6	9
18	Frecciarossa	2025-10-22	2025-12-31	120	07:30:00	09:30:00	7	10
19	Regionale Veloce	2025-10-25	2025-12-31	85	15:00:00	17:00:00	8	11
20	Regionale	2025-10-28	2025-12-31	100	18:15:00	20:15:00	9	12
\.


--
-- TOC entry 3527 (class 0 OID 84081)
-- Dependencies: 235
-- Data for Name: treno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.treno (matricola, tipologia, numero_carrozze, numero_posti, capienza, id_tipologia, id_alimentazione, anno_costruzione) FROM stdin;
T001	Frecciarossa	8	500	500	1	1	2015
T002	Intercity	6	400	400	3	2	2010
T003	Regionale	4	300	300	5	1	2012
T004	Regionale Veloce	5	350	350	4	3	2018
T005	Frecciarossa	10	600	600	1	1	2016
T006	Intercity	7	450	450	3	2	2011
T007	Regionale	4	280	280	5	1	2013
T008	Regionale Veloce	6	360	360	4	3	2019
T009	Frecciarossa	8	520	520	1	1	2017
T010	Intercity	7	430	430	3	2	2014
T011	Regionale	5	310	310	5	1	2010
T012	Regionale Veloce	6	340	340	4	3	2018
T013	Frecciarossa	9	580	580	1	1	2015
T014	Intercity	6	400	400	3	2	2012
T015	Regionale	4	300	300	5	1	2016
T016	Regionale Veloce	5	350	350	4	3	2019
T017	Frecciarossa	8	500	500	1	1	2013
T018	Intercity	7	450	450	3	2	2011
T019	Regionale	4	280	280	5	1	2017
T020	Regionale Veloce	6	360	360	4	3	2020
\.


--
-- TOC entry 3528 (class 0 OID 84099)
-- Dependencies: 236
-- Data for Name: viaggia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.viaggia (id_tratta, matricola_treno) FROM stdin;
1	T001
2	T002
3	T003
4	T004
5	T005
6	T006
7	T007
8	T008
9	T009
10	T010
11	T011
12	T012
13	T013
14	T014
15	T015
16	T016
17	T017
18	T018
19	T019
20	T020
\.


--
-- TOC entry 3548 (class 0 OID 0)
-- Dependencies: 231
-- Name: biglietto_id_biglietto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.biglietto_id_biglietto_seq', 20, true);


--
-- TOC entry 3549 (class 0 OID 0)
-- Dependencies: 211
-- Name: comune_id_comune_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comune_id_comune_seq', 20, true);


--
-- TOC entry 3550 (class 0 OID 0)
-- Dependencies: 221
-- Name: indirizzo_id_indirizzo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.indirizzo_id_indirizzo_seq', 20, true);


--
-- TOC entry 3551 (class 0 OID 0)
-- Dependencies: 223
-- Name: passeggero_id_passeggero_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.passeggero_id_passeggero_seq', 20, true);


--
-- TOC entry 3552 (class 0 OID 0)
-- Dependencies: 227
-- Name: prenotazione_id_prenotazione_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prenotazione_id_prenotazione_seq', 20, true);


--
-- TOC entry 3553 (class 0 OID 0)
-- Dependencies: 209
-- Name: provincia_id_provincia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.provincia_id_provincia_seq', 20, true);


--
-- TOC entry 3554 (class 0 OID 0)
-- Dependencies: 219
-- Name: ruolo_id_ruolo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ruolo_id_ruolo_seq', 20, true);


--
-- TOC entry 3555 (class 0 OID 0)
-- Dependencies: 217
-- Name: statoprenotazione_id_stato_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.statoprenotazione_id_stato_seq', 3, true);


--
-- TOC entry 3556 (class 0 OID 0)
-- Dependencies: 229
-- Name: stazione_id_stazione_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stazione_id_stazione_seq', 20, true);


--
-- TOC entry 3557 (class 0 OID 0)
-- Dependencies: 215
-- Name: tipoalimentazione_id_alimentazione_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipoalimentazione_id_alimentazione_seq', 3, true);


--
-- TOC entry 3558 (class 0 OID 0)
-- Dependencies: 213
-- Name: tipologiatreno_id_tipologia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipologiatreno_id_tipologia_seq', 20, true);


--
-- TOC entry 3559 (class 0 OID 0)
-- Dependencies: 233
-- Name: tratta_id_tratta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tratta_id_tratta_seq', 20, true);


--
-- TOC entry 3323 (class 2606 OID 84047)
-- Name: biglietto biglietto_numero_biglietto_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biglietto
    ADD CONSTRAINT biglietto_numero_biglietto_key UNIQUE (numero_biglietto);


--
-- TOC entry 3325 (class 2606 OID 84045)
-- Name: biglietto biglietto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biglietto
    ADD CONSTRAINT biglietto_pkey PRIMARY KEY (id_biglietto);


--
-- TOC entry 3291 (class 2606 OID 83909)
-- Name: comune comune_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comune
    ADD CONSTRAINT comune_pkey PRIMARY KEY (id_comune);


--
-- TOC entry 3333 (class 2606 OID 84119)
-- Name: dipendente dipendente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dipendente
    ADD CONSTRAINT dipendente_pkey PRIMARY KEY (matricola);


--
-- TOC entry 3305 (class 2606 OID 83955)
-- Name: indirizzo indirizzo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indirizzo
    ADD CONSTRAINT indirizzo_pkey PRIMARY KEY (id_indirizzo);


--
-- TOC entry 3335 (class 2606 OID 84129)
-- Name: lavora lavora_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lavora
    ADD CONSTRAINT lavora_pkey PRIMARY KEY (matricola, id_tratta);


--
-- TOC entry 3307 (class 2606 OID 83973)
-- Name: passeggero passeggero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passeggero
    ADD CONSTRAINT passeggero_pkey PRIMARY KEY (id_passeggero);


--
-- TOC entry 3309 (class 2606 OID 83985)
-- Name: persona_fisica persona_fisica_codice_fiscale_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona_fisica
    ADD CONSTRAINT persona_fisica_codice_fiscale_key UNIQUE (codice_fiscale);


--
-- TOC entry 3311 (class 2606 OID 83983)
-- Name: persona_fisica persona_fisica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona_fisica
    ADD CONSTRAINT persona_fisica_pkey PRIMARY KEY (id_passeggero);


--
-- TOC entry 3317 (class 2606 OID 84013)
-- Name: prenotazione prenotazione_numero_prenotazione_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prenotazione
    ADD CONSTRAINT prenotazione_numero_prenotazione_key UNIQUE (numero_prenotazione);


--
-- TOC entry 3319 (class 2606 OID 84011)
-- Name: prenotazione prenotazione_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prenotazione
    ADD CONSTRAINT prenotazione_pkey PRIMARY KEY (id_prenotazione);


--
-- TOC entry 3289 (class 2606 OID 83902)
-- Name: provincia provincia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provincia
    ADD CONSTRAINT provincia_pkey PRIMARY KEY (id_provincia);


--
-- TOC entry 3301 (class 2606 OID 83948)
-- Name: ruolo ruolo_denominazione_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruolo
    ADD CONSTRAINT ruolo_denominazione_key UNIQUE (denominazione);


--
-- TOC entry 3303 (class 2606 OID 83946)
-- Name: ruolo ruolo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruolo
    ADD CONSTRAINT ruolo_pkey PRIMARY KEY (id_ruolo);


--
-- TOC entry 3313 (class 2606 OID 83997)
-- Name: soggetto_giuridico soggetto_giuridico_partita_iva_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.soggetto_giuridico
    ADD CONSTRAINT soggetto_giuridico_partita_iva_key UNIQUE (partita_iva);


--
-- TOC entry 3315 (class 2606 OID 83995)
-- Name: soggetto_giuridico soggetto_giuridico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.soggetto_giuridico
    ADD CONSTRAINT soggetto_giuridico_pkey PRIMARY KEY (id_passeggero);


--
-- TOC entry 3299 (class 2606 OID 83939)
-- Name: statoprenotazione statoprenotazione_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statoprenotazione
    ADD CONSTRAINT statoprenotazione_pkey PRIMARY KEY (id_stato);


--
-- TOC entry 3321 (class 2606 OID 84032)
-- Name: stazione stazione_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stazione
    ADD CONSTRAINT stazione_pkey PRIMARY KEY (id_stazione);


--
-- TOC entry 3297 (class 2606 OID 83931)
-- Name: tipoalimentazione tipoalimentazione_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipoalimentazione
    ADD CONSTRAINT tipoalimentazione_pkey PRIMARY KEY (id_alimentazione);


--
-- TOC entry 3293 (class 2606 OID 83923)
-- Name: tipologiatreno tipologiatreno_descrizione_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipologiatreno
    ADD CONSTRAINT tipologiatreno_descrizione_key UNIQUE (descrizione);


--
-- TOC entry 3295 (class 2606 OID 83921)
-- Name: tipologiatreno tipologiatreno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipologiatreno
    ADD CONSTRAINT tipologiatreno_pkey PRIMARY KEY (id_tipologia);


--
-- TOC entry 3327 (class 2606 OID 84070)
-- Name: tratta tratta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratta
    ADD CONSTRAINT tratta_pkey PRIMARY KEY (id_tratta);


--
-- TOC entry 3329 (class 2606 OID 84088)
-- Name: treno treno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treno
    ADD CONSTRAINT treno_pkey PRIMARY KEY (matricola);


--
-- TOC entry 3331 (class 2606 OID 84103)
-- Name: viaggia viaggia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viaggia
    ADD CONSTRAINT viaggia_pkey PRIMARY KEY (id_tratta, matricola_treno);


--
-- TOC entry 3345 (class 2606 OID 84048)
-- Name: biglietto biglietto_id_prenotazione_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biglietto
    ADD CONSTRAINT biglietto_id_prenotazione_fkey FOREIGN KEY (id_prenotazione) REFERENCES public.prenotazione(id_prenotazione) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3347 (class 2606 OID 84058)
-- Name: biglietto biglietto_stazione_arrivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biglietto
    ADD CONSTRAINT biglietto_stazione_arrivo_fkey FOREIGN KEY (stazione_arrivo) REFERENCES public.stazione(id_stazione) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3346 (class 2606 OID 84053)
-- Name: biglietto biglietto_stazione_partenza_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biglietto
    ADD CONSTRAINT biglietto_stazione_partenza_fkey FOREIGN KEY (stazione_partenza) REFERENCES public.stazione(id_stazione) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3336 (class 2606 OID 83910)
-- Name: comune comune_provincia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comune
    ADD CONSTRAINT comune_provincia_fkey FOREIGN KEY (provincia) REFERENCES public.provincia(id_provincia);


--
-- TOC entry 3354 (class 2606 OID 84120)
-- Name: dipendente dipendente_ruolo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dipendente
    ADD CONSTRAINT dipendente_ruolo_fkey FOREIGN KEY (ruolo) REFERENCES public.ruolo(id_ruolo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3338 (class 2606 OID 83961)
-- Name: indirizzo indirizzo_id_comune_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indirizzo
    ADD CONSTRAINT indirizzo_id_comune_fkey FOREIGN KEY (id_comune) REFERENCES public.comune(id_comune);


--
-- TOC entry 3337 (class 2606 OID 83956)
-- Name: indirizzo indirizzo_id_provincia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indirizzo
    ADD CONSTRAINT indirizzo_id_provincia_fkey FOREIGN KEY (id_provincia) REFERENCES public.provincia(id_provincia);


--
-- TOC entry 3356 (class 2606 OID 84135)
-- Name: lavora lavora_id_tratta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lavora
    ADD CONSTRAINT lavora_id_tratta_fkey FOREIGN KEY (id_tratta) REFERENCES public.tratta(id_tratta) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3355 (class 2606 OID 84130)
-- Name: lavora lavora_matricola_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lavora
    ADD CONSTRAINT lavora_matricola_fkey FOREIGN KEY (matricola) REFERENCES public.dipendente(matricola) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3339 (class 2606 OID 83974)
-- Name: passeggero passeggero_id_indirizzo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passeggero
    ADD CONSTRAINT passeggero_id_indirizzo_fkey FOREIGN KEY (id_indirizzo) REFERENCES public.indirizzo(id_indirizzo) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3340 (class 2606 OID 83986)
-- Name: persona_fisica persona_fisica_id_passeggero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona_fisica
    ADD CONSTRAINT persona_fisica_id_passeggero_fkey FOREIGN KEY (id_passeggero) REFERENCES public.passeggero(id_passeggero) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3343 (class 2606 OID 84019)
-- Name: prenotazione prenotazione_id_passeggero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prenotazione
    ADD CONSTRAINT prenotazione_id_passeggero_fkey FOREIGN KEY (id_passeggero) REFERENCES public.passeggero(id_passeggero) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3342 (class 2606 OID 84014)
-- Name: prenotazione prenotazione_stato_prenotazione_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prenotazione
    ADD CONSTRAINT prenotazione_stato_prenotazione_fkey FOREIGN KEY (stato_prenotazione) REFERENCES public.statoprenotazione(id_stato);


--
-- TOC entry 3341 (class 2606 OID 83998)
-- Name: soggetto_giuridico soggetto_giuridico_id_passeggero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.soggetto_giuridico
    ADD CONSTRAINT soggetto_giuridico_id_passeggero_fkey FOREIGN KEY (id_passeggero) REFERENCES public.passeggero(id_passeggero) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3344 (class 2606 OID 84033)
-- Name: stazione stazione_id_indirizzo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stazione
    ADD CONSTRAINT stazione_id_indirizzo_fkey FOREIGN KEY (id_indirizzo) REFERENCES public.indirizzo(id_indirizzo) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3349 (class 2606 OID 84076)
-- Name: tratta tratta_id_stazione_arrivo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratta
    ADD CONSTRAINT tratta_id_stazione_arrivo_fkey FOREIGN KEY (id_stazione_arrivo) REFERENCES public.stazione(id_stazione) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3348 (class 2606 OID 84071)
-- Name: tratta tratta_id_stazione_partenza_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratta
    ADD CONSTRAINT tratta_id_stazione_partenza_fkey FOREIGN KEY (id_stazione_partenza) REFERENCES public.stazione(id_stazione) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3351 (class 2606 OID 84094)
-- Name: treno treno_id_alimentazione_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treno
    ADD CONSTRAINT treno_id_alimentazione_fkey FOREIGN KEY (id_alimentazione) REFERENCES public.tipoalimentazione(id_alimentazione);


--
-- TOC entry 3350 (class 2606 OID 84089)
-- Name: treno treno_id_tipologia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treno
    ADD CONSTRAINT treno_id_tipologia_fkey FOREIGN KEY (id_tipologia) REFERENCES public.tipologiatreno(id_tipologia);


--
-- TOC entry 3352 (class 2606 OID 84104)
-- Name: viaggia viaggia_id_tratta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viaggia
    ADD CONSTRAINT viaggia_id_tratta_fkey FOREIGN KEY (id_tratta) REFERENCES public.tratta(id_tratta) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3353 (class 2606 OID 84109)
-- Name: viaggia viaggia_matricola_treno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viaggia
    ADD CONSTRAINT viaggia_matricola_treno_fkey FOREIGN KEY (matricola_treno) REFERENCES public.treno(matricola) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2025-10-09 00:17:01

--
-- PostgreSQL database dump complete
--

