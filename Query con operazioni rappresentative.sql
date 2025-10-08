--Restituisce i treni/tratte disponibili per una certa data, con il numero di posti residui.
SELECT
    t.id_tratta,
    sp.denominazione AS stazione_partenza,
    sa.denominazione AS stazione_arrivo,
    tr.tipologia,
    tr.matricola,
    tr.numero_posti,
    tr.capienza,
    tr.capienza - COUNT(b.id_biglietto) AS posti_disponibili
FROM Tratta t
JOIN Stazione sp ON t.id_stazione_partenza = sp.id_stazione
JOIN Stazione sa ON t.id_stazione_arrivo = sa.id_stazione
JOIN Viaggia v ON t.id_tratta = v.id_tratta
JOIN Treno tr ON v.matricola_treno = tr.matricola
LEFT JOIN Biglietto b ON b.id_prenotazione IN (
    SELECT id_prenotazione FROM Prenotazione
    WHERE data_partenza = '2025-10-15'
)
WHERE t.data_inizio <= '2025-10-15'
  AND (t.data_fine IS NULL OR t.data_fine >= '2025-10-15')
GROUP BY t.id_tratta, sp.denominazione, sa.denominazione, tr.tipologia, tr.matricola, tr.numero_posti, tr.capienza
ORDER BY sp.denominazione, sa.denominazione;


--Mostra lo storico prenotazioni di un cliente (persona fisica o giuridica), con totale biglietti e stato attuale.
SELECT
    p.numero_prenotazione,
    p.data_prenotazione,
    p.data_partenza,
    s.stato,
    COUNT(b.id_biglietto) AS numero_biglietti,
    SUM(b.prezzo) AS importo_totale
FROM Prenotazione p
JOIN StatoPrenotazione s ON p.stato_prenotazione = s.id_stato
LEFT JOIN Biglietto b ON p.id_prenotazione = b.id_prenotazione
WHERE p.id_passeggero = 5
GROUP BY p.numero_prenotazione, p.data_prenotazione, p.data_partenza, s.stato
ORDER BY p.data_partenza DESC;

--Controlla se un biglietto è ancora valido, già validato o scaduto.
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
JOIN Stazione sa ON b.stazione_arrivo = sa.id_stazione
WHERE b.numero_biglietto = 'BIG-2025-00015';

--Mostra i treni effettivamente operativi (cioè con tratte attive) per una data specifica.
SELECT
    tr.matricola,
    tr.tipologia,
    ta.tipo AS alimentazione,
    t.id_tratta,
    sp.denominazione AS partenza,
    sa.denominazione AS arrivo,
    t.orario_partenza,
    t.orario_arrivo
FROM Treno tr
JOIN TipoAlimentazione ta ON tr.id_alimentazione = ta.id_alimentazione
JOIN Viaggia v ON tr.matricola = v.matricola_treno
JOIN Tratta t ON v.id_tratta = t.id_tratta
JOIN Stazione sp ON t.id_stazione_partenza = sp.id_stazione
JOIN Stazione sa ON t.id_stazione_arrivo = sa.id_stazione
WHERE '2025-10-15' BETWEEN t.data_inizio AND COALESCE(t.data_fine, '9999-12-31')
ORDER BY sp.denominazione, sa.denominazione;

--Elenca il personale assegnato a una determinata tratta (macchinisti, controllori, ecc.).
SELECT
    d.matricola,
    d.nome,
    d.cognome,
    r.denominazione AS ruolo,
    t.id_tratta,
    sp.denominazione AS stazione_partenza,
    sa.denominazione AS stazione_arrivo
FROM Dipendente d
JOIN Ruolo r ON d.ruolo = r.id_ruolo
JOIN Lavora l ON d.matricola = l.matricola
JOIN Tratta t ON l.id_tratta = t.id_tratta
JOIN Stazione sp ON t.id_stazione_partenza = sp.id_stazione
JOIN Stazione sa ON t.id_stazione_arrivo = sa.id_stazione
WHERE t.id_tratta = 3;