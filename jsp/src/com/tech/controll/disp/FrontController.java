package com.tech.controll.disp;

import com.tech.controll.controllers.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class FrontController extends HttpServlet {
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("!!");
        String requestURI = req.getRequestURI();
        System.out.println("requestURI = " + requestURI);
        Controller controller = null;
        // 회원가입 관련 URI
        if (requestURI.equals("/member/joinForm.do")){
            controller = new Mission_MemberJoinController();
        }
        if (requestURI.equals("/member/joinPro.do")){
            controller = new Mission_MemberJoinProController();
        } // 로그인 관련 URI
        if (requestURI.equals("/member/loginForm.do")){
            controller = new Mission_MemberLoginController();
        }
        if (requestURI.equals("/member/loginPro.do")){
            controller = new Mission_MemberLoginProController();
        }   // 로그아웃 관련 URI
        if (requestURI.equals("/member/logoutPro.do")){
            controller = new Mission_MemberLogoutProController();
        }   // 유저정보 관련 URI
        if (requestURI.equals("/member/userInfo.do")){
            controller = new Mission_MemberInfoProController();
        }
        try {
            controller.execute(req,resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
