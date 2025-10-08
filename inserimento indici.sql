-- ============================================
-- Indici su chiavi esterne per JOIN veloci
-- ============================================
CREATE INDEX idx_comune_provincia ON Comune(provincia);
CREATE INDEX idx_indirizzo_provincia ON Indirizzo(id_provincia);
CREATE INDEX idx_indirizzo_comune ON Indirizzo(id_comune);
CREATE INDEX idx_passeggero_indirizzo ON Passeggero(id_indirizzo);
CREATE INDEX idx_prenotazione_passeggero ON Prenotazione(id_passeggero);
CREATE INDEX idx_prenotazione_stato ON Prenotazione(stato_prenotazione);
CREATE INDEX idx_stazione_indirizzo ON Stazione(id_indirizzo);
CREATE INDEX idx_biglietto_prenotazione ON Biglietto(id_prenotazione);
CREATE INDEX idx_biglietto_partenza ON Biglietto(stazione_partenza);
CREATE INDEX idx_biglietto_arrivo ON Biglietto(stazione_arrivo);
CREATE INDEX idx_tratta_partenza ON Tratta(id_stazione_partenza);


-- ============================================
-- Indici su colonne frequentemente ricercate
-- ============================================
CREATE INDEX idx_prenotazione_data_partenza ON Prenotazione(data_partenza);
CREATE INDEX idx_prenotazione_numero_prenotazione ON Prenotazione(numero_prenotazione);
CREATE INDEX idx_biglietto_numero_biglietto ON Biglietto(numero_biglietto);
CREATE INDEX idx_biglietto_ticket ON Biglietto(ticket);
CREATE INDEX idx_passeggero_cognome ON Passeggero(cognome);
CREATE INDEX idx_passeggero_email ON Passeggero(email);


-- ============================================
-- Indici su colonne usate in ordinamenti frequenti
-- ============================================
CREATE INDEX idx_tratta_data_inizio ON Tratta(data_inizio);
CREATE INDEX idx_tratta_orario_partenza ON Tratta(orario_partenza);
CREATE INDEX idx_tratta_orario_arrivo ON Tratta(orario_arrivo);
CREATE INDEX idx_dipendente_data_assunzione ON Dipendente(data_assunzione);