package br.unit.lojaUnit.repositorio;

import org.springframework.data.repository.CrudRepository;

import br.unit.lojaUnit.entidade.Categoria;

public interface RepositorioCategoria extends CrudRepository<Categoria, Integer> {
	
}
