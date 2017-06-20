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
  Seção 9
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

