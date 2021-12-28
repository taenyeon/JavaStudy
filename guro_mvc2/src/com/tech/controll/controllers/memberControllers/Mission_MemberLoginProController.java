package com.tech.controll.controllers.memberControllers;
import com.tech.controll.controllers.Controller;
import com.tech.controll.service.MemberService;
import com.tech.crypt.work.BCrypt;
import com.tech.crypt.work.SHA256;
import com.tech.db.DBCon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Mission_MemberLoginProController implements Controller {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Connection con = DBCon.getConnection();
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        String pwd = request.getParameter("pwd");
        if (id == null || pwd == null) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer = response.getWriter();
            writer.println("<script>alert('아이디 또는 비밀번호를 입력하지 않았습니다.'); location.href='index.jsp'</script>");
        } else {
            MemberService memberService = new MemberService();
            String login = memberService.login(id, pwd);
            if (login != null){
                    HttpSession session = request.getSession(true);
                    session.setAttribute("login", id);
                    System.out.println(session.getAttribute("login"));

                    response.setContentType("text/html; charset=UTF-8");
                    PrintWriter writer = response.getWriter();
                    writer.println("<script>alert('로그인에 성공했습니다.'); location.href='index.jsp'</script>");
                } else { // 비밀번호 오류 출력
                    response.setContentType("text/html; charset=UTF-8");
                    PrintWriter writer = response.getWriter();
                    writer.println("<script>alert('비밀번호 오류입니다.'); location.href='index.jsp'</script>");
                }
            }
        }
    }
//else {
//        System.out.println("!!");
//        response.setContentType("text/html; charset=UTF-8");
//        PrintWriter writer = response.getWriter();
//        writer.println("<script>alert('아이디 또는 비밀번호 오류입니다.'); location.href='index.jsp'</script>");
//        writer.close();
//        }