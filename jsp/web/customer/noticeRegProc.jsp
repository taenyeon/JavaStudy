<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.tech.db.DBCon" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>noticeRegProc.jsp</h3>
<%
    request.setCharacterEncoding("utf-8");
    String login = request.getParameter("login");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String depart = request.getParameter("depart");
    String file = request.getParameter("file");

    Connection con = DBCon.getConnection();
    PreparedStatement pstmt = con.prepareStatement("select name, phone from GUROUSER where ID=?");
    pstmt.setString(1, login);
    ResultSet rs = pstmt.executeQuery();
    rs.next();
    String name = rs.getString("name");
    String phone = rs.getString("phone");


    pstmt = con.prepareStatement("insert into GUROBOARD(gno, gtitle, gdepart, gwriter, gphone, gcontent, gdate, gfile)" +
            "values (BOARD_GNO.nextval,?,?,?,?,?,sysdate,?)");
    pstmt.setString(1,title);
    pstmt.setString(2,depart);
    pstmt.setString(3,login);
    pstmt.setString(4,phone);
    pstmt.setString(5,content);
    pstmt.setString(6,file);
    pstmt.executeUpdate();
    response.sendRedirect("notice.jsp");
%>

</body>
</html>
