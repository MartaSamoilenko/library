package com.school.library.service;

import com.school.library.model.ParticipantType;
import com.school.library.repository.ParticipantTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ParticipantTypeService implements IParticipantTypeService {
    @Autowired
    ParticipantTypeRepository participantTypeRepository;

    @Override
    public List<ParticipantType> findAll(){
        return participantTypeRepository.findAll();
    }

    @Override
    public Optional<ParticipantType> findById(Long id){
        return participantTypeRepository.findById(id);
    }
}
