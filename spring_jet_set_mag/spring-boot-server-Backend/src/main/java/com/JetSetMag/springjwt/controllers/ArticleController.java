package com.bezkoder.springjwt.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bezkoder.springjwt.exception.ResourceNotFoundException;
import com.bezkoder.springjwt.models.Article;
import com.bezkoder.springjwt.repository.ArticleRepository;

@RestController
@RequestMapping("api/auth/restArticle")
@CrossOrigin
public class ArticleController {
	@Autowired
    private ArticleRepository articleRepository;

    @GetMapping("/articles")
    public List<Article> getAllAricle() {
        return articleRepository.findAll();
    }

    @GetMapping("/articles/{id}")
    public ResponseEntity<Article> getArticleById(@PathVariable(value = "id") Long articleId)
        throws ResourceNotFoundException {
        Article article = articleRepository.findById(articleId)
          .orElseThrow(() -> new ResourceNotFoundException("Article not found for this id :: " + articleId));
        return ResponseEntity.ok().body(article);
    }
    
    @PostMapping("/articles")
    public Article createArticle(@Valid @RequestBody Article article) {
        return articleRepository.save(article);
    }

    @PutMapping("/articles/{id}")
    public ResponseEntity<Article> updateArticle(@PathVariable(value = "id") Long articleId,
         @Valid @RequestBody Article articleDetails) throws ResourceNotFoundException {
        Article article = articleRepository.findById(articleId)
        .orElseThrow(() -> new ResourceNotFoundException("Article not found for this id :: " + articleId));

        
        article.setTitre(articleDetails.getTitre());
        article.setDescription(articleDetails.getDescription());
        final Article updatedArticle = articleRepository.save(article);
        return ResponseEntity.ok(updatedArticle);
    }

    @DeleteMapping("/article/{id}")
    public Map<String, Boolean> deleteArticle(@PathVariable(value = "id") Long articleId)
         throws ResourceNotFoundException {
        Article article = articleRepository.findById(articleId)
       .orElseThrow(() -> new ResourceNotFoundException("article not found for this id :: " + articleId));

        articleRepository.delete(article);
        Map<String, Boolean> response = new HashMap<>();
        response.put("deleted", Boolean.TRUE);
        return response;
    }

}
