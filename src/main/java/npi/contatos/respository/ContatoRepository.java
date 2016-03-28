package npi.contatos.respository;

import java.util.List;

import javax.inject.Named;

import npi.contatos.model.Contato;

@Named
public interface ContatoRepository {
	
	List<Contato> findAll();
	
	void salvar(Contato contato);
	
	Contato findById(Integer id);
	
	List<Contato> buscarPorNome(String nome);
	
	void remover(Contato contato);
	
	void atualizar(Contato contato);
}
