package npi.contatos.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import npi.contatos.model.Usuario;
import npi.contatos.service.UsuarioServiceImpl;

@Controller
@SessionAttributes("usuario")
public class UsuarioController {
	
	@Inject
	private UsuarioServiceImpl usuarioService;
	

	
	@RequestMapping("/usuario/autenticado")
	public ModelAndView infoAutenticado(@ModelAttribute("usuario") Usuario usuario){
		ModelAndView mav = new ModelAndView("usuario/show");
		mav.getModel().put("usuario", usuario);
		return mav;
	}
	
	@RequestMapping(value = "/usuario/loginForm", method = RequestMethod.GET)
	public String login(@RequestParam(value = "erro", required = false) String erro, Model model, HttpSession secao) {
		if(secao.getAttribute("usuario") != null){
			System.out.println(secao.getAttribute("usuario").toString());
			return "redirect:/listar";
		}
		if (erro != null) {
			model.addAttribute("erro", "Usuário e/ou senha inválidos!");
		}
		model.addAttribute("usuario", new Usuario());
		return "usuario/login";
	}
	
	@RequestMapping(value = "/usuario/login", method = RequestMethod.POST)
	public String login(@RequestParam("login") String login,@RequestParam("password") String password , HttpSession sessao) {
		Usuario usuario = usuarioService.autenticar(login, password);
		if(usuario != null){
			System.out.println("Usuário autenticado com sucesso!!!");
			sessao.setAttribute("usuario", usuario);
			return "redirect:/listar";
		}else{
			System.out.println("Falha na autenticação do usuário :(");
			return "redirect:/";
		}
	}

	@RequestMapping(value = "/usuario/loginfailed", method = RequestMethod.GET)
	public String loginerror(Model model) {
		model.addAttribute("erro", "Usuário e/ou senha inválidos");
		return "usuario/login";
	}

	@RequestMapping(value = "/usuario/logout", method = {RequestMethod.POST,RequestMethod.GET})
	public String logout(HttpSession secao) {
		secao.invalidate();
		System.out.println("Logout realizado com sucesso!!");
		return "redirect:/";
	}
	
	@RequestMapping(value = "/usuario/registrarForm", method = RequestMethod.GET)
	public String registrar(Model model) {
	    model.addAttribute("usuario", new Usuario());
	    return "usuario/registration";
	}
	
	@RequestMapping(value = "/usuario/registrar", method = RequestMethod.POST)
	public String registrar(@Valid Usuario usuario,  BindingResult result, HttpSession secao) {
		usuarioService.registrar(usuario);
		secao.setAttribute("usuario", usuario);
		return "redirect:/usuario/login";
	}
}