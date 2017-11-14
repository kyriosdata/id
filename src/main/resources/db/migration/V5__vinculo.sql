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

