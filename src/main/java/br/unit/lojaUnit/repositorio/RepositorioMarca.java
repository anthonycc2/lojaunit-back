package br.unit.lojaUnit.repositorio;

import org.springframework.data.repository.CrudRepository;

import br.unit.lojaUnit.entidade.Marca;

public interface RepositorioMarca extends CrudRepository<Marca, Integer> {

}
