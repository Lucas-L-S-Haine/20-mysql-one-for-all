DELIMITER $$
CREATE FUNCTION quantidade_musicas_no_historico(nomeDeUsuario VARCHAR(50))
RETURNS INT READS SQL DATA
BEGIN
  DECLARE musicas INT;
  SELECT
    COUNT(H.usuario_id) AS `quantidade_musicas_no_historico`
    FROM SpotifyClone.historico AS H
    JOIN SpotifyClone.usuario AS U
    ON H.usuario_id = U.usuario_id
    AND U.usuario = nomeDeUsuario
    INTO musicas;
  RETURN musicas;
END $$
DELIMITER ;
