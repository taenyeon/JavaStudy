package com.tech.controll.controllers.memberControllers;

import com.sun.tools.internal.xjc.model.Model;
import com.tech.controll.controllers.Controller;
import com.tech.controll.service.MemberService;
import com.tech.crypt.work.BCrypt;
import com.tech.crypt.work.SHA256;
import com.tech.db.DBCon;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Mission_MemberJoinProController implements Controller {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
        MemberService memberService = new MemberService();
            request.setCharacterEncoding("utf-8");
            String id = request.getParameter("id");
            String pwd = request.getParameter("pwd");
            String name = request.getParameter("name");
            String tel = request.getParameter("tel");
        int join = memberService.join(id, pwd, name, tel);
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter writer = response.getWriter();
        if (join >0){
            writer.println("<script>alert('회원가입에 성공하였습니다.'); location.href='index.jsp'</script>");
        } else {
            writer.println("<script>alert('회원가입에 실패하였습니다.'); location.href='index.jsp'</script>");
        }

    }
}
