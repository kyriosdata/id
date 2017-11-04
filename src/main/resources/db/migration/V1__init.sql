/*
	Tabela que mantém identificadores únicos (surrogate keys) para
	os indivíduos cujas informações são mantidas.
 */

DROP TABLE IF EXISTS INDIVIDUO;

CREATE TABLE INDIVIDUO (
	id VARCHAR(36) NOT NULL,
	PRIMARY KEY (id)
);

INSERT INTO INDIVIDUO VALUES ('8d4cd0d3-8996-4812-96b4-48b4f1847ff5');
INSERT INTO INDIVIDUO VALUES ('530e40d3-9482-4dcb-b5cb-2168c98f3b26');
INSERT INTO INDIVIDUO VALUES ('18afaf46-abe5-46d8-80df-68a44a367a5d');
