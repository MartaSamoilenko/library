package com.school.library.repository;

import com.school.library.model.Classlnz;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClasslnzRepository extends JpaRepository<Classlnz, Long> {
}
