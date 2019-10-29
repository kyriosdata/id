package com.github.kyriosdata.id;

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
	public CommandLineRunner exampleQuery(IndividuoRepository repository) {
		return args -> {
			repository.save(new Individuo());
			repository.save(new Individuo());
			repository.save(new Individuo());
			repository.save(new Individuo());

			repository.findAll().forEach(System.err::println);
		};
	}
}
