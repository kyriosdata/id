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
	public CommandLineRunner exampleQuery(IndividuoRepository repository) {
		return args -> {
			String uuid = "8d4cd0d3-8996-4812-96b4-48b4f1847ff5";
			repository.findByIdIgnoringCase(uuid)
					.forEach(System.err::println);
		};
	}

}
