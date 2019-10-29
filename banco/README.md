# Iniciando com o H2
- Configure o arquivo _pom.xml_ por meio de duas propriedades: **h2.version** e **h2.url**. A primeira com a versão do H2 a ser usada, enquanto a segunda com a URL de acesso ao 
banco desejado, possivelmente algo como _jdbc:h2:tcp://192.168.0.104:9092/./db-teste_, por exemplo.

- `mvn exec:exec -P start-h2` inicia o servidor (porta **9092**) e o cliente Web (porta **8082**) do H2, ambos acessíveis remotamente.
- `mvn exec:exec -P stop-h2` interrompe a execução do H2.

### H2 (server, cliente e driver JDBC)

- **mvn package** deposita no diretório **target/jars** 
os arquivos jar empregados pela solução, inclusive o arquivo **h2-&lt;version&gt;.jar** que inclui a implementação do [H2](http://www.h2database.com), o cliente Web e o _driver_ JDBC.
Observe que **version** é definida pela propriedade **h2.version** no arquivo _pom.xml_. 


### H2 (iniciar o Server e cliente Web)
Iniciado com permissão para criação remota de _database_. Este recurso apresenta
vulnerabilidades de segurança e, portanto, só deve ser feito tal uso em desenvolvimento.
 
```
mvn exec:exec -P start-h2
```
 
A versão do H2 a ser utilizada está definida no _pom.xml_ por meio da propriedade **h2.version**. As portas utilizadas são **9092** (tcp) e **8082** (web).

### Interromper o H2 (Server e Web)
 
```
mvn exec:exec -P stop-h2
```

### Criar um _database_
Antes de se conectar a uma base de dados será necessário criá-la. Conforme configurado
no _pom.xml_, o comando para iniciar o H2 o configura para permitir a criação automática
de um _database_, contudo, você pode desejar criar um explicitamente conforme abaixo:
 
 - `java -cp target/jars/h2-&lt;version&gt;.jar org.h2.tools.Shell`. Você terá que
  fornecer como URL algo como `jdbc:h2:./teste` para criar no diretório
   corrente o banco "teste".
   

### Conexão (URL)
```
jdbc:h2:tcp://localhost:9092/./target/database
```
   
### Flyway
Defina a propriedade **h2.url** no arquivo _pom.xml_ para o _database_ a ser
empregado pelo FlyWay. 

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


#### Fluxo típico
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

