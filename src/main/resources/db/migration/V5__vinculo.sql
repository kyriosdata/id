/*
	Um vínculo representa um relacionamento social e que,
	portanto, podem ser alterado ao longo do tempo.
 */

DROP TABLE IF EXISTS VINCULO;

/*
	Vínculo

	Seção 13.1 (pág. 89) - identificador do indivíduo,
	13.2 (pág. 89) - relacionamento,
	13.3 (pág. 90) e 13.4 (pág. 91) para período de validade.
 */
CREATE TABLE VINCULO (
	identificador VARCHAR(36) NOT NULL,
	individuo varchar(36) NOT NULL,
	relacionamento int,
	dataInicio DATE,
	dataFinal DATE
);

ALTER TABLE VINCULO
	ADD CONSTRAINT FK_VinculoParaUmIdentificador
FOREIGN KEY (identificador) REFERENCES IDENTIFICADOR (id);

ALTER TABLE VINCULO
	ADD CONSTRAINT FK_VinculoParaUmIndividuo
FOREIGN KEY (individuo) REFERENCES INDIVIDUO (id);

ALTER TABLE VINCULO
		ADD CONSTRAINT FK_TipoDeRelacionamento
FOREIGN KEY (relacionamento) REFERENCES TIPORELACIONAMENTO (codigo);

INSERT INTO VINCULO VALUES ('7ec971f2-bd30-4704-8952-d705e9b006e5', '8d4cd0d3-8996-4812-96b4-48b4f1847ff5', 41, DATE '2016-12-31', DATE '2017-12-31');
