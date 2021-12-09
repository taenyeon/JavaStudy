package com.tech.controll.controllers;

import com.tech.db.DBCon;
import com.tech.db.guro_member;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Mission_MemberInfoProController implements Controller{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        List<guro_member> members = new ArrayList<>();
        HttpSession session = request.getSession(false);
        String login = (String) session.getAttribute("login");
        Connection conn = DBCon.getConnection();
        PreparedStatement pstmt = conn.prepareStatement("select name,PHONE from GUROUSER where ID = ?");
        pstmt.setString(1,login);
        ResultSet rs = pstmt.executeQuery();
        while (rs.next()){
            guro_member member = new guro_member();
            member.setID(login);
            member.setName(rs.getString("name"));
            member.setPhone(rs.getString("phone"));
            members.add(member);
        }
        request.setAttribute("members",members);
        RequestDispatcher dispatcher = request.getRequestDispatcher("info.jsp");
        dispatcher.forward(request,response);

    }
}
