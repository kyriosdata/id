/*
  Nome do indivíduo.
 */

DROP TABLE IF EXISTS NOME;
DROP TABLE IF EXISTS UTILIZACAO;
DROP TABLE IF EXISTS REPRESENTACAO;

/*
  Seção 9 (página 17)
  O nome do indivíduo é um elemento de dados composto. Um único nome pode
  conter múltiplos títulos, nomes atribuídos, sobrenomes e sufixos. Cada
  um desses é registrado por meio de uma única sequência de caracteres e,
  nesse caso, um espaço em branco é o separador. Por exemplo, em vez de
  "Prof." e "Doutor" como dois títulos de um único nome, optou-se por
  "Prof. Doutor".

  Somente um nome pode ser o nome preferido da pessoa em cada instante de
  tempo. Adicionalmente, para cada nome de um indivíduo tem-se um uso
  condicional associado.

  Pode haver mais de um nome registrado para cada indivíduo. Pelo menos
  um nome deve ser capturado.
 */
CREATE TABLE NOME (
  id varchar(36) NOT NULL,
  individuo varchar(36) NOT NULL,
  titulos varchar,
  nomes varchar,
  sobrenomes varchar,
  sufixos varchar,
  preferido int NOT NULL,
  usoCondicional int
);

ALTER TABLE NOME
  ADD CONSTRAINT FK_UsoCondicionalCodigo
FOREIGN KEY (usoCondicional) REFERENCES USOCONDICIONAL (codigo);

ALTER TABLE NOME
  ADD CONSTRAINT FK_IndividuoDoNome
FOREIGN KEY (individuo) REFERENCES INDIVIDUO (id);

ALTER TABLE NOME
    ADD CONSTRAINT FK_NomePreferido
FOREIGN KEY (preferido) REFERENCES NOMEPREFERIDO (codigo);

/*
  Grupo de utilização do nome
  Seção 9.9 (pág. 40)
 */

CREATE TABLE UTILIZACAO (
  nome varchar(36) NOT NULL,
  uso int,
  identificador varchar(36) NOT NULL,
  dataInicial DATE,
  dataFinal DATE
);

ALTER TABLE UTILIZACAO
    ADD CONSTRAINT FK_UtilizacaoDeNome
FOREIGN KEY (nome) REFERENCES NOME (id);

ALTER TABLE UTILIZACAO
  ADD CONSTRAINT FK_UtilizacaoExigeIdentificador
FOREIGN KEY (identificador) REFERENCES IDENTIFICADOR (id);

ALTER TABLE UTILIZACAO
    ADD CONSTRAINT FK_UsoDoNomeCodigo
FOREIGN KEY (uso) REFERENCES NOMEUSO (codigo);

/*
  Representação alternativa de um nome.
  Seção 9.10 (pág. 43)
 */

CREATE TABLE REPRESENTACAO (
  nome varchar(36) NOT NULL,
  utilizacao varchar,
  alternativa varchar
);

ALTER TABLE REPRESENTACAO
    ADD CONSTRAINT FK_NomeDaRepresentacao
FOREIGN KEY (nome) REFERENCES NOME (id);

INSERT INTO NOME (
  id, individuo,
  titulos, nomes, sobrenomes, sufixos, preferido, usoCondicional)
  VALUES (
    '8db412b5-bc25-4ced-96ba-2014d1178550', '8d4cd0d3-8996-4812-96b4-48b4f1847ff5',
  NULL, 'José Pedro', 'dos Santos', 'Filho', 1, 3);

