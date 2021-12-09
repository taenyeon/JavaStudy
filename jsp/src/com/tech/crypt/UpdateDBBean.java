package com.tech.crypt;

import com.tech.crypt.work.BCrypt;
import com.tech.crypt.work.SHA256;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UpdateDBBean {
    private static UpdateDBBean instance = new UpdateDBBean();

    public static UpdateDBBean getInstance() {
        return instance;
    }

    private UpdateDBBean() {
    }
    private Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        String url = "jdbc:oracle:thin:@192.168.1.156:1521:XE";
        String user = "hr";
        String pw = "1234";
        return DriverManager.getConnection(url,user,pw);
    }

    public List<UpdateDataBean> getMembers() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<UpdateDataBean> memberList = new ArrayList<>();

        int x = 0;
        try {
            conn = getConnection();
                pstmt = conn.prepareStatement("select ID,PWD from MEMBER5");
                rs = pstmt.executeQuery();
                    while (rs.next()){
                        UpdateDataBean member = new UpdateDataBean();
                        member.setId(rs.getString("id"));
                        member.setPwd(rs.getString("pwd"));
                        memberList.add(member);
                    }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try {
                rs.close();
            } catch (SQLException ex) {
            }
            if (pstmt != null) try {
                pstmt.close();
            } catch (SQLException ex) {
            }
            if (conn != null) try {
                conn.close();
            } catch (SQLException ex) {
            }
        }
        return memberList;
    }

    public void updateMember(){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        SHA256 sha = SHA256.getInsatnce();
        try {
            conn = getConnection();
            pstmt = conn.prepareStatement("select id,pwd from MEMBER5");
            rs = pstmt.executeQuery();

            while(rs.next()){
                String id = rs.getString("id");
                String orgPwd = rs.getString("pwd");
                System.out.println("orgPwd = " + orgPwd);
                //원래의 비밀번호를 sha256을 이용해서 암호화
                String shaPass = sha.getSha256(orgPwd.getBytes());
                System.out.println("shaPass = " + shaPass);

                //shaPass를 BCrypt.gensalt()를 통해서 salt난수를 이용해 hashpw 암호화
                String bcPass = BCrypt.hashpw(shaPass,BCrypt.gensalt());
                System.out.println("bcPass = " + bcPass);
                //암호화한 값을 DB에 저장
                pstmt = conn.prepareStatement("update MEMBER5 set PWD=? where ID = ?");

                pstmt.setString(1,bcPass);
                pstmt.setString(2,id);

                pstmt.executeUpdate();
            }

        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if (rs != null) try {rs.close();} catch (SQLException ex) {   }
            if (pstmt != null) try {pstmt.close();} catch (SQLException ex) {   }
            if (conn != null) try {conn.close();} catch (SQLException ex) {   }
        }
    }
}
