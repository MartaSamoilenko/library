package com.school.library.controller;

import com.school.library.model.Classlnz;
import com.school.library.model.Participant;
import com.school.library.model.ParticipantType;
import com.school.library.service.ClasslnzService;
import com.school.library.service.ParticipantService;
import com.school.library.service.ParticipantTypeService;
import com.school.library.utils.AppUtils;
import com.school.library.utils.CookieCheck;
import com.school.library.utils.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/librarian/participants")
public class ParticipantLibrarianController extends CookieCheck {

    @PersistenceContext
    private EntityManager em;

    public Boolean check(HttpServletRequest request) {
        if (AppUtils.getLoginCookie(request) == null) {
            return false;
        }
        return true;
    }

    @Autowired
    private ParticipantService participantService;

    @Autowired
    private ParticipantTypeService participantTypeService;

    @Autowired
    private ClasslnzService classlnzService;

    @GetMapping
    public String loadParticipants(Model model, HttpServletRequest request) {
        if (check(request)) {
            var participants = participantService.findAll();
            participants.removeIf(participant -> participant.getParticipantTypeId() == 3);
            var participantTypes = (List<ParticipantType>) participantTypeService.findAll();
            var classLnzs = (List<Classlnz>) classlnzService.findAll();

            model.addAttribute("classLnzs", classLnzs);
            model.addAttribute("participantTypes", participantTypes);
            model.addAttribute("participants", participants);
            return "showParticipantsLibrarian";
        } else {
            return "loginPage";
        }
    }

    @GetMapping(value = "/showAll")
    public String showAll(Model model, HttpServletRequest request) {
        if (check(request)) {
            var participants = (List<Participant>) participantService.findAll();
            participants.removeIf(participant -> participant.getParticipantTypeId() == 3);
            var participantTypes = (List<ParticipantType>) participantTypeService.findAll();
            var classLnzs = (List<Classlnz>) classlnzService.findAll();

            model.addAttribute("classLnzs", classLnzs);
            model.addAttribute("participantTypes", participantTypes);
            model.addAttribute("participants", participants);
            return "showParticipantsLibrarian";
        } else {
            return "loginPage";
        }
    }

    @PostMapping(value = "/selectClass")
    public String loadParticipantsByClass(@ModelAttribute("classLnzId") Long classLnzId, Model model, HttpServletRequest request) {
        if (check(request)) {
            var participants = (List<Participant>) participantService.findByClass(classLnzId);
            var participantTypes = (List<ParticipantType>) participantTypeService.findAll();
            var classLnzs = (List<Classlnz>) classlnzService.findAll();

            model.addAttribute("classLnzs", classLnzs);
            model.addAttribute("participantTypes", participantTypes);
            model.addAttribute("participants", participants);
            return "showParticipantsLibrarian";
        } else {
            return "loginPage";
        }
    }

    @PostMapping(value = "/byCriteria")
    public String loadParticipantsByCriteria(@ModelAttribute("criteria") String criteria, Model model, HttpServletRequest request){
        if (check(request)) {
            var participants = (List<Participant>) participantService.findByCriteria(criteria);
            participants.removeIf(participant -> participant.getParticipantTypeId() == 3);
            var participantTypes = (List<ParticipantType>) participantTypeService.findAll();
            var classLnzs = (List<Classlnz>) classlnzService.findAll();

            model.addAttribute("classLnzs", classLnzs);
            model.addAttribute("participantTypes", participantTypes);
            model.addAttribute("participants", participants);
            return "showParticipantsLibrarian";
        } else {
            return "loginPage";
        }
    }

    @PostMapping(value = "/create")
    public ModelAndView createParticipant(@ModelAttribute("participant") Participant participant, HttpServletRequest request) {
        if (check(request)) {
            Optional<ParticipantType> optional = participantTypeService.findById(participant.getParticipantTypeId());
            participant.setParticipantType(optional.orElse(null));

            Optional<Classlnz> optionalClasslnz = classlnzService.findById(participant.getClassLnzId());
            participant.setClassLnz(optionalClasslnz.orElse(null));

            participantService.createParticipant(participant);
            List<Participant> participants = participantService.findAll();
            participants.removeIf(participant1 -> participant1.getParticipantTypeId() == 3);
            List<ParticipantType> participantTypes = participantTypeService.findAll();
            List<Classlnz> classlnzs = classlnzService.findAll();


            ModelAndView modelAndView = new ModelAndView("showParticipantsLibrarian");
            modelAndView.addObject("participants", participants);
            modelAndView.addObject("participantTypes", participantTypes);
            modelAndView.addObject("classLnzs", classlnzs);
            return modelAndView;
        } else {
            ModelAndView modelAndView = new ModelAndView("loginPage");
            return modelAndView;
        }
    }

    @GetMapping(value = "/delete/{participantId}")
    public String delete(@PathVariable Long participantId, Model model, HttpServletRequest request) {
        if (check(request)) {
            try {
                participantService.removeParticipant(participantId);
            } catch (Exception e) {
                model.addAttribute("pageErrors", "Неможливо видалити користувача");
                return "errorPage";
            }
            return "redirect:/librarian/participants";
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
