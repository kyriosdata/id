DROP TABLE IF EXISTS Sufixo;
DROP TABLE IF EXISTS NumeroSequenciaSufixo;

/*
  LOOKUP TABLE
  Seção 9.8.3 (página 39)
  Indica a ordem de um determinado sufixo de nome.
 */

CREATE TABLE NumeroSequenciaSufixo (
  ordem int,
  descricao varchar,
  PRIMARY KEY (ordem)
);

INSERT INTO NumeroSequenciaSufixo VALUES (1, 'Primeiro sufixo do nome');
INSERT INTO NumeroSequenciaSufixo VALUES (2, 'Segundo sufixo do nome');
INSERT INTO NumeroSequenciaSufixo VALUES (3, 'Terceiro sufixo do nome');
INSERT INTO NumeroSequenciaSufixo VALUES (4, 'Quarto sufixo do nome');
INSERT INTO NumeroSequenciaSufixo VALUES (5, 'Quinto sufixo do nome');
INSERT INTO NumeroSequenciaSufixo VALUES (6, 'Sexto sufixo do nome');
INSERT INTO NumeroSequenciaSufixo VALUES (7, 'Sétimo sufixo do nome');
INSERT INTO NumeroSequenciaSufixo VALUES (8, 'Oitavo sufixo do nome');
INSERT INTO NumeroSequenciaSufixo VALUES (9, 'Nono sufixo do nome e sufixos subsequentes');

/*
  LOOKUP TABLE
  Seção 9.8.2 (página 38)
 */

CREATE TABLE NomeSufixo (
  sufixo varchar,
  abreviacao VARCHAR
);

INSERT INTO NomeSufixo VALUES ('Junior', 'Jr.');
INSERT INTO NomeSufixo VALUES ('Membro do Parlamento', 'MP');
INSERT INTO NomeSufixo VALUES ('Senior', 'Sr.');
INSERT INTO NomeSufixo VALUES ('Primeiro', 'I');
INSERT INTO NomeSufixo VALUES ('Segundo', 'II');
INSERT INTO NomeSufixo VALUES ('Terceiro', 'III');
INSERT INTO NomeSufixo VALUES ('Quarto', 'IV');
INSERT INTO NomeSufixo VALUES ('Quinto', 'V');
INSERT INTO NomeSufixo VALUES ('Sexto', 'VI');
INSERT INTO NomeSufixo VALUES ('Sétimo', 'VII');
INSERT INTO NomeSufixo VALUES ('Oitavo', 'VIII');
INSERT INTO NomeSufixo VALUES ('Nono', 'IX');
INSERT INTO NomeSufixo VALUES ('Décimo', 'X');
INSERT INTO NomeSufixo VALUES ('PhD', 'PhD');
INSERT INTO NomeSufixo VALUES ('Doutor em Medicina', 'MD');

ALTER TABLE NomeAtribuido
  ADD CONSTRAINT FK_NumeroSequenciaNomeAtribuido
FOREIGN KEY (ordem) REFERENCES NumeroSequenciaNomeAtribuido(ordem);

/*
  "Maria Georgina da Silva"
 */
INSERT INTO NomeAtribuido VALUES ('Maria', 1);
INSERT INTO NomeAtribuido VALUES ('Georgina', 2);

