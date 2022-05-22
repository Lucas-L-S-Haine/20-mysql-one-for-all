CREATE VIEW `faturamento_atual` AS
  SELECT
    CAST(MIN(P.valor_plano) AS DECIMAL(10,2)) AS `faturamento_minimo`,
    CAST(MAX(P.valor_plano) AS DECIMAL(10,2)) AS `faturamento_maximo`,
    CAST(ROUND(AVG(P.valor_plano), 2) AS DECIMAL(10,2)) AS `faturamento_medio`,
    CAST(SUM(P.valor_plano) AS DECIMAL(10,2)) AS `faturamento_total`
    FROM SpotifyClone.plano AS P
    JOIN SpotifyClone.usuario AS U
    ON P.plano_id = U.plano_id
;
