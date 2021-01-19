package br.unit.lojaUnit.entidade;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Faq {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private Date datahora;
	
	private String texto;
	
	@ManyToOne
	@JoinColumn(name = "produto_id")
	private Produto produto;
	
	public Faq() {
		super();
	}
	
	public Faq(int id, Date datahora, String texto, Produto produto) {
		this.id = id;
		this.datahora = datahora;
		this.texto = texto;
		this.produto = produto;
	}

	public Faq(Date datahora, String texto, Produto produto) {
		this.datahora = datahora;
		this.texto = texto;
		this.produto = produto;
	}

	public Faq(int id) {
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

	public void setDatahora(Date data) {
		this.datahora = data;
	}

	public String getTexto() {
		return texto;
	}

	public void setTexto(String texto) {
		this.texto = texto;
	}

	public Produto getProduto() {
		return produto;
	}

	public void setProduto(Produto produto) {
		this.produto = produto;
	}

}
