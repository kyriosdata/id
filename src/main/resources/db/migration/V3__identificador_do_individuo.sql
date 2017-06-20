DROP TABLE IF EXISTS AreaGeografica;
DROP TABLE IF EXISTS IdentificadorDoIndividuo;
DROP TABLE IF EXISTS TipoDoIdentificador;

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

/*
  LOOKUP TABLE
  Tipo de identificador usando pela organização, por exemplo,
  identificador único do paciente, cartão de saúde, cartão da previdência.
  FONTES ENCONTRADAS:
  http://www.pmf.sc.gov.br/arquivos/arquivos/pdf/04_01_2010_10.17.42.24125bd84cc115c7ed10f14d211976a2.PDF
 */

CREATE TABLE TipoDoIdentificador (
  codigo varchar,
  descricao varchar,
  PRIMARY KEY (codigo)
);

INSERT INTO TipoDoIdentificador VALUES ('01', 'Identificador único dentro da organização');
INSERT INTO TipoDoIdentificador VALUES ('21', 'radiologia');
INSERT INTO TipoDoIdentificador VALUES ('22', 'patologia');

CREATE TABLE IdentificadorDoIndividuo (
  designacao varchar NOT NULL,
  area int,
  emissor varchar,
  dataDeEmissao DATE,
  tipoDoIdentificador varchar,
  cartorio varchar,
  livro varchar,
  folha varchar,
  termo varchar,
  serie varchar
);

ALTER TABLE IdentificadorDoIndividuo
  ADD CONSTRAINT FK_AreaGeograficaCodigo
FOREIGN KEY (area) REFERENCES AreaGeografica(codigo);

ALTER TABLE IdentificadorDoIndividuo
  ADD CONSTRAINT FK_TipoDoIdentificadorCodigo
FOREIGN KEY (tipoDoIdentificador) REFERENCES TipoDoIdentificador(codigo);

INSERT INTO IdentificadorDoIndividuo VALUES (1, 1, 'N/A', DATE '2017-12-31', '01');
