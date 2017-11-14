/*
	Tabela que mantém peo menos uma entrada (registro)
	para cada indivíduo assistido. Idealmente deveria
	manter um único registro por indivíduo.
 */

DROP TABLE IF EXISTS INDIVIDUO;

CREATE TABLE INDIVIDUO (
	id VARCHAR(36) NOT NULL,
	PRIMARY KEY (id)
);
