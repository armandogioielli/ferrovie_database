-- ============================================
-- Inserimento dati Provincia 
-- ============================================
INSERT INTO Provincia (sigla, denominazione) VALUES
('RM', 'Roma'),
('MI', 'Milano'),
('NA', 'Napoli'),
('TO', 'Torino'),
('FI', 'Firenze'),
('VE', 'Venezia'),
('BO', 'Bologna'),
('GE', 'Genova'),
('PA', 'Palermo'),
('CT', 'Catania'),
('VR', 'Verona'),
('PD', 'Padova'),
('AN', 'Ancona'),
('TR', 'Trieste'),
('BS', 'Brescia'),
('SA', 'Salerno'),
('LE', 'Lecce'),
('AR', 'Arezzo'),
('LI', 'Livorno'),
('PG', 'Perugia');

-- ============================================
-- Inserimento dati Comune 
-- ============================================
INSERT INTO Comune (nome, provincia) VALUES
('Roma', 1),
('Fiumicino', 1),
('Milano', 2),
('Monza', 2),
('Napoli', 3),
('Pozzuoli', 3),
('Torino', 4),
('Alessandria', 4),
('Firenze', 5),
('Prato', 5),
('Venezia', 6),
('Mestre', 6),
('Bologna', 7),
('Modena', 7),
('Genova', 8),
('Savona', 8),
('Palermo', 9),
('Monreale', 9),
('Catania', 10),
('Acireale', 10);

-- ============================================
-- Inserimento dati TipologiaTreno
-- ============================================
INSERT INTO TipologiaTreno (descrizione) VALUES
('Frecciarossa'),
('Frecciargento'),
('Intercity'),
('Regionale Veloce'),
('Regionale'),
('Alta Velocita'),
('Eurostar'),
('Notte'),
('Cargo'),
('Shuttle'),
('Treno Turistico'),
('Pendolino'),
('Espresso'),
('Intercity Notte'),
('Metropolitano'),
('Treno Locale'),
('Rapido'),
('Speciale'),
('Storia'),
('Treno Panoramico');

-- ============================================
-- Inserimento dati TipoAlimentazione
-- ============================================
INSERT INTO TipoAlimentazione (tipo) VALUES
('ELETTRICO'),
('DIESEL'),
('IBRIDO');

-- ============================================
-- Inserimento dati StatoPrenotazione
-- ============================================
INSERT INTO StatoPrenotazione (stato) VALUES
('IN PAGAMENTO'),
('PAGATA'),
('SCADUTA');

-- ============================================
-- Inserimento dati Ruolo
-- ============================================
INSERT INTO Ruolo (denominazione, postazione) VALUES
('Macchinista', 'Locomotiva'),
('CapoTreno', 'Carrozza 1'),
('Controllore', 'Carrozza 2'),
('AddettoBiglietteria', 'Stazione'),
('PersonalePulizia', 'Treno'),
('AddettoManutenzione', 'Deposito'),
('ResponsabileTurno', 'Stazione Centrale'),
('AssistenteViaggio', 'Treno'),
('CapoStazione', 'Ufficio'),
('AddettoSicurezza', 'Treno'),
('TecnicoSegnalamento', 'Stazione'),
('CoordinatoreTurni', 'Stazione Centrale'),
('ImpiegatoUfficio', 'Stazione'),
('AutistaShuttle', 'Treno Locale'),
('PersonaleRistorazione', 'Treno'),
('AddettoInformazioni', 'Stazione'),
('AddettoBinari', 'Stazione'),
('CapoPersonale', 'Stazione'),
('AssistenteViaggioNotte', 'Treno Notte'),
('AddettoEmergenze', 'Treno');

-- ============================================
-- Inserimento dati Indirizzo
-- ============================================
INSERT INTO Indirizzo (via, civico, cap, id_provincia, id_comune, latitudine, longitudine) VALUES
('Via Roma', '1', '00100', 1, 1, 41.902782, 12.496366),
('Via Milano', '10', '20100', 2, 3, 45.464211, 9.191383),
('Via Napoli', '5', '80100', 3, 5, 40.851798, 14.268120),
('Via Torino', '7', '10100', 4, 7, 45.070339, 7.686864),
('Via Firenze', '2', '50100', 5, 9, 43.769562, 11.255814),
('Via Venezia', '8', '30100', 6, 11, 45.440847, 12.315515),
('Via Bologna', '12', '40100', 7, 13, 44.494887, 11.342616),
('Via Genova', '6', '16100', 8, 15, 44.405650, 8.946256),
('Via Palermo', '4', '90100', 9, 17, 38.115688, 13.361267),
('Via Catania', '9', '95100', 10, 19, 37.507877, 15.083030),
('Via Mestre', '11', '30172', 6, 12, 45.495000, 12.229000),
('Via Modena', '3', '41100', 7, 14, 44.647128, 10.925227),
('Via Savona', '14', '17100', 8, 16, 44.309060, 8.477180),
('Via Monreale', '15', '90046', 9, 18, 38.080000, 13.298000),
('Via Acireale', '16', '95024', 10, 20, 37.583000, 15.255000),
('Via Lecce', '17', '73100', 17, 17, 40.351000, 18.174000),
('Via Arezzo', '18', '52100', 18, 18, 43.463000, 11.879000),
('Via Livorno', '19', '57100', 19, 19, 43.548000, 10.310000),
('Via Perugia', '20', '06100', 20, 20, 43.112000, 12.388000),
('Via Brescia', '20', '25100', 15, 15, 45.541000, 10.211000);

-- ============================================
-- Inserimento dati Passeggero
-- ============================================
INSERT INTO Passeggero (nome, cognome, sesso, data_nascita, telefono, email, id_indirizzo) VALUES
('Mario', 'Rossi', 'M', '1980-05-12', '0601234567', 'mario.rossi@example.com', 1),
('Lucia', 'Bianchi', 'F', '1990-03-20', '0265432109', 'lucia.bianchi@example.com', 2),
('Giuseppe', 'Verdi', 'M', '1975-11-05', '0812345678', 'giuseppe.verdi@example.com', 3),
('Francesca', 'Neri', 'F', '1985-06-17', '0119876543', 'francesca.neri@example.com', 4),
('Alessandro', 'Galli', 'M', '1992-12-30', '0551234567', 'alessandro.galli@example.com', 5),
('Chiara', 'Costa', 'F', '1988-08-21', '0419876543', 'chiara.costa@example.com', 6),
('Luca', 'Fontana', 'M', '1983-09-15', '0511234567', 'luca.fontana@example.com', 7),
('Martina', 'Ferrari', 'F', '1995-07-10', '0109876543', 'martina.ferrari@example.com', 8),
('Stefano', 'Marini', 'M', '1978-02-25', '0911234567', 'stefano.marini@example.com', 9),
('Elisa', 'Barbieri', 'F', '1991-01-08', '0959876543', 'elisa.barbieri@example.com', 10),
('Andrea', 'Rinaldi', 'M', '1984-04-14', '0451234567', 'andrea.rinaldi@example.com', 11),
('Sara', 'Romano', 'F', '1987-09-09', '0499876543', 'sara.romano@example.com', 12),
('Davide', 'Moretti', 'M', '1993-10-22', '0591234567', 'davide.moretti@example.com', 13),
('Valentina', 'Conti', 'F', '1982-03-30', '0199876543', 'valentina.conti@example.com', 14),
('Matteo', 'De Luca', 'M', '1979-06-06', '0101234567', 'matteo.deluca@example.com', 15),
('Federica', 'Grassi', 'F', '1994-12-12', '0819876543', 'federica.grassi@example.com', 16),
('Simone', 'Bellini', 'M', '1981-11-11', '0561234567', 'simone.bellini@example.com', 17),
('Ilaria', 'Longo', 'F', '1990-05-05', '0579876543', 'ilaria.longo@example.com', 18),
('Riccardo', 'Marchetti', 'M', '1986-08-18', '0301234567', 'riccardo.marchetti@example.com', 19),
('Giulia', 'Villa', 'F', '1992-02-28', '0759876543', 'giulia.villa@example.com', 20);

-- ============================================
-- Inserimento dati Persona_Fisica
-- ============================================
INSERT INTO Persona_Fisica (id_passeggero, codice_fiscale) VALUES
(1,'RSSMRA80A12H501U'),
(2,'BNCLCU90C60F205X'),
(3,'VRDGPP75E05F839S'),
(4,'NRIFNC85H57G273Y'),
(5,'GLLLSD92T30D612Z'),
(6,'CSTCHR88M61L736W'),
(7,'FNTLCU83P15B325D'),
(8,'FRRMTN95L10C351K'),
(9,'MRNSTF78B25F839R'),
(10,'BRBELS91A08C351L'),
(11,'RNLNDR84D14H501M'),
(12,'RMNSRA87P09F205N'),
(13,'MRTDVD93R22G273V'),
(14,'CNTVLN82C30L736B'),
(15,'DLCMTE79H06C351X'),
(16,'GRSFDR94T12A609S'),
(17,'BLNSMN81P11D612F'),
(18,'LNGLRI90E05D612K'),
(19,'MRCRCD86M18F205J'),
(20,'VLLGLL92B28H501Q');

-- ============================================
-- Inserimento dati Soggetto_Giuridico
-- ============================================
INSERT INTO Soggetto_Giuridico (id_passeggero, partita_iva, pec) VALUES
(1,'12345678901','azienda1@pec.it'),
(2,'12345678902','azienda2@pec.it'),
(3,'12345678903','azienda3@pec.it'),
(4,'12345678904','azienda4@pec.it'),
(5,'12345678905','azienda5@pec.it'),
(6,'12345678906','azienda6@pec.it'),
(7,'12345678907','azienda7@pec.it'),
(8,'12345678908','azienda8@pec.it'),
(9,'12345678909','azienda9@pec.it'),
(10,'12345678910','azienda10@pec.it'),
(11,'12345678911','azienda11@pec.it'),
(12,'12345678912','azienda12@pec.it'),
(13,'12345678913','azienda13@pec.it'),
(14,'12345678914','azienda14@pec.it'),
(15,'12345678915','azienda15@pec.it'),
(16,'12345678916','azienda16@pec.it'),
(17,'12345678917','azienda17@pec.it'),
(18,'12345678918','azienda18@pec.it'),
(19,'12345678919','azienda19@pec.it'),
(20,'12345678920','azienda20@pec.it');

-- ============================================
-- Inserimento dati Prenotazione 
-- ============================================
INSERT INTO Prenotazione (numero_prenotazione, data_prenotazione, data_partenza, ora_partenza, importo, numero_passeggeri, numero_cambi, stato_prenotazione, id_passeggero) VALUES
('PNR001','2025-09-01','2025-09-10','08:30',50.00,1,0,1,1),
('PNR002','2025-09-02','2025-09-12','09:00',75.00,2,0,2,2),
('PNR003','2025-09-03','2025-09-15','14:30',60.50,1,1,3,3),
('PNR004','2025-09-04','2025-09-18','07:15',90.00,3,0,1,4),
('PNR005','2025-09-05','2025-09-20','16:00',45.00,1,0,2,5),
('PNR006','2025-09-06','2025-09-22','12:00',120.00,2,1,3,6),
('PNR007','2025-09-07','2025-09-25','10:30',35.50,1,0,1,7),
('PNR008','2025-09-08','2025-09-28','15:45',55.00,2,0,2,8),
('PNR009','2025-09-09','2025-09-30','11:00',65.00,1,1,3,9),
('PNR010','2025-09-10','2025-10-02','09:30',80.00,2,0,1,10),
('PNR011','2025-09-11','2025-10-05','13:15',70.00,1,0,2,11),
('PNR012','2025-09-12','2025-10-08','17:00',95.00,3,0,3,12),
('PNR013','2025-09-13','2025-10-10','08:00',50.00,1,0,1,13),
('PNR014','2025-09-14','2025-10-12','12:30',60.00,1,1,2,14),
('PNR015','2025-09-15','2025-10-15','14:00',85.00,2,0,3,15),
('PNR016','2025-09-16','2025-10-18','16:30',55.50,1,0,1,16),
('PNR017','2025-09-17','2025-10-20','09:45',45.00,1,0,2,17),
('PNR018','2025-09-18','2025-10-22','07:30',110.00,2,1,3,18),
('PNR019','2025-09-19','2025-10-25','15:00',95.00,3,0,1,19),
('PNR020','2025-09-20','2025-10-28','18:15',120.00,2,0,2,20);

-- ============================================
-- Inserimento dati Stazione 
-- ============================================
INSERT INTO Stazione (denominazione, numero_binari, capolinea, id_indirizzo) VALUES
('Roma Termini', 20, TRUE, 1),
('Milano Centrale', 24, TRUE, 3),
('Napoli Centrale', 15, TRUE, 5),
('Torino Porta Nuova', 18, TRUE, 7),
('Firenze Santa Maria Novella', 12, TRUE, 9),
('Venezia Mestre', 10, FALSE, 11),
('Bologna Centrale', 14, TRUE, 13),
('Genova Piazza Principe', 11, TRUE, 15),
('Palermo Centrale', 9, TRUE, 17),
('Catania Centrale', 8, TRUE, 19),
('Fiumicino Aeroporto', 6, FALSE, 2),
('Monza', 4, FALSE, 4),
('Pozzuoli', 3, FALSE, 6),
('Alessandria', 5, FALSE, 8),
('Prato Centrale', 7, FALSE, 10),
('Mestre Centro', 6, FALSE, 12),
('Modena', 5, FALSE, 14),
('Savona', 4, FALSE, 16),
('Monreale', 3, FALSE, 18),
('Acireale', 2, FALSE, 20);

-- ============================================
-- Inserimento dati Biglietto 
-- ============================================
INSERT INTO Biglietto (numero_biglietto, ticket, prezzo, classe, fila, lettera_posto, numero_carrozza, data_validita, data_validazione, validato, id_prenotazione, stazione_partenza, stazione_arrivo) VALUES
('BT001', gen_random_uuid(), 25.50, 'Economy', 5, 'A', 1, '2025-09-10','2025-09-10', TRUE, 1, 1, 2),
('BT002', gen_random_uuid(), 50.00, 'Business', 3, 'B', 2, '2025-09-12','2025-09-12', TRUE, 2, 3, 4),
('BT003', gen_random_uuid(), 35.00, 'Economy', 10, 'C', 1, '2025-09-15','2025-09-15', TRUE, 3, 5, 6),
('BT004', gen_random_uuid(), 70.00, 'First', 2, 'D', 3, '2025-09-18','2025-09-18', TRUE, 4, 7, 8),
('BT005', gen_random_uuid(), 40.00, 'Economy', 8, 'E', 2, '2025-09-20','2025-09-20', TRUE, 5, 9, 10),
('BT006', gen_random_uuid(), 60.00, 'Business', 4, 'F', 3, '2025-09-22','2025-09-22', TRUE, 6, 11, 12),
('BT007', gen_random_uuid(), 30.00, 'Economy', 6, 'G', 1, '2025-09-25','2025-09-25', TRUE, 7, 1, 3),
('BT008', gen_random_uuid(), 55.50, 'Business', 5, 'H', 2, '2025-09-28','2025-09-28', TRUE, 8, 2, 4),
('BT009', gen_random_uuid(), 45.00, 'Economy', 7, 'I', 1, '2025-09-30','2025-09-30', TRUE, 9, 5, 7),
('BT010', gen_random_uuid(), 80.00, 'First', 1, 'J', 3, '2025-10-02','2025-10-02', TRUE, 10, 3, 6),
('BT011', gen_random_uuid(), 65.00, 'Business', 4, 'K', 2, '2025-10-05','2025-10-05', TRUE, 11, 7, 9),
('BT012', gen_random_uuid(), 75.00, 'First', 2, 'L', 3, '2025-10-08','2025-10-08', TRUE, 12, 1, 4),
('BT013', gen_random_uuid(), 50.00, 'Economy', 3, 'M', 1, '2025-10-10','2025-10-10', TRUE, 13, 2, 5),
('BT014', gen_random_uuid(), 60.00, 'Business', 5, 'N', 2, '2025-10-12','2025-10-12', TRUE, 14, 3, 6),
('BT015', gen_random_uuid(), 85.00, 'First', 1, 'O', 3, '2025-10-15','2025-10-15', TRUE, 15, 4, 7),
('BT016', gen_random_uuid(), 55.00, 'Economy', 6, 'P', 1, '2025-10-18','2025-10-18', TRUE, 16, 5, 8),
('BT017', gen_random_uuid(), 45.00, 'Economy', 7, 'Q', 1, '2025-10-20','2025-10-20', TRUE, 17, 6, 9),
('BT018', gen_random_uuid(), 110.00, 'Business', 2, 'R', 2, '2025-10-22','2025-10-22', TRUE, 18, 7, 10),
('BT019', gen_random_uuid(), 95.00, 'First', 1, 'S', 3, '2025-10-25','2025-10-25', TRUE, 19, 8, 11),
('BT020', gen_random_uuid(), 120.00, 'Business', 2, 'T', 2, '2025-10-28','2025-10-28', TRUE, 20, 9, 12);

-- ============================================
-- Inserimento dati Tratta 
-- ============================================
INSERT INTO Tratta (tipologia, data_inizio, data_fine, posti_disponibili, orario_partenza, orario_arrivo, id_stazione_partenza, id_stazione_arrivo) VALUES
('Regionale','2025-09-10','2025-12-31',100, '08:30','10:30',1,2),
('Intercity','2025-09-12','2025-12-31',80, '09:00','11:00',3,4),
('Frecciarossa','2025-09-15','2025-12-31',120, '14:30','16:30',5,6),
('Regionale Veloce','2025-09-18','2025-12-31',60, '07:15','09:15',7,8),
('Regionale','2025-09-20','2025-12-31',90, '16:00','18:00',9,10),
('Intercity','2025-09-22','2025-12-31',100, '12:00','14:00',11,12),
('Frecciarossa','2025-09-25','2025-12-31',110, '10:30','12:30',1,3),
('Regionale','2025-09-28','2025-12-31',70, '15:45','17:45',2,4),
('Regionale Veloce','2025-09-30','2025-12-31',85, '11:00','13:00',5,7),
('Intercity','2025-10-02','2025-12-31',120, '09:30','11:30',3,6),
('Frecciarossa','2025-10-05','2025-12-31',90, '13:15','15:15',7,9),
('Regionale','2025-10-08','2025-12-31',60, '17:00','19:00',1,4),
('Regionale Veloce','2025-10-10','2025-12-31',100, '08:00','10:00',2,5),
('Intercity','2025-10-12','2025-12-31',80, '12:30','14:30',3,6),
('Frecciarossa','2025-10-15','2025-12-31',110, '14:00','16:00',4,7),
('Regionale','2025-10-18','2025-12-31',70, '16:30','18:30',5,8),
('Intercity','2025-10-20','2025-12-31',90, '09:45','11:45',6,9),
('Frecciarossa','2025-10-22','2025-12-31',120, '07:30','09:30',7,10),
('Regionale Veloce','2025-10-25','2025-12-31',85, '15:00','17:00',8,11),
('Regionale','2025-10-28','2025-12-31',100, '18:15','20:15',9,12);

-- ============================================
-- Inserimento dati Treno 
-- ============================================
INSERT INTO Treno (matricola, tipologia, numero_carrozze, numero_posti, capienza, id_tipologia, id_alimentazione, anno_costruzione) VALUES
('T001','Frecciarossa',8,500,500,1,1,2015),
('T002','Intercity',6,400,400,3,2,2010),
('T003','Regionale',4,300,300,5,1,2012),
('T004','Regionale Veloce',5,350,350,4,3,2018),
('T005','Frecciarossa',10,600,600,1,1,2016),
('T006','Intercity',7,450,450,3,2,2011),
('T007','Regionale',4,280,280,5,1,2013),
('T008','Regionale Veloce',6,360,360,4,3,2019),
('T009','Frecciarossa',8,520,520,1,1,2017),
('T010','Intercity',7,430,430,3,2,2014),
('T011','Regionale',5,310,310,5,1,2010),
('T012','Regionale Veloce',6,340,340,4,3,2018),
('T013','Frecciarossa',9,580,580,1,1,2015),
('T014','Intercity',6,400,400,3,2,2012),
('T015','Regionale',4,300,300,5,1,2016),
('T016','Regionale Veloce',5,350,350,4,3,2019),
('T017','Frecciarossa',8,500,500,1,1,2013),
('T018','Intercity',7,450,450,3,2,2011),
('T019','Regionale',4,280,280,5,1,2017),
('T020','Regionale Veloce',6,360,360,4,3,2020);

-- ============================================
-- Inserimento dati Viaggia 
-- ============================================
INSERT INTO Viaggia (id_tratta, matricola_treno) VALUES
(1,'T001'),
(2,'T002'),
(3,'T003'),
(4,'T004'),
(5,'T005'),
(6,'T006'),
(7,'T007'),
(8,'T008'),
(9,'T009'),
(10,'T010'),
(11,'T011'),
(12,'T012'),
(13,'T013'),
(14,'T014'),
(15,'T015'),
(16,'T016'),
(17,'T017'),
(18,'T018'),
(19,'T019'),
(20,'T020');

-- ============================================
-- Inserimento dati Dipendente 
-- ============================================
INSERT INTO Dipendente (matricola, nome, cognome, sesso, data_nascita, data_assunzione, ruolo) VALUES
('D001','Marco','Rossi','M','1980-05-12','2005-06-01',1),
('D002','Anna','Bianchi','F','1985-03-20','2010-09-15',2),
('D003','Luca','Verdi','M','1975-11-05','2000-01-10',3),
('D004','Sara','Neri','F','1990-06-17','2015-03-20',4),
('D005','Alessandro','Galli','M','1992-12-30','2017-08-01',5),
('D006','Chiara','Costa','F','1988-08-21','2012-05-18',6),
('D007','Stefano','Fontana','M','1983-09-15','2008-07-22',7),
('D008','Martina','Ferrari','F','1995-07-10','2020-02-10',8),
('D009','Davide','Marini','M','1978-02-25','2003-04-05',9),
('D010','Elisa','Barbieri','F','1991-01-08','2016-11-11',10),
('D011','Andrea','Rinaldi','M','1984-04-14','2009-12-01',11),
('D012','Valentina','Romano','F','1987-09-09','2011-06-15',12),
('D013','Matteo','Moretti','M','1993-10-22','2018-09-03',13),
('D014','Federica','Conti','F','1982-03-30','2007-05-07',14),
('D015','Simone','De Luca','M','1979-06-06','2002-01-15',15),
('D016','Ilaria','Grassi','F','1994-12-12','2019-04-18',16),
('D017','Riccardo','Bellini','M','1981-11-11','2006-07-25',17),
('D018','Giulia','Longo','F','1990-05-05','2015-09-19',18),
('D019','Marco','Marchetti','M','1986-08-18','2013-03-30',19),
('D020','Elena','Villa','F','1992-02-28','2017-12-12',20);

-- ============================================
-- Inserimento dati Lavora 
-- ============================================
INSERT INTO Lavora (matricola, id_tratta) VALUES
('D001',1),
('D002',2),
('D003',3),
('D004',4),
('D005',5),
('D006',6),
('D007',7),
('D008',8),
('D009',9),
('D010',10),
('D011',11),
('D012',12),
('D013',13),
('D014',14),
('D015',15),
('D016',16),
('D017',17),
('D018',18),
('D019',19),
('D020',20);
