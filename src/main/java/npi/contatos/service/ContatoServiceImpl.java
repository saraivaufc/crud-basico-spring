package npi.contatos.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import npi.contatos.model.Contato;
import npi.contatos.model.Usuario;
import npi.contatos.respository.ContatoRepository;

@Named
public class ContatoServiceImpl implements ContatoService {
	
	@Inject
	private ContatoRepository contatoRepository;

	@Override
	public List<Contato> findAll() {
		return contatoRepository.findAll();
	}

	@Override
	public void salvar(Contato contato) {
		contatoRepository.salvar(contato);
		
	}

	@Override
	public void remover(Integer id) {
		Contato contato = contatoRepository.findById(id);
		contatoRepository.remover(contato);
	}

	@Override
	public void atualizar(Contato contato) {
		contatoRepository.atualizar(contato);
	}

	@Override
	public Contato findId(Integer id) {
		Contato contato = contatoRepository.findById(id);
		return contato;
	}

	@Override
	public List<Contato> buscarPorNome(String nome) {
		List<Contato> contatos = contatoRepository.buscarPorNome(nome);
		return contatos;
	}

	@Override
	public boolean salvarImagem(ServletContext context, Contato contato) {
		MultipartFile imagem = contato.getImagem();
		if(imagem.isEmpty()){
			System.out.println("Nenhuma imagem encontrada!!!");
			return false;
		}
		String uploadsDir = "/media/";
		String absolutePath = (new File( context.getRealPath("/"))).getAbsolutePath().toString();
        String realPathtoUploads = absolutePath + uploadsDir;
        if(! new File(realPathtoUploads).exists()){new File(realPathtoUploads).mkdir();}
        String relativePath=null;
        try {
			relativePath = uploadsDir + imagem.getBytes().hashCode()  + "_" + imagem.getOriginalFilename();
		} catch (IOException e) {
			e.printStackTrace();
		}
        String imagemPath = absolutePath + relativePath;
        File dest = new File(imagemPath);
        try {
			imagem.transferTo(dest);
			contato.setAbsolutePathImagem(imagemPath);
			contato.setRelativePathImagem(relativePath);
	        this.atualizar(contato);
	        return true;
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return false;
	}

	@Override
	public boolean enviarEmail(Usuario usuario, Contato contato, String mensagem) {
		// TODO Auto-generated method stub
		return false;
	}

}
