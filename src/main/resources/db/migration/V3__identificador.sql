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
  area int NOT NULL,
  emissor varchar NOT NULL ,
  data DATE NOT NULL ,
  tipo varchar NOT NULL ,
  PRIMARY KEY (id)
);

ALTER TABLE IDENTIFICADOR
  ADD CONSTRAINT FK_AreaGeograficaCodigo
FOREIGN KEY (area) REFERENCES AREAGEOGRAFICA (codigo);

ALTER TABLE IDENTIFICADOR
  ADD CONSTRAINT FK_TipoDoIdentificadorCodigo
FOREIGN KEY (tipo) REFERENCES TIPOIDENTIFICADOR (codigo);

ALTER TABLE IDENTIFICADOR
  ADD CONSTRAINT FK_IdentificadorParaIndividuo
FOREIGN KEY (individuo) REFERENCES INDIVIDUO (id);

/*
  Seção 8.11 (pág. 15) e 8.12 (pág. 16), respectivamente para
  os campos "série" e "estado" da carteira de trabalho.
 */
CREATE TABLE CTPS (
  identificador varchar(36) NOT NULL,
  serie INT,
  estado varchar(2)
);

ALTER TABLE CTPS
  ADD CONSTRAINT FK_EstadoCodigo
FOREIGN KEY (estado) REFERENCES ESTADO (codigo);

ALTER TABLE CTPS
  ADD CONSTRAINT FK_IdentificadorDaCarteira
FOREIGN KEY (identificador) REFERENCES IDENTIFICADOR (id);

/*
  Certidão de nascimento, casamento e divórcio.
  Seções 8.7 (pág. 14), 8.8 (pág. 14), 8.9 (pág. 14) e 8.10 (pág. 15),
  respectivamente para os campos "cartório", "livro", "folha" e "termo".
 */
CREATE TABLE CERTIDAO (
  identificador varchar(36) NOT NULL,
  tipo int,
  cartorio varchar,
  livro INT,
  folha INT,
  termo INT
);

ALTER TABLE CERTIDAO
  ADD CONSTRAINT FK_IdentificadorDaCertidao
FOREIGN KEY (identificador) REFERENCES IDENTIFICADOR (id);

ALTER TABLE CERTIDAO
    ADD CONSTRAINT FK_TipoDaCertidao
FOREIGN KEY (tipo) REFERENCES CERTIDAOTIPO (codigo);

/*
  Título de eleitor.

  Seção 8.13 (pág. 16) e 8.14 (pág. 17), respectivamente para
  os campos "zona" e "seção".
 */

CREATE TABLE TITULOELEITORAL (
  identificador varchar(36) NOT NULL,
  zona INT,
  sessao INT
);

ALTER TABLE TITULOELEITORAL
  ADD CONSTRAINT FK_IdentificadorDoTituloEleitoral
FOREIGN KEY (identificador) REFERENCES IDENTIFICADOR (id);

