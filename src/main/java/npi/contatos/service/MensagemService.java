package npi.contatos.service;

import java.util.List;

import npi.contatos.model.Mensagem;

public interface MensagemService {
	List<Mensagem> findAll();
	
	Mensagem findId(Integer id);
	
	void salvar(Mensagem mensagem);
	
	void remover(Integer id);

	void atualizar(Mensagem mensagem);
	
	List<Mensagem> buscarPorAssunto(String assunto);
	
	void enviarEmail(Mensagem mensagem);
}
