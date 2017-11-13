/*
  O identificador do indivíduo também é conhecido por:
  (a) ID do paciente; (b) identificador pessoal;
  (c) número único do prontuário; (d) número do prontuário médico;
  (e) identificador local do sujeito; (f) número de identificação
  do sujeito; e (g) identificador único, dentre outros.
 */

DROP TABLE IF EXISTS IDENTIFICADOR;
DROP TABLE IF EXISTS CTPS;
DROP TABLE IF EXISTS CERTIDAO;
DROP TABLE IF EXISTS TITULOELEITORAL;

CREATE TABLE IDENTIFICADOR (
  id VARCHAR(36) NOT NULL,
  individuo varchar(36) NOT NULL,
  designacao varchar NOT NULL,
  area int,
  emissor varchar,
  dataDeEmissao DATE,
  tipo varchar,
  PRIMARY KEY (id)
);

CREATE TABLE CTPS (
  serie varchar,
  estado varchar(2)
);

CREATE TABLE CERTIDAO (
  tipo int,
  cartorio varchar,
  livro varchar,
  folha varchar,
  termo varchar
);

CREATE TABLE TITULOELEITORAL (
  sessao varchar,
  zona varchar
);

ALTER TABLE CERTIDAO
    ADD CONSTRAINT FK_TipoCertidao
FOREIGN KEY (tipo) REFERENCES TIPOCERTIDAO (codigo);

ALTER TABLE IDENTIFICADOR
  ADD CONSTRAINT FK_AreaGeograficaCodigo
FOREIGN KEY (area) REFERENCES AREAGEOGRAFICA (codigo);

ALTER TABLE IDENTIFICADOR
  ADD CONSTRAINT FK_TipoDoIdentificadorCodigo
FOREIGN KEY (tipo) REFERENCES TIPOIDENTIFICADOR (codigo);

ALTER TABLE IDENTIFICADOR
    ADD CONSTRAINT FK_IdentificadorParaIndividuo
FOREIGN KEY (individuo) REFERENCES INDIVIDUO (id);

ALTER TABLE CTPS
  ADD CONSTRAINT FK_EstadoCodigo
FOREIGN KEY (estado) REFERENCES ESTADO (codigo);

INSERT INTO IDENTIFICADOR (id, individuo, designacao, area, emissor, dataDeEmissao, tipo)
VALUES ('7ec971f2-bd30-4704-8952-d705e9b006e5', '8d4cd0d3-8996-4812-96b4-48b4f1847ff5',
        12345678, 1, 'N/A', DATE '2017-12-31', '01');
