package br.unit.lojaUnit.repositorio;

import org.springframework.data.repository.CrudRepository;

import br.unit.lojaUnit.entidade.Venda;

public interface RepositorioVenda extends CrudRepository<Venda, Integer> {

}
