package br.unit.lojaUnit.repositorio;

import org.springframework.data.repository.CrudRepository;

import br.unit.lojaUnit.entidade.Fornecedor;

public interface RepositorioFornecedor extends CrudRepository<Fornecedor, Integer> {

}
