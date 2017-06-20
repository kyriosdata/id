DROP TABLE IF EXISTS Nome;
DROP TABLE IF EXISTS UsoCondicional;

/*
  LOOKUP TABLE
  Seção 9.5.3
  Indicador da ordem de uso de sobrenome.
 */

CREATE TABLE NumeroSequenciaSobrenome (
  ordem int,
  descricao varchar
);

INSERT INTO NumeroSequenciaSobrenome VALUES (1, 'Primeiro sobrenome do nome');
INSERT INTO NumeroSequenciaSobrenome VALUES (2, 'Segundo sobrenome do nome');
INSERT INTO NumeroSequenciaSobrenome VALUES (3, 'Terceiro sobrenome do nome');
INSERT INTO NumeroSequenciaSobrenome VALUES (4, 'Quarto sobrenome do nome');
INSERT INTO NumeroSequenciaSobrenome VALUES (5, 'Quinto sobrenome do nome');
INSERT INTO NumeroSequenciaSobrenome VALUES (6, 'Sexto sobrenome do nome');
INSERT INTO NumeroSequenciaSobrenome VALUES (7, 'Sétimo sobrenome do nome');
INSERT INTO NumeroSequenciaSobrenome VALUES (8, 'Oitavo sobrenome do nome');
INSERT INTO NumeroSequenciaSobrenome VALUES (9, 'Nono e subsequentes sobrenomes do nome');

/*
  Seção 9.5
  Grupo do sobrenome
  Este grupo inclui cada elemento do sobrenome de um conjunto de
  sobrenomes e indica a sequência de uso dos sobrenomes.
 */

CREATE TABLE Sobrenome (
  nome varchar,
  ordem int
);

ALTER TABLE Sobrenome
  ADD CONSTRAINT FK_NumeroSequenciaSobrenome
FOREIGN KEY (ordem) REFERENCES NumeroSequenciaSobrenome(ordem);
