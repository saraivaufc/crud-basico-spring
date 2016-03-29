package npi.contatos.service;

import javax.inject.Inject;
import javax.inject.Named;

import npi.contatos.model.Usuario;
import npi.contatos.respository.UsuarioRepository;

@Named
public class UsuarioServiceImpl implements UsuarioService {

	@Inject
	private UsuarioRepository usuarioRepository;
	
	@Override
	public void registrar(Usuario usuario) {
//		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//		usuario.setPassword(passwordEncoder.encode(usuario.getPassword()));
		usuarioRepository.salvar(usuario);
		
	}
	
	@Override
	public Usuario autenticar(String login, String password) {
//		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
//		String passwordHash = passwordEncoder.encode(password);
//		System.out.println("Password:" + password + " Password Hash:" + passwordHash);
		return usuarioRepository.autenticar(login, password);
	}

}
