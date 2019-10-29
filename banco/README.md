# Primeiros passos
Segue sequência típica para desenvolvimento que coloca o H2 e um cliente Web
disponível para sessão de trabalho. Detalhes e cenários específicos 
são fornecidos nas subseções seguintes: 
 
 - `mvn package` (deposita em target/jars/h2-&lt;versao&gt;.jar o H2)
 - `mvn exec:exec -P start-h2` (coloca H2 Server em execução)
 
```shell
mvn spring-boot:run
```

## H2 (por simplicidade)
A simplicidade do [H2](http://www.h2database.com) foi determinante para 
utilizá-lo durante o desenvolvimento.

Ao executar **mvn package** será gerado no diretório **target/jars** 
todos os arquivos jar empregados pela solução, inclusive 
aquele correspondente ao H2. O arquivo segue o formato **h2-&lt;versao&gt;.jar**.
Este arquivo também inclui o _driver_ JDBC a ser utilizado por qualquer cliente
SQL para interagir com o H2.

#### H2 (iniciar o Server e cliente Web)
Iniciado com permissão para criação remota de _database_. Este recurso apresenta
vulnerabilidades de segurança e, portanto, só deve ser feito tal uso em desenvolvimento.
 
```
mvn exec:exec -P start-h2
```
 
A versão do H2 a ser utilizada está definida no _pom.xml_ por meio da propriedade **h2.version**. Deve ser a mesma versão empregada tanto pelo 
Flyway quanto pelo cliente SQL empregado. As portas utilizadas são **9092** (tcp) e **8082** (web).

#### Interromper o H2 (Server e Web)
 
```
mvn exec:exec -P stop-h2
```

#### Criar um _database_
Antes de se conectar a uma base de dados será necessário criá-la. Uma forma
 é apresentada abaixo: 
 
 - `java -cp target/jars/h2-1.4.199.jar org.h2.tools.Shell`. Você terá que
  fornecer como URL algo como `jdbc:h2:./teste` para criar no diretório
   corrente o banco "teste" (que posteriormente poderá ser empregado).
   

#### Conexão (URL)
```
jdbc:h2:tcp://localhost:9092/./target/database
```
   
## Flyway
Assumindo que o H2 está em execução...

#### Migrações (informações)

```
mvn flyway:info
```

#### Migrações (aplicar)

```
mvn flyway:migrate
```

Migrações configuradas, ou seja, os arquivos disponíveis em 
_resources/db/migration_ serão executados na ordem **V1__**, **V2__** e 
assim por diante.

#### Limpar (sim, mas nunca em produção...)

```
mvn flyway:clean
```

#### Refatoração

O diretório `src/main/db/migration` contém várias versões **V1**, 
**V2** e assim sucessivamente. 

Todas elas serão aplicadas, na ordem das versões, com o comando
**mvn flyway:migrate**. Use o comando **mvn flyway:info** para obter
informações sobre o banco de dados em questão, o que deve indicar
eventuais alterações pendentes, se for o caso.


## Fluxo típico
Remover o **database.mv.db** (banco padrão usado pela aplicação). Executar o
H2 via **mvn exec:jdbc** e só então a aplicação. A execução da aplicação pode ser
feita via linha de comandos conforme ilustrado abaixo.

```
$ mvn exec:exec -P start-h2
$ mvn flyway:info
$ mvn flyway:migrate
... Realiza algumas mudanças 
$ mvn flyway:clean
$ mvn flyway:migrate
```

