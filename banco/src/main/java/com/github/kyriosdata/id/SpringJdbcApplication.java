package com.github.kyriosdata.id;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;
import java.util.Map;

@SpringBootApplication
public class SpringJdbcApplication {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Bean
    public CommandLineRunner exibeMunicipios() {
        return args -> {
            List<Map<String, Object>> municipios =
                    jdbcTemplate.queryForList("SELECT * FROM municipio");

            municipios.forEach(System.out::println);

            System.out.println("TOTAL: " + municipios.size());
        };
    }

    public static void main(String[] args) {
        SpringApplication.run(SpringJdbcApplication.class, args);
    }
}
