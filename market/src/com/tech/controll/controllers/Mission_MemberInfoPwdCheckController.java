package com.tech.controll.controllers;

import com.tech.crypt.work.BCrypt;
import com.tech.crypt.work.SHA256;
import com.tech.db.DBCon;
import com.tech.db.market_member;

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
        request.setCharacterEncoding("utf-8");
        String pwd = request.getParameter("pwd");
        String login = request.getParameter("login");
        List<market_member> members = new ArrayList<>();
        Connection conn = DBCon.getConnection();
        PreparedStatement pstmt = conn.prepareStatement("select MEMBER_PWD from MEMBER_INFO where MEMBER_ID = ?");
        pstmt.setString(1, login);
        ResultSet rs = pstmt.executeQuery();
        rs.next();
        String bcpass = rs.getString("MEMBER_PWD");
        SHA256 sha = SHA256.getInsatnce();
        String shapass = sha.getSha256(pwd.getBytes());


        if (BCrypt.checkpw(shapass, bcpass)) {
            pstmt = conn.prepareStatement("select MEMBER_ADRESS,MEMBER_TEL,MEMBER_BIRTH from MEMBER_INFO where MEMBER_ID = ?");
            pstmt.setString(1, login);
           rs = pstmt.executeQuery();
            while (rs.next()) {
                market_member member = new market_member();
                member.setAdress(rs.getString("MEMBER_ADRESS"));
                member.setTel(rs.getString("MEMBER_TEL"));
                        String[] realBirth = rs.getString("MEMBER_BIRTH").split(" ");
                member.setBirth(realBirth[0]);
                members.add(member);
            }
            request.setAttribute("members", members);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/member/info.jsp");
            dispatcher.forward(request, response);

        } else {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter writer = response.getWriter();
            writer.println("<script>alert('비밀번호 확인에 실패했습니다.'); location.href='/member/index.jsp'</script>");
        }

    }
}
