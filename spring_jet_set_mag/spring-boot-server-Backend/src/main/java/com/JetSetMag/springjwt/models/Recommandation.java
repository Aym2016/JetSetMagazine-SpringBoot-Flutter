package com.bezkoder.springjwt.models;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import javax.persistence.Entity;
@Entity
public class Recommandation {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
    
	

	@NotBlank
	@Size(max = 20)
	private String Recommandation;
     
	
	
	@Override
	public String toString() {
		return "Recommandation [id=" + id + ", Recommandation=" + Recommandation + "]";
	}
	public Recommandation( @NotBlank @Size(max = 20) String recommandation) {
		
		Recommandation = recommandation;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRecommandation() {
		return Recommandation;
	}

	public void setRecommandation(String recommandation) {
		Recommandation = recommandation;
	}
}
