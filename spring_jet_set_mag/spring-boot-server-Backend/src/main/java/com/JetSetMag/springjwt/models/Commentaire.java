package com.bezkoder.springjwt.models;

import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import javax.persistence.Entity;
@Entity
public class Commentaire {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotBlank
	@Size(max = 20)
	private Date date_com;
	@NotBlank
	@Size(max = 50)
	private String texte_com ;

	
	@ManyToOne
	private Article art1;
    
	
	public Article getArt1() {
		return art1;
	}

	public void setArt1(Article art1) {
		this.art1 = art1;
	}

	@Override
	public String toString() {
		return "Commentaire [id=" + id + ", date_com=" + date_com + ", texte_com=" + texte_com + "]";
	}

	public Commentaire(Long id, @NotBlank @Size(max = 20) Date date_com,
			@NotBlank @Size(max = 50) @Email String texte_com) {
		super();
		this.id = id;
		this.date_com = date_com;
		this.texte_com = texte_com;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getDate_com() {
		return date_com;
	}

	public void setDate_com(Date date_com) {
		this.date_com = date_com;
	}

	public String getTexte_com() {
		return texte_com;
	}

	public void setTexte_com(String texte_com) {
		this.texte_com = texte_com;
	}

}
