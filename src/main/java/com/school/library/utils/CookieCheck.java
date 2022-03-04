package com.school.library.utils;

import javax.annotation.PostConstruct;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public abstract class CookieCheck {
    public abstract Boolean check(HttpServletRequest request);
}
