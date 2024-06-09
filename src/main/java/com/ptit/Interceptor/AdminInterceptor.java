package com.ptit.Interceptor;

import com.ptit.Entities.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;

public class AdminInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        User user = (User) request.getSession().getAttribute("loggedInUser");

        if (user != null && "ROLE_ADMIN".equals(user.getRole().trim())) {
            return true;
        } else {
            response.sendRedirect("/access-denied");
            return false;
        }
    }
}
