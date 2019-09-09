package com.github.kyriosdata.id;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Set;

@Entity
public class Individuo {

	@Id
	private String id;

	private Set<Nome> nomes;

	Individuo() {
	}

	public Individuo(String id) {
		super();

		this.id = id;
	}

	public String getId() {
		return id;
	}

	@Override
	public String toString() {
		return "Indivíduo: " + id;
	}

}
