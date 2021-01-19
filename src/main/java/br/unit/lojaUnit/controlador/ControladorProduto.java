package br.unit.lojaUnit.controlador;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import br.unit.lojaUnit.entidade.Produto;
import br.unit.lojaUnit.repositorio.RepositorioProduto;
import br.unit.lojaUnit.repositorio.RepositorioCategoria;
import br.unit.lojaUnit.repositorio.RepositorioFornecedor;
import br.unit.lojaUnit.repositorio.RepositorioMarca;

@Controller
@RequestMapping(path = "/produto")
public class ControladorProduto {
	
	@Autowired
	private RepositorioProduto repositorio;

	@Autowired
	private RepositorioCategoria repositorioCategoria;

	@Autowired
	private RepositorioFornecedor repositorioFornecedor;

	@Autowired
	private RepositorioMarca repositorioMarca;
	
	@PostMapping(path = "/add")
	public @ResponseBody String inserir(@RequestBody Produto produto) {
		if(repositorioCategoria.existsById(produto.getCategoria().getId())
				&& repositorioFornecedor.existsById(produto.getFornecedor().getId())
				&& repositorioMarca.existsById(produto.getMarca().getId())) {
			repositorio.save(produto);
			return "Saved";
		} else {
			return "Id doesn't exist";
		}
	}
	
	@GetMapping(path = "/all")
	public @ResponseBody Iterable<Produto> listar(){
		return repositorio.findAll();
	}
	
	@GetMapping(path = "/get/{id}")
	public @ResponseBody Optional<Produto> recuperar(@PathVariable(required = true, name="id") int id) {
			return repositorio.findById(id);
	}
	
	@PutMapping(path = "/update/{id}")
	public @ResponseBody String alterar(
			@PathVariable(required = true, name="id") int id,
			@RequestBody Produto produto) {
		if(repositorio.existsById(id)
				&& repositorioCategoria.existsById(produto.getCategoria().getId())
				&& repositorioFornecedor.existsById(produto.getFornecedor().getId())
				&& repositorioMarca.existsById(produto.getMarca().getId())) {
			repositorio.save(produto);
			return "Saved";
		} else {
			return "Id doesn't exist";
		}
	}
	
	@DeleteMapping(path = "/delete/{id}")
	public @ResponseBody String deletar(@PathVariable(required = true, name = "id") int id) {
		if(repositorio.existsById(id)) {
			repositorio.deleteById(id);
			return "Removed";
		} else {
			return "Id doesn't exist";
		}
	}
	
}
