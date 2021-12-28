package com.tech.controll.repository;

import com.tech.crypt.work.SHA256;
import com.tech.db.DBCon;
import com.tech.db.GuroMember;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberRepository {
    Connection con;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    public MemberRepository() throws SQLException, ClassNotFoundException, NamingException {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) envCtx.lookup("jdbc/noticeXe");
        con = ds.getConnection();
    }

    public void close() throws SQLException {
        if (rs !=null) {
                rs.close();
        }
        if (pstmt != null){
            pstmt.close();
        }
        if (con != null){
            con.close();
        }
    }

    // member 찾기
    public GuroMember findByID(String id) throws SQLException, ClassNotFoundException {
        pstmt = con.prepareStatement("select * from GURO_MEMBER where ID = ?");
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        rs.next();
        GuroMember result = new GuroMember();
        result.setId(rs.getString("id"));
        result.setPwd(rs.getString("pwd"));
        result.setName(rs.getString("name"));
        result.setTel(rs.getString("tel"));
//        close();
        return result;

    }

    public List<GuroMember> findAll() throws SQLException, ClassNotFoundException {
        pstmt = con.prepareStatement("select * from GURO_MEMBER");
        rs = pstmt.executeQuery();
        List<GuroMember> members = new ArrayList<>();
        while(rs.next()){
            GuroMember result = new GuroMember();
            result.setId(rs.getString("id"));
            result.setPwd(rs.getString("pwd"));
            result.setName(rs.getString("name"));
            result.setTel(rs.getString("tel"));
            members.add(result);
        }
//        close();
        return members;
    }
    public int updateMember(String id, String name , String tel) throws SQLException, ClassNotFoundException {
        pstmt = con.prepareStatement("update GURO_MEMBER set NAME=?,TEL=? where ID=?");
        pstmt.setString(1,name);
        pstmt.setString(2,tel);
        pstmt.setString(3,id);
        int result = pstmt.executeUpdate();
//        close();
        return result;
    }

    public int insertMember(String id, String pwd, String name, String tel) throws SQLException {
        pstmt = con.prepareStatement("insert into GURO_MEMBER values (?,?,?,?)");
        pstmt.setString(1,id);
        pstmt.setString(2,pwd);
        pstmt.setString(3,name);
        pstmt.setString(4,tel);
        int result = pstmt.executeUpdate();
//        close();
        return result;
    }
}
