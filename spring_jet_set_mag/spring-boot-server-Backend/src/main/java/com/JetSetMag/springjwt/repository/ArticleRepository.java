package com.bezkoder.springjwt.repository;




import java.util.List;
import java.util.Optional;

//import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.repository.CrudRepository;
import com.bezkoder.springjwt.models.Article;




@Repository("articleRepository")
public interface ArticleRepository extends CrudRepository<Article, Long>{

	Optional<Article> findById(Long articleId);
	//Optional<Article> findByUsername(String username);
	List<Article> findAll(); 

	
	

}

	

