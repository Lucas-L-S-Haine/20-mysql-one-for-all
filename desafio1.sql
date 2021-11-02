DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE artista(
  `artista_id` INT PRIMARY KEY AUTO_INCREMENT,
  `artista` VARCHAR(50) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE album(
  `album_id` INT PRIMARY KEY AUTO_INCREMENT,
  `album` VARCHAR(50) NOT NULL,
  `artista_id` INT NOT NULL,
  FOREIGN KEY (`artista_id`) REFERENCES artista(`artista_id`)
) ENGINE = InnoDB;

CREATE TABLE musica(
  `musica_id` INT PRIMARY KEY AUTO_INCREMENT,
  `musica` VARCHAR(50) NOT NULL,
  `album_id` INT NOT NULL,
  FOREIGN KEY (`album_id`) REFERENCES album(`album_id`)
) ENGINE = InnoDB;

CREATE TABLE usuario(
  `usuario_id` INT PRIMARY KEY AUTO_INCREMENT,
  `usuario` VARCHAR(50) NOT NULL,
  `idade` INT NOT NULL,
  `plano` VARCHAR(15),
  `valor_plano` DECIMAL(2,2)
) ENGINE = InnoDB;

CREATE TABLE usuario_artista(
  `usuario_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`,`artista_id`),
  FOREIGN KEY (`artista_id`) REFERENCES artista(`artista_id`)
) ENGINE = InnoDB;

CREATE TABLE historico(
  `usuario_id` INT NOT NULL,
  `musica_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`,`musica_id`),
  FOREIGN KEY (`usuario_id`) REFERENCES usuario(`usuario_id`),
  FOREIGN KEY (`musica_id`) REFERENCES musica(`musica_id`)
) ENGINE = InnoDB;

INSERT INTO `artista` (`artista`)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

INSERT INTO `album` (`album`, `artista_id`)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

INSERT INTO `musica` (`musica`, `album_id`)
VALUES
  ('Soul For Us', 1),
  ('Reflections Of Magic', 1),
  ('Dance With Her Own', 1),
  ('Troubles Of My Inner Fire', 2),
  ('Time Fireworks', 2),
  ('Magic Circus', 3),
  ('Honey, So Do I', 3),
  ('Sweetie, Let’s Go Wild', 3),
  ('She Knows', 3),
  ('Fantasy For Me', 4),
  ('Celebration Of More', 4),
  ('Rock His Everything', 4),
  ('Home Forever', 4),
  ('Diamond Power', 4),
  ('Honey, Let’s Be Silly', 4),
  ('Thang Of Thunder', 5),
  ('Words Of Her Life', 5),
  ('Without My Streets', 5);

INSERT INTO `usuario` (`usuario`, `idade`, `plano`, `valor_plano`)
VALUES
  ('Thati', 23, 'gratuito', 0),
  ('Cintia', 35, 'familiar', 7.99),
  ('Bill', 20, 'universitario', 5.99),
  ('Roger', 45, 'gratutito', 0);

INSERT INTO `usuario_artista` (`usuario_id`, `artista_id`)
VALUES
  (1,1),
  (1,3),
  (1,4),
  (2,1),
  (2,3),
  (3,1),
  (3,2),
  (4,4);

INSERT INTO `historico` (`usuario_id`, `musica_id`)
VALUES
  (1,1),
  (1,6),
  (1,14),
  (1,16),
  (2,13),
  (2,17),
  (2,2),
  (2,15),
  (3,4),
  (3,16),
  (3,6),
  (4,3),
  (4,18),
  (4,11);
