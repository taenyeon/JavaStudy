package com.tech.controll.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class Mission_MemberLogoutProController implements Controller{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession(false);
        String login = (String) session.getAttribute("login");

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter writer = response.getWriter();
        //로그인 세션 확인
        if (login != null){ // 있을경우, 세션을 전체 삭제
            session.invalidate();
            writer.println("<script>alert('로그아웃 하였습니다.'); location.href='/member/index.jsp'</script>");
        }else { // 없을경우, 정보 없음 출력
            writer.println("<script>alert('로그인 정보가 없습니다.'); location.href='/member/index.jsp'</script>");
        }
    }
}
