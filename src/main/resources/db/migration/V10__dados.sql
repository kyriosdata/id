/*
	Dados iniciais para testes do esquema de dados
	para identificação de pacientes.
 */

/* José Pedro dos Santos Filho mais conhecido por Zuza do Luar. */
INSERT INTO INDIVIDUO VALUES ('8d4cd0d3-8996-4812-96b4-48b4f1847ff5');

INSERT INTO INDIVIDUO VALUES ('530e40d3-9482-4dcb-b5cb-2168c98f3b26');
INSERT INTO INDIVIDUO VALUES ('18afaf46-abe5-46d8-80df-68a44a367a5d');


INSERT INTO IDENTIFICADOR (id, individuo, designacao, area, emissor, data, tipo)
VALUES ('7ec971f2-bd30-4704-8952-d705e9b006e5',
        '8d4cd0d3-8996-4812-96b4-48b4f1847ff5',
        12345678, 1, 'N/A', DATE '2017-12-31', '10');

/* Zuza do Luar é o nome preferido de José Pedro dos Santos Filho */
INSERT INTO NOME (id, individuo, nomes, sobrenomes, sufixos, preferido)
VALUES (
  'dcbc06f7-19f9-4108-8734-3a239fea5cbc',
  '8d4cd0d3-8996-4812-96b4-48b4f1847ff5',
  'Zuza', 'do Luar', NULL, 1);

INSERT INTO NOME (id, individuo, nomes, sobrenomes, sufixos, preferido)
VALUES (
  '8db412b5-bc25-4ced-96ba-2014d1178550',
  '8d4cd0d3-8996-4812-96b4-48b4f1847ff5',
  'José Pedro', 'dos Santos', 'Filho', 2);

INSERT INTO VINCULO (IDENTIFICADOR, INDIVIDUO, RELACIONAMENTO, DATAINICIO)
VALUES ('7ec971f2-bd30-4704-8952-d705e9b006e5',
        '8d4cd0d3-8996-4812-96b4-48b4f1847ff5', 41,
        DATE '2016-12-31');

INSERT INTO COMUNICACAO (INDIVIDUO, MEIO, PREFERENCIA, DETALHE, USO)
VALUES ('8d4cd0d3-8996-4812-96b4-48b4f1847ff5', 4, 'B', 'f@gmail.com', 1);

INSERT INTO DADODEMOGRAFICO (
  individuo,
  nascimento, nascimentoAcuracia, nascimentoSeguimento, nascimentoPluralidade, nascimentoOrdem,
  obito, obitoAcuracia, obitoFonte, sexo, mae, pai, situacaoFamiliar, raca, comentario,
  nacionalidade, municipio, estado, pais, dataEntradaPais) VALUES (
  '8d4cd0d3-8996-4812-96b4-48b4f1847ff5',
  DATE '2017-11-13', 'AEU', 'S', 1, 1,
  DATE '2017-11-14', 'AAA', 1, 1, 'nome da mãe', 'nome do pai', 1, 1,
  'um comentário',
  1, 1100015, 'RO', NULL, NULL
);