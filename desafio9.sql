DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN ARTISTA_ESCOLHIDO VARCHAR(50))
BEGIN
  SELECT
    A.artista AS `artista`,
    AL.album AS `album`
    FROM SpotifyClone.artista AS A
    JOIN SpotifyClone.album AS AL
    ON A.artista_id = AL.artista_id
    WHERE A.artista = 'Walter Phoenix'
    ORDER BY `album` ASC
  ;
END$$
DELIMITER ;
