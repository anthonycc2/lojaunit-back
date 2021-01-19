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

import br.unit.lojaUnit.entidade.Venda;
import br.unit.lojaUnit.repositorio.RepositorioCliente;
import br.unit.lojaUnit.repositorio.RepositorioFormaPagamento;
import br.unit.lojaUnit.repositorio.RepositorioVenda;

@Controller
@RequestMapping(path = "/venda")
public class ControladorVenda {
	
	@Autowired
	private RepositorioVenda repositorio;
	
	@Autowired
	private RepositorioCliente repositorioCliente;
	
	@Autowired
	private RepositorioFormaPagamento repositorioFormaPagamento;

	@PostMapping(path = "/add")
	public @ResponseBody String inserir(@RequestBody Venda venda) {
		if (repositorioCliente.existsById(venda.getCliente().getId()) 
				&& repositorioFormaPagamento.existsById(venda.getFormaPagamento().getId())) {
			repositorio.save(venda);
			return "Saved";
		} else {
			return "Id doesn't exist";
		}
	}

	@GetMapping(path = "/all")
	public @ResponseBody Iterable<Venda> listar() {
		return repositorio.findAll();
	}
	
	@GetMapping(path = "/get/{id}")
	public @ResponseBody Optional<Venda> recuperar(@PathVariable(required = true, name="id") int id) {
			return repositorio.findById(id);
	}
	
	@PutMapping(path = "/update/{id}")
	public @ResponseBody String alterar(
			@PathVariable(required = true, name = "id") int id,
			@RequestBody Venda venda) {
		if (repositorio.existsById(id) 
				&& repositorioCliente.existsById(venda.getCliente().getId()) 
				&& repositorioFormaPagamento.existsById(venda.getFormaPagamento().getId())) {
			repositorio.save(venda);
			return "Saved";
		} else {
			return "Id doesn't exist";
		}
	}

	@DeleteMapping(path = "/delete/{id}")
	public @ResponseBody String deletar(@PathVariable(required = true, name = "id") int id) {
		if (repositorio.existsById(id)) {
			repositorio.deleteById(id);
			return "Removed";
		} else {
			return "Id doesn't exist";
		}
	}
}
