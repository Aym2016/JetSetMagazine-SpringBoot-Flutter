package com.bezkoder.springjwt.repository;


	import java.util.List;
	import java.util.Optional;

	import org.springframework.data.jpa.repository.JpaRepository;
	import org.springframework.stereotype.Repository;

import com.bezkoder.springjwt.models.Commentaire;



	@Repository
	public interface CommentaireRepository extends JpaRepository<Commentaire, Long>{

		Optional<Commentaire> findById(Long rubriqueId);

	}

