--Creazione tabella Indirizzo
CREATE TABLE Indirizzo (
    id_indirizzo        SERIAL PRIMARY KEY,
    via                 VARCHAR(100) NOT NULL,
    civico              VARCHAR(10),
    cap                 CHAR(5),
    citta               VARCHAR(50) NOT NULL,
    comune              VARCHAR(50),
    provincia           CHAR(2),
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
    stato_prenotazione  VARCHAR(20) CHECK (stato_prenotazione IN ('CREATA', 'PAGATA', 'ANNULLATA')),
    importo             DECIMAL(8,2),
    numero_passeggeri   INTEGER CHECK (numero_passeggeri > 0),
    numero_cambi        INTEGER DEFAULT 0,
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
    capienza            INTEGER,
    alimentazione       VARCHAR(20) CHECK (alimentazione IN ('ELETTRICO', 'DIESEL', 'IBRIDO')),
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
    ruolo               VARCHAR(50)
);

--Creazione tabella Operatore
CREATE TABLE Operatore (
    matricola           VARCHAR(20) PRIMARY KEY REFERENCES Dipendente(matricola)
        ON UPDATE CASCADE ON DELETE CASCADE,
    tipologia           VARCHAR(50)
);

--Creazione tabella Amministrativo
CREATE TABLE Amministrativo (
    matricola           VARCHAR(20) PRIMARY KEY REFERENCES Dipendente(matricola)
        ON UPDATE CASCADE ON DELETE CASCADE,
    ufficio             VARCHAR(100)
);

--Creazione tabella Lavora
CREATE TABLE Lavora (
    matricola           VARCHAR(20) NOT NULL REFERENCES Dipendente(matricola)
        ON UPDATE CASCADE ON DELETE CASCADE,
    id_tratta           INTEGER NOT NULL REFERENCES Tratta(id_tratta)
        ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (matricola, id_tratta)
);
