package com.github.kyriosdata.esb.id;

import org.springframework.data.jpa.repository.JpaRepository;

public interface IndividuoRepository extends JpaRepository<Individuo, Long> {

	Iterable<Individuo> findByIdIgnoringCase(String make);

}
