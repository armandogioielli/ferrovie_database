--Creazione tabella Provincia
CREATE TABLE Provincia (
    id_provincia SERIAL PRIMARY KEY,
    sigla VARCHAR(2) NOT null,
    denominazione VARCHAR(50) NOT NULL
);

--Creazione tabella Comune
CREATE TABLE Comune (
    id_comune SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    provincia INTEGER NOT NULL REFERENCES Provincia(id_provincia)
);

--Creazione tabella TipologiaTreno
CREATE TABLE TipologiaTreno (
    id_tipologia SERIAL PRIMARY KEY,
    descrizione VARCHAR(50) NOT NULL UNIQUE
);

--Creazione tabella TipologiaAlimentazione
CREATE TABLE TipoAlimentazione (
    id_alimentazione SERIAL PRIMARY KEY,
    tipo VARCHAR(20) NOT NULL CHECK (tipo IN ('ELETTRICO', 'DIESEL', 'IBRIDO'))
);

--Creazione tabella StatoPrenotazione
CREATE TABLE StatoPrenotazione (
    id_stato SERIAL PRIMARY KEY,
    stato VARCHAR(20) NOT NULL CHECK (stato IN ('IN PAGAMENTO', 'PAGATA', 'SCADUTA'))
);

--Creazione tabella TipologiaTreno
CREATE TABLE Ruolo (
    id_ruolo SERIAL PRIMARY KEY,
    denominazione VARCHAR(50) NOT NULL UNIQUE,
    postazione VARCHAR(50)
);

--Creazione tabella Indirizzo
CREATE TABLE Indirizzo (
    id_indirizzo        SERIAL PRIMARY KEY,
    via                 VARCHAR(100) NOT NULL,
    civico              VARCHAR(10),
    cap                 CHAR(5),
    id_provincia        INTEGER NOT NULL REFERENCES Provincia(id_provincia),
    id_comune           INTEGER NOT NULL REFERENCES Comune(id_comune),
    latitudine          DECIMAL(9,6),
    longitudine         DECIMAL(9,6)
);

--Creazione tabella Passeggero
CREATE TABLE Passeggero (
    id_passeggero       SERIAL PRIMARY KEY,
    nome                VARCHAR(50) NOT NULL,
    cognome             VARCHAR(50) NOT NULL,
    sesso               CHAR(1) CHECK (sesso IN ('M', 'F')),
    data_nascita        DATE,
    telefono            VARCHAR(20),
    email               VARCHAR(100),
    id_indirizzo        INTEGER REFERENCES Indirizzo(id_indirizzo)
        ON UPDATE CASCADE ON DELETE SET NULL
);

--Creazione tabella Persona Fisica
CREATE TABLE Persona_Fisica (
    id_passeggero       INTEGER PRIMARY KEY REFERENCES Passeggero(id_passeggero)
        ON UPDATE CASCADE ON DELETE CASCADE,
    codice_fiscale      CHAR(16) UNIQUE NOT NULL
);

--Creazione tabella Soggetto Giuridico
CREATE TABLE Soggetto_Giuridico (
    id_passeggero       INTEGER PRIMARY KEY REFERENCES Passeggero(id_passeggero)
        ON UPDATE CASCADE ON DELETE CASCADE,
    partita_iva         CHAR(11) UNIQUE NOT NULL,
    pec                 VARCHAR(100)
);

--Creazione tabella Prenotazione
CREATE TABLE Prenotazione (
    id_prenotazione     SERIAL PRIMARY KEY,
    numero_prenotazione VARCHAR(20) UNIQUE NOT NULL,
    data_prenotazione   DATE NOT NULL,
    data_partenza       DATE NOT NULL,
    ora_partenza        TIME,
    importo             DECIMAL(8,2),
    numero_passeggeri   INTEGER CHECK (numero_passeggeri > 0),
    numero_cambi        INTEGER DEFAULT 0,
    stato_prenotazione  INTEGER REFERENCES StatoPrenotazione(id_stato),
    id_passeggero       INTEGER NOT NULL REFERENCES Passeggero(id_passeggero)
        ON UPDATE CASCADE ON DELETE CASCADE
);

--Creazione tabella Stazione
CREATE TABLE Stazione (
    id_stazione         SERIAL PRIMARY KEY,
    denominazione       VARCHAR(100) NOT NULL,
    numero_binari       INTEGER CHECK (numero_binari > 0),
    capolinea           BOOLEAN DEFAULT FALSE,
    id_indirizzo        INTEGER REFERENCES Indirizzo(id_indirizzo)
        ON UPDATE CASCADE ON DELETE SET NULL
);

--Creazione tabella Biglietto
CREATE TABLE Biglietto (
    id_biglietto        SERIAL PRIMARY KEY,
    numero_biglietto    VARCHAR(20) UNIQUE NOT NULL,
    ticket              uuid NOT NULL,
    prezzo              DECIMAL(8,2) NOT NULL,
    classe              VARCHAR(20),
    fila                INTEGER,
    lettera_posto       CHAR(1),
    numero_carrozza     INTEGER,
    data_validita       DATE,
    data_validazione    DATE,
    validato            BOOLEAN DEFAULT FALSE,
    id_prenotazione     INTEGER NOT NULL REFERENCES Prenotazione(id_prenotazione)
        ON UPDATE CASCADE ON DELETE CASCADE,
    stazione_partenza   INTEGER NOT NULL REFERENCES Stazione(id_stazione)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    stazione_arrivo     INTEGER NOT NULL REFERENCES Stazione(id_stazione)
        ON UPDATE CASCADE ON DELETE RESTRICT
);


--Creazione tabella Tratta
CREATE TABLE Tratta (
    id_tratta           SERIAL PRIMARY KEY,
    tipologia           VARCHAR(50),
    data_inizio         DATE NOT NULL,
    data_fine           DATE,
    posti_disponibili   INTEGER CHECK (posti_disponibili >= 0),
    orario_partenza     TIME,
    orario_arrivo       TIME,
    id_stazione_partenza INTEGER NOT NULL REFERENCES Stazione(id_stazione)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    id_stazione_arrivo  INTEGER NOT NULL REFERENCES Stazione(id_stazione)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

--Creazione tabella Treno
CREATE TABLE Treno (
    matricola           VARCHAR(20) PRIMARY KEY,
    tipologia           VARCHAR(50),
    numero_carrozze     INTEGER CHECK (numero_carrozze > 0),
    numero_posti        INTEGER CHECK (numero_posti > 0),
    capienza            INTEGER CHECK (capienza > 0),
    id_tipologia INTEGER REFERENCES TipologiaTreno(id_tipologia),
    id_alimentazione INTEGER REFERENCES TipoAlimentazione(id_alimentazione),
    anno_costruzione    INTEGER
);

--Creazione tabella Viaggia
CREATE TABLE Viaggia (
    id_tratta           INTEGER NOT NULL REFERENCES Tratta(id_tratta)
        ON UPDATE CASCADE ON DELETE CASCADE,
    matricola_treno     VARCHAR(20) NOT NULL REFERENCES Treno(matricola)
        ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (id_tratta, matricola_treno)
);

--Creazione tabella Dipendente
CREATE TABLE Dipendente (
    matricola           VARCHAR(20) PRIMARY KEY,
    nome                VARCHAR(50) NOT NULL,
    cognome             VARCHAR(50) NOT NULL,
    sesso               CHAR(1) CHECK (sesso IN ('M', 'F')),
    data_nascita        DATE,
    data_assunzione     DATE NOT NULL,
    ruolo               INTEGER REFERENCES Ruolo(id_ruolo) ON UPDATE CASCADE ON DELETE CASCADE
);

--Creazione tabella Lavora
CREATE TABLE Lavora (
    matricola           VARCHAR(20) NOT NULL REFERENCES Dipendente(matricola)
        ON UPDATE CASCADE ON DELETE CASCADE,
    id_tratta           INTEGER NOT NULL REFERENCES Tratta(id_tratta)
        ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (matricola, id_tratta)
);
