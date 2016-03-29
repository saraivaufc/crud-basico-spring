package npi.contatos.respository;

import java.util.List;

import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import npi.contatos.model.Usuario;

@Named
public class UsuarioRepositoryImpl implements UsuarioRepository {

	protected EntityManager em;
	
	@PersistenceContext
	public void setEntityManager(EntityManager em) {
		this.em = em;
	}
	
	@Override
	public List<Usuario> findAll() {
		Query query = em.createQuery("from Usuario order by(nome)");
		return query.getResultList();
	}

	@Override
	@Transactional
	public void salvar(Usuario usuario) {
		em.persist(usuario);
	}

	@Override
	public Usuario findById(Integer id) {
		return em.find(Usuario.class, id);
	}

	@Override
	public List<Usuario> buscarPorNome(String nome) {
		Query query = em.createQuery("from Usuario where UPPER(nome) like '%' || UPPER(:nome) || '%'");
		query.setParameter("nome", nome);
		List<Usuario> resultList = (List<Usuario>) query.getResultList();
		return resultList;
	}

	@Override
	@Transactional
	public void remover(Usuario usuario) {
		em.remove(em.merge(usuario));
	}

	@Override
	@Transactional
	public void atualizar(Usuario usuario) {
		em.merge(usuario);

	}

	@Override
	public Usuario autenticar(String login, String password) {
		Query query = em.createQuery("from Usuario where login=:login and password=:password");
		query.setParameter("login", login);
		query.setParameter("password", password);
		query.setMaxResults(1);
		return  (Usuario) query.getSingleResult();
	}

}
