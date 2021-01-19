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

import br.unit.lojaUnit.entidade.Faq;
import br.unit.lojaUnit.repositorio.RepositorioFaq;
import br.unit.lojaUnit.repositorio.RepositorioProduto;

@Controller
@RequestMapping(path = "/faq")
public class ControladorFaq {
	
	@Autowired
	private RepositorioFaq repositorio;
	
	@Autowired
	private RepositorioProduto repositorioProduto;
	
	@PostMapping(path = "/add")
	public @ResponseBody String inserir(@RequestBody Faq faq) {
		if(repositorioProduto.existsById(faq.getProduto().getId())) {
			repositorio.save(faq);
			return "Saved";
		} else {
			return "Id doesn't exist";
		}	}
	
	@GetMapping(path = "/all")
	public @ResponseBody Iterable<Faq> listar(){
		return repositorio.findAll();
	}
	
	@GetMapping(path = "/get/{id}")
	public @ResponseBody Optional<Faq> recuperar(@PathVariable(required = true, name="id") int id) {
			return repositorio.findById(id);
	}
	
	@PutMapping(path = "/update/{id}")
	public @ResponseBody String inserir(
			@PathVariable(required = true, name="id") int id,
			@RequestBody Faq faq) {
		if(repositorio.existsById(id) && repositorioProduto.existsById(faq.getProduto().getId())) {
			repositorio.save(faq);
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
