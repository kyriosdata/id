/*
	Dados iniciais para testes do esquema de dados
	para identificação de pacientes.
 */

INSERT INTO INDIVIDUO VALUES ('8d4cd0d3-8996-4812-96b4-48b4f1847ff5');
INSERT INTO INDIVIDUO VALUES ('530e40d3-9482-4dcb-b5cb-2168c98f3b26');
INSERT INTO INDIVIDUO VALUES ('18afaf46-abe5-46d8-80df-68a44a367a5d');


INSERT INTO IDENTIFICADOR (id, individuo, designacao, area, emissor, data, tipo)
VALUES ('7ec971f2-bd30-4704-8952-d705e9b006e5', '8d4cd0d3-8996-4812-96b4-48b4f1847ff5',
				12345678, 1, 'N/A', DATE '2017-12-31', '10');


INSERT INTO NOME (
	id, individuo,
	titulos, nomes, sobrenomes, sufixos, preferido, usoCondicional)
VALUES (
	'8db412b5-bc25-4ced-96ba-2014d1178550', '8d4cd0d3-8996-4812-96b4-48b4f1847ff5',
	NULL, 'José Pedro', 'dos Santos', 'Filho', 1, 3);