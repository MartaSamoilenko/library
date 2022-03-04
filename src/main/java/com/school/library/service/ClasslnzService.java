package com.school.library.service;

import com.school.library.model.Classlnz;
import com.school.library.repository.ClasslnzRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ClasslnzService implements IClasslnzService {
    @Autowired
    private ClasslnzRepository classlnzRepository;

    @Override
    public List<Classlnz> findAll(){
        return classlnzRepository.findAll();
    }

    @Override
    public Optional<Classlnz> findById(Long id){
        return classlnzRepository.findById(id);
    }
}
