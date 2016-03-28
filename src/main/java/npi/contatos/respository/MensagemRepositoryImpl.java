package npi.contatos.respository;

import java.util.List;

import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.transaction.annotation.Transactional;

import npi.contatos.model.Mensagem;

@Named
public class MensagemRepositoryImpl implements MensagemRepository {

	protected EntityManager em;
	
	@PersistenceContext
	public void setEntityManager(EntityManager em) {
		this.em = em;
	}
	
	@Override
	public List<Mensagem> findAll() {
		Query query = em.createQuery("from Mensagem order by(assunto)");
		return query.getResultList();
	}

	@Override
	@Transactional
	public void salvar(Mensagem mensagem) {
		System.out.println("Salvando Mensagem!!!");
		em.persist(mensagem);
	}

	@Override
	public Mensagem findById(Integer id) {
		return em.find(Mensagem.class, id);
	}

	@Override
	@Transactional
	public void remover(Mensagem mensagem) {
		em.remove(em.merge(mensagem));

	}

	@Override
	@Transactional
	public void atualizar(Mensagem mensagem) {
		em.merge(mensagem);

	}

	@Override
	public List<Mensagem> buscarPorAssunto(String assunto) {
		Query query = em.createQuery("from Mensagem where UPPER(assunto) like '%' || UPPER(:assunto) || '%'");
		query.setParameter("assunto", assunto);
		List<Mensagem> resultList = (List<Mensagem>) query.getResultList();
		return resultList;
	}

}
