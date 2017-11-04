DROP TABLE IF EXISTS Identificador;

CREATE TABLE Identificador (
  designacao varchar NOT NULL,
  area int,
  emissor varchar,
  dataDeEmissao DATE,
  tipoDoIdentificador varchar,
  cartorio varchar,
  livro varchar,
  folha varchar,
  termo varchar,
  serie varchar,
  estado varchar(2),
  zona varchar,
  secao varchar
);

ALTER TABLE Identificador
  ADD CONSTRAINT FK_AreaGeograficaCodigo
FOREIGN KEY (area) REFERENCES AreaGeografica(codigo);

ALTER TABLE Identificador
  ADD CONSTRAINT FK_TipoDoIdentificadorCodigo
FOREIGN KEY (tipoDoIdentificador) REFERENCES TipoDoIdentificador(codigo);

ALTER TABLE Identificador
  ADD CONSTRAINT FK_EstadoCodigo
FOREIGN KEY (estado) REFERENCES Estado(codigo);

INSERT INTO Identificador VALUES (1, 1, 'N/A', DATE '2017-12-31', '01', 'c', 'l', 'f', 't', 's', 'GO', 'zona', 'seção');
