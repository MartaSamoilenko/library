package com.school.library.controller;

import com.school.library.model.Book;
import com.school.library.model.Participant;
import com.school.library.service.PartBookService;
import com.school.library.service.ParticipantService;
import com.school.library.utils.AppUtils;
import com.school.library.utils.CookieCheck;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RequestMapping(value = "/user")
@Controller
public class MyProfileUserController extends CookieCheck {

    public Boolean check(HttpServletRequest request) {
        if (AppUtils.getLoginCookie(request) == null) {
            return false;
        }
        return true;
    }

    @Autowired
    PartBookService partBookService;

    @Autowired
    ParticipantService participantService;

    @GetMapping("/myprofileuser")
    public String profile(Model model, HttpServletRequest request){
        if (check(request)) {
            Participant participant = participantService.findByLogin(AppUtils.getLoginCookie(request).getValue());
            Long participantId = participant.getId();

            var books = (List<Book>) partBookService.findByParticipantId(participantId);

            model.addAttribute("books", books);
            model.addAttribute("participant", participant);
            return "myProfileUser";
        } else {
            return "redirect:/login";
        }
    }

    @PostMapping(value = "/logout")
    public String logout(HttpServletResponse response, HttpServletRequest request){
        Cookie cookie = AppUtils.getLoginCookie(request);
        if (cookie != null) {
            AppUtils.deleteLoginCookie(request, response);
        }
        return "redirect:/index.html";
    }
}
