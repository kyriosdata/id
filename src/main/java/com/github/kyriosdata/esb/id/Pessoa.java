package com.github.kyriosdata.esb.id;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Pessoa {

	@Id
	private long id;

	private String nome;

	private int ano;

	private String cor;

	Pessoa() {
	}

	public Pessoa(String nome, String model, int ano, String cor) {
		super();
		this.nome = nome;
		this.ano = ano;
		this.cor = cor;
	}

	public String getNome() {
		return nome;
	}

	public int getAno() {
		return ano;
	}

	public String getCor() {
		return cor;
	}

	@Override
	public String toString() {
		return nome + " " + ano + " " + this.cor;
	}

}
