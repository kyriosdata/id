/*
  LOOKUP TABLES.

  Tabelas que contêm valores válidos para
  vários campos empregados para a identificação de
  indivíduos.
 */

DROP TABLE IF EXISTS AREAGEOGRAFICA;
DROP TABLE IF EXISTS TIPOCERTIDAO;
DROP TABLE IF EXISTS TIPOIDENTIFICADOR;
DROP TABLE IF EXISTS USOCONDICIONAL;
DROP TABLE IF EXISTS NOMEPREFERIDO;
DROP TABLE IF EXISTS NOMEUSO;
DROP TABLE IF EXISTS NOMEDETITULO;
DROP TABLE IF EXISTS NOMESUFIXO;
DROP TABLE IF EXISTS PAIS;


CREATE TABLE AREAGEOGRAFICA (
  codigo int,
  alternativo char(1),
  descricao varchar,
  PRIMARY KEY (codigo)
);

INSERT INTO AREAGEOGRAFICA VALUES (1, 'L', 'Identificador do sujeito local');
INSERT INTO AREAGEOGRAFICA VALUES (2, 'A', 'Identificador da área/região/distrito');
INSERT INTO AREAGEOGRAFICA VALUES (3, 'E', 'Identificador do estado/província/território');
INSERT INTO AREAGEOGRAFICA VALUES (4, 'N', 'Identificador nacional');

/*
  Indicação se o indivíduo é brasileiro ou estrangeiro.
 */

CREATE TABLE NACIONALIDADE (
  codigo int,
  descricao varchar,
  PRIMARY KEY (codigo)
);

INSERT INTO NACIONALIDADE VALUES (1, 'Brasileiro');
INSERT INTO NACIONALIDADE VALUES (2, 'Estrangeiro');

/*
  Seção 10.3.4 (pág. 53)
  Indica a fonte de notificação do óbito.
 */

CREATE TABLE OBITOFONTE (
  codigo int,
  descricao varchar,
  PRIMARY KEY (codigo)
);

INSERT INTO OBITOFONTE VALUES (1, 'Cartório');
INSERT INTO OBITOFONTE VALUES (2, 'Prestador de assistência à saúde');
INSERT INTO OBITOFONTE VALUES (3, 'Parente');
INSERT INTO OBITOFONTE VALUES (4, 'Outro');
INSERT INTO OBITOFONTE VALUES (9, 'Desconhecido');

/*
  Raça/cor
 */

CREATE TABLE RACA (
  codigo int,
  descricao varchar,
  PRIMARY KEY (codigo)
);

INSERT INTO RACA VALUES (1, 'Branca');
INSERT INTO RACA VALUES (2, 'Preta');
INSERT INTO RACA VALUES (3, 'Parda');
INSERT INTO RACA VALUES (4, 'Amarela');
INSERT INTO RACA VALUES (5, 'Indígena');

/*
  Sexo do indivíduo para propósitos administrativos.
 */

CREATE TABLE SEXO (
  codigo int,
  descricao varchar,
  alternativo char(1),
  PRIMARY KEY (codigo)
);

INSERT INTO SEXO VALUES (1, 'Masculino', 'M');
INSERT INTO SEXO VALUES (2, 'Feminino', 'F');
INSERT INTO SEXO VALUES (3, 'Intersexo ou indeterminado', 'I');
INSERT INTO SEXO VALUES (9, 'Não declarado ou descrito inadequadamente', 'U');

/*
  Situação familiar indica a relação do indivíduo com as pessoas
  com as quais convive.
 */

CREATE TABLE SITUACAOFAMILIAR (
  codigo int,
  descricao varchar,
  PRIMARY KEY (codigo)
);

INSERT INTO SITUACAOFAMILIAR VALUES (1, 'Convive com companheiro(a) e filho(s)');
INSERT INTO SITUACAOFAMILIAR VALUES (2, 'Convive com companheiro(a) com laços conjugais e sem filhos');
INSERT INTO SITUACAOFAMILIAR VALUES (3, 'Convive com companheiro(a), com filho(s) e/ou outro(s) familiares');
INSERT INTO SITUACAOFAMILIAR VALUES (4, 'Convive com familiar(es) sem companheira(o)');
INSERT INTO SITUACAOFAMILIAR VALUES (5, 'Convive com outra(s) pessoa(s), sem laços consanguíneos e/ou laços conjugais');
INSERT INTO SITUACAOFAMILIAR VALUES (6, 'Vive só');

/*
  Seguimento de data. Indica se a data em questão precisa de acompanhamento
  para obter dados mais acurados.
 */

CREATE TABLE DATASEGUIMENTO (
  codigo char(1),
  descricao varchar,
  PRIMARY KEY (codigo)
);

INSERT INTO DATASEGUIMENTO VALUES ('S', 'A data precisa de seguimento');
INSERT INTO DATASEGUIMENTO VALUES ('N', 'A data não precisa de seguimento');

/*
  Seção 10.15 (pág. 60)
  A ordem sequencial deste indivíduo em um nascimento múltiplo, não
  importando se foi uma nascido vivo ou morto.
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
  Seção 10.14 (pág. 59)
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

INSERT INTO TIPOIDENTIFICADOR VALUES ('10', 'SSP');
INSERT INTO TIPOIDENTIFICADOR VALUES ('40', 'Organismos militares');
INSERT INTO TIPOIDENTIFICADOR VALUES ('41', 'Comando da Aeronáutica (Ministério da Aerotnáutica)');
INSERT INTO TIPOIDENTIFICADOR VALUES ('42', 'Comando do Exército (Ministério do Exército)');
INSERT INTO TIPOIDENTIFICADOR VALUES ('43', 'Comando da Marinha (Ministério da Marinha)');
INSERT INTO TIPOIDENTIFICADOR VALUES ('44', 'Polícia Federal');
INSERT INTO TIPOIDENTIFICADOR VALUES ('60', 'Carteira de identidade classista');
INSERT INTO TIPOIDENTIFICADOR VALUES ('61', 'Conselho Regional de Administração');
INSERT INTO TIPOIDENTIFICADOR VALUES ('62', 'Conselho Regional de Assistência Social');
INSERT INTO TIPOIDENTIFICADOR VALUES ('63', 'Conselho Regional de Biblioteconomia');
INSERT INTO TIPOIDENTIFICADOR VALUES ('64', 'Conselho Regional de Contabilidade');
INSERT INTO TIPOIDENTIFICADOR VALUES ('65', 'Conselho Regional de Corretores Imóveis');
INSERT INTO TIPOIDENTIFICADOR VALUES ('66', 'Conselho Regional de Enfermagem');
INSERT INTO TIPOIDENTIFICADOR VALUES ('67', 'Conselho Regional de Engenharia, Arquitetura e Agronomia');
INSERT INTO TIPOIDENTIFICADOR VALUES ('68', 'Conselho Regional de Estatística');
INSERT INTO TIPOIDENTIFICADOR VALUES ('69', 'Conselho Regional de Farmácia');
INSERT INTO TIPOIDENTIFICADOR VALUES ('70', 'Conselho Regional de Fisioterapi e Terapia Ocupacional');
INSERT INTO TIPOIDENTIFICADOR VALUES ('71', 'Conselho Regional de Medicina');
INSERT INTO TIPOIDENTIFICADOR VALUES ('72', 'Conselho Regional de Medicina Veterinária');
INSERT INTO TIPOIDENTIFICADOR VALUES ('73', 'Ordem dos Músicos do Brasil');
INSERT INTO TIPOIDENTIFICADOR VALUES ('74', 'Conselho Regional de Nutrição');
INSERT INTO TIPOIDENTIFICADOR VALUES ('75', 'Conselho Regional de Odontologia');
INSERT INTO TIPOIDENTIFICADOR VALUES ('76', 'Conselho Regional de Profissionais de Relações Públicas');
INSERT INTO TIPOIDENTIFICADOR VALUES ('77', 'Conselho Regional de Psicologia');
INSERT INTO TIPOIDENTIFICADOR VALUES ('78', 'Conselho Regional de Química');
INSERT INTO TIPOIDENTIFICADOR VALUES ('79', 'Conselho Regional de Representantes Comerciais');
INSERT INTO TIPOIDENTIFICADOR VALUES ('80', 'Ordem dos Advogados do Brasil');
INSERT INTO TIPOIDENTIFICADOR VALUES ('81', 'Outros Emissores');
INSERT INTO TIPOIDENTIFICADOR VALUES ('82', 'Documento Estrangeiro');

/*
  Seção 12.2 (pág. 85)
  Tipo de meio de comunicação eletrônica.
 */

CREATE TABLE COMUNICACAOMEIO (
  codigo int,
  descricao varchar,
  alternativo char(1),
  PRIMARY KEY (codigo)
);

INSERT INTO COMUNICACAOMEIO VALUES (1, 'Telefone (excluindo o celular)', 'T');
INSERT INTO COMUNICACAOMEIO VALUES (2, 'Telefone celular', 'C');
INSERT INTO COMUNICACAOMEIO VALUES (3, 'Fax', 'F');
INSERT INTO COMUNICACAOMEIO VALUES (4, 'Pager', 'P');
INSERT INTO COMUNICACAOMEIO VALUES (5, 'Correio eletrônico', 'E');
INSERT INTO COMUNICACAOMEIO VALUES (6, 'URL', 'U');
INSERT INTO COMUNICACAOMEIO VALUES (8, 'Outro', 'O');

/*
  Tipo de preferência.
 */

CREATE TABLE COMUNICACAOPREFERENCIA (
  codigo char(1),
  descricao varchar,
  PRIMARY KEY (codigo)
);

INSERT INTO COMUNICACAOPREFERENCIA VALUES ('B', 'Horário comercial');
INSERT INTO COMUNICACAOPREFERENCIA VALUES ('D', 'Durante o dia');
INSERT INTO COMUNICACAOPREFERENCIA VALUES ('W', 'Finais de semana');
INSERT INTO COMUNICACAOPREFERENCIA VALUES ('A', 'Qualquer hora');
INSERT INTO COMUNICACAOPREFERENCIA VALUES ('E', 'Período noturno');

/*
  Tipo de uso de meio de comunicação.
 */

CREATE TABLE COMUNICACAOUSO (
  codigo int,
  descricao varchar,
  alternativo char(1),
  PRIMARY KEY (codigo)
);

INSERT INTO COMUNICACAOUSO VALUES (1, 'Comercial', 'B');
INSERT INTO COMUNICACAOUSO VALUES (2, 'Pessoal', 'P');
INSERT INTO COMUNICACAOUSO VALUES (3, 'Tanto comercial quanto pessoal', 'A');

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
  Seção 9.3 Nome preferido
 */

CREATE TABLE NOMEPREFERIDO (
  codigo int,
  descricao varchar,
  PRIMARY KEY (codigo)
);

INSERT INTO NOMEPREFERIDO VALUES (1, 'Este é o nome preferido');
INSERT INTO NOMEPREFERIDO VALUES (2, 'Este não é o nome preferido');

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
  Seção 9.9.2 (pág. 40) Uso do nome
 */

CREATE TABLE NOMEUSO (
  codigo int,
  alternativo char(1),
  descricao varchar,
  PRIMARY KEY (codigo)
);

INSERT INTO NOMEUSO VALUES (1, 'R', 'relatório');
INSERT INTO NOMEUSO VALUES (2, 'N', 'Nome de recém-nascido');
INSERT INTO NOMEUSO VALUES (3, 'C', 'Nome profissional ou comercial');
INSERT INTO NOMEUSO VALUES (4, 'S', 'Nome de solteiro (nome de nascimento) (nome original)');
INSERT INTO NOMEUSO VALUES (5, 'L', 'Nome registrado (nome legal)');
INSERT INTO NOMEUSO VALUES (8, 'O', 'Outro nome (alias)');

/*
  LOOKUP TABLE Tipo de endereço
  Seção 11.9 (pág. 77).
 */

CREATE TABLE ENDERECOTIPO (
  codigo int,
  descricao varchar,
  PRIMARY KEY (codigo)
);

INSERT INTO ENDERECOTIPO VALUES (1, 'Comercial');
INSERT INTO ENDERECOTIPO VALUES (2, 'Correio ou postal');
INSERT INTO ENDERECOTIPO VALUES (3, 'Acomodação temporária');
INSERT INTO ENDERECOTIPO VALUES (4, 'Residencial');
INSERT INTO ENDERECOTIPO VALUES (8, 'Sem endereço fixo');
INSERT INTO ENDERECOTIPO VALUES (9, 'Desconhecido, ou não declarado, ou inadequadamente descrito');