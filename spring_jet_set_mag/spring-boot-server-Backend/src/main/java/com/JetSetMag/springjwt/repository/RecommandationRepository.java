package com.bezkoder.springjwt.repository;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bezkoder.springjwt.models.Recommandation;



@Repository
public interface RecommandationRepository extends JpaRepository<Recommandation, Long>{

	Optional<Recommandation> findById(Long recommandationId);

}