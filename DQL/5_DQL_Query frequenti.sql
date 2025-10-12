-- ============================================================
--  Sistema Ferroviario - Query operazioni tipiche
-- ============================================================

-- =====================
-- Ricerca biglietti disponibili per una tratta in una specifica data
-- =====================
SELECT t.codice_tratta, t.orario_partenza, t.orario_arrivo, t.posti_disponibili, s1.denominazione AS stazione_partenza, s2.denominazione AS stazione_arrivo
FROM tratta t
JOIN stazione s1 ON t.stazione_partenza_id = s1.codice_stazione
JOIN stazione s2 ON t.stazione_arrivo_id = s2.codice_stazione
WHERE t.data_inizio <= '2025-10-15'
  AND t.data_fine >= '2025-10-15'
  AND t.posti_disponibili > 0
ORDER BY t.orario_partenza;

-- =====================
-- Storico Prenotazioni di un cliente
-- =====================
SELECT p.nome, p.cognome, pr.numero_prenotazione, pr.data_partenza, pr.ora_partenza, pr.numero_passaggeri, s.stato
FROM passeggero p
JOIN prenotazione pr ON p.id = pr.passeggero_id
JOIN statoPrenotazione s ON pr.stato_prenotazione = s.id_stato
WHERE p.email = 'marco.rossi@gmail.com'
ORDER BY pr.data_prenotazione DESC;


-- =====================
-- Verifica validità di un biglietto
-- =====================
SELECT b.codice, b.data_validita, b.data_validazione, b.validato, pr.numero_prenotazione
FROM biglietto b
JOIN prenotazione pr ON b.prenotazione_id = pr.numero_prenotazione
WHERE b.validato is false; --> Se false, il biglietto è ancora valido

-- =====================
-- Recupero elenco fermate di una tratta
-- =====================
SELECT f.id AS fermata_id, s.denominazione AS stazione, t.codice_tratta, t.orario_partenza
FROM fermata f
JOIN stazione s ON f.codice_stazione = s.codice_stazione
JOIN tratta t ON f.codice_tratta = t.codice_tratta
WHERE t.codice_tratta = 1
ORDER BY f.id;

-- =====================
-- Elenco dei dipendenti che lavorano su una tratta
-- =====================
SELECT d.nome, d.cognome, r.denominazione AS ruolo, l.data_inizio, l.data_fine
FROM lavora l
JOIN dipendente d ON l.dipendente_id = d.matricola
JOIN ruolo r ON d.ruolo = r.id_ruolo
WHERE l.tratta_id = 1
ORDER BY d.nome;

-- =====================
-- Calcolo del prezzo totale di un viaggio e verifica disponibilita
-- =====================
WITH tratte_scelte AS (
    SELECT t.codice_tratta, t.posti_disponibili, t.stazione_partenza_id, t.stazione_arrivo_id
    FROM tratta t
    WHERE t.codice_tratta IN (1, 2, 3)
)
, tariffe_scelte AS (
    SELECT tt.tratta_id, SUM(tf.importo) AS prezzo_totale
    FROM tratta_tariffa tt
    JOIN tariffa tf ON tt.tariffa_id = tf.id
    WHERE tt.tratta_id IN (1, 2, 3)
    GROUP BY tt.tratta_id
)
SELECT p.nome, p.cognome, SUM(ts.posti_disponibili) AS posti_disponibili_totali, SUM(tsc.prezzo_totale) AS prezzo_viaggio
FROM passeggero p
JOIN prenotazione pr ON p.id = pr.passeggero_id
JOIN tratte_scelte ts ON ts.codice_tratta = pr.numero_prenotazione 
JOIN tariffe_scelte tsc ON tsc.tratta_id = ts.codice_tratta
WHERE p.email = 'marco.rossi@gmail.com'
GROUP BY p.nome, p.cognome;


-- =====================
-- Elenco treni disponibili per un giorno specifico
-- =====================
SELECT tr.matricola, tt.descrizione AS tipologia_treno, ta.tipo AS alimentazione, tr.numero_carrozze, tr.numero_posti
FROM treno tr
JOIN tipologiaTreno tt ON tr.tipologia = tt.id_tipologia
JOIN tipoAlimentazione ta ON tr.alimentazione = ta.id_alimentazione
WHERE tr.matricola IN (
    SELECT treno_id FROM tratta
    WHERE data_inizio <= '2025-10-20' AND data_fine >= '2025-10-20'
);


-- =====================
-- Elenco tratte con più di N (esempio N=150) posti disponibili
-- =====================
SELECT t.codice_tratta, s1.denominazione AS partenza, s2.denominazione AS arrivo, t.posti_disponibili
FROM tratta t
JOIN stazione s1 ON t.stazione_partenza_id = s1.codice_stazione
JOIN stazione s2 ON t.stazione_arrivo_id = s2.codice_stazione
WHERE t.posti_disponibili > 150
ORDER BY t.posti_disponibili DESC;