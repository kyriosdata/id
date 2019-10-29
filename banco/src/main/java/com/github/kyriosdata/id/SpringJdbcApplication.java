package com.github.kyriosdata.id;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import javax.sql.DataSource;
import java.util.List;

@SpringBootApplication
public class SpringJdbcApplication {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Bean
    public CommandLineRunner exampleQuery() {
        return args -> {

            List records = jdbcTemplate.queryForList("SELECT * FROM municipio");
            for (int i = 0; i < records.size(); i++) {
                System.out.println("Municipio = " + records.get(i));
            }

            System.out.println("TOTAL DE REGISTROS: " + records.size());
        };
    }

    public static void main(String[] args) {
        SpringApplication.run(SpringJdbcApplication.class, args);
    }
}
