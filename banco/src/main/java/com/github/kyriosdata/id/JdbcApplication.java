package com.github.kyriosdata.id;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.sql.DataSource;
import java.util.List;

/**
 * Manualmente configura acesso ao H2.
 */
public class JdbcApplication {
    public static final String DRIVER = "org.h2.Driver";
    public static final String JDBC_URL = "jdbc:h2:tcp://localhost:9092/./db1";
    public static final String USERNAME = "sa";
    public static final String PASSWORD = "";

    public static void main(String[] args) {
        DataSource source = getDataSource();
        JdbcTemplate template = new JdbcTemplate(source);

        List records = template.queryForList("SELECT * FROM municipio");
        for (int i = 0; i < records.size(); i++) {
            System.out.println("Municipio = " + records.get(i));
        }

        System.out.println("TOTAL DE REGISTROS: " + records.size());
    }

    /**
     * Cria {@link DataSource} a ser empregada pela aplicação.
     *
     * @return Objeto para acesso ao banco de dados.
     */
    private static DataSource getDataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(JdbcApplication.DRIVER);
        dataSource.setUrl(JdbcApplication.JDBC_URL);
        dataSource.setUsername(JdbcApplication.USERNAME);
        dataSource.setPassword(JdbcApplication.PASSWORD);
        return dataSource;
    }
}
