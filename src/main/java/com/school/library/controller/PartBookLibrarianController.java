package com.school.library.controller;

import com.school.library.model.Book;
import com.school.library.model.Classlnz;
import com.school.library.model.PartBook;
import com.school.library.model.Participant;
import com.school.library.service.BookService;
import com.school.library.service.ClasslnzService;
import com.school.library.service.PartBookService;
import com.school.library.service.ParticipantService;
import com.school.library.utils.AppUtils;
import com.school.library.utils.CookieCheck;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/librarian/partbooks")
public class PartBookLibrarianController extends CookieCheck {

    public Boolean check(HttpServletRequest request) {
        if (AppUtils.getLoginCookie(request) == null) {
            return false;
        }
        return true;
    }

    @Autowired
    private PartBookService partBookService;

    @Autowired
    private BookService bookService;

    @Autowired
    private ParticipantService participantService;

    @Autowired
    private ClasslnzService classlnzService;

    @GetMapping
    public String findPartBooks(Model model, HttpServletRequest request) {
        if (check(request)) {
            var partBooks = (List<PartBook>) partBookService.findAll();
            var books = (List<Book>) bookService.findAllNotBelongs();
            var participants = (List<Participant>) participantService.findAll();
            participants.removeIf(participant -> participant.getParticipantTypeId() == 3);
            var classLnzs = (List<Classlnz>) classlnzService.findAll();

            model.addAttribute("classLnzs", classLnzs);
            model.addAttribute("partBooks", partBooks);
            model.addAttribute("books", books);
            model.addAttribute("participants", participants);

            return "showPartBooksLibrarian";
        }else {
            return "loginPage";
        }
    }

    @GetMapping(value = "/showAll")
    public String showAll(Model model, HttpServletRequest request){
        if (check(request)) {
            var partBooks = (List<PartBook>) partBookService.findAll();
            var books = (List<Book>) bookService.findAllNotBelongs();
            var participants = (List<Participant>) participantService.findAll();
            participants.removeIf(participant -> participant.getParticipantTypeId() == 3);
            var classLnzs = (List<Classlnz>) classlnzService.findAll();

            model.addAttribute("classLnzs", classLnzs);
            model.addAttribute("partBooks", partBooks);
            model.addAttribute("books", books);
            model.addAttribute("participants", participants);

            return "showPartBooksLibrarian";
        } else {
            return "loginPage";
        }
    }

    @PostMapping(value = "/create")
    public String createPartBook(Long bookid, Long participantid, HttpServletRequest request) {
        if (check(request)) {
            PartBook partBook = new PartBook();
            partBook.setBookid(bookid);
            partBook.setParticipantid(participantid);

            partBookService.createPartBook(partBook);
            List<PartBook> partBooks = partBookService.findAll();
            ModelAndView modelAndView = new ModelAndView("showPartBooksLibrarian");
            modelAndView.addObject("partBooks", partBooks);
            return "redirect:/librarian/partbooks";
        } else {
            return "loginPage";
        }
    }

    @GetMapping("/delete")
    public String deletePartBook(Long id, HttpServletRequest request){
        if(check(request)) {
            partBookService.deleteById(id);
            List<PartBook> partBooks = partBookService.findAll();
            ModelAndView modelAndView = new ModelAndView("showPartBooksLibrarian");
            modelAndView.addObject("partBooks", partBooks);
            return "redirect:/librarian/partbooks";
        } else {
            return "loginPage";
        }
    }

    @GetMapping(value = "/logout")
    public String logout(HttpServletResponse response, HttpServletRequest request){
        Cookie cookie = AppUtils.getLoginCookie(request);
        if (cookie != null) {
            AppUtils.deleteLoginCookie(request, response);
        }
        return "redirect:/index.html";
    }

    @PostMapping(value = "/selectClass")
    public String findPartBooksByClass(@ModelAttribute("classLnzId") Long classLnzId, Model model, HttpServletRequest request) {
        if (check(request)) {
            var partBooks = (List<PartBook>) partBookService.findAllByClass(classLnzId);
            var books = (List<Book>) bookService.findAllNotBelongs();
            var participants = (List<Participant>) participantService.findAll();
            var classLnzs = (List<Classlnz>) classlnzService.findAll();

            model.addAttribute("classLnzs", classLnzs);
            model.addAttribute("partBooks", partBooks);
            model.addAttribute("books", books);
            model.addAttribute("participants", participants);

            return "showPartBooksLibrarian";
        } else {
            return "loginPage";
        }
    }
}
