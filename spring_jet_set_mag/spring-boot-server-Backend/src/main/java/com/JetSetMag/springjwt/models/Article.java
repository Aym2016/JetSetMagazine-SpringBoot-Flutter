package com.bezkoder.springjwt.models;


import java.util.List;


import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import javax.persistence.Entity;
@Entity
public class Article {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotBlank
	@Size(max = 20)
	private String titre;

	@NotBlank
	@Size()
    private String description;
    @OneToMany
    List<Note> ListNote;
    @OneToMany
    List<Commentaire> ListCommentaire;
    
    /*
	@ManyToOne
    Rubrique rubri;*/
    
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitre() {
		return titre;
	}

	public void setTitre(String titre) {
		this.titre = titre;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Article(Long id, @NotBlank @Size(max = 20) String titre,
			@NotBlank @Size(max = 50) @Email String description) {
		super();
		this.id = id;
		this.titre = titre;
		this.description = description;
	}

	public Article() {
		
	}
	
}
