package br.unit.lojaUnit.controlador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.unit.lojaUnit.entidade.ItemVenda;
import br.unit.lojaUnit.entidade.Produto;
import br.unit.lojaUnit.entidade.Venda;
import br.unit.lojaUnit.repositorio.RepositorioItemVenda;
import br.unit.lojaUnit.repositorio.RepositorioProduto;
import br.unit.lojaUnit.repositorio.RepositorioVenda;

@Controller
@RequestMapping(path = "/itemvenda")
public class ControladorItemVenda {
	
	@Autowired
	private RepositorioItemVenda repositorio;
	
	@Autowired
	private RepositorioVenda repositorioVenda;
	
	@Autowired
	private RepositorioProduto repositorioProduto;

	@PostMapping(path = "/add")
	public @ResponseBody String inserir(
			@RequestParam(required = true, name = "venda") int idVenda,
			@RequestParam(required = true, name = "produto") int idProduto,
			@RequestParam(required = true, name = "quantidade") int quantidade,
			@RequestParam(required = true, name = "valor") double valorUnitario) {
		if (repositorioVenda.existsById(idVenda) && repositorioProduto.existsById(idProduto)) {
			Venda venda = new Venda(idVenda);
			Produto produto = new Produto(idProduto);
			ItemVenda itemVenda = new ItemVenda(venda, produto, quantidade, valorUnitario);
			repositorio.save(itemVenda);
			return "Saved";
		} else {
			return "Id doesn't exist";
		}
	}

	@GetMapping(path = "/all")
	public @ResponseBody Iterable<ItemVenda> listar() {
		return repositorio.findAll();
	}
	
	@PutMapping(path = "/update")
	public @ResponseBody String alterar(@RequestBody ItemVenda itemVenda) {
		if (repositorioVenda.existsById(itemVenda.getId().getVenda().getId())
				&& repositorioProduto.existsById(itemVenda.getId().getProduto().getId())) {
			repositorio.save(itemVenda);
			return "Saved";
		} else {
			return "Id doesn't exist";
		}
	}

	@DeleteMapping(path = "/delete/{idVenda}/{idProduto}")
	public @ResponseBody String deletar (
			@PathVariable(required = true, name = "idVenda") int idVenda,
			@PathVariable(required = true, name = "idProduto") int idProduto) {
		try {
			ItemVenda item = new ItemVenda(new Venda(idVenda), new Produto(idProduto), 0, 0.0);
			repositorio.delete(item);
			return "Removed";
		} catch(IllegalArgumentException e) {
			e.printStackTrace();
			return "Id doesn't exist";
		}
	}
	
}
