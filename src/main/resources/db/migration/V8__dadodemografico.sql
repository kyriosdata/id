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
	obitoFonte int,
	sexo int NOT NULL,
	mae varchar,
	pai varchar,
	situacaoFamiliar int,
	raca int,
	comentario varchar,
	nacionalidade int,
	municipio int,
	estado varchar(2),
	pais int,
	dataEntradaPais DATE
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

ALTER TABLE DADODEMOGRAFICO
	ADD CONSTRAINT FK_Sexo
FOREIGN KEY (sexo) REFERENCES SEXO (codigo);

ALTER TABLE DADODEMOGRAFICO
	ADD CONSTRAINT FK_SituacaoFamiliar
FOREIGN KEY (situacaoFamiliar) REFERENCES SITUACAOFAMILIAR (codigo);

ALTER TABLE DADODEMOGRAFICO
	ADD CONSTRAINT FK_Raca
FOREIGN KEY (raca) REFERENCES RACA (codigo);

ALTER TABLE DADODEMOGRAFICO
	ADD CONSTRAINT FK_Nacionalidade
FOREIGN KEY (nacionalidade) REFERENCES NACIONALIDADE (codigo);

ALTER TABLE DADODEMOGRAFICO
	ADD CONSTRAINT FK_ReferenciaParaMunicipio
FOREIGN KEY (municipio) REFERENCES MUNICIPIO (codigo);

ALTER TABLE DADODEMOGRAFICO
	ADD CONSTRAINT FK_Estado
FOREIGN KEY (estado) REFERENCES ESTADO (codigo);

ALTER TABLE DADODEMOGRAFICO
	ADD CONSTRAINT FK_Pais
FOREIGN KEY (pais) REFERENCES PAIS (codigo);

INSERT INTO DADODEMOGRAFICO(
	individuo,
	nascimento, nascimentoAcuracia, nascimentoSeguimento, nascimentoPluralidade, nascimentoOrdem,
	obito, obitoAcuracia, obitoFonte, sexo, mae, pai, situacaoFamiliar, raca, comentario,
	nacionalidade, municipio, estado, pais, dataEntradaPais) VALUES (
	'8d4cd0d3-8996-4812-96b4-48b4f1847ff5',
	DATE '2017-11-13', 'AEU', 'S', 1, 1,
	DATE '2017-11-14', 'AAA', 1, 1, 'nome da mãe', 'nome do pai',	1, 1, 'um comentário',
	1, 1100015, 'RO', NULL, NULL
);
