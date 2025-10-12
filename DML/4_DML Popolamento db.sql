-- ============================================================
-- POPOLAMENTO DATI - SISTEMA FERROVIARIO
-- ============================================================

-- =====================
-- PROVINCE
-- =====================
INSERT INTO provincia (denominazione) VALUES
('Torino'),('Milano'),('Roma'),('Napoli'),('Firenze'),
('Bologna'),('Genova'),('Venezia'),('Verona'),('Palermo'),
('Catania'),('Bari'),('Trieste'),('Padova'),('Parma'),
('Modena'),('Pisa'),('Perugia'),('Reggio Emilia'),('Messina');

-- =====================
-- COMUNI
-- =====================
INSERT INTO comune (denominazione, cap) VALUES
('Torino','10100'),('Rivoli','10098'),('Milano','20100'),('Pavia','27100'),
('Roma','00100'),('Ciampino','00043'),('Napoli','80100'),('Salerno','84100'),
('Firenze','50100'),('Prato','59100'),('Bologna','40100'),('Genova','16100'),
('Venezia','30100'),('Verona','37100'),('Palermo','90100'),('Catania','95100'),
('Bari','70100'),('Trieste','34100'),('Padova','35100'),('Parma','43100');

-- =====================
-- TIPOLOGIA TRENO 
-- =====================
INSERT INTO tipologiaTreno (descrizione) VALUES
('Regionale'),('Intercity'),('Frecciarossa'),('Frecciargento'),('Italo');

-- =====================
-- TIPO ALIMENTAZIONE 
-- =====================
INSERT INTO tipoAlimentazione (tipo) VALUES
('ELETTRICO'),('DIESEL'),('IBRIDO');

-- =====================
-- STATO PRENOTAZIONE 
-- =====================
INSERT INTO statoPrenotazione (stato) VALUES
('IN PAGAMENTO'),('PAGATA'),('SCADUTA');

-- =====================
-- RUOLI
-- =====================
INSERT INTO ruolo (denominazione, ufficio_riferimento) VALUES
('Macchinista','Deposito Torino'),('Capotreno','Milano Centrale'),
('Controllore','Roma Termini'),('Addetto Stazione','Napoli Centrale'),
('Tecnico Manutenzione','Firenze SMN');

-- =====================
-- INDIRIZZI PASSEGGERI
-- =====================
INSERT INTO indirizzo_passeggero (via,civico,citta,id_comune,id_provincia) VALUES
('Via Roma','10','Torino',1,1),('Corso Francia','45','Rivoli',2,1),
('Via Manzoni','12','Milano',3,2),('Viale Matteotti','8','Roma',5,3),
('Via Toledo','22','Napoli',7,4),('Via Dante','15','Firenze',9,5),
('Via Garibaldi','30','Bologna',11,6),('Via XX Settembre','7','Genova',12,7),
('Riva degli Schiavoni','2','Venezia',13,8),('Via Mazzini','5','Verona',14,9),
('Via Libertà','11','Palermo',15,10),('Via Etnea','18','Catania',16,11),
('Via Sparano','20','Bari',17,12),('Via Roma','25','Trieste',18,13),
('Via Altinate','33','Padova',19,14),('Strada Repubblica','9','Parma',20,15),
('Via Emilia','4','Modena',16,16),('Via Santa Maria','8','Pisa',17,17),
('Corso Vannucci','21','Perugia',18,18),('Via Emilia Ovest','12','Reggio Emilia',19,19),
('Via Giardini','7','Messina',20,20),('Via Torino','5','Torino',1,1),
('Via Milano','2','Milano',3,2),('Via Napoli','9','Napoli',7,4),
('Via Firenze','10','Firenze',9,5);

-- =====================
-- PASSEGGERI
-- =====================
INSERT INTO passeggero (nome,cognome,sesso,data_nascita,email,telefono,indirizzo_id) VALUES
('Marco','Rossi','M','1985-05-10','marco.rossi@gmail.com','3331111111',1),
('Giulia','Bianchi','F','1990-09-21','giulia.bianchi@yahoo.com','3332222222',2),
('Luca','Verdi','M','1978-12-02','luca.verdi@gmail.com','3333333333',3),
('Sara','Neri','F','1995-04-14','sara.neri@gmail.com','3334444444',4),
('Davide','Russo','M','1988-07-30','davide.russo@hotmail.com','3335555555',5),
('Alessia','Ferrari','F','1987-01-11','alessia.ferrari@gmail.com','3336666666',6),
('Matteo','Galli','M','1992-03-20','matteo.galli@gmail.com','3337777777',7),
('Francesca','Moretti','F','1983-06-25','francesca.moretti@gmail.com','3338888888',8),
('Stefano','Rinaldi','M','1979-11-10','stefano.rinaldi@gmail.com','3339999999',9),
('Martina','Fontana','F','1991-12-30','martina.fontana@gmail.com','3340000000',10),
('Giovanni','Conti','M','1980-04-05','giovanni.conti@gmail.com','3341111111',11),
('Chiara','Marini','F','1985-07-18','chiara.marini@gmail.com','3342222222',12),
('Alberto','Ferrari','M','1975-03-21','alberto.ferrari@gmail.com','3343333333',13),
('Paola','Greco','F','1990-08-09','paola.greco@gmail.com','3344444444',14),
('Davide','Costa','M','1989-09-12','davide.costa@gmail.com','3345555555',15),
('Sofia','Rossi','F','1993-10-01','sofia.rossi@gmail.com','3346666666',16),
('Giorgio','Bianchi','M','1986-05-17','giorgio.bianchi@gmail.com','3347777777',17),
('Elena','Verdi','F','1994-01-23','elena.verdi@gmail.com','3348888888',18),
('Lorenzo','Neri','M','1982-02-14','lorenzo.neri@gmail.com','3349999999',19),
('Federica','Russo','F','1991-06-02','federica.russo@gmail.com','3350000000',20),
('Riccardo','Ferrari','M','1988-12-29','riccardo.ferrari@gmail.com','3351111111',21),
('Elisa','Bianchi','F','1995-03-15','elisa.bianchi@gmail.com','3352222222',22),
('Andrea','Verdi','M','1987-09-05','andrea.verdi@gmail.com','3353333333',23),
('Valentina','Neri','F','1990-07-20','valentina.neri@gmail.com','3354444444',24),
('Tommaso','Russo','M','1983-04-12','tommaso.russo@gmail.com','3355555555',25);

-- =====================
-- PERSONA_FISICA
-- =====================
INSERT INTO persona_fisica (passeggero_id,codice_fiscale) VALUES
(1,'RSSMRC85A10H501X'),
(2,'BNCLGU90P61H501Y'),
(3,'VRDLUC78T02H501Z'),
(4,'NRISRA95D14H501A'),
(5,'RSSDVD88L30H501B'),
(6,'FRRALS87A11H501C'),
(7,'GLLMTT92C20H501D'),
(8,'MRTFNC83H25H501E'),
(9,'RNLSTF79L10H501F'),
(10,'FNTMRT91L30H501G'),
(11,'CNTGNV80D05H501H'),
(12,'MRNCHR85L18H501I'),
(13,'FRRLBT75C21H501J'),
(14,'GRCPL90H09H501K'),
(15,'CSTDVD89P12H501L');

-- =====================
-- SOGGETTO_GIURIDICO
-- =====================
INSERT INTO soggetto_giuridico (passeggero_id,partita_iva,pec) VALUES
(16,'01234567890','azienda1@pec.it'),
(17,'09876543210','azienda2@pec.it'),
(18,'12345098765','azienda3@pec.it'),
(19,'56789012345','azienda4@pec.it'),
(20,'67890123456','azienda5@pec.it'),
(21,'23456789012','azienda6@pec.it'),
(22,'34567890123','azienda7@pec.it'),
(23,'45678901234','azienda8@pec.it'),
(24,'56781012345','azienda9@pec.it'),
(25,'67891123456','azienda10@pec.it');

-- =====================
-- INDIRIZZI STAZIONI
-- =====================
INSERT INTO indirizzo_stazione (via,civico,citta,longitudine,latitudine,id_comune,id_provincia) VALUES
('Piazza Carlo Felice','1','Torino',7.668,45.062,1,1),
('Piazza Duca dAosta','1','Milano',9.201,45.484,3,2),
('Piazza dei Cinquecento','1','Roma',12.501,41.902,5,3),
('Piazza Garibaldi','1','Napoli',14.272,40.852,7,4),
('Piazza della Stazione','1','Firenze',11.249,43.776,9,5),
('Piazza Maggiore','2','Bologna',11.342,44.494,11,6),
('Piazza Principe','3','Genova',8.933,44.404,12,7),
('Riva degli Schiavoni','4','Venezia',12.336,45.434,13,8),
('Piazza Bra','5','Verona',10.991,45.438,14,9),
('Via Libertà','6','Palermo',13.361,38.115,15,10),
('Via Etnea','7','Catania',15.087,37.502,16,11),
('Via Sparano','8','Bari',16.871,41.117,17,12),
('Piazza Unita','9','Trieste',13.772,45.652,18,13),
('Prato Centrale','10','Prato',11.102,43.877,10,5),
('Padova Centrale','11','Padova',11.876,45.406,19,14),
('Parma Centrale','12','Parma',10.328,44.801,20,15),
('Modena Centrale','13','Modena',10.926,44.647,16,16),
('Pisa Centrale','14','Pisa',10.397,43.716,17,17),
('Perugia Centrale','15','Perugia',12.389,43.112,18,18),
('Reggio Emilia Centrale','16','Reggio Emilia',10.631,44.698,19,19),
('Messina Centrale','17','Messina',15.554,38.193,20,20);

-- =====================
-- STAZIONI
-- =====================
INSERT INTO stazione (denominazione, numero_binari, capolinea, indirizzo_id) VALUES
('Torino Porta Nuova',12,TRUE,1),('Milano Centrale',24,FALSE,2),
('Roma Termini',32,FALSE,3),('Napoli Centrale',18,FALSE,4),('Firenze SMN',16,FALSE,5),
('Bologna Centrale',20,FALSE,6),('Genova Piazza Principe',15,FALSE,7),
('Venezia Santa Lucia',12,FALSE,8),('Verona Porta Nuova',14,FALSE,9),('Palermo Centrale',16,FALSE,10),
('Catania Centrale',12,FALSE,11),('Bari Centrale',12,FALSE,12),('Trieste Centrale',10,FALSE,13),
('Prato Centrale',10,FALSE,14),('Padova Centrale',12,FALSE,15),('Parma Centrale',10,FALSE,16),
('Modena Centrale',12,FALSE,17),('Pisa Centrale',10,FALSE,18),('Perugia Centrale',10,FALSE,19),
('Messina Centrale',12,FALSE,20);

-- =====================
-- TRENI
-- =====================
INSERT INTO treno (tipologia, numero_carrozze, numero_posti, anno_costruzione, alimentazione) VALUES
(1,6,400,2005,2),(2,8,500,2010,1),(3,10,600,2015,1),(4,8,550,2018,1),(5,11,700,2020,1),
(1,5,300,2002,2),(2,7,450,2008,1),(3,9,600,2012,1),(4,6,500,2016,1),(5,12,720,2021,1),
(1,6,400,2005,2),(2,8,500,2010,1),(3,10,600,2015,1),(4,8,550,2018,1),(5,11,700,2020,1),
(1,5,300,2002,2),(2,7,450,2008,1),(3,9,600,2012,1),(4,6,500,2016,1),(5,12,720,2021,1);

-- =====================
-- PRENOTAZIONI
-- =====================
INSERT INTO prenotazione (data_prenotazione,data_partenza,ora_partenza,numero_passaggeri,numero_cambi,stato_prenotazione,importo,passeggero_id) VALUES
('2025-10-05','2025-10-10','07:00',1,0,2,40.00,1),
('2025-10-06','2025-10-12','09:30',2,1,1,30.00,2),
('2025-10-07','2025-10-15','10:00',1,0,2,25.50,3),
('2025-10-08','2025-10-16','08:15',3,1,2,60.00,4),
('2025-10-09','2025-10-20','06:45',2,1,3,50.00,5),
('2025-10-10','2025-10-21','07:30',1,0,2,35.00,6),
('2025-10-11','2025-10-22','08:00',2,1,1,55.00,7),
('2025-10-12','2025-10-23','09:15',1,0,2,20.00,8),
('2025-10-13','2025-10-24','10:30',3,1,2,65.00,9),
('2025-10-14','2025-10-25','11:00',2,1,3,45.00,10),
('2025-10-15','2025-10-26','07:45',1,0,2,50.00,11),
('2025-10-16','2025-10-27','08:30',2,1,1,60.00,12),
('2025-10-17','2025-10-28','09:00',1,0,2,30.00,13),
('2025-10-18','2025-10-29','10:15',3,1,2,75.00,14),
('2025-10-19','2025-10-30','11:30',2,1,3,55.00,15),
('2025-10-20','2025-10-31','07:00',1,0,2,35.00,16),
('2025-10-21','2025-11-01','08:45',2,1,1,40.00,17),
('2025-10-22','2025-11-02','09:30',1,0,2,25.00,18),
('2025-10-23','2025-11-03','10:45',3,1,2,70.00,19),
('2025-10-24','2025-11-04','11:15',2,1,3,45.00,20),
('2025-10-25','2025-11-05','07:30',1,0,2,55.00,21),
('2025-10-26','2025-11-06','08:15',2,1,1,50.00,22),
('2025-10-27','2025-11-07','09:45',1,0,2,30.00,23),
('2025-10-28','2025-11-08','10:30',3,1,2,65.00,24),
('2025-10-29','2025-11-09','11:00',2,1,3,45.00,25);


-- =====================
-- BIGLIETTI
-- =====================
INSERT INTO biglietto (numero_carrozza,fila,lettera_posto,classe,prezzo,token,data_validita,prenotazione_id,stazione_partenza_id,stazione_arrivo_id) VALUES
(3,'12','A','1A',40.00,'TK12345A','2025-10-10',1,1,2),
(4,'8','B','2A',15.00,'TK22345B','2025-10-12',2,2,3),
(2,'5','C','1A',25.50,'TK32345C','2025-10-15',3,3,4),
(1,'3','D','1A',30.00,'TK42345D','2025-10-16',4,4,5),
(5,'10','E','2A',50.00,'TK52345E','2025-10-20',5,5,1),
(3,'6','F','1A',35.00,'TK62345F','2025-10-21',6,6,7),
(4,'7','G','2A',45.00,'TK72345G','2025-10-22',7,7,8),
(2,'5','H','1A',20.00,'TK82345H','2025-10-23',8,8,9),
(1,'4','I','1A',60.00,'TK92345I','2025-10-24',9,9,10),
(5,'8','J','2A',55.00,'TK10345J','2025-10-25',10,10,11),
(3,'3','K','1A',40.00,'TK11345K','2025-10-26',11,11,12),
(4,'9','L','2A',50.00,'TK12346L','2025-10-27',12,12,13),
(2,'6','M','1A',25.00,'TK13345M','2025-10-28',13,13,14),
(1,'5','N','1A',70.00,'TK14345N','2025-10-29',14,14,15),
(5,'7','O','2A',45.00,'TK15345O','2025-10-30',15,15,16),
(3,'4','P','1A',50.00,'TK16345P','2025-10-31',16,16,17),
(4,'6','Q','2A',60.00,'TK17345Q','2025-11-01',17,17,18),
(2,'8','R','1A',30.00,'TK18345R','2025-11-02',18,18,19),
(1,'3','S','1A',65.00,'TK19345S','2025-11-03',19,19,20),
(5,'5','T','2A',55.00,'TK20345T','2025-11-04',20,20,1),
(3,'7','U','1A',40.00,'TK21345U','2025-11-05',21,1,2),
(4,'8','V','2A',50.00,'TK22345V','2025-11-06',22,2,3),
(2,'5','W','1A',25.00,'TK23345W','2025-11-07',23,3,4),
(1,'4','X','1A',70.00,'TK24345X','2025-11-08',24,4,5),
(5,'6','Y','2A',45.00,'TK25345Y','2025-11-09',25,5,1);

-- =====================
-- TRATTE
-- =====================
INSERT INTO tratta (data_inizio,data_fine,tipologia,orario_partenza,orario_arrivo,posti_disponibili,stazione_partenza_id,stazione_arrivo_id,treno_id) VALUES
('2025-10-10','2025-12-31','Regionale','07:00','09:00',100,1,2,1),
('2025-10-11','2025-12-31','Intercity','08:30','11:00',120,2,3,2),
('2025-10-12','2025-12-31','Frecciarossa','09:00','12:00',200,3,4,3),
('2025-10-13','2025-12-31','Frecciargento','10:00','13:30',180,4,5,4),
('2025-10-14','2025-12-31','Italo','11:00','14:00',220,5,6,5),
('2025-10-15','2025-12-31','Regionale','07:30','09:30',90,6,7,6),
('2025-10-16','2025-12-31','Intercity','08:00','10:30',150,7,8,7),
('2025-10-17','2025-12-31','Frecciarossa','09:30','12:30',200,8,9,8),
('2025-10-18','2025-12-31','Frecciargento','10:15','13:15',180,9,10,9),
('2025-10-19','2025-12-31','Italo','11:45','14:45',220,10,11,10),
('2025-10-20','2025-12-31','Regionale','07:15','09:15',100,11,12,11),
('2025-10-21','2025-12-31','Intercity','08:45','11:15',120,12,13,12),
('2025-10-22','2025-12-31','Frecciarossa','09:00','12:00',200,13,14,13),
('2025-10-23','2025-12-31','Frecciargento','10:30','13:30',180,14,15,14),
('2025-10-24','2025-12-31','Italo','11:15','14:15',220,15,16,15),
('2025-10-25','2025-12-31','Regionale','07:00','09:00',90,16,17,16),
('2025-10-26','2025-12-31','Intercity','08:30','11:00',150,17,18,17),
('2025-10-27','2025-12-31','Frecciarossa','09:00','12:00',200,18,19,18),
('2025-10-28','2025-12-31','Frecciargento','10:00','13:00',180,19,20,19),
('2025-10-29','2025-12-31','Italo','11:30','14:30',220,20,1,20);


-- =====================
-- DIPENDENTI
-- =====================
INSERT INTO dipendente (nome,cognome,sesso,data_nascita,data_assunzione,ruolo) VALUES
('Alberto','Ferrari','M','1975-03-21','2005-06-15',1),
('Chiara','Marini','F','1980-07-12','2010-03-01',2),
('Giovanni','Conti','M','1985-09-08','2015-09-01',3),
('Francesca','De Luca','F','1992-11-20','2020-01-15',4),
('Paolo','Greco','M','1988-02-05','2012-05-10',5),
('Sara','Rossi','F','1987-08-09','2011-03-12',1),
('Luca','Bianchi','M','1983-12-21','2009-09-30',2),
('Martina','Verdi','F','1990-04-18','2014-05-25',3),
('Stefano','Neri','M','1982-06-10','2008-08-18',4),
('Valentina','Russo','F','1991-11-05','2013-02-12',5),
('Giorgio','Fontana','M','1986-01-23','2010-06-30',1),
('Elena','Moretti','F','1989-03-14','2012-07-15',2),
('Riccardo','Costa','M','1984-07-11','2007-09-22',3),
('Federica','Ferrara','F','1992-12-01','2015-01-10',4),
('Tommaso','Lombardi','M','1988-05-05','2011-04-20',5),
('Chiara','Galli','F','1990-08-30','2014-06-11',1),
('Andrea','Rinaldi','M','1987-09-19','2012-03-08',2),
('Sofia','Grassi','F','1993-02-28','2016-09-05',3),
('Lorenzo','Marchetti','M','1985-10-15','2009-12-01',4),
('Elisa','Ricci','F','1991-06-22','2013-11-20',5);

-- =====================
-- LAVORA (dipendente-tratta)
-- =====================
INSERT INTO lavora (dipendente_id,tratta_id,data_inizio,data_fine) VALUES
(1,1,'2025-10-01','2025-12-31'),
(2,2,'2025-10-01','2025-12-31'),
(3,3,'2025-10-01','2025-12-31'),
(4,4,'2025-10-01','2025-12-31'),
(5,5,'2025-10-01','2025-12-31'),
(6,1,'2025-10-05','2025-12-15'),
(7,2,'2025-10-07','2025-12-20'),
(8,3,'2025-10-10','2025-12-25'),
(9,4,'2025-10-12','2025-12-28'),
(10,5,'2025-10-15','2025-12-30'),
(11,1,'2025-10-05','2025-12-15'),
(12,2,'2025-10-07','2025-12-20'),
(13,3,'2025-10-10','2025-12-25'),
(14,4,'2025-10-12','2025-12-28'),
(15,5,'2025-10-15','2025-12-30'),
(16,1,'2025-10-01','2025-12-31'),
(17,2,'2025-10-01','2025-12-31'),
(18,3,'2025-10-01','2025-12-31'),
(19,4,'2025-10-01','2025-12-31'),
(20,5,'2025-10-01','2025-12-31'),
(1,2,'2025-11-01','2025-12-15'),
(2,3,'2025-11-01','2025-12-20'),
(3,4,'2025-11-01','2025-12-25'),
(4,5,'2025-11-01','2025-12-30'),
(5,1,'2025-11-01','2025-12-31');

-- =====================
-- TARIFFE
-- =====================
INSERT INTO tariffa (importo,data_inizio_periodo,data_fine_periodo) VALUES
(20.00,'2025-10-01','2025-10-31'),
(25.00,'2025-10-01','2025-10-31'),
(30.00,'2025-10-01','2025-10-31'),
(35.00,'2025-10-01','2025-10-31'),
(40.00,'2025-10-01','2025-10-31'),
(22.50,'2025-10-05','2025-11-05'),
(27.50,'2025-10-05','2025-11-05'),
(32.50,'2025-10-05','2025-11-05'),
(37.50,'2025-10-05','2025-11-05'),
(42.50,'2025-10-05','2025-11-05'),
(23.00,'2025-10-10','2025-11-10'),
(28.00,'2025-10-10','2025-11-10'),
(33.00,'2025-10-10','2025-11-10'),
(38.00,'2025-10-10','2025-11-10'),
(43.00,'2025-10-10','2025-11-10'),
(24.00,'2025-10-15','2025-11-15'),
(29.00,'2025-10-15','2025-11-15'),
(34.00,'2025-10-15','2025-11-15'),
(39.00,'2025-10-15','2025-11-15'),
(44.00,'2025-10-15','2025-11-15');

-- =====================
-- TRATTA-TARIFFA
-- =====================
INSERT INTO tratta_tariffa (tratta_id,tariffa_id) VALUES
(1,1),(1,2),(2,2),(2,3),(3,1),(3,2),(4,2),(4,3),(5,1),(5,2),
(6,2),(6,3),(7,1),(7,3),(8,2),(8,3),(9,1),(9,2),(10,2),(10,3),
(11,1),(11,3),(12,2),(12,3),(13,1),(13,2),(14,2),(14,3),(15,1),(15,2);

-- =====================
-- FERMATE
-- =====================
INSERT INTO fermata (codice_tratta,codice_stazione) VALUES
(1,1),(1,2),(1,3),
(2,2),(2,3),(2,4),
(3,3),(3,4),(3,5),
(4,4),(4,5),(4,6),
(5,5),(5,6),(5,7),
(6,1),(6,7),(6,8),
(7,2),(7,8),(7,9),
(8,3),(8,9),(8,10),
(9,4),(9,10),(9,11),
(10,5),(10,11),(10,12);
