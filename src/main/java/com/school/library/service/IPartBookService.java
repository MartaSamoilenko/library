package com.school.library.service;

import com.school.library.model.Book;
import com.school.library.model.PartBook;
import com.school.library.model.Participant;

import java.util.List;

public interface IPartBookService {
    List<PartBook> findAll();

    List<PartBook> findAllByClass(Long classLnzId);

    void createPartBook(PartBook partBook);

    void deletePartBook(PartBook partBook);

    void deleteById(Long id);

    PartBook getById(Long id);

    List<Book> findByParticipantId(Long id);

    PartBook findByBookId(Long bookId);

}
