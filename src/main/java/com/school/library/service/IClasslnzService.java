package com.school.library.service;

import com.school.library.model.Classlnz;

import java.util.List;
import java.util.Optional;

public interface IClasslnzService {
    List<Classlnz> findAll();

    Optional<Classlnz> findById(Long id);
}
