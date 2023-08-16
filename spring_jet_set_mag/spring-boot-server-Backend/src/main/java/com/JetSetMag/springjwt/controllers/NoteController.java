package com.bezkoder.springjwt.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.bezkoder.springjwt.exception.ResourceNotFoundException;
import com.bezkoder.springjwt.models.Note;
import com.bezkoder.springjwt.repository.NoteRepository;

public class NoteController {
	@Autowired
    private NoteRepository noteRepository;

    @GetMapping("/notes")
    public List<Note> getAllNote() {
        return noteRepository.findAll();
    }

    @GetMapping("/notes/{id}")
    public ResponseEntity<Note> getNoteById(@PathVariable(value = "id") Long noteId)
        throws ResourceNotFoundException {
        Note note =noteRepository.findById(noteId)
          .orElseThrow(() -> new ResourceNotFoundException("Note not found for this id :: " + noteId));
        return ResponseEntity.ok().body(note);
    }
    
    @PostMapping("/notes")
    public Note createNote(@Valid @RequestBody Note note) {
        return noteRepository.save(note);
    }

    @PutMapping("/notes/{id}")
    public ResponseEntity<Note> updateNote(@PathVariable(value = "id") Long noteId,
         @Valid @RequestBody Note noteDetails) throws ResourceNotFoundException {
        Note note = noteRepository.findById(noteId)
        .orElseThrow(() -> new ResourceNotFoundException("Note not found for this id :: " + noteId));

        
        note.setNoteArticle(note.getNoteArticle());
        
        //note.setDate_com(commentaireDetails.getDate_com());
        final Note updatednote = noteRepository.save(note);
        return ResponseEntity.ok(updatednote);
    }

    @DeleteMapping("/note/{id}")
    public Map<String, Boolean> deleteNote(@PathVariable(value = "id") Long noteId)
         throws ResourceNotFoundException {
        Note note = noteRepository.findById(noteId)
       .orElseThrow(() -> new ResourceNotFoundException("note not found for this id :: " + noteId));

        noteRepository.delete(note);
        Map<String, Boolean> response = new HashMap<>();
        response.put("deleted", Boolean.TRUE);
        return response;
    }
}
