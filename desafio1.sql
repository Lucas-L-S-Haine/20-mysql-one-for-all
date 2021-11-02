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

CREATE TABLE plano(
  `plano_id` INT PRIMARY KEY AUTO_INCREMENT,
  `plano` VARCHAR(15),
  `valor_plano` DOUBLE
) ENGINE = InnoDB;

CREATE TABLE usuario(
  `usuario_id` INT PRIMARY KEY AUTO_INCREMENT,
  `usuario` VARCHAR(50) NOT NULL,
  `idade` INT NOT NULL,
  `plano_id` INT,
  FOREIGN KEY (`plano_id`) REFERENCES plano(`plano_id`)
) ENGINE = InnoDB;

CREATE TABLE usuario_artista(
  `usuario_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  `usuario_artista` VARCHAR(101),
  PRIMARY KEY (`usuario_id`,`artista_id`),
  FOREIGN KEY (`usuario_id`) REFERENCES usuario(`usuario_id`),
  FOREIGN KEY (`artista_id`) REFERENCES artista(`artista_id`)
) ENGINE = InnoDB;

CREATE TABLE historico(
  `usuario_id` INT NOT NULL,
  `musica_id` INT NOT NULL,
  `historico` VARCHAR(101),
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

INSERT INTO `plano` (`plano`, `valor_plano`)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitario', 5.99);

INSERT INTO `usuario` (`usuario`, `idade`, `plano_id`)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

INSERT INTO `usuario_artista` (`usuario_id`, `artista_id`, `usuario_artista`)
VALUES
  (1,1,'Thati-Walter Phoenix'),
  (1,3,'Thati-Lance Day'),
  (1,4,'Thati-Freedie Shannon'),
  (2,1,'Cintia-Walter Phoenix'),
  (2,3,'Cintia-Lance Day'),
  (3,1,'Bill-Walter Phoenix'),
  (3,2,'Bill-Peter Strong'),
  (4,4,'Roger-Freedie Shannon');

INSERT INTO `historico` (`usuario_id`, `musica_id`, `historico`)
VALUES
  (1,1,'Thati-Soul For Us'),
  (1,6,'Thati-Magic Circus'),
  (1,14,'Thati-Diamond Power'),
  (1,16,'Thati-Thang Of Thunder'),
  (2,13,'Cintia-Home Forever'),
  (2,17,'Cintia-Words Of Her Life'),
  (2,2,'Cintia-Reflections Of Magic'),
  (2,15,'Cintia-Honey, Let’s Be Silly'),
  (3,4,'Bill-Troubles Of My Inner Fire'),
  (3,16,'Bill-Thang Of Thunder'),
  (3,6,'Bill-Magic Circus'),
  (4,3,'Roger-Dance With Her Own'),
  (4,18,'Roger-Without My Streets'),
  (4,11,'Roger-Celebration Of More');
