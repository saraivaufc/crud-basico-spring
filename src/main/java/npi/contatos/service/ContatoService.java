package npi.contatos.service;

import java.util.List;

import javax.inject.Named;
import javax.servlet.ServletContext;

import npi.contatos.model.Contato;

@Named
public interface ContatoService {
	
	List<Contato> findAll();
	
	Contato findId(Integer id);
	
	void salvar(Contato contato);
	
	void remover(Integer id);

	void atualizar(Contato contato);
	
	List<Contato> buscarPorNome(String nome);
	
	boolean salvarImagem(ServletContext context, Contato contato);
	
}
