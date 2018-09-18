package com.github.kyriosdata.esb.id;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Individuo {

	@Id
	private String id;

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
