/*
	Seção 11 (pág. 62) - Endereço do indivíduo
 */

DROP TABLE IF EXISTS ENDERECO;
DROP TABLE IF EXISTS LINHAENDERECO;

/*
	Seção 11.2.14 (pág. 74) - bairro é seguida, na ordem por outras seções
	que refletem a ordem dos campos definidos na tabela abaixo.
 */
CREATE TABLE ENDERECO (
	id VARCHAR(36) NOT NULL,
	individuo VARCHAR(36) NOT NULL,
	bairro varchar,
	distrito varchar,
	municipio int,
	estado VARCHAR(2),
	cep varchar,
	caixaPostal varchar,
	pais int,
	PRIMARY KEY (id)
);

ALTER TABLE ENDERECO
		ADD CONSTRAINT FK_EnderecoDeIndividuo
FOREIGN KEY (individuo) REFERENCES INDIVIDUO (id);

ALTER TABLE ENDERECO
		ADD CONSTRAINT FK_CodigoMunicipio
FOREIGN KEY (municipio) REFERENCES MUNICIPIO (codigo);

ALTER TABLE ENDERECO
		ADD CONSTRAINT FK_EstadoDoEndereco
FOREIGN KEY (estado) REFERENCES ESTADO (codigo);

ALTER TABLE ENDERECO
	ADD CONSTRAINT FK_PaisDoEndereco
FOREIGN KEY (pais) REFERENCES PAIS (codigo);

/*
	Seção 11.2 (pág. 65) - Linha de endereço
 */
CREATE TABLE LINHAENDERECO (
	endereco varchar(36) NOT NULL,
	linha varchar,
	ordem int
);

ALTER TABLE LINHAENDERECO
		ADD CONSTRAINT FK_LinhaTemEnderecoAssociado
FOREIGN KEY (endereco) REFERENCES ENDERECO (id);

INSERT INTO INDIVIDUO VALUES ('8d4cd0d3-8996-4812-96b4-48b4f1847ff5');
INSERT INTO INDIVIDUO VALUES ('530e40d3-9482-4dcb-b5cb-2168c98f3b26');
INSERT INTO INDIVIDUO VALUES ('18afaf46-abe5-46d8-80df-68a44a367a5d');
