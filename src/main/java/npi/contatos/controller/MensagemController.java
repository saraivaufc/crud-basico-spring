package npi.contatos.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import npi.contatos.model.Contato;
import npi.contatos.model.Mensagem;
import npi.contatos.service.ContatoService;
import npi.contatos.service.ContatoServiceImpl;
import npi.contatos.service.MensagemService;

@Controller
public class MensagemController {
	@Inject
	private MensagemService mensagemService;
	
	@Inject
	private ContatoService contatoService;
	
	@RequestMapping(value = "/mensagens/listar")
	public String listar(Model model) {
		model.addAttribute("mensagens", mensagemService.findAll());
		return "listar";
	}

	@RequestMapping(value = "/mensagens/adicionar/contato={id}", method = RequestMethod.POST)
	public String adicionar(Mensagem mensagem, @PathVariable("id") Integer id ){
		Contato contato = contatoService.findId(id);
		mensagem.setDestinatario(contato);
		mensagem.setId(null);
		System.out.println("Mensagem:" + mensagem.toString());
		mensagemService.salvar(mensagem);
		return "redirect:/listar";
	}
	

	@RequestMapping(value = "/mensagens/remover/{id}", method = RequestMethod.GET)
	public String remover(@PathVariable("id") Integer id) {
		mensagemService.remover(id);
		return "redirect:/listar";
	}
	
	
	@RequestMapping(value = "/mensagens/buscar", method = RequestMethod.POST)
	public String buscar(Model model,@RequestParam("assunto") String assunto) {
		List<Mensagem> mensagens = mensagemService.buscarPorAssunto(assunto);
		model.addAttribute("mensagens", mensagens);
		model.addAttribute("qtd_busca", mensagens.size());
		return "listar";
	}
}
