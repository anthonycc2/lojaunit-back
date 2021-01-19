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

import br.unit.lojaUnit.entidade.Marca;
import br.unit.lojaUnit.repositorio.RepositorioMarca;

@Controller
@RequestMapping(path = "/marca")
public class ControladorMarca {
	
	@Autowired
	private RepositorioMarca repositorio;

	@PostMapping(path = "/add")
	public @ResponseBody String inserir(@RequestBody Marca marca) {
		repositorio.save(marca);
		return "Saved";
	}

	@GetMapping(path = "/all")
	public @ResponseBody Iterable<Marca> listar() {
		return repositorio.findAll();
	}
	
	@GetMapping(path = "/get/{id}")
	public @ResponseBody Optional<Marca> recuperar(@PathVariable(required = true, name="id") int id) {
			return repositorio.findById(id);
	}
	
	@PutMapping(path = "/update/{id}")
	public @ResponseBody String alterar(
			@PathVariable(required = true, name = "id")  int id,
			@RequestBody Marca marca) {
		if (repositorio.existsById(id)) {
			repositorio.save(marca);
			return "Saved";
		} else {
			return "Id doesn't exist";
		}
	}

	@DeleteMapping(path = "/delete/{id}")
	public @ResponseBody String deletar(@PathVariable(required = true, name = "id")  int id) {
		if (repositorio.existsById(id)) {
			repositorio.deleteById(id);
			return "Removed";
		} else {
			return "Id doesn't exist";
		}
	}

}
