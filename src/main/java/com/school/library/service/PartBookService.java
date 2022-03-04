package com.school.library.service;

import com.school.library.model.Book;
import com.school.library.model.PartBook;
import com.school.library.model.Participant;
import com.school.library.repository.BookRepository;
import com.school.library.repository.PartBookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class PartBookService implements IPartBookService {

    @Autowired
    private PartBookRepository partBookRepository;

    @Autowired
    private BookRepository bookRepository;

    @Override
    public List<PartBook> findAll() {
        return (List<PartBook>) partBookRepository.findAll();
    }

    @Override
    public void createPartBook(PartBook partBook){
        partBookRepository.save(partBook);

    }

    @Override
    public void deletePartBook(PartBook partBook){
        partBookRepository.delete(partBook);
    }

    @Override
    public void deleteById(Long id){
        partBookRepository.deleteById(id);
    }

    @Override
    public PartBook getById(Long id){
        return partBookRepository.findById(id).get();
    }

    @Override
    public List<Book> findByParticipantId(Long participantId){
        List<PartBook> partBooks = partBookRepository.findAll();
        List<Book> books = new ArrayList<>();
        for (PartBook partBook : partBooks){
            if(partBook.getParticipantid() == participantId.longValue()){
                    books.add(bookRepository.getOne(partBook.getBookid()));
            }
//            System.out.println(partBook.getParticipantid());
//            System.out.println(partBook.getParticipantid() == participantId.longValue());
        }
        return books;
    }

    @Override
    public List<PartBook> findAllByClass(Long classLnzId){
        List<PartBook> partBooks = partBookRepository.findAll();
        List<PartBook> partBooksByClassId = new ArrayList<>();
        for (PartBook partBook : partBooks){
            if(partBook.getParticipant().getClassLnzId() == classLnzId){
                partBooksByClassId.add(partBook);
            }
        }
        return partBooksByClassId;
    }

    @Override
    public PartBook findByBookId(Long bookId){
        List<PartBook> partBooks = partBookRepository.findAll();
        for (PartBook partBook : partBooks){
            if (partBook.getBookid().longValue() == bookId){
                return partBook;
            }
        }
        return null;
    }
}
