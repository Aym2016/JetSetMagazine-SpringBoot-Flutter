package com.bezkoder.springjwt.models;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

public class Media {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotBlank
	@Size(max = 20)
	private String extension;
	
	
	@ManyToOne
	private Article art1;
	public Media(Long id, @NotBlank @Size(max = 20) String extension, @NotBlank @Size String contenu) {
		super();
		this.id = id;
		this.extension = extension;
		this.contenu = contenu;
	}

	@Override
	public String toString() {
		return "Media [id=" + id + ", extension=" + extension + ", contenu=" + contenu + "]";
	}

	@NotBlank
	@Size()
    private String contenu;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getExtension() {
		return extension;
	}

	public void setExtension(String extension) {
		this.extension = extension;
	}

	public String getContenu() {
		return contenu;
	}

	public void setContenu(String contenu) {
		this.contenu = contenu;
	}

	public Article getArt1() {
		return art1;
	}

	public void setArt1(Article art1) {
		this.art1 = art1;
	}
}
