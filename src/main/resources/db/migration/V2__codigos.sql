DROP TABLE IF EXISTS AreaGeografica;
DROP TABLE IF EXISTS Estado;
DROP TABLE IF EXISTS Identificador;
DROP TABLE IF EXISTS TipoDoIdentificador;

/* LOOKUP TABLE
   O código do estado onde foi emitida a carteira de trabalho
   do indivíduo.
*/

CREATE TABLE Estado (
  codigo varchar(2),
  nome varchar,
  PRIMARY KEY (codigo)
);

INSERT INTO Estado VALUES ('GO', 'Goiás');
INSERT INTO Estado VALUES ('RJ', 'Rio de Janeiro');
INSERT INTO Estado VALUES ('SP', 'São Paulo');

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
