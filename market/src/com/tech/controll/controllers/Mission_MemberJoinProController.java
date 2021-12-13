package com.tech.controll.controllers;

import com.tech.crypt.work.BCrypt;
import com.tech.crypt.work.SHA256;
import com.tech.db.DBCon;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

public class Mission_MemberJoinProController implements Controller{
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection con = DBCon.getConnection();
            request.setCharacterEncoding("utf-8");
            String id = request.getParameter("id");
            String pwd = request.getParameter("pwd");
            String name = request.getParameter("name");
            String adress = request.getParameter("adress");
            String tel = request.getParameter("tel");
            String birth = request.getParameter("birth");
            System.out.println("birth = " + birth);

            SHA256 sha = SHA256.getInsatnce();
            String shPwd = sha.getSha256(pwd.getBytes());
//            String shPwd = "26AE784D194A5760464348329AF4EB9FCA2B27BBF823742C968A61543E3A1153";
//            String bcPwd = BCrypt.hashpw(shPwd,BCrypt.gensalt());
//            System.out.println("인증확인1 : " + BCrypt.checkpw(shPwd,bcPwd));
//            System.out.println("인증확인2 : " + BCrypt.checkpw("26AE784D194A576046",bcPwd));

            String bcPwd = BCrypt.hashpw(shPwd,BCrypt.gensalt());


            PreparedStatement pstmt = con.prepareStatement("insert into MEMBER_INFO(member_id, member_pwd, member_name, member_adress, member_tel, member_birth)" +
                    " values (?,?,?,?,?,?)");
            pstmt.setString(1,id);
            pstmt.setString(2,bcPwd);
            pstmt.setString(3,name);
            pstmt.setString(4,adress);
            pstmt.setString(5,tel);
            pstmt.setString(6,birth);
            pstmt.executeUpdate();

            response.sendRedirect("/member/index.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
