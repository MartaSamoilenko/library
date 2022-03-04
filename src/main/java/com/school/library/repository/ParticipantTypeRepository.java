package com.school.library.repository;

import com.school.library.model.ParticipantType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ParticipantTypeRepository extends JpaRepository<ParticipantType, Long> {
}
