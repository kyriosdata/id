/*
	Registra os meios de comunicação eletrônica para
	contato com o indivíduo.
 */

DROP TABLE IF EXISTS COMUNICACAO;

/*
	Seção 12 (pág. 84) Comunicação eletrônica do indivíduo.

	Seção 12.2 (pág. 85) - meio de comunicação,
	12.3 (pág. 86) - código de preferência de contato,
	12.4 (pág. 86) - detalhe (endereço) da comunicação eletrônica e
	12.5 (pág. 87) - código de utilização do contato
 */
CREATE TABLE COMUNICACAO (
	individuo VARCHAR(36) NOT NULL,
	meio int NOT NULL,
	preferencia char(1),
	detalhe varchar NOT NULL,
	uso int
);

ALTER TABLE COMUNICACAO
		ADD CONSTRAINT FK_IndividuoDaComunicacao
FOREIGN KEY (individuo) REFERENCES INDIVIDUO (id);

ALTER TABLE COMUNICACAO
	ADD CONSTRAINT FK_TipoComunicacao
FOREIGN KEY (meio) REFERENCES COMUNICACAOMEIO (codigo);

ALTER TABLE COMUNICACAO
	ADD CONSTRAINT FK_HorarioPreferencialParaContato
FOREIGN KEY (preferencia) REFERENCES COMUNICACAOPREFERENCIA (codigo);

ALTER TABLE COMUNICACAO
	ADD CONSTRAINT FK_UsoDaComunicacao
FOREIGN KEY (uso) REFERENCES COMUNICACAOUSO (codigo);

INSERT INTO COMUNICACAO VALUES ('8d4cd0d3-8996-4812-96b4-48b4f1847ff5', 4, 'B', 'f@g', 1);
