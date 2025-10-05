INSERT INTO Indirizzo (via, civico, cap, citta, comune, provincia, latitudine, longitudine)
VALUES
('Via Roma', '12', '00184', 'Roma', 'Roma', 'RM', 41.9028, 12.4964),
('Corso Vittorio Emanuele', '45', '20121', 'Milano', 'Milano', 'MI', 45.4642, 9.1900),
('Via Garibaldi', '10', '50123', 'Firenze', 'Firenze', 'FI', 43.7696, 11.2558),
('Piazza del Duomo', '1', '80134', 'Napoli', 'Napoli', 'NA', 40.8518, 14.2681);


INSERT INTO Passeggero (nome, cognome, sesso, data_nascita, telefono, email, id_indirizzo)
VALUES
('Luca', 'Bianchi', 'M', '1985-06-15', '3331112233', 'luca.bianchi@email.it', 1),
('Maria', 'Rossi', 'F', '1990-02-10', '3334445566', 'maria.rossi@email.it', 2),
('Giovanni', 'Verdi', 'M', '1978-09-30', '3397778899', 'giovanni.verdi@email.it', 3),
('Anna', 'Neri', 'F', '1995-04-21', '3311234567', 'anna.neri@email.it', 4);


-- Persone fisiche
INSERT INTO Persona_Fisica (id_passeggero, codice_fiscale)
VALUES
(1, 'BNCLCU85H15H501Z'),
(2, 'RSSMRA90B50F205P'),
(3, 'VRDGNN78P30D612T');

-- Soggetto giuridico (azienda come passeggero)
INSERT INTO Soggetto_Giuridico (id_passeggero, partita_iva, pec)
VALUES
(4, '01234567890', 'info@nerisrl.pec.it');


INSERT INTO Stazione (denominazione, numero_binari, capolinea, id_indirizzo)
VALUES
('Roma Termini', 30, TRUE, 1),
('Milano Centrale', 24, TRUE, 2),
('Firenze Santa Maria Novella', 19, FALSE, 3),
('Napoli Centrale', 25, TRUE, 4);


INSERT INTO Treno (matricola, tipologia, numero_carrozze, numero_posti, capienza, alimentazione, anno_costruzione)
VALUES
('TRN1001', 'Frecciarossa', 8, 500, 520, 'ELETTRICO', 2019),
('TRN2002', 'Intercity', 10, 600, 620, 'DIESEL', 2015),
('TRN3003', 'Regionale', 6, 300, 320, 'IBRIDO', 2021);


INSERT INTO Tratta (tipologia, data_inizio, data_fine, posti_disponibili, orario_partenza, orario_arrivo, id_stazione_partenza, id_stazione_arrivo)
VALUES
('Alta Velocità', '2025-01-01', NULL, 200, '08:00', '10:30', 1, 2),
('Interregionale', '2025-01-01', NULL, 150, '11:00', '13:00', 2, 3),
('Regionale', '2025-01-01', NULL, 120, '14:00', '16:30', 3, 4);


INSERT INTO Viaggia (id_tratta, matricola_treno)
VALUES
(1, 'TRN1001'),
(2, 'TRN2002'),
(3, 'TRN3003');


INSERT INTO Prenotazione (numero_prenotazione, data_prenotazione, data_partenza, ora_partenza, stato_prenotazione, importo, numero_passeggeri, numero_cambi, id_passeggero)
VALUES
('PRN001', '2025-10-01', '2025-10-10', '08:00', 'PAGATA', 79.90, 1, 0, 1),
('PRN002', '2025-10-02', '2025-10-12', '14:00', 'CREATA', 49.50, 2, 0, 2),
('PRN003', '2025-10-03', '2025-10-15', '11:00', 'CREATA', 65.00, 1, 1, 3);


INSERT INTO Biglietto (numero_biglietto, prezzo, classe, fila, lettera_posto, numero_carrozza, data_validita, validato, id_prenotazione, stazione_partenza, stazione_arrivo)
VALUES
('BGL001', 79.90, '1ª Classe', 3, 'A', 2, '2025-10-10', TRUE, 1, 1, 2),
('BGL002', 24.75, '2ª Classe', 10, 'C', 4, '2025-10-12', FALSE, 2, 2, 3),
('BGL003', 24.75, '2ª Classe', 10, 'D', 4, '2025-10-12', FALSE, 2, 2, 3),
('BGL004', 65.00, '1ª Classe', 5, 'B', 1, '2025-10-15', FALSE, 3, 3, 4);


-- Dipendenti
INSERT INTO Dipendente (matricola, nome, cognome, sesso, data_nascita, data_assunzione, ruolo)
VALUES
('DIP001', 'Franco', 'Belli', 'M', '1980-05-12', '2010-03-01', 'Macchinista'),
('DIP002', 'Laura', 'Gentili', 'F', '1988-08-09', '2015-06-15', 'Capotreno'),
('DIP003', 'Marco', 'Russo', 'M', '1992-12-20', '2019-02-10', 'Amministrativo');

-- Operatori
INSERT INTO Operatore (matricola, tipologia)
VALUES
('DIP001', 'Conduttore'),
('DIP002', 'Assistente bordo');

-- Amministrativi
INSERT INTO Amministrativo (matricola, ufficio)
VALUES
('DIP003', 'Ufficio Prenotazioni');

-- Lavora (dipendenti assegnati a tratte)
INSERT INTO Lavora (matricola, id_tratta)
VALUES
('DIP001', 1),
('DIP002', 1),
('DIP003', 2);
