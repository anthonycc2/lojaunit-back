package br.unit.lojaUnit.repositorio;

import org.springframework.data.repository.CrudRepository;

import br.unit.lojaUnit.entidade.Produto;

public interface RepositorioProduto extends CrudRepository<Produto, Integer> {

}
