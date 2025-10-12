-- ============================================================
--  DDL Per un Sistema Ferroviario - Creazione di Indici per ottimizzare ricerche
-- ============================================================

-- ============================================================
--  Ottimizzazione ricerche per comune e province
-- ============================================================
CREATE INDEX idx_provincia_denom ON provincia(denominazione);
CREATE INDEX idx_comune_denom ON comune(denominazione);
CREATE INDEX idx_comune_cap ON comune(cap);

-- ============================================================
--  Ottimizzazione ricerche passeggero
-- ============================================================
CREATE INDEX idx_indirizzo_passeggero_comune ON indirizzo_passeggero(id_comune);
CREATE INDEX idx_indirizzo_passeggero_provincia ON indirizzo_passeggero(id_provincia);
CREATE INDEX idx_indirizzo_stazione_comune ON indirizzo_stazione(id_comune);
CREATE INDEX idx_indirizzo_stazione_provincia ON indirizzo_stazione(id_provincia);
CREATE INDEX idx_passeggero_nome_cognome ON passeggero(nome, cognome);
CREATE INDEX idx_persona_fisica_cf ON persona_fisica(codice_fiscale);
CREATE INDEX idx_soggetto_giuridico_piva ON soggetto_giuridico(partita_iva);

-- ============================================================
--  Ottimizzazione ricerche per prenotazioni
-- ============================================================
CREATE INDEX idx_prenotazione_data ON prenotazione(data_prenotazione);
CREATE INDEX idx_prenotazione_stato ON prenotazione(stato_prenotazione);
CREATE INDEX idx_prenotazione_data_partenza ON prenotazione(data_partenza, ora_partenza);

-- ============================================================
--  Ottimizzazione ricerche per tratte
-- ============================================================
CREATE INDEX idx_tratta_stazioni ON tratta(stazione_partenza_id, stazione_arrivo_id);
CREATE INDEX idx_tratta_treno ON tratta(treno_id);
CREATE INDEX idx_tratta_date ON tratta(data_inizio, data_fine);
CREATE INDEX idx_tratta_orario ON tratta(orario_partenza, orario_arrivo);

-- ============================================================
--  Ottimizzazione ricerche per tariffa
-- ============================================================
CREATE INDEX idx_tariffa_periodo ON tariffa(data_inizio_periodo, data_fine_periodo);

-- ============================================================
--  Ottimizzazione ricerche per biglietto
-- ============================================================
CREATE INDEX idx_biglietto_validato ON biglietto(validato);
CREATE INDEX idx_biglietto_date ON biglietto(data_validita, data_validazione);
CREATE INDEX idx_biglietto_stazioni ON biglietto(stazione_partenza_id, stazione_arrivo_id);