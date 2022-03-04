package com.school.library.controller;

import com.school.library.utils.AppUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RequestMapping(value = "/librarian")
@Controller
public class MainLibrarianController {

    @GetMapping(value = "/logout")
    public String logout(HttpServletResponse response, HttpServletRequest request){
        Cookie cookie = AppUtils.getLoginCookie(request);
        if (cookie != null) {
            AppUtils.deleteLoginCookie(request, response);
        }
        return "redirect:/index.html";
    }
}
