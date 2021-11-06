DROP FUNCTION IF EXISTS quantidade_musicas_no_historico;
DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(idDeUsuario VARCHAR(50))
RETURNS INT READS SQL DATA
BEGIN
  DECLARE musicas INT;
  SELECT
    COUNT(H.usuario_id) AS `quantidade_musicas_no_historico`
    FROM SpotifyClone.historico AS H
    JOIN SpotifyClone.usuario AS U
    ON H.usuario_id = U.usuario_id
    WHERE U.usuario_id = idDeUsuario
    INTO musicas;
  RETURN musicas;
END $$
DELIMITER ;
