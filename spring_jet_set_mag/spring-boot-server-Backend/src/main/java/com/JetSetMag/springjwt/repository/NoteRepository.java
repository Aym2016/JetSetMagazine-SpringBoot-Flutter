package com.bezkoder.springjwt.repository;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bezkoder.springjwt.models.Note;



@Repository
public interface NoteRepository extends JpaRepository<Note, Long>{

	Optional<Note> findById(Long noteId);

}