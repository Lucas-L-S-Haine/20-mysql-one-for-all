CREATE VIEW `cancoes_premium` AS
  SELECT
    M.musica AS `nome`,
    COUNT(H.historico) AS `reproducoes`
    FROM SpotifyClone.musica AS M
    JOIN SpotifyClone.historico AS H
    JOIN SpotifyClone.usuario AS U
    ON H.usuario_id = U.usuario_id
    WHERE U.plano_id <> 1
    AND H.musica_id = M.musica_id
    GROUP BY M.musica
    ORDER BY `nome` ASC
;
