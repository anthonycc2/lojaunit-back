package br.unit.lojaUnit.entidade;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "forma_pagamento")
public class FormaPagamento {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String forma;
	
	private String descricao;
	
	private boolean ativo;
	
	public FormaPagamento() {
		super();
	}
	
	public FormaPagamento(int id, String forma, String descricao, boolean ativo) {
		this.id = id;
		this.forma = forma;
		this.descricao = descricao;
		this.ativo = ativo;
	}

	public FormaPagamento(String forma, String descricao, boolean ativo) {
		this.forma = forma;
		this.descricao = descricao;
		this.ativo = ativo;
	}

	public FormaPagamento(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getForma() {
		return forma;
	}

	public void setForma(String forma) {
		this.forma = forma;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public boolean isAtivo() {
		return ativo;
	}

	public void setAtivo(boolean ativo) {
		this.ativo = ativo;
	}

}
