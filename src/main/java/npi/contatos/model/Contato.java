package npi.contatos.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

@Entity
public class Contato {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@NotNull
	private String nome;
	@NotNull
	private String telefone;
	@NotNull
	private String email;
	private String endereco;
	
	@Transient
	private MultipartFile imagem;
	private String absolutePathImagem;
	private String relativePathImagem;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getEmail() {
		return email;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return this.getId() + " - " + this.getNome() + " - " + this.getEmail() + " - " + this.getTelefone(); 
	}

	public MultipartFile getImagem() {
		return imagem;
	}

	public void setImagem(MultipartFile imagem) {
		this.imagem = imagem;
	}


	public String getRelativePathImagem() {
		return relativePathImagem;
	}

	public void setRelativePathImagem(String relativePathImagem) {
		this.relativePathImagem = relativePathImagem;
	}

	public String getAbsolutePathImagem() {
		return absolutePathImagem;
	}

	public void setAbsolutePathImagem(String absolutePathImagem) {
		this.absolutePathImagem = absolutePathImagem;
	}
	
	
}
