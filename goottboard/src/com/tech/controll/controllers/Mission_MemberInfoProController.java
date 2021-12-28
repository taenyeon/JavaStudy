package com.tech.controll.controllers;

import com.tech.db.DBCon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class Mission_MemberInfoProController implements Controller{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String name = request.getParameter("name");
        String tel = request.getParameter("tel");
        String login = request.getParameter("c");
        Connection con = DBCon.getConnection();
        PreparedStatement pstmt = con.prepareStatement("update SURVEYUSER set name=?,tel=? where ID=?");
        pstmt.setString(1,name);
        pstmt.setString(2,tel);
        pstmt.setString(3,login);
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter writer = response.getWriter();
        if (pstmt.executeUpdate() != 0){
            writer.println("<script>alert('수정되었습니다.'); location.href='/member/info.jsp'</script>");
        } else {
            writer.println("<script>alert('수정에 실패하였습니다.'); location.href='/member/info.jsp'</script>");
        }
    }
}
