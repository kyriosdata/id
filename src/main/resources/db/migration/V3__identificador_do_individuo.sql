
/* LOOKUP TABLE
   Um código que representa a área geográfica na qual
   o identificador é utilizado.
*/

CREATE TABLE AreaGeografica (
  codigo int,
  codigoAlternativo char,
  descricao varchar,
  PRIMARY KEY (codigo)
);

INSERT INTO AreaGeografica VALUES (1, 'L', 'Identificador do sujeito local');
INSERT INTO AreaGeografica VALUES (2, 'A', 'Identificador da área/região/distrito');
INSERT INTO AreaGeografica VALUES (3, 'E', 'Identificador do estado/província/território');
INSERT INTO AreaGeografica VALUES (4, 'N', 'Identificador nacional');


CREATE TABLE IdentificadorDoIndividuo (
  designacao varchar,
  area int
);

ALTER TABLE IdentificadorDoIndividuo
ADD CONSTRAINT FK_AreaGeograficaCodigo
FOREIGN KEY (area) REFERENCES AreaGeografica(codigo);

INSERT INTO IdentificadorDoIndividuo VALUES (1, 1);
INSERT INTO IdentificadorDoIndividuo VALUES (1, 4);
