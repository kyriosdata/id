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
	tipo int,
	dataInicial DATE,
	dataInicialAcuracia varchar(3),
	dataFinal DATE,
	dataFinalAcuracia varchar(3),
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

ALTER TABLE ENDERECO
	ADD CONSTRAINT FK_TipoDoEndereco
FOREIGN KEY (tipo) REFERENCES TIPOENDERECO (codigo);

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

