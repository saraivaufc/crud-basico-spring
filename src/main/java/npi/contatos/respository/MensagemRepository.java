package npi.contatos.respository;

import java.util.List;

import npi.contatos.model.Mensagem;

public interface MensagemRepository {
	List<Mensagem> findAll();
	
	void salvar(Mensagem mensagem);
	
	Mensagem findById(Integer id);
	
	
	List<Mensagem> buscarPorAssunto(String assunto);
	
	
	void remover(Mensagem mensagem);
	
	void atualizar(Mensagem mensagem);
}
