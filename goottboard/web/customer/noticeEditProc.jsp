<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.tech.db.DBCon" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>noticeEditProc.jsp</h3>
<%
    request.setCharacterEncoding("utf-8");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String eno = request.getParameter("c");
    Connection con = DBCon.getConnection();
    PreparedStatement pstmt = con.prepareStatement("update EDUGOOTT set eTITLE=?,EMEMO=? where eno=?");
    pstmt.setString(1,title);
    pstmt.setString(2,content);
    pstmt.setString(3,eno);
    pstmt.executeUpdate();
    response.sendRedirect("noticeDetail.jsp?c="+eno);
%>

</body>
</html>
