-- ============================================================
--  DDL Per un Sistema Ferroviario
-- ============================================================

-- =====================
-- TABELLA: provincia
-- =====================
CREATE TABLE provincia (
    id SERIAL PRIMARY KEY,
    denominazione VARCHAR(100)
);

COMMENT ON TABLE provincia IS 'Contiene informazioni geografiche e di localizzazione della Provincia.';
COMMENT ON COLUMN provincia.denominazione IS 'Nome della Provincia.';

-- =====================
-- TABELLA: comune
-- =====================
CREATE TABLE comune (
    id SERIAL PRIMARY KEY,
    denominazione VARCHAR(100),
	cap VARCHAR(10)
);

COMMENT ON TABLE comune IS 'Contiene informazioni geografiche e di localizzazione del Comune.';
COMMENT ON COLUMN comune.denominazione IS 'Nome del Comune.';
COMMENT ON COLUMN comune.cap IS 'Cap del comune';

-- =====================
-- TABELLA: tipologiaTreno
-- =====================
CREATE TABLE tipologiaTreno (
    id_tipologia SERIAL PRIMARY KEY,
    descrizione VARCHAR(50) NOT NULL UNIQUE
);

-- =====================
-- TABELLA: tipoAlimentazione
-- =====================
CREATE TABLE tipoAlimentazione (
    id_alimentazione SERIAL PRIMARY KEY,
    tipo VARCHAR(20) NOT NULL CHECK (tipo IN ('ELETTRICO', 'DIESEL', 'IBRIDO'))
);

-- =====================
-- TABELLA: statoPrenotazione
-- =====================
CREATE TABLE statoPrenotazione (
    id_stato SERIAL PRIMARY KEY,
    stato VARCHAR(20) NOT NULL CHECK (stato IN ('IN PAGAMENTO', 'PAGATA', 'SCADUTA'))
);

-- =====================
-- TABELLA: ruolo
-- =====================
CREATE TABLE ruolo (
    id_ruolo SERIAL PRIMARY KEY,
    denominazione VARCHAR(50) NOT NULL UNIQUE,
    ufficio_riferimento VARCHAR(50)
);


-- =====================
-- TABELLA: indirizzo passeggero
-- =====================
CREATE TABLE indirizzo_passeggero (
    id SERIAL PRIMARY KEY,
    via VARCHAR(100),
    civico VARCHAR(10),
    citta VARCHAR(50),
    id_comune INT REFERENCES comune(id) ON DELETE SET NULL,
    id_provincia INT REFERENCES provincia(id) ON DELETE SET NULL
);

COMMENT ON TABLE indirizzo_passeggero IS 'Contiene informazioni geografiche e di localizzazione del passeggero.';
COMMENT ON COLUMN indirizzo_passeggero.via IS 'Nome della via.';
COMMENT ON COLUMN indirizzo_passeggero.civico IS 'Numero civico.';
COMMENT ON COLUMN indirizzo_passeggero.citta IS 'Denominazione della citta.';

-- =====================
-- TABELLA: indirizzo stazione
-- =====================
CREATE TABLE indirizzo_stazione (
    id SERIAL PRIMARY KEY,
    via VARCHAR(100),
    civico VARCHAR(10),
    citta VARCHAR(50),
    longitudine DECIMAL(9,6),
    latitudine DECIMAL(9,6),
    id_comune INT REFERENCES comune(id) ON DELETE SET NULL,
    id_provincia INT REFERENCES provincia(id) ON DELETE SET NULL
);

COMMENT ON TABLE indirizzo_stazione IS 'Contiene informazioni geografiche e di localizzazione della stazione.';
COMMENT ON COLUMN indirizzo_stazione.via IS 'Nome della via.';
COMMENT ON COLUMN indirizzo_stazione.civico IS 'Numero civico.';
COMMENT ON COLUMN indirizzo_stazione.citta IS 'Denominazione della citta.';
COMMENT ON COLUMN indirizzo_stazione.longitudine IS 'Longitudine';
COMMENT ON COLUMN indirizzo_stazione.latitudine IS 'Latitudine';


-- =====================
-- TABELLA: passeggero
-- =====================
CREATE TABLE passeggero (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL,
    sesso CHAR(1),
    data_nascita DATE,
    email VARCHAR(100),
    telefono VARCHAR(20),
    indirizzo_id INT REFERENCES indirizzo_passeggero(id) ON DELETE SET NULL
);

CREATE INDEX idx_passeggero_email ON passeggero(email);
COMMENT ON TABLE passeggero IS 'Contiene i dati anagrafici e di contatto dei passeggeri.';


-- =====================
-- TABELLA: persona_fisica
-- =====================
CREATE TABLE persona_fisica (
    passeggero_id INT PRIMARY KEY REFERENCES passeggero(id) ON DELETE CASCADE,
    codice_fiscale VARCHAR(16) UNIQUE NOT NULL
);

COMMENT ON TABLE persona_fisica IS 'Estensione di passeggero per persone fisiche.';


-- =====================
-- TABELLA: soggetto_giuridico
-- =====================
CREATE TABLE soggetto_giuridico (
    passeggero_id INT PRIMARY KEY REFERENCES passeggero(id) ON DELETE CASCADE,
    partita_iva VARCHAR(20) UNIQUE NOT NULL,
    pec VARCHAR(100)
);

COMMENT ON TABLE soggetto_giuridico IS 'Estensione di passeggero per soggetti giuridici.';


-- =====================
-- TABELLA: stazione
-- =====================
CREATE TABLE stazione (
    codice_stazione SERIAL PRIMARY KEY,
    denominazione VARCHAR(100) NOT NULL,
    numero_binari INT,
    capolinea BOOLEAN DEFAULT FALSE,
    indirizzo_id INT REFERENCES indirizzo_stazione(id) ON DELETE SET NULL
);

COMMENT ON TABLE stazione IS 'Contiene le informazioni delle stazioni ferroviarie.';


-- =====================
-- TABELLA: prenotazione
-- =====================
CREATE TABLE prenotazione (
    numero_prenotazione SERIAL PRIMARY KEY,
    data_prenotazione DATE NOT NULL,
    data_partenza DATE,
    ora_partenza TIME,
    numero_passaggeri INT,
    numero_cambi INT,
    stato_prenotazione INT REFERENCES statoPrenotazione(id_stato) ON DELETE CASCADE,
    importo DECIMAL(10,2),
    passeggero_id INT REFERENCES passeggero(id) ON DELETE CASCADE
);

CREATE INDEX idx_prenotazione_passeggero ON prenotazione(passeggero_id);
COMMENT ON TABLE prenotazione IS 'Rappresenta la prenotazione effettuata da un passeggero.';


-- =====================
-- TABELLA: treno
-- =====================
CREATE TABLE treno (
    matricola SERIAL PRIMARY KEY,
    tipologia INT REFERENCES tipologiaTreno(id_tipologia) ON DELETE CASCADE,
    numero_carrozze INT,
    numero_posti INT,
    anno_costruzione INT,
    alimentazione INT REFERENCES tipoAlimentazione(id_alimentazione) ON DELETE CASCADE
);

COMMENT ON TABLE treno IS 'Contiene le informazioni dei treni disponibili.';


-- =====================
-- TABELLA: tratta
-- =====================
CREATE TABLE tratta (
    codice_tratta SERIAL PRIMARY KEY,
    data_inizio DATE,
    data_fine DATE,
    tipologia VARCHAR(30),
    orario_partenza TIME,
    orario_arrivo TIME,
    posti_disponibili INT,
    stazione_partenza_id INT REFERENCES stazione(codice_stazione) ON DELETE RESTRICT,
    stazione_arrivo_id INT REFERENCES stazione(codice_stazione) ON DELETE RESTRICT,
    treno_id INT REFERENCES treno(matricola) ON DELETE CASCADE
);

COMMENT ON TABLE tratta IS 'Definisce una tratta ferroviaria tra due stazioni.';


-- =====================
-- TABELLA: fermata
-- =====================
CREATE TABLE fermata (
    id SERIAL PRIMARY KEY,
    codice_tratta INT REFERENCES tratta(codice_tratta) ON DELETE CASCADE,
    codice_stazione INT REFERENCES stazione(codice_stazione) ON DELETE CASCADE
);

CREATE INDEX idx_fermata_tratta ON fermata(codice_tratta);
CREATE INDEX idx_fermata_stazione ON fermata(codice_stazione);
COMMENT ON TABLE fermata IS 'Rappresenta le fermate intermedie di una tratta.';


-- =====================
-- TABELLA: tariffa
-- =====================
CREATE TABLE tariffa (
    id SERIAL PRIMARY KEY,
    importo DECIMAL(10,2),
    data_inizio_periodo DATE,
    data_fine_periodo DATE
);

COMMENT ON TABLE tariffa IS 'Contiene le tariffe applicate alle tratte ferroviarie.';


-- =====================
-- TABELLA: tratta_tariffa
-- =====================
CREATE TABLE tratta_tariffa (
    tratta_id INT REFERENCES tratta(codice_tratta) ON DELETE CASCADE,
    tariffa_id INT REFERENCES tariffa(id) ON DELETE CASCADE,
    PRIMARY KEY (tratta_id, tariffa_id)
);

COMMENT ON TABLE tratta_tariffa IS 'Associazione N:N tra tratte e tariffe.';


-- =====================
-- TABELLA: dipendente
-- =====================
CREATE TABLE dipendente (
    matricola SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL,
    sesso CHAR(1),
    data_nascita DATE,
    data_assunzione DATE,
	ruolo INT REFERENCES ruolo(id_ruolo) ON DELETE CASCADE
);

COMMENT ON TABLE dipendente IS 'Contiene i dati anagrafici dei dipendenti.';


-- =====================
-- TABELLA: lavora (dipendente-tratta)
-- =====================
CREATE TABLE lavora (
    dipendente_id INT REFERENCES dipendente(matricola) ON DELETE CASCADE,
    tratta_id INT REFERENCES tratta(codice_tratta) ON DELETE CASCADE,
    data_inizio DATE,
    data_fine DATE,
    PRIMARY KEY (dipendente_id, tratta_id)
);

COMMENT ON TABLE lavora IS 'Relazione N:N tra dipendenti e tratte.';


-- =====================
-- TABELLA: biglietto
-- =====================
CREATE TABLE biglietto (
    codice SERIAL PRIMARY KEY,
    numero_carrozza INT,
    fila VARCHAR(5),
    lettera_posto CHAR(1),
    classe VARCHAR(10),
    prezzo DECIMAL(10,2),
    token VARCHAR(255),
    data_validita DATE,
    data_validazione DATE,
    validato BOOLEAN DEFAULT FALSE,
    prenotazione_id INT REFERENCES prenotazione(numero_prenotazione) ON DELETE CASCADE,
    stazione_partenza_id INT REFERENCES stazione(codice_stazione) ON DELETE RESTRICT,
    stazione_arrivo_id INT REFERENCES stazione(codice_stazione) ON DELETE RESTRICT
);

CREATE INDEX idx_biglietto_prenotazione ON biglietto(prenotazione_id);
COMMENT ON TABLE biglietto IS 'Biglietto generato a seguito di una prenotazione.';
