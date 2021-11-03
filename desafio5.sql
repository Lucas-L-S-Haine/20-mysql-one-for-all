CREATE VIEW `top_2_hits_do_momento` AS
  SELECT
    M.musica AS `cancao`,
    COUNT(U.usuario) AS `reproducoes`
    FROM SpotifyClone.musica AS M
    JOIN SpotifyClone.usuario AS U
    JOIN SpotifyClone.historico AS H
    ON M.musica_id = H.musica_id
    AND U.usuario_id = H.usuario_id
    GROUP BY M.musica
    ORDER BY `reproducoes` DESC, `cancao` ASC
    LIMIT 2
;
