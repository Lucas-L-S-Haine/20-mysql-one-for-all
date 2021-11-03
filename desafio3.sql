CREATE VIEW `historico_reproducao_usuarios` AS
  SELECT
    U.usuario AS `usuario`,
    M.musica AS `nome`
    FROM SpotifyClone.usuario AS U
    INNER JOIN SpotifyClone.musica AS M
    INNER JOIN SpotifyClone.historico AS H
    ON U.usuario_id = H.usuario_id
    AND M.musica_id = H.musica_id
    ORDER BY U.usuario ASC, M.musica ASC
;
