package npi.contatos.service;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

import npi.contatos.model.Mensagem;
import npi.contatos.respository.MensagemRepository;

@Named
public class MensagemServiceImpl implements MensagemService {

	@Inject
	private MensagemRepository mensagemRepository;
	
	@Inject
	private MailSender mailSender;
	
	public void setMailSender(MailSender mailSender) {
		this.mailSender = mailSender;
	}
	
	@Override
	public List<Mensagem> findAll() {
		return mensagemRepository.findAll();
	}

	@Override
	public Mensagem findId(Integer id) {
		Mensagem mensagem = mensagemRepository.findById(id);
		return mensagem;
	}

	@Override
	public void salvar(Mensagem mensagem) {
		mensagemRepository.salvar(mensagem);
		this.enviarEmail(mensagem);
	}

	@Override
	public void remover(Integer id) {
		Mensagem mensagem = this.findId(id);
		mensagemRepository.remover(mensagem);
	}

	@Override
	public void atualizar(Mensagem mensagem) {
		mensagemRepository.atualizar(mensagem);
	}

	@Override
	public List<Mensagem> buscarPorAssunto(String assunto) {
		return mensagemRepository.buscarPorAssunto(assunto);
	}

	@Override
	public void enviarEmail(Mensagem mensagem) {
		SimpleMailMessage msn = new SimpleMailMessage();	
		msn.setTo(mensagem.getDestinatario().getEmail());
		msn.setSubject(mensagem.getAssunto());
		msn.setText(mensagem.getMensagem());
		mailSender.send(msn);	
	}

}
