package npi.contatos.respository;

import java.util.List;

import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import npi.contatos.model.Contato;

@Named
public class ContatoRepositoryImpl implements ContatoRepository {
	
	protected EntityManager em;
	
	@PersistenceContext
	public void setEntityManager(EntityManager em) {
		this.em = em;
	}

	@Override
	public List<Contato> findAll() {
		Query query = em.createQuery("from Contato");
		return query.getResultList();
	}

	@Override
	@Transactional
	public void salvar(Contato contato) {
		em.persist(contato);
	}

	@Override
	public Contato findById(Integer id) {
		return em.find(Contato.class, id);
	}

	@Override
	@Transactional
	public void remover(Contato contato) {
		em.remove(em.merge(contato));
		
	}

	@Override
	@Transactional
	public void atualizar(Contato contato) {
		em.merge(contato);
	}

	@Override
	public Contato buscar(String nome) {
		Query query = em.createQuery("from Contato where nome = :nome");
		query.setParameter("nome", nome);
		query.setMaxResults(1);
		Contato contato= (Contato) query.getSingleResult();
		return contato;
	}

}
