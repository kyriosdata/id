/*
	Registra os meios de comunicação eletrônica para
	contato com o indivíduo.
 */

DROP TABLE IF EXISTS COMUNICACAO;

CREATE TABLE COMUNICACAO (
	individuo VARCHAR(36) NOT NULL,
	meio int,
	preferencia char,
	detalhe varchar NOT NULL,
	utilizacao int
);

ALTER TABLE COMUNICACAO
		ADD CONSTRAINT FK_IndividuoDaComunicacao
FOREIGN KEY (individuo) REFERENCES INDIVIDUO (id);

ALTER TABLE COMUNICACAO
	ADD CONSTRAINT FK_TipoComunicacao
FOREIGN KEY (meio) REFERENCES TIPOCOMUNICACAO (codigo);

ALTER TABLE COMUNICACAO
	ADD CONSTRAINT FK_HorarioPreferencialParaContato
FOREIGN KEY (preferencia) REFERENCES HORARIOCONTATO (codigo);

ALTER TABLE COMUNICACAO
	ADD CONSTRAINT FK_UsoDaComunicacao
FOREIGN KEY (utilizacao) REFERENCES TIPOUSO (codigo);

INSERT INTO COMUNICACAO VALUES ('8d4cd0d3-8996-4812-96b4-48b4f1847ff5', 4, 'B', 'f@g', 1);
