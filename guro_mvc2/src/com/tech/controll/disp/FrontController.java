package com.tech.controll.disp;

import com.tech.controll.controllers.*;
import com.tech.controll.controllers.boardController.*;
import com.tech.controll.controllers.memberControllers.*;

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

        // member

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
            controller = new Mission_MemberInfoController();
        }
        if (requestURI.equals("/member/userInfoPwdCheck.do")){
            controller = new Mission_MemberInfoPwdCheckController();
        }
        if (requestURI.equals("/member/userInfoPro.do")){
            controller = new Mission_MemberInfoProController();
        }

        // board
        if (requestURI.equals("/board/noticePro.do")){
            controller = new Mission_BoardNoticeProController();
        }
        if (requestURI.equals("/board/noticeDetailPro.do")){
            controller = new Mission_BoardDetailProController();
        }
        if (requestURI.equals("/board/noticeDeletePro.do")){
            controller = new Mission_BoardDeleteProController();
        }
        if (requestURI.equals("/board/noticeEdit.do")){
            controller = new Mission_BoardEditController();
        }
        if (requestURI.equals("/board/noticeEditPro.do")){
            controller = new Mission_BoardEditProController();
        }
        if (requestURI.equals("/board/noticeFileDownPro.do")){
            controller = new Mission_BoardFileDownProController();
        }
        if (requestURI.equals("/board/noticeWrite.do")){
            controller = new Mission_BoardWriteController();
        }
        if (requestURI.equals("/board/noticeWritePro.do")){
            controller = new Mission_BoardWriteProController();
        }
        try {
            controller.execute(req,resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
