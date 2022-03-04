package com.school.library.controller;

import com.school.library.model.Book;
import com.school.library.service.BookService;
import com.school.library.utils.AppUtils;
import com.school.library.utils.CookieCheck;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


@RequestMapping(value = "/librarian/books")
@Controller
public class BookLibrarianController extends CookieCheck {

    public Boolean check(HttpServletRequest request) {
        if (AppUtils.getLoginCookie(request) == null) {
            return false;
        }
        return true;
    }

    @Autowired
    private BookService bookService;

    @GetMapping
    public String findBooks(Model model, HttpServletRequest request) {
        if (check(request)) {
            var books = (List<Book>) bookService.findAllNotBelongs();
            model.addAttribute("books", books);
            return "showBooksLibrarian";
        } else {
            return "loginPage";
        }
    }

    @GetMapping(value = "/showAll")
    public String showAll(Model model, HttpServletRequest request) {
        if (check(request)) {
            var books = (List<Book>) bookService.findAllNotBelongs();
            model.addAttribute("books", books);
            return "showBooksLibrarian";
        } else {
            return "loginPage";
        }
    }

    @PostMapping(value = "/byCriteria")
    public String loadParticipantsByCriteria(@ModelAttribute("criteria") String criteria, Model model, HttpServletRequest request){
        if (check(request)) {
            var books = (List<Book>) bookService.findByCriteria(criteria);

            model.addAttribute("books", books);
            return "showBooksLibrarian";
        } else {
            return "loginPage";
        }
    }

    @PostMapping(value = "/create")
    public String createBook(@ModelAttribute("book") Book book, Long value, HttpServletRequest request) {
        if (check(request)) {
            for (int i = 0; i < value; i++) {
                Book book1 = new Book();
                book1.setName(book.getName());
                book1.setAuthor(book.getAuthor());
                bookService.createBook(book1);
            }
            return "redirect:/librarian/books";
        } else {
            return "loginPage";
        }

    }

    @GetMapping(value = "/delete/{bookId}")
    public String delete(@PathVariable Long bookId, HttpServletRequest request) {
        if (check(request)) {
            bookService.remove(bookId);
            return "redirect:/librarian/books";
        } else {
            return "loginPage";
        }
    }

    @GetMapping(value = "/logout")
    public String logout(HttpServletResponse response, HttpServletRequest request) {
        Cookie cookie = AppUtils.getLoginCookie(request);
        if (cookie != null) {
            AppUtils.deleteLoginCookie(request, response);
        }
        return "redirect:/index.html";
    }
}
