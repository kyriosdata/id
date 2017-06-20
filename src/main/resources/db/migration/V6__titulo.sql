DROP TABLE IF EXISTS Titulo;
DROP TABLE IF EXISTS NumeroSequenciaTitulo;
DROP TABLE IF EXISTS NomeDeTitulo;

/*
  LOOKUP TABLE
  Seção 9.6.3
 */

CREATE TABLE NumeroSequenciaTitulo (
  ordem int,
  descricao varchar,
  PRIMARY KEY (ordem)
);

INSERT INTO NumeroSequenciaTitulo VALUES (1, 'Primeiro título do nome');
INSERT INTO NumeroSequenciaTitulo VALUES (2, 'Segundo título do nome');
INSERT INTO NumeroSequenciaTitulo VALUES (3, 'Terceiro título do nome');
INSERT INTO NumeroSequenciaTitulo VALUES (4, 'Quarto título do nome');
INSERT INTO NumeroSequenciaTitulo VALUES (5, 'Quinto título do nome');
INSERT INTO NumeroSequenciaTitulo VALUES (6, 'Sexto título do nome');
INSERT INTO NumeroSequenciaTitulo VALUES (7, 'Sétimo título do nome');
INSERT INTO NumeroSequenciaTitulo VALUES (8, 'Oitavo título do nome');
INSERT INTO NumeroSequenciaTitulo VALUES (9, 'Nono e subsequentes títulos do nome');

/*
  LOOKUP TABLE
  Seção 9.6.2
  Título, honorífico ou prefixo do nome de referência, que inicia um
  nome, usada ao se referir a um indivíduo pelo nome, seja por carta,
  por telefone ou, dependendo da situação cultural, pessoalmente.
 */

CREATE TABLE NomeDeTitulo (
  nome varchar,
  abreviacao varchar,
  PRIMARY KEY (abreviacao)
);

INSERT INTO NomeDeTitulo VALUES ('Almirante', 'Alm.');
INSERT INTO NomeDeTitulo VALUES ('Capitão', 'Cap.');
INSERT INTO NomeDeTitulo VALUES ('Coronel', 'Cel.');
INSERT INTO NomeDeTitulo VALUES ('General', 'Gen.');
INSERT INTO NomeDeTitulo VALUES ('Herr', 'Herr.');
INSERT INTO NomeDeTitulo VALUES ('Major', 'Maj.');
INSERT INTO NomeDeTitulo VALUES ('Senhor', 'Sr.');
INSERT INTO NomeDeTitulo VALUES ('Senhorita', 'Srta.');
INSERT INTO NomeDeTitulo VALUES ('Senhora', 'Sra.');
INSERT INTO NomeDeTitulo VALUES ('Professor', 'Prof.');
INSERT INTO NomeDeTitulo VALUES ('Reverendo', 'Ver.');
INSERT INTO NomeDeTitulo VALUES ('Sargente', 'Sgt.');

/*
  Seção 9.5
  Mantém detalhes de cada título relevante para um sobrenome específico
  para um indivíduo. O grupo indica o título e a sequência (ordem) em que o
  título deve aparecer antes do nome da pessoa.
 */

CREATE TABLE Titulo (
  abreviacao varchar,
  ordem int
);

ALTER TABLE Titulo
  ADD CONSTRAINT FK_NumeroSequenciaTitulo
FOREIGN KEY (ordem) REFERENCES NumeroSequenciaTitulo(ordem);

ALTER TABLE Titulo
  ADD CONSTRAINT FK_NomeDeTituloAbreviacao
FOREIGN KEY (abreviacao) REFERENCES NomeDeTitulo(abreviacao);
