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

    Connection con = DBCon.getConnection();
    PreparedStatement pstmt = con.prepareStatement("select name, tel from GOOTTUSER where ID=?");
    pstmt.setString(1, login);
    ResultSet rs = pstmt.executeQuery();
    rs.next();
    String name = rs.getString("name");
    String tel = rs.getString("tel");


    pstmt = con.prepareStatement("insert into EDUGOOTT(eno, eid, etitle, ememo, etel, edate)" +
            " values (EDUGOOTT_ENOUP.nextval,?,?,?,?,sysdate)");
    pstmt.setString(1,name);
    pstmt.setString(2,title);
    pstmt.setString(3,content);
    pstmt.setString(4,tel);
    pstmt.executeUpdate();
    response.sendRedirect("notice.jsp");
%>

</body>
</html>
