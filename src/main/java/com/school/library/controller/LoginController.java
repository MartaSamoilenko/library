package com.school.library.controller;

import com.school.library.model.Participant;
import com.school.library.service.ParticipantService;
import com.school.library.utils.AppUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.thymeleaf.util.StringUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RequestMapping(value = "/login")
@Controller
public class LoginController {
    @Autowired
    ParticipantService participantService;


    @GetMapping
    public String login(HttpServletRequest request) {
        Cookie cookie = AppUtils.getLoginCookie(request);
        if (cookie != null && !StringUtils.isEmpty(cookie.getValue()) && participantService.findByLogin(cookie.getValue()).getParticipantTypeId() == 3) {
            return "mainLibrarianPage";
        } else if (cookie != null && !StringUtils.isEmpty(cookie.getValue()) && (participantService.findByLogin(cookie.getValue()).getParticipantTypeId() == 1 || participantService.findByLogin(cookie.getValue()).getParticipantTypeId() == 2)) {
            return "mainUserPage";
        }
        return "loginPage";
    }

    @PostMapping
    public String loginPage(HttpServletRequest request, HttpServletResponse response,
                            String login, String password) {
        Participant participant = participantService.findByLoginPass(login, password);
        if (participant == null) {
            return "redirect:";
        } else if (participant.getParticipantTypeId() == 3) {
            AppUtils.checkLogin(request, response, login);
            return "mainLibrarianPage";
        } else if (participant.getParticipantTypeId() == 1 || participant.getParticipantTypeId() == 2) {
            AppUtils.checkLogin(request, response, login);
            return "mainUserPage";
        }
        return null;
    }


}
