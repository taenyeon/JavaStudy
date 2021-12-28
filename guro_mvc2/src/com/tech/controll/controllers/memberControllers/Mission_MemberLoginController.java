package com.tech.controll.controllers.memberControllers;

import com.tech.controll.controllers.Controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Mission_MemberLoginController implements Controller {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(request.getRequestURI());
        response.sendRedirect("/member/loginForm.jsp");
    }
}
