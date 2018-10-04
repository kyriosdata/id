## Escolhendo um SGBD para ser usado durante o desenvolvimento...
A simplicidade do [H2](http://www.h2database.com) foi determinante para 
selecioná-lo para uso durante a fase de desenvolvimento.

**Importante**: caso venha a utilizar algum cliente senão aquele web oferecido pelo próprio H2, verifique se o cliente faz uso da mesma versão empregada para iniciar o H2. Esta versão também deve ser a mesma empregada pelo Flyway. 

#### Disponibilizar H2 localmente
Observe que ao executar **mvn package** será gerado o diretório **jars** no 
diretório **target** no qual estarão todas os jar files empregados, inclusive 
aquele correspondente ao H2. Esse deve ser o jar empregado pelo cliente do 
IntelliJ IDEA. 

## SGBD H2

#### Conexão (URL)
```
jdbc:h2:tcp://localhost:9092/./target/database
```

#### Iniciar o H2 (Server e Web)
 
```
mvn exec:exec -P start-h2
```
 
A versão do H2 a ser utilizada está definida no _pom.xml_ por meio da propriedade **h2.version**. Deve ser a mesma versão empregada tanto pelo 
Flyway quanto pelo cliente SQL empregado. As portas utilizadas são **9092** (tcp) e **8082** (web).

#### Interromper o H2 (Server e Web)
 
```
mvn exec:exec -P stop-h2
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

