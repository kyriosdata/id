/*
	Um vínculo representa um relacionamento social e que,
	portanto, podem ser alterado ao longo do tempo.
 */

DROP TABLE IF EXISTS VINCULO;

CREATE TABLE VINCULO (
	id VARCHAR(36) NOT NULL,
	relacionamento int,
	dataInicio DATE,
	dataFinal DATE
);

ALTER TABLE VINCULO
	ADD CONSTRAINT FK_IdentificadorChave
FOREIGN KEY (id) REFERENCES IDENTIFICADOR (id);

ALTER TABLE VINCULO
		ADD CONSTRAINT FK_TipoDeRelacionamento
FOREIGN KEY (relacionamento) REFERENCES TIPORELACIONAMENTO (codigo);

INSERT INTO VINCULO VALUES ('7ec971f2-bd30-4704-8952-d705e9b006e5', 41, DATE '2016-12-31', DATE '2017-12-31');
