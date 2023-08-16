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
import com.bezkoder.springjwt.models.Recommandation;
import com.bezkoder.springjwt.repository.RecommandationRepository;


@RestController
@RequestMapping("/restRecommandation")
@CrossOrigin
public class RecommandationController {
	@Autowired
    private RecommandationRepository recommandationRepository;

    @GetMapping("/recommandations")
    public List<Recommandation> getAllRecommandation() {
        return recommandationRepository.findAll();
    }

    @GetMapping("/recommandations/{id}")
    public ResponseEntity<Recommandation> getRecommandationById(@PathVariable(value = "id") Long recommandationId)
        throws ResourceNotFoundException {
        Recommandation recommandation = recommandationRepository.findById(recommandationId)
          .orElseThrow(() -> new ResourceNotFoundException("recommandation not found for this id :: " + recommandationId));
        return ResponseEntity.ok().body(recommandation);
    }
    
    @PostMapping("/recommandations")
    public Recommandation createRecommandation(@Valid @RequestBody Recommandation recommandation) {
        return recommandationRepository.save(recommandation);
    }

    @PutMapping("/recommandations/{id}")
    public ResponseEntity<Recommandation> updateRecommandation(@PathVariable(value = "id") Long recommandationId,
         @Valid @RequestBody Recommandation recommandationDetails) throws ResourceNotFoundException {
        Recommandation recommandation = recommandationRepository.findById(recommandationId)
        .orElseThrow(() -> new ResourceNotFoundException("Recommandation not found for this id :: " + recommandationId));

        
        recommandation.setRecommandation(recommandationDetails.
        		getRecommandation());
        
        final Recommandation updatedRecommandation = recommandationRepository.save(recommandation);
        return ResponseEntity.ok(updatedRecommandation);
    }

    @DeleteMapping("/recommandation/{id}")
    public Map<String, Boolean> deleteRecommandation(@PathVariable(value = "id") Long recommandationId)
         throws ResourceNotFoundException {
        Recommandation recommandation = recommandationRepository.findById(recommandationId)
       .orElseThrow(() -> new ResourceNotFoundException("recommandation not found for this id :: " + recommandationId));

        recommandationRepository.delete(recommandation);
        Map<String, Boolean> response = new HashMap<>();
        response.put("deleted", Boolean.TRUE);
        return response;
    }

}
