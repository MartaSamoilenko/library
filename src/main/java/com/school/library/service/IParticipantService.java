package com.school.library.service;

import com.school.library.model.Participant;

import java.util.List;

public interface IParticipantService {

    List<Participant> findAll();

    void createParticipant(Participant participant);

    void removeParticipant(Long id);

    Participant findById(Long id);

    Participant findByLoginPass(String login, String password);

    Participant findByLogin(String login);

    List<Participant> findByClass(Long classLnzId);

    List<Participant> findByCriteria(String terms);
}
