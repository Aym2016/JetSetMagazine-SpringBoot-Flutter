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
import com.bezkoder.springjwt.models.Commentaire;
import com.bezkoder.springjwt.repository.CommentaireRepository;

@RestController
@RequestMapping("api/auth/restCommentaire")
@CrossOrigin
public class CommentaireController {
	@Autowired
    private CommentaireRepository commentaireRepository;

    @GetMapping("/commentaires")
    public List<Commentaire> getAllC() {
        return commentaireRepository.findAll();
    }

    @GetMapping("/commentaires/{id}")
    public ResponseEntity<Commentaire> getCommentaireById(@PathVariable(value = "id") Long commentaireId)
        throws ResourceNotFoundException {
        Commentaire article =commentaireRepository.findById(commentaireId)
          .orElseThrow(() -> new ResourceNotFoundException("Article not found for this id :: " + commentaireId));
        return ResponseEntity.ok().body(article);
    }
    
    @PostMapping("/commentaires")
    public Commentaire createCommentaire(@Valid @RequestBody Commentaire commentaire) {
        return commentaireRepository.save(commentaire);
    }

    @PutMapping("/commentaires/{id}")
    public ResponseEntity<Commentaire> updateCommentaire(@PathVariable(value = "id") Long commentaireId,
         @Valid @RequestBody Commentaire commentaireDetails) throws ResourceNotFoundException {
        Commentaire commentaire = commentaireRepository.findById(commentaireId)
        .orElseThrow(() -> new ResourceNotFoundException("Article not found for this id :: " + commentaireId));

        
        commentaire.setTexte_com(commentaireDetails.getTexte_com());
        commentaire.setDate_com(commentaireDetails.getDate_com());
        final Commentaire updatedCommentaire = commentaireRepository.save(commentaire);
        return ResponseEntity.ok(updatedCommentaire);
    }

    @DeleteMapping("/commentaire/{id}")
    public Map<String, Boolean> deleteEmployee(@PathVariable(value = "id") Long commentaireId)
         throws ResourceNotFoundException {
        Commentaire commentaire = commentaireRepository.findById(commentaireId)
       .orElseThrow(() -> new ResourceNotFoundException("commentaire not found for this id :: " + commentaireId));

        commentaireRepository.delete(commentaire);
        Map<String, Boolean> response = new HashMap<>();
        response.put("deleted", Boolean.TRUE);
        return response;
    }
    
}
