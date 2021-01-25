package br.unit.lojaUnit.entidade;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Table;

@Entity
@Table(name = "item_venda")
public class ItemVenda {
	
	@EmbeddedId
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private ItemVendaId itemVendaId;
	
	private int quantidade;
	
	@Column(name = "valor_unitario")
	private double valorUnitario;
	
	public ItemVenda() {
		super();
	}

	public ItemVenda(Venda venda, Produto produto, int quantidade, double valorUnitario) {
		this.itemVendaId = new ItemVendaId(venda, produto);
		this.quantidade = quantidade;
		this.valorUnitario = valorUnitario;
	}
	
	public ItemVendaId getId() {
		return this.itemVendaId;
	}
	
	public void setId(ItemVendaId id) {
		this.itemVendaId = id;
	}

	public int getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(int quantidade) {
		this.quantidade = quantidade;
	}

	public double getValorUnitario() {
		return valorUnitario;
	}

	public void setValorUnitario(double valorUnitario) {
		this.valorUnitario = valorUnitario;
	}

}
