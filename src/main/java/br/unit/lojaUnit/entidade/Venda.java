package br.unit.lojaUnit.entidade;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Venda {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private Date datahora;
	
	@ManyToOne
	@JoinColumn(name = "cliente_id")
	private Cliente cliente;
	
	@ManyToOne
	@JoinColumn(name = "formapagamento_id")
	private FormaPagamento formaPagamento;
	
	private double valor;
	
	public Venda() {
		super();
	}

	public Venda(int id, Date datahora, Cliente cliente, FormaPagamento formaPagamento, double valor) {
		this.id = id;
		this.datahora = datahora;
		this.cliente = cliente;
		this.formaPagamento = formaPagamento;
		this.valor = valor;
	}

	public Venda(Date datahora, Cliente cliente, FormaPagamento formaPagamento, double valor) {
		this.datahora = datahora;
		this.cliente = cliente;
		this.formaPagamento = formaPagamento;
		this.valor = valor;
	}
	
	public Venda(int id) {
		this.id = id;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDatahora() {
		return datahora;
	}

	public void setDatahora(Date datahora) {
		this.datahora = datahora;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public FormaPagamento getFormaPagamento() {
		return formaPagamento;
	}

	public void setFormaPagamento(FormaPagamento formaPagamento) {
		this.formaPagamento = formaPagamento;
	}

	public double getValor() {
		return valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}

}
