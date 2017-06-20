package com.github.kyriosdata.esb.id;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class FlywayMigrationApplication {

	public static void main(String[] args) {
		SpringApplication.run(FlywayMigrationApplication.class, args);
	}

	@Bean
	public CommandLineRunner exampleQuery(PessoaRepository repository) {
		return args -> repository.findByNomeIgnoringCase("FÁBIO")
				.forEach(System.err::println);
	}

}
