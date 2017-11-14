/*
	Dados iniciais para testes do esquema de dados
	para identificação de pacientes.
 */

/* "José Pedro dos Santos Filho" mais conhecido por "Zuza do Luar". */
INSERT INTO INDIVIDUO VALUES ('8d4cd0d3-8996-4812-96b4-48b4f1847ff5');

/* Zuza do Luar é o nome preferido de José Pedro dos Santos Filho */
INSERT INTO NOME (id, individuo, nomes, sobrenomes, sufixos, preferido)
VALUES (
  'dcbc06f7-19f9-4108-8734-3a239fea5cbc',
  '8d4cd0d3-8996-4812-96b4-48b4f1847ff5',
  'Zuza', 'do Luar', NULL, 1);

/* José Pedro dos Santos Filho (não é o nome preferido) */
INSERT INTO NOME (id, individuo, nomes, sobrenomes, sufixos, preferido)
VALUES (
  '8db412b5-bc25-4ced-96ba-2014d1178550',
  '8d4cd0d3-8996-4812-96b4-48b4f1847ff5',
  'José Pedro', 'dos Santos', 'Filho', 2);

/* "José Pedro dos Santos" é o pai adotivo do "Zuza do Luar". */
INSERT INTO INDIVIDUO VALUES ('530e40d3-9482-4dcb-b5cb-2168c98f3b26');

/* Carteira de identidade emitida pela SSP-GO do "Zuza do Luar" */
INSERT INTO IDENTIFICADOR (id, individuo, designacao, area, emissor, data, tipo)
VALUES ('7ec971f2-bd30-4704-8952-d705e9b006e5',
        '8d4cd0d3-8996-4812-96b4-48b4f1847ff5',
        12345678, 4, 'SSP-GO', DATE '2017-12-31', '10');

/* Carteira de identidade do pai adotivo do Zuza do Luar */
INSERT INTO IDENTIFICADOR (id, individuo, designacao, area, emissor, data, tipo)
VALUES ('1de7df6a-55b6-4d23-8bec-93fcd65dadb5',
        '530e40d3-9482-4dcb-b5cb-2168c98f3b26',
        12345677, 4, 'SSP-GO', DATE '2016-12-31', '10');

/* Zuza do Luar é adotado em 2016 por "José Pedro dos Santos" */
INSERT INTO VINCULO (IDENTIFICADOR, INDIVIDUO, RELACIONAMENTO, DATAINICIO)
VALUES ('1de7df6a-55b6-4d23-8bec-93fcd65dadb5',
        '8d4cd0d3-8996-4812-96b4-48b4f1847ff5', 263, DATE '2016-12-31');

/* Zuza do Luar possui email (durante o dia) e celular (horário comercial) */
/* tanto para uso pessoal quanto profissional. */
INSERT INTO COMUNICACAO (INDIVIDUO, MEIO, PREFERENCIA, DETALHE, USO)
VALUES ('8d4cd0d3-8996-4812-96b4-48b4f1847ff5', 5, 'D', 'zl@gmail.com', 3);
VALUES ('8d4cd0d3-8996-4812-96b4-48b4f1847ff5', 2, 'B', '999999999', 3);

/* Zuza do Luar nasceu em 2010 é do sexo masculino. Pai e mãe desconhecidos. */
/* Convive com o pai adotivo (José Pedro dos Santos), sabe-se que nasceu em
   Cabixi, Rondônia. */
INSERT INTO DADODEMOGRAFICO (
  individuo, nascimento, nascimentoAcuracia, nascimentoSeguimento,
  nascimentoPluralidade, nascimentoOrdem, obito, obitoAcuracia, obitoFonte,
  sexo, mae, pai, situacaoFamiliar, raca, comentario,
  nacionalidade, municipio, estado, pais, dataEntradaPais)
VALUES (
  '8d4cd0d3-8996-4812-96b4-48b4f1847ff5',
  DATE '2017-11-13', 'AAA', 'N', 1, 1,
  NULL , NULL, NULL, 1, NULL, NULL, 5, 1,
  NULL, 1, 1100031, 'RO', NULL, NULL
);

/* Endereço residencial do Zuza do Luar */
INSERT INTO ENDERECO(
  ID, INDIVIDUO, BAIRRO, DISTRITO, MUNICIPIO, ESTADO, CEP, CAIXAPOSTAL, PAIS,
  TIPO, DATAINICIAL, DATAINICIALACURACIA, DATAFINAL, DATAFINALACURACIA)
VALUES (
   '39c7285f-3874-4719-bcc2-28ecf8816b5b',
   '8d4cd0d3-8996-4812-96b4-48b4f1847ff5',
  'Solar', NULL, 1100031, 'RO', NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL
);

INSERT INTO ENDERECOLINHA (ENDERECO, LINHA, ORDEM)
VALUES (
    '39c7285f-3874-4719-bcc2-28ecf8816b5b',
  'Rua da Lua Cheia, no. 123, Ed. Taciturno, apto. 112', 1
);