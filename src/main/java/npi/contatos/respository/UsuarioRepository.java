package npi.contatos.respository;

import java.util.List;

import javax.inject.Named;

import npi.contatos.model.Usuario;

@Named
public interface UsuarioRepository {
	List<Usuario> findAll();
	
	void salvar(Usuario usuario);
	
	Usuario findById(Integer id);
	
	Usuario autenticar(String login, String password);
	
	List<Usuario> buscarPorNome(String nome);
	
	void remover(Usuario usuario);
	
	void atualizar(Usuario usuario);
}
