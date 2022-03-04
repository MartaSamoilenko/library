package com.school.library.service;

import com.school.library.model.Book;
import com.school.library.model.Participant;
import com.school.library.repository.BookRepository;
import com.school.library.utils.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class BookService implements IBookService {

    @Autowired
    private BookRepository bookRepository;

    @Override
    public List<Book> findAll(){
        return bookRepository.findAll(Sort.by(Sort.Direction.ASC, "name"));
    }

    @Override
    public List<Book> findAllNotBelongs() {
        List<Book> books = (List<Book>) bookRepository.findAll(Sort.by(Sort.Direction.ASC, "name"));
        List<Book> result = books.stream().filter(book ->
                book.getPartBook() == null
        ).collect(Collectors.toList());
        return result;
    }

    @Override
    public void createBook(Book book){
        bookRepository.save(book);
    }

    @Override
    public void remove(Long bookId){
        bookRepository.deleteById(bookId);
    }

    @Override
    public Book findById(Long id){
        return bookRepository.getOne(id);
    }

    @Override
    public List<Book> findByCriteria(String terms){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("FROM Book WHERE " +
                "name like concat('%',:terms,'%')" +
                "or author like concat('%',:terms,'%')");
        query.setParameter("terms", terms);
        List<Book> list = query.list();
        if (list.size() == 0)
            return Collections.emptyList();
        return list;
    }

}
