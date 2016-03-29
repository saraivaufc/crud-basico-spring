package npi.contatos.service;

import npi.contatos.model.Usuario;

public interface UsuarioService {
	public void registrar(Usuario usuario);
	public Usuario autenticar(String login, String password);
}
