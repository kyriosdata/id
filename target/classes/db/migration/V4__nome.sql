DROP TABLE IF EXISTS Nome;
DROP TABLE IF EXISTS UsoCondicional;

/*
  LOOKUP TABLE
  Seção 9.4 Uso condicional
 */
CREATE TABLE UsoCondicional (
  codigo int,
  descricao varchar
);

INSERT INTO UsoCondicional VALUES (1, 'Informação não confiável');
INSERT INTO UsoCondicional VALUES (2, 'Nome com erro de digitação');
INSERT INTO UsoCondicional VALUES (3, 'Nome para não ser usado');
INSERT INTO UsoCondicional VALUES (4, 'Vínculo do nome proibido por lei');
INSERT INTO UsoCondicional VALUES (6, 'Requisito de privacidade/segurança especial');
INSERT INTO UsoCondicional VALUES (9, 'Nome temporário');

/*
  LOOKUP TABLE
  Seção 9.9.2 Uso do nome
 */

CREATE TABLE UsoDoNome (
  codigo int,
  alternativo char,
  descricao varchar
);

INSERT INTO UsoDoNome VALUES (1, 'R', 'relatório');
INSERT INTO UsoDoNome VALUES (2, 'N', 'Nome de recém-nascido');
INSERT INTO UsoDoNome VALUES (3, 'C', 'Nome profissional ou comercial');
INSERT INTO UsoDoNome VALUES (4, 'S', 'Nome de solteiro (nome de nascimento) (nome original)');
INSERT INTO UsoDoNome VALUES (8, 'O', 'Outro nome (alias)');

/*
  Seção 9 (página 17)
  O nome do indivíduo é um elemento de dados composto.
  Pode haver mais de um nome registrado para cada indivíduo. Pelo menos
  um nome deve ser capturado. Pode haver múltiplos títulos, nomes
  atribuídos, sobrenomes, sufixos e usos do nome para cada nome.
  Somente um nome pode ser o nome preferido da pessoa em cda instante do
  tempo.
 */
CREATE TABLE Nome (
  completo varchar,
  preferido BOOLEAN,
  usoCondicional int
);

ALTER TABLE Nome
  ADD CONSTRAINT FK_UsoCondicionalCodigo
FOREIGN KEY (usoCondicional) REFERENCES UsoCondicional(codigo);

