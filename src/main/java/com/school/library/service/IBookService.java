package com.school.library.service;


import com.school.library.model.Book;

import java.util.List;

public interface IBookService {
    List<Book> findAll();

    List<Book> findAllNotBelongs();

    Book findById(Long id);

    void createBook(Book book);

    void remove(Long bookId);

    List<Book> findByCriteria(String criteria);
}
