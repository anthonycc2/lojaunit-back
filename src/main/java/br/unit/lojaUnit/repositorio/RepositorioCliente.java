package br.unit.lojaUnit.repositorio;

import org.springframework.data.repository.CrudRepository;

import br.unit.lojaUnit.entidade.Cliente;

//import com.example.lojaUnitSpring.Cliente;

// This will be AUTO IMPLEMENTED by Spring into a Bean called userRepository
// CRUD refers Create, Read, Update, Delete

public interface RepositorioCliente extends CrudRepository<Cliente, Integer> {

}
