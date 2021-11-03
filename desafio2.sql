CREATE VIEW `estatisticas_musicais` AS
  SELECT
    COUNT(DISTINCT M.musica_id) AS `cancoes`,
    COUNT(DISTINCT A.artista_id) AS `artistas`,
    COUNT(DISTINCT AL.album_id) AS `albuns`
    FROM SpotifyClone.musica AS M
    INNER JOIN SpotifyClone.artista AS A
    INNER JOIN SpotifyClone.album AS AL
    ON M.album_id = AL.album_id
    AND AL.artista_id = A.artista_id
;
