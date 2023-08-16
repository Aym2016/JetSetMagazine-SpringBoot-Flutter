package com.bezkoder.springjwt.models;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import javax.persistence.Entity;
@Entity
public class Note {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@NotBlank
	private int NoteArticle;
	@NotBlank
	@Size(max = 20)
	private float Moyenne;
	@ManyToOne
	private Article art1;
	
	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public int getNoteArticle() {
		return NoteArticle;
	}


	public void setNoteArticle(int noteArticle) {
		NoteArticle = noteArticle;
	}


	public float getMoyenne() {
		return Moyenne;
	}


	public void setMoyenne(float moyenne) {
		Moyenne = moyenne;
	}


	public Article getArt1() {
		return art1;
	}


	public void setArt1(Article art1) {
		this.art1 = art1;
	}


	
}
