DROP TABLE IF EXISTS Nome;

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
  titulos varchar,
  nomes varchar,
  sobrenomes varchar,
  sufixos varchar,
  usoCondicional int,
  preferido BOOLEAN
);

ALTER TABLE Nome
  ADD CONSTRAINT FK_UsoCondicionalCodigo
FOREIGN KEY (usoCondicional) REFERENCES UsoCondicional(codigo);

