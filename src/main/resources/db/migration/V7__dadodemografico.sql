/*
	Dados demográficos.
 */

DROP TABLE IF EXISTS DADODEMOGRAFICO;

CREATE TABLE DADODEMOGRAFICO (
	individuo VARCHAR(36) NOT NULL,
	nascimento DATE,
	nascimentoAcuracia varchar(3),
	nascimentoSeguimento char,
	nascimentoPluralidade int,
	nascimentoOrdem int,
	obito DATE,
	obitoAcuracia varchar(3),
	obitoFonte int
);

ALTER TABLE DADODEMOGRAFICO
		ADD CONSTRAINT FK_IndividuoDoDadoDemografico
FOREIGN KEY (individuo) REFERENCES INDIVIDUO (id);

ALTER TABLE DADODEMOGRAFICO
	ADD CONSTRAINT FK_PluralidadeDoNascimento
FOREIGN KEY (nascimentoPluralidade) REFERENCES NASCIMENTOPLURALIDADE (codigo);

ALTER TABLE DADODEMOGRAFICO
	ADD CONSTRAINT FK_OrdemDoNascimento
FOREIGN KEY (nascimentoOrdem) REFERENCES NASCIMENTOORDEM (codigo);

ALTER TABLE DADODEMOGRAFICO
	ADD CONSTRAINT FK_DataDemandaSeguimento
FOREIGN KEY (nascimentoSeguimento) REFERENCES DATASEGUIMENTO (codigo);

ALTER TABLE DADODEMOGRAFICO
	ADD CONSTRAINT FK_FonteDoObito
FOREIGN KEY (obitoFonte) REFERENCES OBITOFONTE (codigo);

INSERT INTO DADODEMOGRAFICO VALUES ('8d4cd0d3-8996-4812-96b4-48b4f1847ff5',
																		DATE '2017-11-13', 'AEU', 'S', 1, 1,
		DATE '2017-11-14', 'AAA', 1);