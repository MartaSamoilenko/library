package com.school.library.repository;

import com.school.library.model.PartBook;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PartBookRepository extends JpaRepository<PartBook, Long> {
}
