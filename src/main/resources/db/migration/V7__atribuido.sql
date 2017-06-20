DROP TABLE IF EXISTS NomeAtribuido;
DROP TABLE IF EXISTS NumeroSequenciaNomeAtribuido;

/*
  LOOKUP TABLE
  Seção 9.7.3 (página 38)
  Indica a ordem de um determinado nome atribuído.
 */

CREATE TABLE NumeroSequenciaNomeAtribuido (
  ordem int,
  descricao varchar,
  PRIMARY KEY (ordem)
);

INSERT INTO NumeroSequenciaNomeAtribuido VALUES (1, 'Primeiro nome atribuído');
INSERT INTO NumeroSequenciaNomeAtribuido VALUES (2, 'Segundo nome atribuído');
INSERT INTO NumeroSequenciaNomeAtribuido VALUES (3, 'Terceiro nome atribuído');
INSERT INTO NumeroSequenciaNomeAtribuido VALUES (4, 'Quarto nome atribuído');
INSERT INTO NumeroSequenciaNomeAtribuido VALUES (5, 'Quinto nome atribuído');
INSERT INTO NumeroSequenciaNomeAtribuido VALUES (6, 'Sexto nome atribuído');
INSERT INTO NumeroSequenciaNomeAtribuido VALUES (7, 'Sétimo nome atribuído');
INSERT INTO NumeroSequenciaNomeAtribuido VALUES (8, 'Oitavo nome atribuído');
INSERT INTO NumeroSequenciaNomeAtribuido VALUES (9, 'Nono e subsequentes nomes atribuídos');

/*
  LOOKUP TABLE
  Seção 9.7.2 (página 34)
  Título, honorífico ou prefixo do nome de referência, que inicia um
  nome, usada ao se referir a um indivíduo pelo nome, seja por carta,
  por telefone ou, dependendo da situação cultural, pessoalmente.
 */

CREATE TABLE NomeAtribuido (
  nome varchar,
  ordem int
);

ALTER TABLE NomeAtribuido
  ADD CONSTRAINT FK_NumeroSequenciaNomeAtribuido
FOREIGN KEY (ordem) REFERENCES NumeroSequenciaNomeAtribuido(ordem);

/*
  "Maria Georgina da Silva"
 */
INSERT INTO NomeAtribuido VALUES ('Maria', 1);
INSERT INTO NomeAtribuido VALUES ('Georgina', 2);

