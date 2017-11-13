/*
  LOOKUP TABLES.

  Tabelas que contêm valores válidos para
  vários campos empregados para a identificação de
  indivíduos.
 */

DROP TABLE IF EXISTS AREAGEOGRAFICA;
DROP TABLE IF EXISTS ESTADO;
DROP TABLE IF EXISTS TIPOCERTIDAO;
DROP TABLE IF EXISTS TIPOIDENTIFICADOR;
DROP TABLE IF EXISTS USOCONDICIONAL;
DROP TABLE IF EXISTS USODONOME;
DROP TABLE IF EXISTS NOMEDETITULO;
DROP TABLE IF EXISTS NOMESUFIXO;

CREATE TABLE ESTADO (
  codigo varchar(2),
  nome varchar,
  PRIMARY KEY (codigo)
);

INSERT INTO ESTADO VALUES ('GO', 'Goiás');
INSERT INTO ESTADO VALUES ('RJ', 'Rio de Janeiro');
INSERT INTO ESTADO VALUES ('SP', 'São Paulo');

CREATE TABLE AREAGEOGRAFICA (
  codigo int,
  codigoAlternativo char,
  descricao varchar,
  PRIMARY KEY (codigo)
);

INSERT INTO AREAGEOGRAFICA VALUES (1, 'L', 'Identificador do sujeito local');
INSERT INTO AREAGEOGRAFICA VALUES (2, 'A', 'Identificador da área/região/distrito');
INSERT INTO AREAGEOGRAFICA VALUES (3, 'E', 'Identificador do estado/província/território');
INSERT INTO AREAGEOGRAFICA VALUES (4, 'N', 'Identificador nacional');

/*
  Seguimento de data. Indica se a data em questão precisa de acompanhamento
  para obter dados mais acurados.
 */

CREATE TABLE DATASEGUIMENTO (
  codigo char,
  descricao varchar,
  PRIMARY KEY (codigo)
);

INSERT INTO DATASEGUIMENTO VALUES ('S', 'A data precisa de seguimento');
INSERT INTO DATASEGUIMENTO VALUES ('N', 'A data não precisa de seguimento');

/*
  Pluralidade de nascimento é um indicador que contempla
  nascimentos múltiplos.
 */

CREATE TABLE NASCIMENTOORDEM (
  codigo int,
  descricao varchar,
  PRIMARY KEY (codigo)
);

INSERT INTO NASCIMENTOORDEM VALUES (1, 'Único ou primeiro de um nascimento múltiplo');
INSERT INTO NASCIMENTOORDEM VALUES (2, 'Segundo de um nascimento múltiplo');
INSERT INTO NASCIMENTOORDEM VALUES (3, 'Terceiro de um nascimento múltiplo');
INSERT INTO NASCIMENTOORDEM VALUES (4, 'Quarto de um nascimento múltiplo');
INSERT INTO NASCIMENTOORDEM VALUES (5, 'Quinto de um nascimento múltiplo');
INSERT INTO NASCIMENTOORDEM VALUES (6, 'Sexto de um nascimento múltiplo');
INSERT INTO NASCIMENTOORDEM VALUES (7, 'Outros');
INSERT INTO NASCIMENTOORDEM VALUES (9, 'Não declarado');


/*
  Pluralidade de nascimento é um indicador que contempla
  nascimentos múltiplos.
 */

CREATE TABLE NASCIMENTOPLURALIDADE (
  codigo int,
  descricao varchar,
  PRIMARY KEY (codigo)
);

INSERT INTO NASCIMENTOPLURALIDADE VALUES (1, 'Único');
INSERT INTO NASCIMENTOPLURALIDADE VALUES (2, 'Gêmeos');
INSERT INTO NASCIMENTOPLURALIDADE VALUES (3, 'Trigêmeos');
INSERT INTO NASCIMENTOPLURALIDADE VALUES (4, 'Quádruplos');
INSERT INTO NASCIMENTOPLURALIDADE VALUES (5, 'Quíntuplos');
INSERT INTO NASCIMENTOPLURALIDADE VALUES (6, 'Sêxtuplos');
INSERT INTO NASCIMENTOPLURALIDADE VALUES (7, 'Outros');
INSERT INTO NASCIMENTOPLURALIDADE VALUES (9, 'Não declarado');

CREATE TABLE TIPOCERTIDAO (
  codigo int,
  descricao varchar,
  PRIMARY KEY (codigo)
);

INSERT INTO TIPOCERTIDAO VALUES (1, 'nascimento');
INSERT INTO TIPOCERTIDAO VALUES (2, 'casamento');
INSERT INTO TIPOCERTIDAO VALUES (3, 'divórcio');

/*
  LOOKUP TABLE
  Tipo de identificador usando pela organização, por exemplo,
  identificador único do paciente, cartão de saúde, cartão da previdência.
  FONTES ENCONTRADAS:
  http://www.pmf.sc.gov.br/arquivos/arquivos/pdf/04_01_2010_10.17.42.24125bd84cc115c7ed10f14d211976a2.PDF
 */

CREATE TABLE TIPOIDENTIFICADOR (
  codigo varchar,
  descricao varchar,
  PRIMARY KEY (codigo)
);

INSERT INTO TIPOIDENTIFICADOR VALUES ('01', 'Identificador único dentro da organização');
INSERT INTO TIPOIDENTIFICADOR VALUES ('21', 'radiologia');
INSERT INTO TIPOIDENTIFICADOR VALUES ('22', 'patologia');

/*
  Tipo de meio de comunicação eletrônica.
 */

CREATE TABLE TIPOCOMUNICACAO (
  codigo int,
  alternativo char,
  descricao varchar,
  PRIMARY KEY (codigo)
);

INSERT INTO TIPOCOMUNICACAO VALUES (1, 'Telefone (excluindo o celular)', 'T');
INSERT INTO TIPOCOMUNICACAO VALUES (2, 'Telefone celular', 'C');
INSERT INTO TIPOCOMUNICACAO VALUES (3, 'Fax', 'F');
INSERT INTO TIPOCOMUNICACAO VALUES (4, 'Pager', 'P');
INSERT INTO TIPOCOMUNICACAO VALUES (5, 'Correio eletrônico', 'E');
INSERT INTO TIPOCOMUNICACAO VALUES (6, 'URL', 'U');
INSERT INTO TIPOCOMUNICACAO VALUES (8, 'Outro', 'O');

/*
  Tipo de preferência.
 */

CREATE TABLE HORARIOCONTATO (
  codigo char,
  descricao varchar
);

INSERT INTO HORARIOCONTATO VALUES ('B', 'Horário comercial');
INSERT INTO HORARIOCONTATO VALUES ('D', 'Durante o dia');
INSERT INTO HORARIOCONTATO VALUES ('W', 'Finais de semana');
INSERT INTO HORARIOCONTATO VALUES ('A', 'Qualquer hora');
INSERT INTO HORARIOCONTATO VALUES ('E', 'Período noturno');

/*
  Tipo de uso de meio de comunicação.
 */

CREATE TABLE TIPOUSO (
  codigo int,
  descricao varchar,
  alternativo char,
  PRIMARY KEY (codigo)
);

INSERT INTO TIPOUSO VALUES (1, 'Comercial', 'B');
INSERT INTO TIPOUSO VALUES (2, 'Pessoal', 'P');
INSERT INTO TIPOUSO VALUES (3, 'Tanto comercial quanto pessoal', 'A');

/*
  Tipos de relacionamentos previstos.
 */
CREATE TABLE TIPORELACIONAMENTO (
  codigo int,
  descricao varchar,
  PRIMARY KEY (codigo)
);

INSERT INTO TIPORELACIONAMENTO VALUES (7, 'Avó materna');
INSERT INTO TIPORELACIONAMENTO VALUES (8, 'Avô materno');
INSERT INTO TIPORELACIONAMENTO VALUES (22, 'Cônjuge/companheiro(a)');
INSERT INTO TIPORELACIONAMENTO VALUES (23, 'Irmão');
INSERT INTO TIPORELACIONAMENTO VALUES (24, 'Irmã');
INSERT INTO TIPORELACIONAMENTO VALUES (25, 'Meio-irmão');
INSERT INTO TIPORELACIONAMENTO VALUES (26, 'Meia-irmã');
INSERT INTO TIPORELACIONAMENTO VALUES (27, 'Irmãos');
INSERT INTO TIPORELACIONAMENTO VALUES (28, 'Criança');
INSERT INTO TIPORELACIONAMENTO VALUES (29, 'Filha');
INSERT INTO TIPORELACIONAMENTO VALUES (36, 'Avô paterna');
INSERT INTO TIPORELACIONAMENTO VALUES (37, 'Avô paterno');
INSERT INTO TIPORELACIONAMENTO VALUES (38, 'Tio materno');
INSERT INTO TIPORELACIONAMENTO VALUES (40, 'Tio paterno');
INSERT INTO TIPORELACIONAMENTO VALUES (41, 'Tia paterna');
INSERT INTO TIPORELACIONAMENTO VALUES (189, 'Recém-nascido');
INSERT INTO TIPORELACIONAMENTO VALUES (254, 'Pais');
INSERT INTO TIPORELACIONAMENTO VALUES (262, 'Mãe adotiva');
INSERT INTO TIPORELACIONAMENTO VALUES (263, 'Pai adotivo');
INSERT INTO TIPORELACIONAMENTO VALUES (264, 'Responsável');
INSERT INTO TIPORELACIONAMENTO VALUES (265, 'Coabitante');
INSERT INTO TIPORELACIONAMENTO VALUES (939, 'Tia materna');

/*
  LOOKUP TABLE
  Seção 9.4 Uso condicional
 */
CREATE TABLE USOCONDICIONAL (
  codigo int,
  descricao varchar
);

INSERT INTO USOCONDICIONAL VALUES (1, 'Informação não confiável');
INSERT INTO USOCONDICIONAL VALUES (2, 'Nome com erro de digitação');
INSERT INTO USOCONDICIONAL VALUES (3, 'Nome para não ser usado');
INSERT INTO USOCONDICIONAL VALUES (4, 'Vínculo do nome proibido por lei');
INSERT INTO USOCONDICIONAL VALUES (6, 'Requisito de privacidade/segurança especial');
INSERT INTO USOCONDICIONAL VALUES (9, 'Nome temporário');


/*
  LOOKUP TABLE
  Seção 9.9.2 Uso do nome
 */

CREATE TABLE USODONOME (
  codigo int,
  alternativo char,
  descricao varchar
);

INSERT INTO USODONOME VALUES (1, 'R', 'relatório');
INSERT INTO USODONOME VALUES (2, 'N', 'Nome de recém-nascido');
INSERT INTO USODONOME VALUES (3, 'C', 'Nome profissional ou comercial');
INSERT INTO USODONOME VALUES (4, 'S', 'Nome de solteiro (nome de nascimento) (nome original)');
INSERT INTO USODONOME VALUES (8, 'O', 'Outro nome (alias)');

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

