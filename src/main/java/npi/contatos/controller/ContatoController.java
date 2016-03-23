package npi.contatos.controller;

import java.util.List;

import javax.inject.Inject;

import npi.contatos.model.Contato;
import npi.contatos.service.ContatoService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ContatoController {
	
	@Inject
	private ContatoService contatoService;
	
	@RequestMapping(value = "/")
	public String index() {
		return "redirect:/listar";
	}
	
	@RequestMapping(value = "/listar")
	public String listar(Model model) {
		model.addAttribute("contatos", contatoService.findAll());
		return "listar";
	}
	
	@RequestMapping(value = "/detalhes/{id}", method = RequestMethod.GET)
	public String detalhes(Model model, @PathVariable("id") Integer id) {
		Contato contato = contatoService.findId(id);
		model.addAttribute("contato", contato);
		return "detalhes";
	}
	
	
	@RequestMapping(value = "/adicionar", method = RequestMethod.GET)
	public String adicionarForm(Model model) {
		model.addAttribute("contato", new Contato());
		model.addAttribute("acao", "adicionar");
		return "formulario";
	}
	
	@RequestMapping(value = "/adicionar", method = RequestMethod.POST)
	public String adicionar(@ModelAttribute("contato") Contato contato) {
		contatoService.salvar(contato);
		return "redirect:/listar";
	}
	
	@RequestMapping(value = "/editar/{id}", method = RequestMethod.GET)
	public String editarForm(Model model, @PathVariable("id") Integer id) {
		Contato contato = contatoService.findId(id);
		model.addAttribute("contato", contato);
		model.addAttribute("acao", "editar");
		return "formulario";
	}
	
	@RequestMapping(value = "/editar", method = RequestMethod.POST)
	public String editar(@ModelAttribute("contato") Contato contato) {
		contatoService.atualizar(contato);
		return "redirect:/listar";
	}
	
	
	@RequestMapping(value = "/remover/{id}", method = RequestMethod.GET)
	public String remover(@PathVariable("id") Integer id) {
		contatoService.remover(id);
		return "redirect:/listar";
	}
	
	
	@RequestMapping(value = "/buscar", method = RequestMethod.POST)
	public String buscar(Model model,@RequestParam("nome") String nome) {
		List<Contato> contatos = contatoService.buscarPorNome(nome);
		model.addAttribute("contatos", contatos);
		model.addAttribute("qtd_busca", contatos.size());
		return "listar";
	}
	
	

}
