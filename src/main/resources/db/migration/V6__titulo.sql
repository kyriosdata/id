DROP TABLE IF EXISTS Titulo;
DROP TABLE IF EXISTS NumeroSequenciaTitulo;
DROP TABLE IF EXISTS NomeDeTitulo;

/*
  LOOKUP TABLE
  Seção 9.6.3 (página 33)
  Indica a ordem de um determinado título no nome.
  Por exemplo, Prof. Dr. faz uso de dois títulos,
  primeiro Prof. seguido de Dr (segundo).
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
  Seção 9.6 (página 31)
  Mantém detalhes de cada título relevante para um sobrenome específico
  para um indivíduo. O grupo indica o título e a sequência (ordem) em que o
  título deve aparecer antes do nome da pessoa. Por exemplo,
  Prof. Dr. faz uso de dois títulos, Prof. de ordem 1 e Dr. de ordem 2.
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
