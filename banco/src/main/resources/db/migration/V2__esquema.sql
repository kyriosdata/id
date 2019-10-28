DROP TABLE IF EXISTS INDIVIDUO;
DROP TABLE IF EXISTS IDENTIFICADOR;
DROP TABLE IF EXISTS CTPS;
DROP TABLE IF EXISTS CERTIDAO;
DROP TABLE IF EXISTS TITULOELEITORAL;
DROP TABLE IF EXISTS NOME;
DROP TABLE IF EXISTS UTILIZACAO;
DROP TABLE IF EXISTS REPRESENTACAO;
DROP TABLE IF EXISTS VINCULO;
DROP TABLE IF EXISTS COMUNICACAO;
DROP TABLE IF EXISTS DADODEMOGRAFICO;

/*
	Tabela que mantém peo menos uma entrada (registro)
	para cada indivíduo assistido. Idealmente deveria
	manter um único registro por indivíduo.
 */

CREATE TABLE INDIVIDUO (
	id VARCHAR(36) NOT NULL,
	PRIMARY KEY (id)
);

/*
  Seção 8 (pág. 7)
  O identificador do indivíduo também é conhecido por:
  (a) ID do paciente; (b) identificador pessoal;
  (c) número único do prontuário; (d) número do prontuário médico;
  (e) identificador local do sujeito; (f) número de identificação
  do sujeito; e (g) identificador único, dentre outros.
 */

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
FOREIGN KEY (tipo) REFERENCES IDENTIFICADORTIPO (codigo);

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
	ADD CONSTRAINT FK_IndividuoDoNome
FOREIGN KEY (individuo) REFERENCES INDIVIDUO (id);

ALTER TABLE NOME
	ADD CONSTRAINT FK_NomePreferido
FOREIGN KEY (preferido) REFERENCES NOMEPREFERIDO (codigo);

ALTER TABLE NOME
	ADD CONSTRAINT FK_UsoCondicionalCodigo
FOREIGN KEY (usoCondicional) REFERENCES USOCONDICIONAL (codigo);

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


/*
	Vínculo

	Seção 13.1 (pág. 89) - identificador do indivíduo,
	13.2 (pág. 89) - relacionamento,
	13.3 (pág. 90) e 13.4 (pág. 91) para período de validade.
 */
CREATE TABLE VINCULO (
	identificador VARCHAR(36) NOT NULL,
	individuo varchar(36) NOT NULL,
	relacionamento int,
	dataInicio DATE,
	dataFinal DATE
);

ALTER TABLE VINCULO
	ADD CONSTRAINT FK_VinculoParaUmIdentificador
FOREIGN KEY (identificador) REFERENCES IDENTIFICADOR (id);

ALTER TABLE VINCULO
	ADD CONSTRAINT FK_VinculoParaUmIndividuo
FOREIGN KEY (individuo) REFERENCES INDIVIDUO (id);

ALTER TABLE VINCULO
	ADD CONSTRAINT FK_TipoDeRelacionamento
FOREIGN KEY (relacionamento) REFERENCES RELACIONAMENTOTIPO (codigo);

/*
	Seção 12 (pág. 84) Comunicação eletrônica do indivíduo.

	Seção 12.2 (pág. 85) - meio de comunicação,
	12.3 (pág. 86) - código de preferência de contato,
	12.4 (pág. 86) - detalhe (endereço) da comunicação eletrônica e
	12.5 (pág. 87) - código de utilização do contato
 */
CREATE TABLE COMUNICACAO (
	individuo VARCHAR(36) NOT NULL,
	meio int NOT NULL,
	preferencia char(1),
	detalhe varchar NOT NULL,
	uso int
);

ALTER TABLE COMUNICACAO
	ADD CONSTRAINT FK_IndividuoDaComunicacao
FOREIGN KEY (individuo) REFERENCES INDIVIDUO (id);

ALTER TABLE COMUNICACAO
	ADD CONSTRAINT FK_TipoComunicacao
FOREIGN KEY (meio) REFERENCES COMUNICACAOMEIO (codigo);

ALTER TABLE COMUNICACAO
	ADD CONSTRAINT FK_HorarioPreferencialParaContato
FOREIGN KEY (preferencia) REFERENCES COMUNICACAOPREFERENCIA (codigo);

ALTER TABLE COMUNICACAO
	ADD CONSTRAINT FK_UsoDaComunicacao
FOREIGN KEY (uso) REFERENCES COMUNICACAOUSO (codigo);

/*
	Seção 10 (pág. 44)
	Dados demográficos adicionais.
 */
CREATE TABLE DADODEMOGRAFICO (
	individuo VARCHAR(36) NOT NULL,
	nascimento DATE,
	nascimentoAcuracia varchar(3),
	nascimentoSeguimento char,
	nascimentoPluralidade int,
	nascimentoOrdem int,
	obito DATE,
	obitoAcuracia varchar(3),
	obitoFonte int,
	sexo int NOT NULL,
	mae varchar,
	pai varchar,
	situacaoFamiliar int,
	raca int,
	comentario varchar,
	nacionalidade int,
	municipio int,
	estado varchar(2),
	pais int,
	dataEntradaPais DATE
);

ALTER TABLE DADODEMOGRAFICO
	ADD CONSTRAINT FK_IndividuoDoDadoDemografico
FOREIGN KEY (individuo) REFERENCES INDIVIDUO (id);

ALTER TABLE DADODEMOGRAFICO
	ADD CONSTRAINT FK_PluralidadeDoNascimento
FOREIGN KEY (nascimentoPluralidade) REFERENCES NASCIMENTOPLURALIDADE (codigo);

ALTER TABLE DADODEMOGRAFICO
	ADD CONSTRAINT FK_OrdemDoNascimento
FOREIGN KEY (nascimentoOrdem) REFERENCES NASCIMENTOORDEM (codigo);

ALTER TABLE DADODEMOGRAFICO
	ADD CONSTRAINT FK_DataDemandaSeguimento
FOREIGN KEY (nascimentoSeguimento) REFERENCES DATASEGUIMENTO (codigo);

ALTER TABLE DADODEMOGRAFICO
	ADD CONSTRAINT FK_FonteDoObito
FOREIGN KEY (obitoFonte) REFERENCES OBITOFONTE (codigo);

ALTER TABLE DADODEMOGRAFICO
	ADD CONSTRAINT FK_Sexo
FOREIGN KEY (sexo) REFERENCES SEXO (codigo);

ALTER TABLE DADODEMOGRAFICO
	ADD CONSTRAINT FK_SituacaoFamiliar
FOREIGN KEY (situacaoFamiliar) REFERENCES SITUACAOFAMILIAR (codigo);

ALTER TABLE DADODEMOGRAFICO
	ADD CONSTRAINT FK_Raca
FOREIGN KEY (raca) REFERENCES RACA (codigo);

ALTER TABLE DADODEMOGRAFICO
	ADD CONSTRAINT FK_Nacionalidade
FOREIGN KEY (nacionalidade) REFERENCES NACIONALIDADE (codigo);

ALTER TABLE DADODEMOGRAFICO
	ADD CONSTRAINT FK_ReferenciaParaMunicipio
FOREIGN KEY (municipio) REFERENCES MUNICIPIO (codigo);

ALTER TABLE DADODEMOGRAFICO
	ADD CONSTRAINT FK_Estado
FOREIGN KEY (estado) REFERENCES ESTADO (codigo);

ALTER TABLE DADODEMOGRAFICO
	ADD CONSTRAINT FK_Pais
FOREIGN KEY (pais) REFERENCES PAIS (codigo);

DROP TABLE IF EXISTS ENDERECO;
DROP TABLE IF EXISTS ENDERECOLINHA;

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
FOREIGN KEY (tipo) REFERENCES ENDERECOTIPO (codigo);

/*
	Seção 11.2 (pág. 65) - Linha de endereço
 */
CREATE TABLE ENDERECOLINHA (
	endereco varchar(36) NOT NULL,
	linha varchar,
	ordem int
);

ALTER TABLE ENDERECOLINHA
	ADD CONSTRAINT FK_LinhaTemEnderecoAssociado
FOREIGN KEY (endereco) REFERENCES ENDERECO (id);