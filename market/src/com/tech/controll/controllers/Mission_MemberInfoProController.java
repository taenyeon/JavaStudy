package com.tech.controll.controllers;

import com.tech.db.DBCon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

public class Mission_MemberInfoProController implements Controller{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String adress = request.getParameter("adress");
        String tel = request.getParameter("tel");
        Date birth = Date.valueOf(request.getParameter("date"));
        String login = request.getParameter("c");
        Connection con = DBCon.getConnection();
        PreparedStatement pstmt = con.prepareStatement("update MEMBER_INFO set MEMBER_ADRESS=?,MEMBER_TEL=?,MEMBER_BIRTH=? where MEMBER_ID=?");
        pstmt.setString(1,adress);
        pstmt.setString(2,tel);
        pstmt.setDate(3,birth);
        pstmt.setString(4,login);
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter writer = response.getWriter();
        if (pstmt.executeUpdate() != 0){
            writer.println("<script>alert('수정되었습니다.'); location.href='/member/info.jsp'</script>");
        } else {
            writer.println("<script>alert('수정에 실패하였습니다.'); location.href='/member/info.jsp'</script>");
        }
    }
}
