-- ============================================================
--  DDL Per un Sistema Ferroviario - Creazione di viste utili per le operazioni frequenti
-- ============================================================

-- ============================================================
--  View per la visualizzazione delle prenotazioni con i dati del passeggero e lo stato
-- ============================================================
CREATE OR REPLACE VIEW vw_prenotazioni_dettaglio AS
SELECT 
    p.numero_prenotazione,
    p.data_prenotazione,
    p.data_partenza,
    p.ora_partenza,
    p.importo,
    sp.stato AS stato_prenotazione,
    pas.nome,
    pas.cognome,
    pas.email,
    pas.telefono
FROM prenotazione p
JOIN statoPrenotazione sp ON p.stato_prenotazione = sp.id_stato
JOIN passeggero pas ON p.passeggero_id = pas.id;

-- ============================================================
--  View per la visualizzazione dei biglietti con stato di validazione e informazioni sul viaggio
-- ============================================================
CREATE OR REPLACE VIEW vw_biglietti_dettaglio AS
SELECT 
    b.codice AS codice_biglietto,
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
FROM biglietto b
JOIN prenotazione pr ON b.prenotazione_id = pr.numero_prenotazione
JOIN passeggero pas ON pr.passeggero_id = pas.id
JOIN stazione sp ON b.stazione_partenza_id = sp.codice_stazione
JOIN stazione sa ON b.stazione_arrivo_id = sa.codice_stazione;

-- ============================================================
--  View per la visualizzazione delle informazioni di contatto e indirizzo di ogni passeggero
-- ============================================================
CREATE OR REPLACE VIEW vw_passeggeri_dettaglio AS
SELECT 
    p.id AS passeggero_id,
    p.nome,
    p.cognome,
    p.email,
    p.telefono,
    i.via,
    i.civico,
    i.citta,
    c.denominazione AS comune,
    pr.denominazione AS provincia
FROM passeggero p
LEFT JOIN indirizzo_passeggero i ON p.indirizzo_id = i.id
LEFT JOIN comune c ON i.id_comune = c.id
LEFT JOIN provincia pr ON i.id_provincia = pr.id;


-- ============================================================
--  View per la visualizzazione delle informazioni sulle tratte, con stazioni e treni
-- ============================================================
CREATE OR REPLACE VIEW vw_tratte_dettaglio AS
SELECT 
    t.codice_tratta,
    sp.denominazione AS stazione_partenza,
    sa.denominazione AS stazione_arrivo,
    t.orario_partenza,
    t.orario_arrivo,
    tr.matricola AS treno_id,
    tt.descrizione AS tipologia_treno,
    tr.numero_posti,
    tr.numero_carrozze
FROM tratta t
JOIN stazione sp ON t.stazione_partenza_id = sp.codice_stazione
JOIN stazione sa ON t.stazione_arrivo_id = sa.codice_stazione
JOIN treno tr ON t.treno_id = tr.matricola
JOIN tipologiaTreno tt ON tr.tipologia = tt.id_tipologia;

-- ============================================================
--  View per la visualizzazione delle tariffe per ogni tratta
-- ============================================================
CREATE OR REPLACE VIEW vw_tratte_tariffe AS
SELECT 
    t.codice_tratta,
    sp.denominazione AS stazione_partenza,
    sa.denominazione AS stazione_arrivo,
    ta.importo,
    ta.data_inizio_periodo,
    ta.data_fine_periodo
FROM tratta_tariffa tt
JOIN tratta t ON tt.tratta_id = t.codice_tratta
JOIN tariffa ta ON tt.tariffa_id = ta.id
JOIN stazione sp ON t.stazione_partenza_id = sp.codice_stazione
JOIN stazione sa ON t.stazione_arrivo_id = sa.codice_stazione;