package com.school.library.controller;

import com.school.library.model.Book;
import com.school.library.service.BookService;
import com.school.library.utils.AppUtils;
import com.school.library.utils.CookieCheck;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RequestMapping(value = "/user/books")
@Controller
public class BookUserController extends CookieCheck {

    public Boolean check(HttpServletRequest request) {
        if (AppUtils.getLoginCookie(request) == null) {
            return false;
        }
        return true;
    }

    @Autowired
    private BookService bookService;

    @GetMapping
    public String findBooks(Model model, HttpServletRequest request){
        if (check(request)) {
            var books = (List<Book>) bookService.findAllNotBelongs();
            model.addAttribute("books", books);
            return "showBooksUser";
        } else {
            return "loginPage";
        }
    }

    @PostMapping(value = "/byCriteria")
    public String loadParticipantsByCriteria(@ModelAttribute("criteria") String criteria, Model model, HttpServletRequest request){
        if (check(request)) {
            var books = (List<Book>) bookService.findByCriteria(criteria);

            model.addAttribute("books", books);
            return "showBooksUser";
        } else {
            return "loginPage";
        }
    }
    @GetMapping(value = "/showAll")
    public String showAll(Model model, HttpServletRequest request) {
        if (check(request)) {
            var books = (List<Book>) bookService.findAllNotBelongs();
            model.addAttribute("books", books);
            return "showBooksUser";
        } else {
            return "loginPage";
        }
    }
}
