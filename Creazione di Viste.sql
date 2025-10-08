-- ============================================
-- View: Biglietti disponibili per una data
-- ============================================
CREATE OR REPLACE VIEW vw_biglietti_disponibili AS
SELECT
    t.id_tratta,
    sp.denominazione AS stazione_partenza,
    sa.denominazione AS stazione_arrivo,
    tr.tipologia AS tipo_treno,
    tr.matricola AS matricola_treno,
    tr.numero_posti,
    tr.capienza,
    tr.capienza - COUNT(b.id_biglietto) AS posti_disponibili,
    t.data_inizio,
    t.data_fine,
    t.orario_partenza,
    t.orario_arrivo
FROM Tratta t
JOIN Stazione sp ON t.id_stazione_partenza = sp.id_stazione
JOIN Stazione sa ON t.id_stazione_arrivo = sa.id_stazione
JOIN Viaggia v ON t.id_tratta = v.id_tratta
JOIN Treno tr ON v.matricola_treno = tr.matricola
LEFT JOIN Biglietto b ON b.id_prenotazione IN (
    SELECT id_prenotazione FROM Prenotazione
)
GROUP BY t.id_tratta, sp.denominazione, sa.denominazione, tr.tipologia, tr.matricola, tr.numero_posti, tr.capienza, t.data_inizio, t.data_fine, t.orario_partenza, t.orario_arrivo;

-- ============================================
-- View: Storico prenotazioni di un passeggero
-- ============================================
CREATE OR REPLACE VIEW vw_storico_prenotazioni AS
SELECT
    p.id_passeggero,
    p.numero_prenotazione,
    p.data_prenotazione,
    p.data_partenza,
    s.stato,
    COUNT(b.id_biglietto) AS numero_biglietti,
    SUM(b.prezzo) AS importo_totale
FROM Prenotazione p
JOIN StatoPrenotazione s ON p.stato_prenotazione = s.id_stato
LEFT JOIN Biglietto b ON p.id_prenotazione = b.id_prenotazione
GROUP BY p.id_passeggero, p.numero_prenotazione, p.data_prenotazione, p.data_partenza, s.stato;

-- ============================================
-- View: Verifica validità biglietto
-- ============================================
CREATE OR REPLACE VIEW vw_verifica_biglietto AS
SELECT
    b.numero_biglietto,
    b.ticket,
    b.validato,
    b.data_validita,
    sp.denominazione AS stazione_partenza,
    sa.denominazione AS stazione_arrivo,
    CASE
        WHEN b.validato = TRUE THEN 'VALIDATO'
        WHEN b.data_validita < CURRENT_DATE THEN 'SCADUTO'
        ELSE 'VALIDO'
    END AS stato_biglietto
FROM Biglietto b
JOIN Stazione sp ON b.stazione_partenza = sp.id_stazione
JOIN Stazione sa ON b.stazione_arrivo = sa.id_stazione;

-- ============================================
-- View: Treni in servizio
-- ============================================
CREATE OR REPLACE VIEW vw_treni_in_servizio AS
SELECT
    tr.matricola,
    tr.tipologia,
    ta.tipo AS alimentazione,
    t.id_tratta,
    sp.denominazione AS stazione_partenza,
    sa.denominazione AS stazione_arrivo,
    t.orario_partenza,
    t.orario_arrivo,
    t.data_inizio,
    t.data_fine
FROM Treno tr
JOIN TipoAlimentazione ta ON tr.id_alimentazione = ta.id_alimentazione
JOIN Viaggia v ON tr.matricola = v.matricola_treno
JOIN Tratta t ON v.id_tratta = t.id_tratta
JOIN Stazione sp ON t.id_stazione_partenza = sp.id_stazione
JOIN Stazione sa ON t.id_stazione_arrivo = sa.id_stazione
WHERE CURRENT_DATE BETWEEN t.data_inizio AND COALESCE(t.data_fine, '9999-12-31');

-- ============================================
-- View: Personale in servizio su una tratta
-- ============================================
CREATE OR REPLACE VIEW vw_personale_tratta AS
SELECT
    t.id_tratta,
    sp.denominazione AS stazione_partenza,
    sa.denominazione AS stazione_arrivo,
    d.matricola,
    d.nome,
    d.cognome,
    r.denominazione AS ruolo
FROM Dipendente d
JOIN Ruolo r ON d.ruolo = r.id_ruolo
JOIN Lavora l ON d.matricola = l.matricola
JOIN Tratta t ON l.id_tratta = t.id_tratta
JOIN Stazione sp ON t.id_stazione_partenza = sp.id_stazione
JOIN Stazione sa ON t.id_stazione_arrivo = sa.id_stazione;
