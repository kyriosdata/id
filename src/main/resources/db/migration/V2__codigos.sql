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
DROP TABLE IF EXISTS NOMEPREFERIDO;
DROP TABLE IF EXISTS USODONOME;
DROP TABLE IF EXISTS NOMEDETITULO;
DROP TABLE IF EXISTS NOMESUFIXO;
DROP TABLE IF EXISTS PAIS;

CREATE TABLE ESTADO (
  codigo varchar(2),
  nome varchar,
  PRIMARY KEY (codigo)
);

INSERT INTO ESTADO VALUES ('AC', 'Acre');
INSERT INTO ESTADO VALUES ('AL', 'Alagoas');
INSERT INTO ESTADO VALUES ('AM', 'Amazonas');
INSERT INTO ESTADO VALUES ('AP', 'Amapá');
INSERT INTO ESTADO VALUES ('BA', 'Bahia');
INSERT INTO ESTADO VALUES ('CE', 'Ceará');
INSERT INTO ESTADO VALUES ('DF', 'Distrito Federal');
INSERT INTO ESTADO VALUES ('ES', 'Espírito Santo');
INSERT INTO ESTADO VALUES ('GO', 'Goiás');
INSERT INTO ESTADO VALUES ('MA', 'Maranhão');
INSERT INTO ESTADO VALUES ('MG', 'Minas Gerais');
INSERT INTO ESTADO VALUES ('MS', 'Mato Grosso do Sul');
INSERT INTO ESTADO VALUES ('MT', 'Mato Grosso');
INSERT INTO ESTADO VALUES ('PA', 'Pará');
INSERT INTO ESTADO VALUES ('PB', 'Paraíba');
INSERT INTO ESTADO VALUES ('PE', 'Pernambuco');
INSERT INTO ESTADO VALUES ('PI', 'Piauí');
INSERT INTO ESTADO VALUES ('PR', 'Paraná');
INSERT INTO ESTADO VALUES ('RJ', 'Rio de Janeiro');
INSERT INTO ESTADO VALUES ('RN', 'Rio Grande do Norte');
INSERT INTO ESTADO VALUES ('RS', 'Rio Grande do Sul');
INSERT INTO ESTADO VALUES ('RO', 'Rondônia');
INSERT INTO ESTADO VALUES ('RR', 'Roraima');
INSERT INTO ESTADO VALUES ('SC', 'Santa Catarina');
INSERT INTO ESTADO VALUES ('SE', 'Sergipe');
INSERT INTO ESTADO VALUES ('SP', 'São Paulo');
INSERT INTO ESTADO VALUES ('TO', 'Tocantins');

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
  alternativo char,
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

CREATE TABLE PAIS (
  codigo int,
  nome VARCHAR(46),
  PRIMARY KEY (codigo)
);

INSERT INTO PAIS VALUES
  (101,'Afeganistão'),
  (102,'África do Sul'),
  (103,'Albânia'),
  (104,'Alemanha'),
  (105,'Andorra'),
  (106,'Angola'),
  (107,'Anguilla'),
  (108,'Antigua e Barbuda'),
  (109,'Antilhas Holandesas'),
  (110,'Arábia Saudita'),
  (111,'Argélia'),
  (112,'Argentina'),
  (113,'Armênia'),
  (114,'Aruba'),
  (115,'Austrália'),
  (116,'Áustria'),
  (117,'Azerbaijão'),
  (118,'Bahamas'),
  (119,'Bahrein'),
  (120,'Bangladesh'),
  (121,'Barbados'),
  (122,'Bélgica'),
  (123,'Belize'),
  (124,'Benin'),
  (125,'Bermudas'),
  (126,'Bielorússia'),
  (127,'Bolívia'),
  (128,'Bósnia e Herzegóvina'),
  (129,'Botswana'),
  (130,'Brunei'),
  (131,'Bulgária'),
  (132,'Burkina Faso'),
  (133,'Burundi'),
  (134,'Butão'),
  (135,'Cabo Verde'),
  (136,'Camarões'),
  (137,'Camboja'),
  (138,'Canadá'),
  (139,'Cazaquistão'),
  (140,'Chade'),
  (141,'Chile'),
  (142,'China'),
  (143,'Chipre'),
  (144,'Cingapura'),
  (145,'Colômbia'),
  (146,'Coréia do Norte'),
  (147,'Coréia do Sul'),
  (148,'Costa do Marfim'),
  (149,'Costa Rica'),
  (150,'Croácia'),
  (151,'Cuba'),
  (152,'Dinamarca'),
  (153,'Djibuti'),
  (154,'Dominica'),
  (155,'Egito'),
  (156,'El Salvador'),
  (157,'Emirados Árabes Unidos'),
  (158,'Equador'),
  (159,'Eritréia'),
  (160,'Eslováquia'),
  (161,'Eslovênia'),
  (162,'Espanha'),
  (163,'Estados Unidos'),
  (164,'Estônia'),
  (165,'Etiópia'),
  (166,'Fiji'),
  (167,'Filipinas'),
  (168,'Finlândia'),
  (169,'França'),
  (170,'Gabão'),
  (171,'Gâmbia'),
  (172,'Geórgia'),
  (173,'Ghana'),
  (174,'Gibraltar'),
  (175,'Granada'),
  (176,'Grécia'),
  (177,'Groenlândia'),
  (178,'Guadalupe'),
  (179,'Guam'),
  (180,'Guatemala'),
  (181,'Guiana'),
  (182,'Guiana Francesa'),
  (183,'Guiné'),
  (184,'Guiné Bissau'),
  (185,'Guiné Equatorial'),
  (186,'Haiti'),
  (187,'Holanda'),
  (188,'Honduras'),
  (189,'Hungria'),
  (190,'Iêmen'),
  (191,'Ilhas Cayman'),
  (192,'Ilhas Comores'),
  (193,'Ilhas Cook'),
  (194,'Ilhas Falkland (Malvinas)'),
  (195,'Ilhas Färoe'),
  (196,'Ilhas Marianas'),
  (197,'Ilhas Marshall'),
  (198,'Ilhas Pitcairn'),
  (199,'Ilhas Salomão'),
  (200,'Ilhas Turks e Caicos'),
  (201,'Ilhas Virgens Americanas'),
  (202,'Ilhas Virgens Britânicas'),
  (203,'Índia'),
  (204,'Indonésia'),
  (205,'Irã'),
  (206,'Iraque'),
  (207,'Irlanda'),
  (208,'Islândia'),
  (209,'Israel'),
  (210,'Itália'),
  (211,'Jamaica'),
  (212,'Japão'),
  (213,'Jordânia'),
  (214,'Kirguistão'),
  (215,'Kiribati'),
  (216,'Kuwait'),
  (217,'Laos'),
  (218,'Lesotho'),
  (219,'Letônia'),
  (220,'Líbano'),
  (221,'Libéria'),
  (222,'Líbia'),
  (223,'Liechtenstein'),
  (224,'Lituânia'),
  (225,'Luxemburgo'),
  (226,'Macau'),
  (227,'Macedônia'),
  (228,'Madagáscar'),
  (229,'Malaísia'),
  (230,'Malawi'),
  (231,'Maldivas'),
  (232,'Mali'),
  (233,'Malta'),
  (234,'Marrocos'),
  (235,'Martinica'),
  (236,'Maurício'),
  (237,'Mauritânia'),
  (238,'Mayotte'),
  (239,'México'),
  (240,'Mianmar'),
  (241,'Micronésia'),
  (242,'Moçambique'),
  (243,'Moldávia'),
  (244,'Mônaco'),
  (245,'Mongólia'),
  (246,'Montserrat'),
  (247,'Namíbia'),
  (248,'Nauru'),
  (249,'Nepal'),
  (250,'Nicarágua'),
  (251,'Níger'),
  (252,'Nigéria'),
  (253,'Niue'),
  (254,'Noruega'),
  (255,'Nova Caledônia'),
  (256,'Nova Zelândia'),
  (257,'Omã'),
  (258,'Palau'),
  (259,'Panamá'),
  (260,'Papua Nova Guiné'),
  (261,'Paquistão'),
  (262,'Paraguai'),
  (263,'Peru'),
  (264,'Polinésia Francesa'),
  (265,'Polônia'),
  (266,'Porto Rico'),
  (267,'Portugal'),
  (268,'Qatar'),
  (269,'Quênia'),
  (270,'Reino Unido (Grã Bretanha e Irlanda do Norte)'),
  (271,'República Centro Africana'),
  (272,'República Democrática do Congo'),
  (273,'República do Congo'),
  (274,'República Dominicana'),
  (275,'República Tcheca'),
  (276,'Reunião'),
  (277,'Romênia'),
  (278,'Ruanda'),
  (279,'Rússia'),
  (280,'Saara Ocidental'),
  (281,'Saint Pierre e Miquelon'),
  (282,'Samoa'),
  (283,'Samoa Americana'),
  (284,'San Marino'),
  (285,'Santa Helena'),
  (286,'Santa Lúcia'),
  (287,'São Cristóvão e Nevis'),
  (288,'São Tomé e Príncipe'),
  (289,'São Vicente e Granadinas'),
  (290,'Senegal'),
  (291,'Serra Leoa'),
  (292,'Seychelles'),
  (293,'Síria'),
  (294,'Somália'),
  (295,'Sri Lanka'),
  (296,'Suazilândia'),
  (297,'Sudão'),
  (298,'Suécia'),
  (299,'Suíça'),
  (300,'Suriname'),
  (301,'Tadjiquistão'),
  (302,'Tailândia'),
  (303,'Taiwan'),
  (304,'Tanzânia'),
  (305,'Timor Leste'),
  (306,'Togo'),
  (307,'Tokelau'),
  (308,'Tonga'),
  (309,'Trinidad e Tobago'),
  (310,'Tunísia'),
  (311,'Turcomênia'),
  (312,'Turquia'),
  (313,'Tuvalu'),
  (314,'Ucrânia'),
  (315,'Uganda'),
  (316,'Uruguai'),
  (317,'Uzbequistão'),
  (318,'Vanuatu'),
  (319,'Vaticano'),
  (320,'Venezuela'),
  (321,'Vietnam'),
  (322,'Yugoslavia'),
  (323,'Zâmbia'),
  (324,'Zimbabwe'),
  (777,'APÁTRIDA'),
  (888,'OUTRAS NACIONALIDADES'),
  (999,'IGNORADO');