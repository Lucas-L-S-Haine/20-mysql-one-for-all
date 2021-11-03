CREATE VIEW `perfil_artistas` AS
  SELECT
    A.artista AS `artista`,
    AL.album AS `album`,
    COUNT(DISTINCT U.usuario) AS `seguidores`
    FROM SpotifyClone.artista AS A
    JOIN SpotifyClone.album AS AL
    JOIN SpotifyClone.usuario AS U
    JOIN SpotifyClone.usuario_artista AS UA
    ON U.usuario_id = UA.usuario_id
    AND A.artista_id = UA.artista_id
    AND A.artista_id = AL.artista_id
    GROUP BY A.artista, AL.album
    ORDER BY `seguidores` DESC,
    `artista` ASC,
    `album` ASC
;
