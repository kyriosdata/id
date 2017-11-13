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
  individuo varchar(36) NOT NULL,
  titulos varchar,
  nomes varchar,
  sobrenomes varchar,
  sufixos varchar,
  usoCondicional int,
  preferido BOOLEAN
);

ALTER TABLE NOME
  ADD CONSTRAINT FK_UsoCondicionalCodigo
FOREIGN KEY (usoCondicional) REFERENCES USOCONDICIONAL (codigo);

ALTER TABLE NOME
  ADD CONSTRAINT FK_IndividuoDoNome
FOREIGN KEY (individuo) REFERENCES INDIVIDUO (id);

CREATE TABLE UTILIZACAO (
  uso int,
  dataInicial DATE,
  dataFinal DATE
);

ALTER TABLE UTILIZACAO
    ADD CONSTRAINT FK_UsoDoNomeCodigo
FOREIGN KEY (uso) REFERENCES USODONOME(codigo);

CREATE TABLE REPRESENTACAO (
  alternativa varchar
);

