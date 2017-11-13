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
  designacao varchar NOT NULL,
  area int,
  emissor varchar,
  dataDeEmissao DATE,
  tipo varchar
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

ALTER TABLE CTPS
  ADD CONSTRAINT FK_EstadoCodigo
FOREIGN KEY (estado) REFERENCES ESTADO (codigo);

INSERT INTO IDENTIFICADOR VALUES ('1', 1, 'N/A', DATE '2017-12-31', '01');
