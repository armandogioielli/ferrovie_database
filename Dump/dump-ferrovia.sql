--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

-- Started on 2025-10-12 19:22:56

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
-- TOC entry 246 (class 1259 OID 86424)
-- Name: biglietto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.biglietto (
    codice integer NOT NULL,
    numero_carrozza integer,
    fila character varying(5),
    lettera_posto character(1),
    classe character varying(10),
    prezzo numeric(10,2),
    token character varying(255),
    data_validita date,
    data_validazione date,
    validato boolean DEFAULT false,
    prenotazione_id integer,
    stazione_partenza_id integer,
    stazione_arrivo_id integer
);


ALTER TABLE public.biglietto OWNER TO postgres;

--
-- TOC entry 3589 (class 0 OID 0)
-- Dependencies: 246
-- Name: TABLE biglietto; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.biglietto IS 'Biglietto generato a seguito di una prenotazione.';


--
-- TOC entry 245 (class 1259 OID 86423)
-- Name: biglietto_codice_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.biglietto_codice_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.biglietto_codice_seq OWNER TO postgres;

--
-- TOC entry 3591 (class 0 OID 0)
-- Dependencies: 245
-- Name: biglietto_codice_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.biglietto_codice_seq OWNED BY public.biglietto.codice;


--
-- TOC entry 212 (class 1259 OID 86174)
-- Name: comune; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comune (
    id integer NOT NULL,
    denominazione character varying(100),
    cap character varying(10)
);


ALTER TABLE public.comune OWNER TO postgres;

--
-- TOC entry 3592 (class 0 OID 0)
-- Dependencies: 212
-- Name: TABLE comune; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.comune IS 'Contiene informazioni geografiche e di localizzazione del Comune.';


--
-- TOC entry 3593 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN comune.denominazione; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comune.denominazione IS 'Nome del Comune.';


--
-- TOC entry 3594 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN comune.cap; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.comune.cap IS 'Cap del comune';


--
-- TOC entry 211 (class 1259 OID 86173)
-- Name: comune_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comune_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comune_id_seq OWNER TO postgres;

--
-- TOC entry 3596 (class 0 OID 0)
-- Dependencies: 211
-- Name: comune_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comune_id_seq OWNED BY public.comune.id;


--
-- TOC entry 243 (class 1259 OID 86397)
-- Name: dipendente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dipendente (
    matricola integer NOT NULL,
    nome character varying(50) NOT NULL,
    cognome character varying(50) NOT NULL,
    sesso character(1),
    data_nascita date,
    data_assunzione date,
    ruolo integer
);


ALTER TABLE public.dipendente OWNER TO postgres;

--
-- TOC entry 3597 (class 0 OID 0)
-- Dependencies: 243
-- Name: TABLE dipendente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dipendente IS 'Contiene i dati anagrafici dei dipendenti.';


--
-- TOC entry 242 (class 1259 OID 86396)
-- Name: dipendente_matricola_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dipendente_matricola_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dipendente_matricola_seq OWNER TO postgres;

--
-- TOC entry 3599 (class 0 OID 0)
-- Dependencies: 242
-- Name: dipendente_matricola_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dipendente_matricola_seq OWNED BY public.dipendente.matricola;


--
-- TOC entry 238 (class 1259 OID 86356)
-- Name: fermata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fermata (
    id integer NOT NULL,
    codice_tratta integer,
    codice_stazione integer
);


ALTER TABLE public.fermata OWNER TO postgres;

--
-- TOC entry 3600 (class 0 OID 0)
-- Dependencies: 238
-- Name: TABLE fermata; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.fermata IS 'Rappresenta le fermate intermedie di una tratta.';


--
-- TOC entry 237 (class 1259 OID 86355)
-- Name: fermata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fermata_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fermata_id_seq OWNER TO postgres;

--
-- TOC entry 3602 (class 0 OID 0)
-- Dependencies: 237
-- Name: fermata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fermata_id_seq OWNED BY public.fermata.id;


--
-- TOC entry 222 (class 1259 OID 86215)
-- Name: indirizzo_passeggero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.indirizzo_passeggero (
    id integer NOT NULL,
    via character varying(100),
    civico character varying(10),
    citta character varying(50),
    id_comune integer,
    id_provincia integer
);


ALTER TABLE public.indirizzo_passeggero OWNER TO postgres;

--
-- TOC entry 3603 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE indirizzo_passeggero; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.indirizzo_passeggero IS 'Contiene informazioni geografiche e di localizzazione del passeggero.';


--
-- TOC entry 3604 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN indirizzo_passeggero.via; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.indirizzo_passeggero.via IS 'Nome della via.';


--
-- TOC entry 3605 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN indirizzo_passeggero.civico; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.indirizzo_passeggero.civico IS 'Numero civico.';


--
-- TOC entry 3606 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN indirizzo_passeggero.citta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.indirizzo_passeggero.citta IS 'Denominazione della citta.';


--
-- TOC entry 221 (class 1259 OID 86214)
-- Name: indirizzo_passeggero_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.indirizzo_passeggero_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indirizzo_passeggero_id_seq OWNER TO postgres;

--
-- TOC entry 3608 (class 0 OID 0)
-- Dependencies: 221
-- Name: indirizzo_passeggero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.indirizzo_passeggero_id_seq OWNED BY public.indirizzo_passeggero.id;


--
-- TOC entry 224 (class 1259 OID 86232)
-- Name: indirizzo_stazione; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.indirizzo_stazione (
    id integer NOT NULL,
    via character varying(100),
    civico character varying(10),
    citta character varying(50),
    longitudine numeric(9,6),
    latitudine numeric(9,6),
    id_comune integer,
    id_provincia integer
);


ALTER TABLE public.indirizzo_stazione OWNER TO postgres;

--
-- TOC entry 3609 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE indirizzo_stazione; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.indirizzo_stazione IS 'Contiene informazioni geografiche e di localizzazione della stazione.';


--
-- TOC entry 3610 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN indirizzo_stazione.via; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.indirizzo_stazione.via IS 'Nome della via.';


--
-- TOC entry 3611 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN indirizzo_stazione.civico; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.indirizzo_stazione.civico IS 'Numero civico.';


--
-- TOC entry 3612 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN indirizzo_stazione.citta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.indirizzo_stazione.citta IS 'Denominazione della citta.';


--
-- TOC entry 3613 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN indirizzo_stazione.longitudine; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.indirizzo_stazione.longitudine IS 'Longitudine';


--
-- TOC entry 3614 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN indirizzo_stazione.latitudine; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.indirizzo_stazione.latitudine IS 'Latitudine';


--
-- TOC entry 223 (class 1259 OID 86231)
-- Name: indirizzo_stazione_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.indirizzo_stazione_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.indirizzo_stazione_id_seq OWNER TO postgres;

--
-- TOC entry 3616 (class 0 OID 0)
-- Dependencies: 223
-- Name: indirizzo_stazione_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.indirizzo_stazione_id_seq OWNED BY public.indirizzo_stazione.id;


--
-- TOC entry 244 (class 1259 OID 86408)
-- Name: lavora; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lavora (
    dipendente_id integer NOT NULL,
    tratta_id integer NOT NULL,
    data_inizio date,
    data_fine date
);


ALTER TABLE public.lavora OWNER TO postgres;

--
-- TOC entry 3617 (class 0 OID 0)
-- Dependencies: 244
-- Name: TABLE lavora; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.lavora IS 'Relazione N:N tra dipendenti e tratte.';


--
-- TOC entry 226 (class 1259 OID 86249)
-- Name: passeggero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passeggero (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    cognome character varying(50) NOT NULL,
    sesso character(1),
    data_nascita date,
    email character varying(100),
    telefono character varying(20),
    indirizzo_id integer
);


ALTER TABLE public.passeggero OWNER TO postgres;

--
-- TOC entry 3619 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE passeggero; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.passeggero IS 'Contiene i dati anagrafici e di contatto dei passeggeri.';


--
-- TOC entry 225 (class 1259 OID 86248)
-- Name: passeggero_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.passeggero_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.passeggero_id_seq OWNER TO postgres;

--
-- TOC entry 3621 (class 0 OID 0)
-- Dependencies: 225
-- Name: passeggero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.passeggero_id_seq OWNED BY public.passeggero.id;


--
-- TOC entry 227 (class 1259 OID 86261)
-- Name: persona_fisica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persona_fisica (
    passeggero_id integer NOT NULL,
    codice_fiscale character varying(16) NOT NULL
);


ALTER TABLE public.persona_fisica OWNER TO postgres;

--
-- TOC entry 3622 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE persona_fisica; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.persona_fisica IS 'Estensione di passeggero per persone fisiche.';


--
-- TOC entry 232 (class 1259 OID 86299)
-- Name: prenotazione; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prenotazione (
    numero_prenotazione integer NOT NULL,
    data_prenotazione date NOT NULL,
    data_partenza date,
    ora_partenza time without time zone,
    numero_passaggeri integer,
    numero_cambi integer,
    stato_prenotazione integer,
    importo numeric(10,2),
    passeggero_id integer
);


ALTER TABLE public.prenotazione OWNER TO postgres;

--
-- TOC entry 3624 (class 0 OID 0)
-- Dependencies: 232
-- Name: TABLE prenotazione; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.prenotazione IS 'Rappresenta la prenotazione effettuata da un passeggero.';


--
-- TOC entry 231 (class 1259 OID 86298)
-- Name: prenotazione_numero_prenotazione_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.prenotazione_numero_prenotazione_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.prenotazione_numero_prenotazione_seq OWNER TO postgres;

--
-- TOC entry 3626 (class 0 OID 0)
-- Dependencies: 231
-- Name: prenotazione_numero_prenotazione_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.prenotazione_numero_prenotazione_seq OWNED BY public.prenotazione.numero_prenotazione;


--
-- TOC entry 210 (class 1259 OID 86167)
-- Name: provincia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provincia (
    id integer NOT NULL,
    denominazione character varying(100)
);


ALTER TABLE public.provincia OWNER TO postgres;

--
-- TOC entry 3627 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE provincia; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.provincia IS 'Contiene informazioni geografiche e di localizzazione della Provincia.';


--
-- TOC entry 3628 (class 0 OID 0)
-- Dependencies: 210
-- Name: COLUMN provincia.denominazione; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.provincia.denominazione IS 'Nome della Provincia.';


--
-- TOC entry 209 (class 1259 OID 86166)
-- Name: provincia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.provincia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.provincia_id_seq OWNER TO postgres;

--
-- TOC entry 3630 (class 0 OID 0)
-- Dependencies: 209
-- Name: provincia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.provincia_id_seq OWNED BY public.provincia.id;


--
-- TOC entry 220 (class 1259 OID 86206)
-- Name: ruolo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ruolo (
    id_ruolo integer NOT NULL,
    denominazione character varying(50) NOT NULL,
    ufficio_riferimento character varying(50)
);


ALTER TABLE public.ruolo OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 86205)
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
-- TOC entry 3632 (class 0 OID 0)
-- Dependencies: 219
-- Name: ruolo_id_ruolo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ruolo_id_ruolo_seq OWNED BY public.ruolo.id_ruolo;


--
-- TOC entry 228 (class 1259 OID 86273)
-- Name: soggetto_giuridico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.soggetto_giuridico (
    passeggero_id integer NOT NULL,
    partita_iva character varying(20) NOT NULL,
    pec character varying(100)
);


ALTER TABLE public.soggetto_giuridico OWNER TO postgres;

--
-- TOC entry 3633 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE soggetto_giuridico; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.soggetto_giuridico IS 'Estensione di passeggero per soggetti giuridici.';


--
-- TOC entry 218 (class 1259 OID 86198)
-- Name: statoprenotazione; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statoprenotazione (
    id_stato integer NOT NULL,
    stato character varying(20) NOT NULL,
    CONSTRAINT statoprenotazione_stato_check CHECK (((stato)::text = ANY ((ARRAY['IN PAGAMENTO'::character varying, 'PAGATA'::character varying, 'SCADUTA'::character varying])::text[])))
);


ALTER TABLE public.statoprenotazione OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 86197)
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
-- TOC entry 3636 (class 0 OID 0)
-- Dependencies: 217
-- Name: statoprenotazione_id_stato_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.statoprenotazione_id_stato_seq OWNED BY public.statoprenotazione.id_stato;


--
-- TOC entry 230 (class 1259 OID 86286)
-- Name: stazione; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stazione (
    codice_stazione integer NOT NULL,
    denominazione character varying(100) NOT NULL,
    numero_binari integer,
    capolinea boolean DEFAULT false,
    indirizzo_id integer
);


ALTER TABLE public.stazione OWNER TO postgres;

--
-- TOC entry 3637 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE stazione; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.stazione IS 'Contiene le informazioni delle stazioni ferroviarie.';


--
-- TOC entry 229 (class 1259 OID 86285)
-- Name: stazione_codice_stazione_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stazione_codice_stazione_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stazione_codice_stazione_seq OWNER TO postgres;

--
-- TOC entry 3639 (class 0 OID 0)
-- Dependencies: 229
-- Name: stazione_codice_stazione_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stazione_codice_stazione_seq OWNED BY public.stazione.codice_stazione;


--
-- TOC entry 240 (class 1259 OID 86375)
-- Name: tariffa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tariffa (
    id integer NOT NULL,
    importo numeric(10,2),
    data_inizio_periodo date,
    data_fine_periodo date
);


ALTER TABLE public.tariffa OWNER TO postgres;

--
-- TOC entry 3640 (class 0 OID 0)
-- Dependencies: 240
-- Name: TABLE tariffa; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tariffa IS 'Contiene le tariffe applicate alle tratte ferroviarie.';


--
-- TOC entry 239 (class 1259 OID 86374)
-- Name: tariffa_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tariffa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tariffa_id_seq OWNER TO postgres;

--
-- TOC entry 3642 (class 0 OID 0)
-- Dependencies: 239
-- Name: tariffa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tariffa_id_seq OWNED BY public.tariffa.id;


--
-- TOC entry 216 (class 1259 OID 86190)
-- Name: tipoalimentazione; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipoalimentazione (
    id_alimentazione integer NOT NULL,
    tipo character varying(20) NOT NULL,
    CONSTRAINT tipoalimentazione_tipo_check CHECK (((tipo)::text = ANY ((ARRAY['ELETTRICO'::character varying, 'DIESEL'::character varying, 'IBRIDO'::character varying])::text[])))
);


ALTER TABLE public.tipoalimentazione OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 86189)
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
-- TOC entry 3644 (class 0 OID 0)
-- Dependencies: 215
-- Name: tipoalimentazione_id_alimentazione_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipoalimentazione_id_alimentazione_seq OWNED BY public.tipoalimentazione.id_alimentazione;


--
-- TOC entry 214 (class 1259 OID 86181)
-- Name: tipologiatreno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipologiatreno (
    id_tipologia integer NOT NULL,
    descrizione character varying(50) NOT NULL
);


ALTER TABLE public.tipologiatreno OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 86180)
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
-- TOC entry 3646 (class 0 OID 0)
-- Dependencies: 213
-- Name: tipologiatreno_id_tipologia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipologiatreno_id_tipologia_seq OWNED BY public.tipologiatreno.id_tipologia;


--
-- TOC entry 236 (class 1259 OID 86334)
-- Name: tratta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tratta (
    codice_tratta integer NOT NULL,
    data_inizio date,
    data_fine date,
    tipologia character varying(30),
    orario_partenza time without time zone,
    orario_arrivo time without time zone,
    posti_disponibili integer,
    stazione_partenza_id integer,
    stazione_arrivo_id integer,
    treno_id integer
);


ALTER TABLE public.tratta OWNER TO postgres;

--
-- TOC entry 3647 (class 0 OID 0)
-- Dependencies: 236
-- Name: TABLE tratta; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tratta IS 'Definisce una tratta ferroviaria tra due stazioni.';


--
-- TOC entry 235 (class 1259 OID 86333)
-- Name: tratta_codice_tratta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tratta_codice_tratta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tratta_codice_tratta_seq OWNER TO postgres;

--
-- TOC entry 3649 (class 0 OID 0)
-- Dependencies: 235
-- Name: tratta_codice_tratta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tratta_codice_tratta_seq OWNED BY public.tratta.codice_tratta;


--
-- TOC entry 241 (class 1259 OID 86381)
-- Name: tratta_tariffa; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tratta_tariffa (
    tratta_id integer NOT NULL,
    tariffa_id integer NOT NULL
);


ALTER TABLE public.tratta_tariffa OWNER TO postgres;

--
-- TOC entry 3650 (class 0 OID 0)
-- Dependencies: 241
-- Name: TABLE tratta_tariffa; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tratta_tariffa IS 'Associazione N:N tra tratte e tariffe.';


--
-- TOC entry 234 (class 1259 OID 86317)
-- Name: treno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.treno (
    matricola integer NOT NULL,
    tipologia integer,
    numero_carrozze integer,
    numero_posti integer,
    anno_costruzione integer,
    alimentazione integer
);


ALTER TABLE public.treno OWNER TO postgres;

--
-- TOC entry 3652 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE treno; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.treno IS 'Contiene le informazioni dei treni disponibili.';


--
-- TOC entry 233 (class 1259 OID 86316)
-- Name: treno_matricola_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.treno_matricola_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.treno_matricola_seq OWNER TO postgres;

--
-- TOC entry 3654 (class 0 OID 0)
-- Dependencies: 233
-- Name: treno_matricola_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.treno_matricola_seq OWNED BY public.treno.matricola;


--
-- TOC entry 248 (class 1259 OID 86473)
-- Name: vw_biglietti_dettaglio; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_biglietti_dettaglio AS
 SELECT b.codice AS codice_biglietto,
    b.numero_carrozza,
    b.fila,
    b.lettera_posto,
    b.classe,
    b.prezzo,
    b.data_validita,
    b.data_validazione,
    b.validato,
    sp.denominazione AS stazione_partenza,
    sa.denominazione AS stazione_arrivo,
    pr.numero_prenotazione,
    pr.data_partenza,
    pr.ora_partenza,
    pas.nome,
    pas.cognome
   FROM ((((public.biglietto b
     JOIN public.prenotazione pr ON ((b.prenotazione_id = pr.numero_prenotazione)))
     JOIN public.passeggero pas ON ((pr.passeggero_id = pas.id)))
     JOIN public.stazione sp ON ((b.stazione_partenza_id = sp.codice_stazione)))
     JOIN public.stazione sa ON ((b.stazione_arrivo_id = sa.codice_stazione)));


ALTER TABLE public.vw_biglietti_dettaglio OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 86478)
-- Name: vw_passeggeri_dettaglio; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_passeggeri_dettaglio AS
 SELECT p.id AS passeggero_id,
    p.nome,
    p.cognome,
    p.email,
    p.telefono,
    i.via,
    i.civico,
    i.citta,
    c.denominazione AS comune,
    pr.denominazione AS provincia
   FROM (((public.passeggero p
     LEFT JOIN public.indirizzo_passeggero i ON ((p.indirizzo_id = i.id)))
     LEFT JOIN public.comune c ON ((i.id_comune = c.id)))
     LEFT JOIN public.provincia pr ON ((i.id_provincia = pr.id)));


ALTER TABLE public.vw_passeggeri_dettaglio OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 86468)
-- Name: vw_prenotazioni_dettaglio; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_prenotazioni_dettaglio AS
 SELECT p.numero_prenotazione,
    p.data_prenotazione,
    p.data_partenza,
    p.ora_partenza,
    p.importo,
    sp.stato AS stato_prenotazione,
    pas.nome,
    pas.cognome,
    pas.email,
    pas.telefono
   FROM ((public.prenotazione p
     JOIN public.statoprenotazione sp ON ((p.stato_prenotazione = sp.id_stato)))
     JOIN public.passeggero pas ON ((p.passeggero_id = pas.id)));


ALTER TABLE public.vw_prenotazioni_dettaglio OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 86483)
-- Name: vw_tratte_dettaglio; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_tratte_dettaglio AS
 SELECT t.codice_tratta,
    sp.denominazione AS stazione_partenza,
    sa.denominazione AS stazione_arrivo,
    t.orario_partenza,
    t.orario_arrivo,
    tr.matricola AS treno_id,
    tt.descrizione AS tipologia_treno,
    tr.numero_posti,
    tr.numero_carrozze
   FROM ((((public.tratta t
     JOIN public.stazione sp ON ((t.stazione_partenza_id = sp.codice_stazione)))
     JOIN public.stazione sa ON ((t.stazione_arrivo_id = sa.codice_stazione)))
     JOIN public.treno tr ON ((t.treno_id = tr.matricola)))
     JOIN public.tipologiatreno tt ON ((tr.tipologia = tt.id_tipologia)));


ALTER TABLE public.vw_tratte_dettaglio OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 86488)
-- Name: vw_tratte_tariffe; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_tratte_tariffe AS
 SELECT t.codice_tratta,
    sp.denominazione AS stazione_partenza,
    sa.denominazione AS stazione_arrivo,
    ta.importo,
    ta.data_inizio_periodo,
    ta.data_fine_periodo
   FROM ((((public.tratta_tariffa tt
     JOIN public.tratta t ON ((tt.tratta_id = t.codice_tratta)))
     JOIN public.tariffa ta ON ((tt.tariffa_id = ta.id)))
     JOIN public.stazione sp ON ((t.stazione_partenza_id = sp.codice_stazione)))
     JOIN public.stazione sa ON ((t.stazione_arrivo_id = sa.codice_stazione)));


ALTER TABLE public.vw_tratte_tariffe OWNER TO postgres;

--
-- TOC entry 3299 (class 2604 OID 86427)
-- Name: biglietto codice; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biglietto ALTER COLUMN codice SET DEFAULT nextval('public.biglietto_codice_seq'::regclass);


--
-- TOC entry 3281 (class 2604 OID 86177)
-- Name: comune id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comune ALTER COLUMN id SET DEFAULT nextval('public.comune_id_seq'::regclass);


--
-- TOC entry 3298 (class 2604 OID 86400)
-- Name: dipendente matricola; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dipendente ALTER COLUMN matricola SET DEFAULT nextval('public.dipendente_matricola_seq'::regclass);


--
-- TOC entry 3296 (class 2604 OID 86359)
-- Name: fermata id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fermata ALTER COLUMN id SET DEFAULT nextval('public.fermata_id_seq'::regclass);


--
-- TOC entry 3288 (class 2604 OID 86218)
-- Name: indirizzo_passeggero id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indirizzo_passeggero ALTER COLUMN id SET DEFAULT nextval('public.indirizzo_passeggero_id_seq'::regclass);


--
-- TOC entry 3289 (class 2604 OID 86235)
-- Name: indirizzo_stazione id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indirizzo_stazione ALTER COLUMN id SET DEFAULT nextval('public.indirizzo_stazione_id_seq'::regclass);


--
-- TOC entry 3290 (class 2604 OID 86252)
-- Name: passeggero id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passeggero ALTER COLUMN id SET DEFAULT nextval('public.passeggero_id_seq'::regclass);


--
-- TOC entry 3293 (class 2604 OID 86302)
-- Name: prenotazione numero_prenotazione; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prenotazione ALTER COLUMN numero_prenotazione SET DEFAULT nextval('public.prenotazione_numero_prenotazione_seq'::regclass);


--
-- TOC entry 3280 (class 2604 OID 86170)
-- Name: provincia id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provincia ALTER COLUMN id SET DEFAULT nextval('public.provincia_id_seq'::regclass);


--
-- TOC entry 3287 (class 2604 OID 86209)
-- Name: ruolo id_ruolo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruolo ALTER COLUMN id_ruolo SET DEFAULT nextval('public.ruolo_id_ruolo_seq'::regclass);


--
-- TOC entry 3285 (class 2604 OID 86201)
-- Name: statoprenotazione id_stato; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statoprenotazione ALTER COLUMN id_stato SET DEFAULT nextval('public.statoprenotazione_id_stato_seq'::regclass);


--
-- TOC entry 3291 (class 2604 OID 86289)
-- Name: stazione codice_stazione; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stazione ALTER COLUMN codice_stazione SET DEFAULT nextval('public.stazione_codice_stazione_seq'::regclass);


--
-- TOC entry 3297 (class 2604 OID 86378)
-- Name: tariffa id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tariffa ALTER COLUMN id SET DEFAULT nextval('public.tariffa_id_seq'::regclass);


--
-- TOC entry 3283 (class 2604 OID 86193)
-- Name: tipoalimentazione id_alimentazione; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipoalimentazione ALTER COLUMN id_alimentazione SET DEFAULT nextval('public.tipoalimentazione_id_alimentazione_seq'::regclass);


--
-- TOC entry 3282 (class 2604 OID 86184)
-- Name: tipologiatreno id_tipologia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipologiatreno ALTER COLUMN id_tipologia SET DEFAULT nextval('public.tipologiatreno_id_tipologia_seq'::regclass);


--
-- TOC entry 3295 (class 2604 OID 86337)
-- Name: tratta codice_tratta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratta ALTER COLUMN codice_tratta SET DEFAULT nextval('public.tratta_codice_tratta_seq'::regclass);


--
-- TOC entry 3294 (class 2604 OID 86320)
-- Name: treno matricola; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treno ALTER COLUMN matricola SET DEFAULT nextval('public.treno_matricola_seq'::regclass);


--
-- TOC entry 3583 (class 0 OID 86424)
-- Dependencies: 246
-- Data for Name: biglietto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.biglietto (codice, numero_carrozza, fila, lettera_posto, classe, prezzo, token, data_validita, data_validazione, validato, prenotazione_id, stazione_partenza_id, stazione_arrivo_id) FROM stdin;
1	3	12	A	1A	40.00	TK12345A	2025-10-10	\N	f	1	1	2
2	4	8	B	2A	15.00	TK22345B	2025-10-12	\N	f	2	2	3
3	2	5	C	1A	25.50	TK32345C	2025-10-15	\N	f	3	3	4
4	1	3	D	1A	30.00	TK42345D	2025-10-16	\N	f	4	4	5
5	5	10	E	2A	50.00	TK52345E	2025-10-20	\N	f	5	5	1
6	3	6	F	1A	35.00	TK62345F	2025-10-21	\N	f	6	6	7
7	4	7	G	2A	45.00	TK72345G	2025-10-22	\N	f	7	7	8
8	2	5	H	1A	20.00	TK82345H	2025-10-23	\N	f	8	8	9
9	1	4	I	1A	60.00	TK92345I	2025-10-24	\N	f	9	9	10
10	5	8	J	2A	55.00	TK10345J	2025-10-25	\N	f	10	10	11
11	3	3	K	1A	40.00	TK11345K	2025-10-26	\N	f	11	11	12
12	4	9	L	2A	50.00	TK12346L	2025-10-27	\N	f	12	12	13
13	2	6	M	1A	25.00	TK13345M	2025-10-28	\N	f	13	13	14
14	1	5	N	1A	70.00	TK14345N	2025-10-29	\N	f	14	14	15
15	5	7	O	2A	45.00	TK15345O	2025-10-30	\N	f	15	15	16
16	3	4	P	1A	50.00	TK16345P	2025-10-31	\N	f	16	16	17
17	4	6	Q	2A	60.00	TK17345Q	2025-11-01	\N	f	17	17	18
18	2	8	R	1A	30.00	TK18345R	2025-11-02	\N	f	18	18	19
19	1	3	S	1A	65.00	TK19345S	2025-11-03	\N	f	19	19	20
20	5	5	T	2A	55.00	TK20345T	2025-11-04	\N	f	20	20	1
21	3	7	U	1A	40.00	TK21345U	2025-11-05	\N	f	21	1	2
22	4	8	V	2A	50.00	TK22345V	2025-11-06	\N	f	22	2	3
23	2	5	W	1A	25.00	TK23345W	2025-11-07	\N	f	23	3	4
24	1	4	X	1A	70.00	TK24345X	2025-11-08	\N	f	24	4	5
25	5	6	Y	2A	45.00	TK25345Y	2025-11-09	\N	f	25	5	1
\.


--
-- TOC entry 3549 (class 0 OID 86174)
-- Dependencies: 212
-- Data for Name: comune; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comune (id, denominazione, cap) FROM stdin;
1	Torino	10100
2	Rivoli	10098
3	Milano	20100
4	Pavia	27100
5	Roma	00100
6	Ciampino	00043
7	Napoli	80100
8	Salerno	84100
9	Firenze	50100
10	Prato	59100
11	Bologna	40100
12	Genova	16100
13	Venezia	30100
14	Verona	37100
15	Palermo	90100
16	Catania	95100
17	Bari	70100
18	Trieste	34100
19	Padova	35100
20	Parma	43100
\.


--
-- TOC entry 3580 (class 0 OID 86397)
-- Dependencies: 243
-- Data for Name: dipendente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dipendente (matricola, nome, cognome, sesso, data_nascita, data_assunzione, ruolo) FROM stdin;
1	Alberto	Ferrari	M	1975-03-21	2005-06-15	1
2	Chiara	Marini	F	1980-07-12	2010-03-01	2
3	Giovanni	Conti	M	1985-09-08	2015-09-01	3
4	Francesca	De Luca	F	1992-11-20	2020-01-15	4
5	Paolo	Greco	M	1988-02-05	2012-05-10	5
6	Sara	Rossi	F	1987-08-09	2011-03-12	1
7	Luca	Bianchi	M	1983-12-21	2009-09-30	2
8	Martina	Verdi	F	1990-04-18	2014-05-25	3
9	Stefano	Neri	M	1982-06-10	2008-08-18	4
10	Valentina	Russo	F	1991-11-05	2013-02-12	5
11	Giorgio	Fontana	M	1986-01-23	2010-06-30	1
12	Elena	Moretti	F	1989-03-14	2012-07-15	2
13	Riccardo	Costa	M	1984-07-11	2007-09-22	3
14	Federica	Ferrara	F	1992-12-01	2015-01-10	4
15	Tommaso	Lombardi	M	1988-05-05	2011-04-20	5
16	Chiara	Galli	F	1990-08-30	2014-06-11	1
17	Andrea	Rinaldi	M	1987-09-19	2012-03-08	2
18	Sofia	Grassi	F	1993-02-28	2016-09-05	3
19	Lorenzo	Marchetti	M	1985-10-15	2009-12-01	4
20	Elisa	Ricci	F	1991-06-22	2013-11-20	5
\.


--
-- TOC entry 3575 (class 0 OID 86356)
-- Dependencies: 238
-- Data for Name: fermata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fermata (id, codice_tratta, codice_stazione) FROM stdin;
1	1	1
2	1	2
3	1	3
4	2	2
5	2	3
6	2	4
7	3	3
8	3	4
9	3	5
10	4	4
11	4	5
12	4	6
13	5	5
14	5	6
15	5	7
16	6	1
17	6	7
18	6	8
19	7	2
20	7	8
21	7	9
22	8	3
23	8	9
24	8	10
25	9	4
26	9	10
27	9	11
28	10	5
29	10	11
30	10	12
\.


--
-- TOC entry 3559 (class 0 OID 86215)
-- Dependencies: 222
-- Data for Name: indirizzo_passeggero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.indirizzo_passeggero (id, via, civico, citta, id_comune, id_provincia) FROM stdin;
1	Via Roma	10	Torino	1	1
2	Corso Francia	45	Rivoli	2	1
3	Via Manzoni	12	Milano	3	2
4	Viale Matteotti	8	Roma	5	3
5	Via Toledo	22	Napoli	7	4
6	Via Dante	15	Firenze	9	5
7	Via Garibaldi	30	Bologna	11	6
8	Via XX Settembre	7	Genova	12	7
9	Riva degli Schiavoni	2	Venezia	13	8
10	Via Mazzini	5	Verona	14	9
11	Via Libertà	11	Palermo	15	10
12	Via Etnea	18	Catania	16	11
13	Via Sparano	20	Bari	17	12
14	Via Roma	25	Trieste	18	13
15	Via Altinate	33	Padova	19	14
16	Strada Repubblica	9	Parma	20	15
17	Via Emilia	4	Modena	16	16
18	Via Santa Maria	8	Pisa	17	17
19	Corso Vannucci	21	Perugia	18	18
20	Via Emilia Ovest	12	Reggio Emilia	19	19
21	Via Giardini	7	Messina	20	20
22	Via Torino	5	Torino	1	1
23	Via Milano	2	Milano	3	2
24	Via Napoli	9	Napoli	7	4
25	Via Firenze	10	Firenze	9	5
\.


--
-- TOC entry 3561 (class 0 OID 86232)
-- Dependencies: 224
-- Data for Name: indirizzo_stazione; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.indirizzo_stazione (id, via, civico, citta, longitudine, latitudine, id_comune, id_provincia) FROM stdin;
1	Piazza Carlo Felice	1	Torino	7.668000	45.062000	1	1
2	Piazza Duca dAosta	1	Milano	9.201000	45.484000	3	2
3	Piazza dei Cinquecento	1	Roma	12.501000	41.902000	5	3
4	Piazza Garibaldi	1	Napoli	14.272000	40.852000	7	4
5	Piazza della Stazione	1	Firenze	11.249000	43.776000	9	5
6	Piazza Maggiore	2	Bologna	11.342000	44.494000	11	6
7	Piazza Principe	3	Genova	8.933000	44.404000	12	7
8	Riva degli Schiavoni	4	Venezia	12.336000	45.434000	13	8
9	Piazza Bra	5	Verona	10.991000	45.438000	14	9
10	Via Libertà	6	Palermo	13.361000	38.115000	15	10
11	Via Etnea	7	Catania	15.087000	37.502000	16	11
12	Via Sparano	8	Bari	16.871000	41.117000	17	12
13	Piazza Unita	9	Trieste	13.772000	45.652000	18	13
14	Prato Centrale	10	Prato	11.102000	43.877000	10	5
15	Padova Centrale	11	Padova	11.876000	45.406000	19	14
16	Parma Centrale	12	Parma	10.328000	44.801000	20	15
17	Modena Centrale	13	Modena	10.926000	44.647000	16	16
18	Pisa Centrale	14	Pisa	10.397000	43.716000	17	17
19	Perugia Centrale	15	Perugia	12.389000	43.112000	18	18
20	Reggio Emilia Centrale	16	Reggio Emilia	10.631000	44.698000	19	19
21	Messina Centrale	17	Messina	15.554000	38.193000	20	20
\.


--
-- TOC entry 3581 (class 0 OID 86408)
-- Dependencies: 244
-- Data for Name: lavora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lavora (dipendente_id, tratta_id, data_inizio, data_fine) FROM stdin;
1	1	2025-10-01	2025-12-31
2	2	2025-10-01	2025-12-31
3	3	2025-10-01	2025-12-31
4	4	2025-10-01	2025-12-31
5	5	2025-10-01	2025-12-31
6	1	2025-10-05	2025-12-15
7	2	2025-10-07	2025-12-20
8	3	2025-10-10	2025-12-25
9	4	2025-10-12	2025-12-28
10	5	2025-10-15	2025-12-30
11	1	2025-10-05	2025-12-15
12	2	2025-10-07	2025-12-20
13	3	2025-10-10	2025-12-25
14	4	2025-10-12	2025-12-28
15	5	2025-10-15	2025-12-30
16	1	2025-10-01	2025-12-31
17	2	2025-10-01	2025-12-31
18	3	2025-10-01	2025-12-31
19	4	2025-10-01	2025-12-31
20	5	2025-10-01	2025-12-31
1	2	2025-11-01	2025-12-15
2	3	2025-11-01	2025-12-20
3	4	2025-11-01	2025-12-25
4	5	2025-11-01	2025-12-30
5	1	2025-11-01	2025-12-31
\.


--
-- TOC entry 3563 (class 0 OID 86249)
-- Dependencies: 226
-- Data for Name: passeggero; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.passeggero (id, nome, cognome, sesso, data_nascita, email, telefono, indirizzo_id) FROM stdin;
1	Marco	Rossi	M	1985-05-10	marco.rossi@gmail.com	3331111111	1
2	Giulia	Bianchi	F	1990-09-21	giulia.bianchi@yahoo.com	3332222222	2
3	Luca	Verdi	M	1978-12-02	luca.verdi@gmail.com	3333333333	3
4	Sara	Neri	F	1995-04-14	sara.neri@gmail.com	3334444444	4
5	Davide	Russo	M	1988-07-30	davide.russo@hotmail.com	3335555555	5
6	Alessia	Ferrari	F	1987-01-11	alessia.ferrari@gmail.com	3336666666	6
7	Matteo	Galli	M	1992-03-20	matteo.galli@gmail.com	3337777777	7
8	Francesca	Moretti	F	1983-06-25	francesca.moretti@gmail.com	3338888888	8
9	Stefano	Rinaldi	M	1979-11-10	stefano.rinaldi@gmail.com	3339999999	9
10	Martina	Fontana	F	1991-12-30	martina.fontana@gmail.com	3340000000	10
11	Giovanni	Conti	M	1980-04-05	giovanni.conti@gmail.com	3341111111	11
12	Chiara	Marini	F	1985-07-18	chiara.marini@gmail.com	3342222222	12
13	Alberto	Ferrari	M	1975-03-21	alberto.ferrari@gmail.com	3343333333	13
14	Paola	Greco	F	1990-08-09	paola.greco@gmail.com	3344444444	14
15	Davide	Costa	M	1989-09-12	davide.costa@gmail.com	3345555555	15
16	Sofia	Rossi	F	1993-10-01	sofia.rossi@gmail.com	3346666666	16
17	Giorgio	Bianchi	M	1986-05-17	giorgio.bianchi@gmail.com	3347777777	17
18	Elena	Verdi	F	1994-01-23	elena.verdi@gmail.com	3348888888	18
19	Lorenzo	Neri	M	1982-02-14	lorenzo.neri@gmail.com	3349999999	19
20	Federica	Russo	F	1991-06-02	federica.russo@gmail.com	3350000000	20
21	Riccardo	Ferrari	M	1988-12-29	riccardo.ferrari@gmail.com	3351111111	21
22	Elisa	Bianchi	F	1995-03-15	elisa.bianchi@gmail.com	3352222222	22
23	Andrea	Verdi	M	1987-09-05	andrea.verdi@gmail.com	3353333333	23
24	Valentina	Neri	F	1990-07-20	valentina.neri@gmail.com	3354444444	24
25	Tommaso	Russo	M	1983-04-12	tommaso.russo@gmail.com	3355555555	25
\.


--
-- TOC entry 3564 (class 0 OID 86261)
-- Dependencies: 227
-- Data for Name: persona_fisica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.persona_fisica (passeggero_id, codice_fiscale) FROM stdin;
1	RSSMRC85A10H501X
2	BNCLGU90P61H501Y
3	VRDLUC78T02H501Z
4	NRISRA95D14H501A
5	RSSDVD88L30H501B
6	FRRALS87A11H501C
7	GLLMTT92C20H501D
8	MRTFNC83H25H501E
9	RNLSTF79L10H501F
10	FNTMRT91L30H501G
11	CNTGNV80D05H501H
12	MRNCHR85L18H501I
13	FRRLBT75C21H501J
14	GRCPL90H09H501K
15	CSTDVD89P12H501L
\.


--
-- TOC entry 3569 (class 0 OID 86299)
-- Dependencies: 232
-- Data for Name: prenotazione; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.prenotazione (numero_prenotazione, data_prenotazione, data_partenza, ora_partenza, numero_passaggeri, numero_cambi, stato_prenotazione, importo, passeggero_id) FROM stdin;
1	2025-10-05	2025-10-10	07:00:00	1	0	2	40.00	1
2	2025-10-06	2025-10-12	09:30:00	2	1	1	30.00	2
3	2025-10-07	2025-10-15	10:00:00	1	0	2	25.50	3
4	2025-10-08	2025-10-16	08:15:00	3	1	2	60.00	4
5	2025-10-09	2025-10-20	06:45:00	2	1	3	50.00	5
6	2025-10-10	2025-10-21	07:30:00	1	0	2	35.00	6
7	2025-10-11	2025-10-22	08:00:00	2	1	1	55.00	7
8	2025-10-12	2025-10-23	09:15:00	1	0	2	20.00	8
9	2025-10-13	2025-10-24	10:30:00	3	1	2	65.00	9
10	2025-10-14	2025-10-25	11:00:00	2	1	3	45.00	10
11	2025-10-15	2025-10-26	07:45:00	1	0	2	50.00	11
12	2025-10-16	2025-10-27	08:30:00	2	1	1	60.00	12
13	2025-10-17	2025-10-28	09:00:00	1	0	2	30.00	13
14	2025-10-18	2025-10-29	10:15:00	3	1	2	75.00	14
15	2025-10-19	2025-10-30	11:30:00	2	1	3	55.00	15
16	2025-10-20	2025-10-31	07:00:00	1	0	2	35.00	16
17	2025-10-21	2025-11-01	08:45:00	2	1	1	40.00	17
18	2025-10-22	2025-11-02	09:30:00	1	0	2	25.00	18
19	2025-10-23	2025-11-03	10:45:00	3	1	2	70.00	19
20	2025-10-24	2025-11-04	11:15:00	2	1	3	45.00	20
21	2025-10-25	2025-11-05	07:30:00	1	0	2	55.00	21
22	2025-10-26	2025-11-06	08:15:00	2	1	1	50.00	22
23	2025-10-27	2025-11-07	09:45:00	1	0	2	30.00	23
24	2025-10-28	2025-11-08	10:30:00	3	1	2	65.00	24
25	2025-10-29	2025-11-09	11:00:00	2	1	3	45.00	25
\.


--
-- TOC entry 3547 (class 0 OID 86167)
-- Dependencies: 210
-- Data for Name: provincia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.provincia (id, denominazione) FROM stdin;
1	Torino
2	Milano
3	Roma
4	Napoli
5	Firenze
6	Bologna
7	Genova
8	Venezia
9	Verona
10	Palermo
11	Catania
12	Bari
13	Trieste
14	Padova
15	Parma
16	Modena
17	Pisa
18	Perugia
19	Reggio Emilia
20	Messina
\.


--
-- TOC entry 3557 (class 0 OID 86206)
-- Dependencies: 220
-- Data for Name: ruolo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ruolo (id_ruolo, denominazione, ufficio_riferimento) FROM stdin;
1	Macchinista	Deposito Torino
2	Capotreno	Milano Centrale
3	Controllore	Roma Termini
4	Addetto Stazione	Napoli Centrale
5	Tecnico Manutenzione	Firenze SMN
\.


--
-- TOC entry 3565 (class 0 OID 86273)
-- Dependencies: 228
-- Data for Name: soggetto_giuridico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.soggetto_giuridico (passeggero_id, partita_iva, pec) FROM stdin;
16	01234567890	azienda1@pec.it
17	09876543210	azienda2@pec.it
18	12345098765	azienda3@pec.it
19	56789012345	azienda4@pec.it
20	67890123456	azienda5@pec.it
21	23456789012	azienda6@pec.it
22	34567890123	azienda7@pec.it
23	45678901234	azienda8@pec.it
24	56781012345	azienda9@pec.it
25	67891123456	azienda10@pec.it
\.


--
-- TOC entry 3555 (class 0 OID 86198)
-- Dependencies: 218
-- Data for Name: statoprenotazione; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.statoprenotazione (id_stato, stato) FROM stdin;
1	IN PAGAMENTO
2	PAGATA
3	SCADUTA
\.


--
-- TOC entry 3567 (class 0 OID 86286)
-- Dependencies: 230
-- Data for Name: stazione; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stazione (codice_stazione, denominazione, numero_binari, capolinea, indirizzo_id) FROM stdin;
1	Torino Porta Nuova	12	t	1
2	Milano Centrale	24	f	2
3	Roma Termini	32	f	3
4	Napoli Centrale	18	f	4
5	Firenze SMN	16	f	5
6	Bologna Centrale	20	f	6
7	Genova Piazza Principe	15	f	7
8	Venezia Santa Lucia	12	f	8
9	Verona Porta Nuova	14	f	9
10	Palermo Centrale	16	f	10
11	Catania Centrale	12	f	11
12	Bari Centrale	12	f	12
13	Trieste Centrale	10	f	13
14	Prato Centrale	10	f	14
15	Padova Centrale	12	f	15
16	Parma Centrale	10	f	16
17	Modena Centrale	12	f	17
18	Pisa Centrale	10	f	18
19	Perugia Centrale	10	f	19
20	Messina Centrale	12	f	20
\.


--
-- TOC entry 3577 (class 0 OID 86375)
-- Dependencies: 240
-- Data for Name: tariffa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tariffa (id, importo, data_inizio_periodo, data_fine_periodo) FROM stdin;
1	20.00	2025-10-01	2025-10-31
2	25.00	2025-10-01	2025-10-31
3	30.00	2025-10-01	2025-10-31
4	35.00	2025-10-01	2025-10-31
5	40.00	2025-10-01	2025-10-31
6	22.50	2025-10-05	2025-11-05
7	27.50	2025-10-05	2025-11-05
8	32.50	2025-10-05	2025-11-05
9	37.50	2025-10-05	2025-11-05
10	42.50	2025-10-05	2025-11-05
11	23.00	2025-10-10	2025-11-10
12	28.00	2025-10-10	2025-11-10
13	33.00	2025-10-10	2025-11-10
14	38.00	2025-10-10	2025-11-10
15	43.00	2025-10-10	2025-11-10
16	24.00	2025-10-15	2025-11-15
17	29.00	2025-10-15	2025-11-15
18	34.00	2025-10-15	2025-11-15
19	39.00	2025-10-15	2025-11-15
20	44.00	2025-10-15	2025-11-15
\.


--
-- TOC entry 3553 (class 0 OID 86190)
-- Dependencies: 216
-- Data for Name: tipoalimentazione; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipoalimentazione (id_alimentazione, tipo) FROM stdin;
1	ELETTRICO
2	DIESEL
3	IBRIDO
\.


--
-- TOC entry 3551 (class 0 OID 86181)
-- Dependencies: 214
-- Data for Name: tipologiatreno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipologiatreno (id_tipologia, descrizione) FROM stdin;
1	Regionale
2	Intercity
3	Frecciarossa
4	Frecciargento
5	Italo
\.


--
-- TOC entry 3573 (class 0 OID 86334)
-- Dependencies: 236
-- Data for Name: tratta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tratta (codice_tratta, data_inizio, data_fine, tipologia, orario_partenza, orario_arrivo, posti_disponibili, stazione_partenza_id, stazione_arrivo_id, treno_id) FROM stdin;
1	2025-10-10	2025-12-31	Regionale	07:00:00	09:00:00	100	1	2	1
2	2025-10-11	2025-12-31	Intercity	08:30:00	11:00:00	120	2	3	2
3	2025-10-12	2025-12-31	Frecciarossa	09:00:00	12:00:00	200	3	4	3
4	2025-10-13	2025-12-31	Frecciargento	10:00:00	13:30:00	180	4	5	4
5	2025-10-14	2025-12-31	Italo	11:00:00	14:00:00	220	5	6	5
6	2025-10-15	2025-12-31	Regionale	07:30:00	09:30:00	90	6	7	6
7	2025-10-16	2025-12-31	Intercity	08:00:00	10:30:00	150	7	8	7
8	2025-10-17	2025-12-31	Frecciarossa	09:30:00	12:30:00	200	8	9	8
9	2025-10-18	2025-12-31	Frecciargento	10:15:00	13:15:00	180	9	10	9
10	2025-10-19	2025-12-31	Italo	11:45:00	14:45:00	220	10	11	10
11	2025-10-20	2025-12-31	Regionale	07:15:00	09:15:00	100	11	12	11
12	2025-10-21	2025-12-31	Intercity	08:45:00	11:15:00	120	12	13	12
13	2025-10-22	2025-12-31	Frecciarossa	09:00:00	12:00:00	200	13	14	13
14	2025-10-23	2025-12-31	Frecciargento	10:30:00	13:30:00	180	14	15	14
15	2025-10-24	2025-12-31	Italo	11:15:00	14:15:00	220	15	16	15
16	2025-10-25	2025-12-31	Regionale	07:00:00	09:00:00	90	16	17	16
17	2025-10-26	2025-12-31	Intercity	08:30:00	11:00:00	150	17	18	17
18	2025-10-27	2025-12-31	Frecciarossa	09:00:00	12:00:00	200	18	19	18
19	2025-10-28	2025-12-31	Frecciargento	10:00:00	13:00:00	180	19	20	19
20	2025-10-29	2025-12-31	Italo	11:30:00	14:30:00	220	20	1	20
\.


--
-- TOC entry 3578 (class 0 OID 86381)
-- Dependencies: 241
-- Data for Name: tratta_tariffa; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tratta_tariffa (tratta_id, tariffa_id) FROM stdin;
1	1
1	2
2	2
2	3
3	1
3	2
4	2
4	3
5	1
5	2
6	2
6	3
7	1
7	3
8	2
8	3
9	1
9	2
10	2
10	3
11	1
11	3
12	2
12	3
13	1
13	2
14	2
14	3
15	1
15	2
\.


--
-- TOC entry 3571 (class 0 OID 86317)
-- Dependencies: 234
-- Data for Name: treno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.treno (matricola, tipologia, numero_carrozze, numero_posti, anno_costruzione, alimentazione) FROM stdin;
1	1	6	400	2005	2
2	2	8	500	2010	1
3	3	10	600	2015	1
4	4	8	550	2018	1
5	5	11	700	2020	1
6	1	5	300	2002	2
7	2	7	450	2008	1
8	3	9	600	2012	1
9	4	6	500	2016	1
10	5	12	720	2021	1
11	1	6	400	2005	2
12	2	8	500	2010	1
13	3	10	600	2015	1
14	4	8	550	2018	1
15	5	11	700	2020	1
16	1	5	300	2002	2
17	2	7	450	2008	1
18	3	9	600	2012	1
19	4	6	500	2016	1
20	5	12	720	2021	1
\.


--
-- TOC entry 3660 (class 0 OID 0)
-- Dependencies: 245
-- Name: biglietto_codice_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.biglietto_codice_seq', 25, true);


--
-- TOC entry 3661 (class 0 OID 0)
-- Dependencies: 211
-- Name: comune_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comune_id_seq', 20, true);


--
-- TOC entry 3662 (class 0 OID 0)
-- Dependencies: 242
-- Name: dipendente_matricola_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dipendente_matricola_seq', 20, true);


--
-- TOC entry 3663 (class 0 OID 0)
-- Dependencies: 237
-- Name: fermata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fermata_id_seq', 30, true);


--
-- TOC entry 3664 (class 0 OID 0)
-- Dependencies: 221
-- Name: indirizzo_passeggero_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.indirizzo_passeggero_id_seq', 25, true);


--
-- TOC entry 3665 (class 0 OID 0)
-- Dependencies: 223
-- Name: indirizzo_stazione_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.indirizzo_stazione_id_seq', 21, true);


--
-- TOC entry 3666 (class 0 OID 0)
-- Dependencies: 225
-- Name: passeggero_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.passeggero_id_seq', 25, true);


--
-- TOC entry 3667 (class 0 OID 0)
-- Dependencies: 231
-- Name: prenotazione_numero_prenotazione_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.prenotazione_numero_prenotazione_seq', 25, true);


--
-- TOC entry 3668 (class 0 OID 0)
-- Dependencies: 209
-- Name: provincia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.provincia_id_seq', 20, true);


--
-- TOC entry 3669 (class 0 OID 0)
-- Dependencies: 219
-- Name: ruolo_id_ruolo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ruolo_id_ruolo_seq', 5, true);


--
-- TOC entry 3670 (class 0 OID 0)
-- Dependencies: 217
-- Name: statoprenotazione_id_stato_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.statoprenotazione_id_stato_seq', 3, true);


--
-- TOC entry 3671 (class 0 OID 0)
-- Dependencies: 229
-- Name: stazione_codice_stazione_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stazione_codice_stazione_seq', 20, true);


--
-- TOC entry 3672 (class 0 OID 0)
-- Dependencies: 239
-- Name: tariffa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tariffa_id_seq', 20, true);


--
-- TOC entry 3673 (class 0 OID 0)
-- Dependencies: 215
-- Name: tipoalimentazione_id_alimentazione_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipoalimentazione_id_alimentazione_seq', 3, true);


--
-- TOC entry 3674 (class 0 OID 0)
-- Dependencies: 213
-- Name: tipologiatreno_id_tipologia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipologiatreno_id_tipologia_seq', 5, true);


--
-- TOC entry 3675 (class 0 OID 0)
-- Dependencies: 235
-- Name: tratta_codice_tratta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tratta_codice_tratta_seq', 20, true);


--
-- TOC entry 3676 (class 0 OID 0)
-- Dependencies: 233
-- Name: treno_matricola_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.treno_matricola_seq', 20, true);


--
-- TOC entry 3372 (class 2606 OID 86430)
-- Name: biglietto biglietto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biglietto
    ADD CONSTRAINT biglietto_pkey PRIMARY KEY (codice);


--
-- TOC entry 3305 (class 2606 OID 86179)
-- Name: comune comune_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comune
    ADD CONSTRAINT comune_pkey PRIMARY KEY (id);


--
-- TOC entry 3368 (class 2606 OID 86402)
-- Name: dipendente dipendente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dipendente
    ADD CONSTRAINT dipendente_pkey PRIMARY KEY (matricola);


--
-- TOC entry 3359 (class 2606 OID 86361)
-- Name: fermata fermata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fermata
    ADD CONSTRAINT fermata_pkey PRIMARY KEY (id);


--
-- TOC entry 3323 (class 2606 OID 86220)
-- Name: indirizzo_passeggero indirizzo_passeggero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indirizzo_passeggero
    ADD CONSTRAINT indirizzo_passeggero_pkey PRIMARY KEY (id);


--
-- TOC entry 3327 (class 2606 OID 86237)
-- Name: indirizzo_stazione indirizzo_stazione_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indirizzo_stazione
    ADD CONSTRAINT indirizzo_stazione_pkey PRIMARY KEY (id);


--
-- TOC entry 3370 (class 2606 OID 86412)
-- Name: lavora lavora_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lavora
    ADD CONSTRAINT lavora_pkey PRIMARY KEY (dipendente_id, tratta_id);


--
-- TOC entry 3331 (class 2606 OID 86254)
-- Name: passeggero passeggero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passeggero
    ADD CONSTRAINT passeggero_pkey PRIMARY KEY (id);


--
-- TOC entry 3334 (class 2606 OID 86267)
-- Name: persona_fisica persona_fisica_codice_fiscale_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona_fisica
    ADD CONSTRAINT persona_fisica_codice_fiscale_key UNIQUE (codice_fiscale);


--
-- TOC entry 3336 (class 2606 OID 86265)
-- Name: persona_fisica persona_fisica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona_fisica
    ADD CONSTRAINT persona_fisica_pkey PRIMARY KEY (passeggero_id);


--
-- TOC entry 3349 (class 2606 OID 86304)
-- Name: prenotazione prenotazione_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prenotazione
    ADD CONSTRAINT prenotazione_pkey PRIMARY KEY (numero_prenotazione);


--
-- TOC entry 3303 (class 2606 OID 86172)
-- Name: provincia provincia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provincia
    ADD CONSTRAINT provincia_pkey PRIMARY KEY (id);


--
-- TOC entry 3317 (class 2606 OID 86213)
-- Name: ruolo ruolo_denominazione_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruolo
    ADD CONSTRAINT ruolo_denominazione_key UNIQUE (denominazione);


--
-- TOC entry 3319 (class 2606 OID 86211)
-- Name: ruolo ruolo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ruolo
    ADD CONSTRAINT ruolo_pkey PRIMARY KEY (id_ruolo);


--
-- TOC entry 3339 (class 2606 OID 86279)
-- Name: soggetto_giuridico soggetto_giuridico_partita_iva_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.soggetto_giuridico
    ADD CONSTRAINT soggetto_giuridico_partita_iva_key UNIQUE (partita_iva);


--
-- TOC entry 3341 (class 2606 OID 86277)
-- Name: soggetto_giuridico soggetto_giuridico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.soggetto_giuridico
    ADD CONSTRAINT soggetto_giuridico_pkey PRIMARY KEY (passeggero_id);


--
-- TOC entry 3315 (class 2606 OID 86204)
-- Name: statoprenotazione statoprenotazione_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statoprenotazione
    ADD CONSTRAINT statoprenotazione_pkey PRIMARY KEY (id_stato);


--
-- TOC entry 3343 (class 2606 OID 86292)
-- Name: stazione stazione_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stazione
    ADD CONSTRAINT stazione_pkey PRIMARY KEY (codice_stazione);


--
-- TOC entry 3364 (class 2606 OID 86380)
-- Name: tariffa tariffa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tariffa
    ADD CONSTRAINT tariffa_pkey PRIMARY KEY (id);


--
-- TOC entry 3313 (class 2606 OID 86196)
-- Name: tipoalimentazione tipoalimentazione_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipoalimentazione
    ADD CONSTRAINT tipoalimentazione_pkey PRIMARY KEY (id_alimentazione);


--
-- TOC entry 3309 (class 2606 OID 86188)
-- Name: tipologiatreno tipologiatreno_descrizione_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipologiatreno
    ADD CONSTRAINT tipologiatreno_descrizione_key UNIQUE (descrizione);


--
-- TOC entry 3311 (class 2606 OID 86186)
-- Name: tipologiatreno tipologiatreno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipologiatreno
    ADD CONSTRAINT tipologiatreno_pkey PRIMARY KEY (id_tipologia);


--
-- TOC entry 3357 (class 2606 OID 86339)
-- Name: tratta tratta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratta
    ADD CONSTRAINT tratta_pkey PRIMARY KEY (codice_tratta);


--
-- TOC entry 3366 (class 2606 OID 86385)
-- Name: tratta_tariffa tratta_tariffa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratta_tariffa
    ADD CONSTRAINT tratta_tariffa_pkey PRIMARY KEY (tratta_id, tariffa_id);


--
-- TOC entry 3351 (class 2606 OID 86322)
-- Name: treno treno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treno
    ADD CONSTRAINT treno_pkey PRIMARY KEY (matricola);


--
-- TOC entry 3373 (class 1259 OID 86466)
-- Name: idx_biglietto_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_biglietto_date ON public.biglietto USING btree (data_validita, data_validazione);


--
-- TOC entry 3374 (class 1259 OID 86446)
-- Name: idx_biglietto_prenotazione; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_biglietto_prenotazione ON public.biglietto USING btree (prenotazione_id);


--
-- TOC entry 3375 (class 1259 OID 86467)
-- Name: idx_biglietto_stazioni; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_biglietto_stazioni ON public.biglietto USING btree (stazione_partenza_id, stazione_arrivo_id);


--
-- TOC entry 3376 (class 1259 OID 86465)
-- Name: idx_biglietto_validato; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_biglietto_validato ON public.biglietto USING btree (validato);


--
-- TOC entry 3306 (class 1259 OID 86449)
-- Name: idx_comune_cap; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_comune_cap ON public.comune USING btree (cap);


--
-- TOC entry 3307 (class 1259 OID 86448)
-- Name: idx_comune_denom; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_comune_denom ON public.comune USING btree (denominazione);


--
-- TOC entry 3360 (class 1259 OID 86373)
-- Name: idx_fermata_stazione; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fermata_stazione ON public.fermata USING btree (codice_stazione);


--
-- TOC entry 3361 (class 1259 OID 86372)
-- Name: idx_fermata_tratta; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fermata_tratta ON public.fermata USING btree (codice_tratta);


--
-- TOC entry 3320 (class 1259 OID 86450)
-- Name: idx_indirizzo_passeggero_comune; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_indirizzo_passeggero_comune ON public.indirizzo_passeggero USING btree (id_comune);


--
-- TOC entry 3321 (class 1259 OID 86451)
-- Name: idx_indirizzo_passeggero_provincia; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_indirizzo_passeggero_provincia ON public.indirizzo_passeggero USING btree (id_provincia);


--
-- TOC entry 3324 (class 1259 OID 86452)
-- Name: idx_indirizzo_stazione_comune; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_indirizzo_stazione_comune ON public.indirizzo_stazione USING btree (id_comune);


--
-- TOC entry 3325 (class 1259 OID 86453)
-- Name: idx_indirizzo_stazione_provincia; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_indirizzo_stazione_provincia ON public.indirizzo_stazione USING btree (id_provincia);


--
-- TOC entry 3328 (class 1259 OID 86260)
-- Name: idx_passeggero_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_passeggero_email ON public.passeggero USING btree (email);


--
-- TOC entry 3329 (class 1259 OID 86454)
-- Name: idx_passeggero_nome_cognome; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_passeggero_nome_cognome ON public.passeggero USING btree (nome, cognome);


--
-- TOC entry 3332 (class 1259 OID 86455)
-- Name: idx_persona_fisica_cf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_persona_fisica_cf ON public.persona_fisica USING btree (codice_fiscale);


--
-- TOC entry 3344 (class 1259 OID 86457)
-- Name: idx_prenotazione_data; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_prenotazione_data ON public.prenotazione USING btree (data_prenotazione);


--
-- TOC entry 3345 (class 1259 OID 86459)
-- Name: idx_prenotazione_data_partenza; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_prenotazione_data_partenza ON public.prenotazione USING btree (data_partenza, ora_partenza);


--
-- TOC entry 3346 (class 1259 OID 86315)
-- Name: idx_prenotazione_passeggero; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_prenotazione_passeggero ON public.prenotazione USING btree (passeggero_id);


--
-- TOC entry 3347 (class 1259 OID 86458)
-- Name: idx_prenotazione_stato; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_prenotazione_stato ON public.prenotazione USING btree (stato_prenotazione);


--
-- TOC entry 3301 (class 1259 OID 86447)
-- Name: idx_provincia_denom; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_provincia_denom ON public.provincia USING btree (denominazione);


--
-- TOC entry 3337 (class 1259 OID 86456)
-- Name: idx_soggetto_giuridico_piva; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_soggetto_giuridico_piva ON public.soggetto_giuridico USING btree (partita_iva);


--
-- TOC entry 3362 (class 1259 OID 86464)
-- Name: idx_tariffa_periodo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_tariffa_periodo ON public.tariffa USING btree (data_inizio_periodo, data_fine_periodo);


--
-- TOC entry 3352 (class 1259 OID 86462)
-- Name: idx_tratta_date; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_tratta_date ON public.tratta USING btree (data_inizio, data_fine);


--
-- TOC entry 3353 (class 1259 OID 86463)
-- Name: idx_tratta_orario; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_tratta_orario ON public.tratta USING btree (orario_partenza, orario_arrivo);


--
-- TOC entry 3354 (class 1259 OID 86460)
-- Name: idx_tratta_stazioni; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_tratta_stazioni ON public.tratta USING btree (stazione_partenza_id, stazione_arrivo_id);


--
-- TOC entry 3355 (class 1259 OID 86461)
-- Name: idx_tratta_treno; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_tratta_treno ON public.tratta USING btree (treno_id);


--
-- TOC entry 3399 (class 2606 OID 86431)
-- Name: biglietto biglietto_prenotazione_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biglietto
    ADD CONSTRAINT biglietto_prenotazione_id_fkey FOREIGN KEY (prenotazione_id) REFERENCES public.prenotazione(numero_prenotazione) ON DELETE CASCADE;


--
-- TOC entry 3401 (class 2606 OID 86441)
-- Name: biglietto biglietto_stazione_arrivo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biglietto
    ADD CONSTRAINT biglietto_stazione_arrivo_id_fkey FOREIGN KEY (stazione_arrivo_id) REFERENCES public.stazione(codice_stazione) ON DELETE RESTRICT;


--
-- TOC entry 3400 (class 2606 OID 86436)
-- Name: biglietto biglietto_stazione_partenza_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.biglietto
    ADD CONSTRAINT biglietto_stazione_partenza_id_fkey FOREIGN KEY (stazione_partenza_id) REFERENCES public.stazione(codice_stazione) ON DELETE RESTRICT;


--
-- TOC entry 3396 (class 2606 OID 86403)
-- Name: dipendente dipendente_ruolo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dipendente
    ADD CONSTRAINT dipendente_ruolo_fkey FOREIGN KEY (ruolo) REFERENCES public.ruolo(id_ruolo) ON DELETE CASCADE;


--
-- TOC entry 3393 (class 2606 OID 86367)
-- Name: fermata fermata_codice_stazione_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fermata
    ADD CONSTRAINT fermata_codice_stazione_fkey FOREIGN KEY (codice_stazione) REFERENCES public.stazione(codice_stazione) ON DELETE CASCADE;


--
-- TOC entry 3392 (class 2606 OID 86362)
-- Name: fermata fermata_codice_tratta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fermata
    ADD CONSTRAINT fermata_codice_tratta_fkey FOREIGN KEY (codice_tratta) REFERENCES public.tratta(codice_tratta) ON DELETE CASCADE;


--
-- TOC entry 3377 (class 2606 OID 86221)
-- Name: indirizzo_passeggero indirizzo_passeggero_id_comune_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indirizzo_passeggero
    ADD CONSTRAINT indirizzo_passeggero_id_comune_fkey FOREIGN KEY (id_comune) REFERENCES public.comune(id) ON DELETE SET NULL;


--
-- TOC entry 3378 (class 2606 OID 86226)
-- Name: indirizzo_passeggero indirizzo_passeggero_id_provincia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indirizzo_passeggero
    ADD CONSTRAINT indirizzo_passeggero_id_provincia_fkey FOREIGN KEY (id_provincia) REFERENCES public.provincia(id) ON DELETE SET NULL;


--
-- TOC entry 3379 (class 2606 OID 86238)
-- Name: indirizzo_stazione indirizzo_stazione_id_comune_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indirizzo_stazione
    ADD CONSTRAINT indirizzo_stazione_id_comune_fkey FOREIGN KEY (id_comune) REFERENCES public.comune(id) ON DELETE SET NULL;


--
-- TOC entry 3380 (class 2606 OID 86243)
-- Name: indirizzo_stazione indirizzo_stazione_id_provincia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.indirizzo_stazione
    ADD CONSTRAINT indirizzo_stazione_id_provincia_fkey FOREIGN KEY (id_provincia) REFERENCES public.provincia(id) ON DELETE SET NULL;


--
-- TOC entry 3397 (class 2606 OID 86413)
-- Name: lavora lavora_dipendente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lavora
    ADD CONSTRAINT lavora_dipendente_id_fkey FOREIGN KEY (dipendente_id) REFERENCES public.dipendente(matricola) ON DELETE CASCADE;


--
-- TOC entry 3398 (class 2606 OID 86418)
-- Name: lavora lavora_tratta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lavora
    ADD CONSTRAINT lavora_tratta_id_fkey FOREIGN KEY (tratta_id) REFERENCES public.tratta(codice_tratta) ON DELETE CASCADE;


--
-- TOC entry 3381 (class 2606 OID 86255)
-- Name: passeggero passeggero_indirizzo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passeggero
    ADD CONSTRAINT passeggero_indirizzo_id_fkey FOREIGN KEY (indirizzo_id) REFERENCES public.indirizzo_passeggero(id) ON DELETE SET NULL;


--
-- TOC entry 3382 (class 2606 OID 86268)
-- Name: persona_fisica persona_fisica_passeggero_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona_fisica
    ADD CONSTRAINT persona_fisica_passeggero_id_fkey FOREIGN KEY (passeggero_id) REFERENCES public.passeggero(id) ON DELETE CASCADE;


--
-- TOC entry 3386 (class 2606 OID 86310)
-- Name: prenotazione prenotazione_passeggero_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prenotazione
    ADD CONSTRAINT prenotazione_passeggero_id_fkey FOREIGN KEY (passeggero_id) REFERENCES public.passeggero(id) ON DELETE CASCADE;


--
-- TOC entry 3385 (class 2606 OID 86305)
-- Name: prenotazione prenotazione_stato_prenotazione_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prenotazione
    ADD CONSTRAINT prenotazione_stato_prenotazione_fkey FOREIGN KEY (stato_prenotazione) REFERENCES public.statoprenotazione(id_stato) ON DELETE CASCADE;


--
-- TOC entry 3383 (class 2606 OID 86280)
-- Name: soggetto_giuridico soggetto_giuridico_passeggero_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.soggetto_giuridico
    ADD CONSTRAINT soggetto_giuridico_passeggero_id_fkey FOREIGN KEY (passeggero_id) REFERENCES public.passeggero(id) ON DELETE CASCADE;


--
-- TOC entry 3384 (class 2606 OID 86293)
-- Name: stazione stazione_indirizzo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stazione
    ADD CONSTRAINT stazione_indirizzo_id_fkey FOREIGN KEY (indirizzo_id) REFERENCES public.indirizzo_stazione(id) ON DELETE SET NULL;


--
-- TOC entry 3390 (class 2606 OID 86345)
-- Name: tratta tratta_stazione_arrivo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratta
    ADD CONSTRAINT tratta_stazione_arrivo_id_fkey FOREIGN KEY (stazione_arrivo_id) REFERENCES public.stazione(codice_stazione) ON DELETE RESTRICT;


--
-- TOC entry 3389 (class 2606 OID 86340)
-- Name: tratta tratta_stazione_partenza_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratta
    ADD CONSTRAINT tratta_stazione_partenza_id_fkey FOREIGN KEY (stazione_partenza_id) REFERENCES public.stazione(codice_stazione) ON DELETE RESTRICT;


--
-- TOC entry 3395 (class 2606 OID 86391)
-- Name: tratta_tariffa tratta_tariffa_tariffa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratta_tariffa
    ADD CONSTRAINT tratta_tariffa_tariffa_id_fkey FOREIGN KEY (tariffa_id) REFERENCES public.tariffa(id) ON DELETE CASCADE;


--
-- TOC entry 3394 (class 2606 OID 86386)
-- Name: tratta_tariffa tratta_tariffa_tratta_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratta_tariffa
    ADD CONSTRAINT tratta_tariffa_tratta_id_fkey FOREIGN KEY (tratta_id) REFERENCES public.tratta(codice_tratta) ON DELETE CASCADE;


--
-- TOC entry 3391 (class 2606 OID 86350)
-- Name: tratta tratta_treno_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratta
    ADD CONSTRAINT tratta_treno_id_fkey FOREIGN KEY (treno_id) REFERENCES public.treno(matricola) ON DELETE CASCADE;


--
-- TOC entry 3388 (class 2606 OID 86328)
-- Name: treno treno_alimentazione_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treno
    ADD CONSTRAINT treno_alimentazione_fkey FOREIGN KEY (alimentazione) REFERENCES public.tipoalimentazione(id_alimentazione) ON DELETE CASCADE;


--
-- TOC entry 3387 (class 2606 OID 86323)
-- Name: treno treno_tipologia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.treno
    ADD CONSTRAINT treno_tipologia_fkey FOREIGN KEY (tipologia) REFERENCES public.tipologiatreno(id_tipologia) ON DELETE CASCADE;


--
-- TOC entry 3590 (class 0 OID 0)
-- Dependencies: 246
-- Name: TABLE biglietto; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.biglietto TO ferrovia_user_db;


--
-- TOC entry 3595 (class 0 OID 0)
-- Dependencies: 212
-- Name: TABLE comune; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.comune TO ferrovia_user_db;


--
-- TOC entry 3598 (class 0 OID 0)
-- Dependencies: 243
-- Name: TABLE dipendente; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.dipendente TO ferrovia_user_db;


--
-- TOC entry 3601 (class 0 OID 0)
-- Dependencies: 238
-- Name: TABLE fermata; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.fermata TO ferrovia_user_db;


--
-- TOC entry 3607 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE indirizzo_passeggero; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.indirizzo_passeggero TO ferrovia_user_db;


--
-- TOC entry 3615 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE indirizzo_stazione; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.indirizzo_stazione TO ferrovia_user_db;


--
-- TOC entry 3618 (class 0 OID 0)
-- Dependencies: 244
-- Name: TABLE lavora; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.lavora TO ferrovia_user_db;


--
-- TOC entry 3620 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE passeggero; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.passeggero TO ferrovia_user_db;


--
-- TOC entry 3623 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE persona_fisica; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.persona_fisica TO ferrovia_user_db;


--
-- TOC entry 3625 (class 0 OID 0)
-- Dependencies: 232
-- Name: TABLE prenotazione; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.prenotazione TO ferrovia_user_db;


--
-- TOC entry 3629 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE provincia; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.provincia TO ferrovia_user_db;


--
-- TOC entry 3631 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE ruolo; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.ruolo TO ferrovia_user_db;


--
-- TOC entry 3634 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE soggetto_giuridico; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.soggetto_giuridico TO ferrovia_user_db;


--
-- TOC entry 3635 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE statoprenotazione; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.statoprenotazione TO ferrovia_user_db;


--
-- TOC entry 3638 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE stazione; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.stazione TO ferrovia_user_db;


--
-- TOC entry 3641 (class 0 OID 0)
-- Dependencies: 240
-- Name: TABLE tariffa; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.tariffa TO ferrovia_user_db;


--
-- TOC entry 3643 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE tipoalimentazione; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.tipoalimentazione TO ferrovia_user_db;


--
-- TOC entry 3645 (class 0 OID 0)
-- Dependencies: 214
-- Name: TABLE tipologiatreno; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.tipologiatreno TO ferrovia_user_db;


--
-- TOC entry 3648 (class 0 OID 0)
-- Dependencies: 236
-- Name: TABLE tratta; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.tratta TO ferrovia_user_db;


--
-- TOC entry 3651 (class 0 OID 0)
-- Dependencies: 241
-- Name: TABLE tratta_tariffa; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.tratta_tariffa TO ferrovia_user_db;


--
-- TOC entry 3653 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE treno; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.treno TO ferrovia_user_db;


--
-- TOC entry 3655 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE vw_biglietti_dettaglio; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.vw_biglietti_dettaglio TO ferrovia_user_db;


--
-- TOC entry 3656 (class 0 OID 0)
-- Dependencies: 249
-- Name: TABLE vw_passeggeri_dettaglio; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.vw_passeggeri_dettaglio TO ferrovia_user_db;


--
-- TOC entry 3657 (class 0 OID 0)
-- Dependencies: 247
-- Name: TABLE vw_prenotazioni_dettaglio; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.vw_prenotazioni_dettaglio TO ferrovia_user_db;


--
-- TOC entry 3658 (class 0 OID 0)
-- Dependencies: 250
-- Name: TABLE vw_tratte_dettaglio; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.vw_tratte_dettaglio TO ferrovia_user_db;


--
-- TOC entry 3659 (class 0 OID 0)
-- Dependencies: 251
-- Name: TABLE vw_tratte_tariffe; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.vw_tratte_tariffe TO ferrovia_user_db;


-- Completed on 2025-10-12 19:22:56

--
-- PostgreSQL database dump complete
--

