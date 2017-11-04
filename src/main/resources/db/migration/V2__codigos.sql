/*
  LOOKUP TABLES
  Tabelas que mantêm códigos predefinidos utilizados em campos
  de outras tabelas.
 */

DROP TABLE IF EXISTS AreaGeografica;
DROP TABLE IF EXISTS Estado;
DROP TABLE IF EXISTS TipoDoIdentificador;
DROP TABLE IF EXISTS UsoCondicional;
DROP TABLE IF EXISTS UsoDoNome;
DROP TABLE IF EXISTS NOMEDETITULO;
DROP TABLE IF EXISTS NOMESUFIXO;

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

/*
  LOOKUP TABLE
  Seção 9.4 Uso condicional
 */
CREATE TABLE UsoCondicional (
  codigo int,
  descricao varchar
);

INSERT INTO UsoCondicional VALUES (1, 'Informação não confiável');
INSERT INTO UsoCondicional VALUES (2, 'Nome com erro de digitação');
INSERT INTO UsoCondicional VALUES (3, 'Nome para não ser usado');
INSERT INTO UsoCondicional VALUES (4, 'Vínculo do nome proibido por lei');
INSERT INTO UsoCondicional VALUES (6, 'Requisito de privacidade/segurança especial');
INSERT INTO UsoCondicional VALUES (9, 'Nome temporário');


/*
  LOOKUP TABLE
  Seção 9.9.2 Uso do nome
 */

CREATE TABLE UsoDoNome (
  codigo int,
  alternativo char,
  descricao varchar
);

INSERT INTO UsoDoNome VALUES (1, 'R', 'relatório');
INSERT INTO UsoDoNome VALUES (2, 'N', 'Nome de recém-nascido');
INSERT INTO UsoDoNome VALUES (3, 'C', 'Nome profissional ou comercial');
INSERT INTO UsoDoNome VALUES (4, 'S', 'Nome de solteiro (nome de nascimento) (nome original)');
INSERT INTO UsoDoNome VALUES (8, 'O', 'Outro nome (alias)');

/*
  LOOKUP TABLE
  Seção 9.6.2 (página 32)
  Título, honorífico ou prefixo do nome de referência, que inicia um
  nome, usada ao se referir a um indivíduo pelo nome, seja por carta,
  por telefone ou, dependendo da situação cultural, pessoalmente.
 */

CREATE TABLE NOMEDETITULO (
  nome varchar,
  abreviacao varchar,
  PRIMARY KEY (abreviacao)
);

/*
  TODO Acrescentar na tabela lista "completa" de pronomes de tratamento.
 */
INSERT INTO NOMEDETITULO VALUES ('Almirante', 'Alm.');
INSERT INTO NOMEDETITULO VALUES ('Capitão', 'Cap.');
INSERT INTO NOMEDETITULO VALUES ('Coronel', 'Cel.');
INSERT INTO NOMEDETITULO VALUES ('General', 'Gen.');
INSERT INTO NOMEDETITULO VALUES ('Herr', 'Herr.');
INSERT INTO NOMEDETITULO VALUES ('Major', 'Maj.');
INSERT INTO NOMEDETITULO VALUES ('Professor', 'Prof.');
INSERT INTO NOMEDETITULO VALUES ('Reverendo', 'Ver.');
INSERT INTO NOMEDETITULO VALUES ('Sargento', 'Sgt.');
INSERT INTO NOMEDETITULO VALUES ('Senhor', 'Sr.');
INSERT INTO NOMEDETITULO VALUES ('Senhora', 'Sra.');
INSERT INTO NOMEDETITULO VALUES ('Senhorita', 'Srta.');

/*
  LOOKUP TABLE
  Seção 9.8.2 (página 38)
 */

CREATE TABLE NOMESUFIXO (
  sufixo varchar,
  abreviacao VARCHAR
);

INSERT INTO NOMESUFIXO VALUES ('Junior', 'Jr.');
INSERT INTO NOMESUFIXO VALUES ('Membro do Parlamento', 'MP');
INSERT INTO NOMESUFIXO VALUES ('Senior', 'Sr.');
INSERT INTO NOMESUFIXO VALUES ('Primeiro', 'I');
INSERT INTO NOMESUFIXO VALUES ('Segundo', 'II');
INSERT INTO NOMESUFIXO VALUES ('Terceiro', 'III');
INSERT INTO NOMESUFIXO VALUES ('Quarto', 'IV');
INSERT INTO NOMESUFIXO VALUES ('Quinto', 'V');
INSERT INTO NOMESUFIXO VALUES ('Sexto', 'VI');
INSERT INTO NOMESUFIXO VALUES ('Sétimo', 'VII');
INSERT INTO NOMESUFIXO VALUES ('Oitavo', 'VIII');
INSERT INTO NOMESUFIXO VALUES ('Nono', 'IX');
INSERT INTO NOMESUFIXO VALUES ('Décimo', 'X');
INSERT INTO NOMESUFIXO VALUES ('PhD', 'PhD');
INSERT INTO NOMESUFIXO VALUES ('Doutor em Medicina', 'MD');

