package com.school.library.controller;

import com.school.library.model.Book;
import com.school.library.service.PartBookService;
import com.school.library.service.ParticipantService;
import com.school.library.utils.AppUtils;
import com.school.library.utils.CookieCheck;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "/librarian/showBooksOfUser")
public class BooksOfUserLibrarianController extends CookieCheck {

    public Boolean check(HttpServletRequest request) {
        if (AppUtils.getLoginCookie(request) == null) {
            return false;
        }
        return true;
    }

    @Autowired
    private PartBookService partBookService;

    @Autowired
    private ParticipantService participantService;

    @GetMapping(value = "/{participantId}")
    public String showBooks(@PathVariable Long participantId, Model model, HttpServletRequest request) {
        if (check(request)) {
            var booksOfUser = partBookService.findByParticipantId(participantId);
            model.addAttribute("booksOfUser", booksOfUser);
            model.addAttribute("participant", participantService.findById(participantId));
            return "showPartBookOfUser";
        } else {
            return "loginPage";
        }
    }

    @GetMapping(value = "/{participantId}/deleteBookOfUser/{bookOfUserId}")
    public String deleteBookOfUser(@PathVariable Long bookOfUserId, @PathVariable Long participantId, HttpServletRequest request) {
        if (check(request)) {
            partBookService.deleteById(partBookService.findByBookId(bookOfUserId).getId());
            List<Book> booksOfUser = partBookService.findByParticipantId(participantId);
            ModelAndView modelAndView = new ModelAndView("showPartBookOfUser");
            modelAndView.addObject("booksOfUser", booksOfUser);
            return "redirect:/librarian/showBooksOfUser/{participantId}";
        } else {
            return "loginPage";
        }
    }
}
