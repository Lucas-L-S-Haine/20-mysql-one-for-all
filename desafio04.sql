CREATE VIEW `top_3_artistas` AS
  SELECT
    A.artista AS `artista`,
    COUNT(DISTINCT U.usuario) AS `seguidores`
    FROM SpotifyClone.artista AS A
    INNER JOIN SpotifyClone.usuario AS U
    INNER JOIN SpotifyClone.usuario_artista AS UA
    ON A.artista_id = UA.artista_id
    AND U.usuario_id = UA.usuario_id
    GROUP BY A.artista
    ORDER BY `seguidores` DESC
    LIMIT 3
;
