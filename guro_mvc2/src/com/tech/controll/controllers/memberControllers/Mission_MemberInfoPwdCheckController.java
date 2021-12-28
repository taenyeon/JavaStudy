package com.tech.controll.controllers.memberControllers;

import com.tech.controll.controllers.Controller;
import com.tech.controll.service.MemberService;
import com.tech.crypt.work.BCrypt;
import com.tech.crypt.work.SHA256;
import com.tech.db.DBCon;
import com.tech.db.GuroMember;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Mission_MemberInfoPwdCheckController implements Controller {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        MemberService memberService = new MemberService();
        request.setCharacterEncoding("utf-8");
        String pwd = request.getParameter("pwd");
        String id = request.getParameter("login");
        GuroMember member = memberService.info(id, pwd);
        if (member.getId() != null){
        request.setAttribute("member", member);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/member/info.jsp");
            dispatcher.forward(request, response);

        } else {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter writer = response.getWriter();
            writer.println("<script>alert('비밀번호 확인에 실패했습니다.'); location.href='/member/index.jsp'</script>");
        }

    }
}
