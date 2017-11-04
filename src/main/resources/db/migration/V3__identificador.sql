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

ALTER TABLE IDENTIFICADOR
  ADD CONSTRAINT FK_AreaGeograficaCodigo
FOREIGN KEY (area) REFERENCES AreaGeografica(codigo);

ALTER TABLE IDENTIFICADOR
  ADD CONSTRAINT FK_TipoDoIdentificadorCodigo
FOREIGN KEY (tipo) REFERENCES TipoDoIdentificador(codigo);

ALTER TABLE CTPS
  ADD CONSTRAINT FK_EstadoCodigo
FOREIGN KEY (estado) REFERENCES Estado(codigo);

INSERT INTO IDENTIFICADOR VALUES ('1', 1, 'N/A', DATE '2017-12-31', '01');
