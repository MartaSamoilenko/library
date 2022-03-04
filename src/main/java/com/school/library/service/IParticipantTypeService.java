package com.school.library.service;

import com.school.library.model.ParticipantType;

import java.util.List;
import java.util.Optional;

public interface IParticipantTypeService {

    List<ParticipantType> findAll();

    Optional<ParticipantType> findById(Long id);
}
