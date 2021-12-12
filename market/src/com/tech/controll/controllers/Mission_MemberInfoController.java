package com.tech.controll.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Mission_MemberInfoController implements Controller{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.sendRedirect("/member/infoForm.jsp");
    }
}
