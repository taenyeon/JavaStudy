<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.tech.db.DBCon" %>
<%@ page import="java.sql.ResultSet" %>
<%@include file="/GuroMember/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    int gno = Integer.parseInt(request.getParameter("c"));
    Connection con = DBCon.getConnection();
    PreparedStatement pstmt = con.prepareStatement("select MAX(GNO)as max from GUROBOARD");
    ResultSet rs = pstmt.executeQuery();
    rs.next();

    int max = rs.getInt("max");
    pstmt = con.prepareStatement("delete from GUROBOARD where gno=?");
    pstmt.setInt(1,gno);
    int del = pstmt.executeUpdate();

    if (max>gno){
        pstmt = con.prepareStatement("update GUROBOARD set GNO = gno-1 where GNO >?");
        pstmt.setInt(1,gno);
        pstmt.executeUpdate();

    }
    pstmt = con.prepareStatement("ALTER SEQUENCE BOARD_GNO INCREMENT BY -1");
    pstmt.executeUpdate();
    pstmt = con.prepareStatement("select BOARD_GNO.nextval from dual");
    pstmt.executeUpdate();
    pstmt = con.prepareStatement("ALTER SEQUENCE BOARD_GNO INCREMENT BY 1");
    pstmt.executeUpdate();

    if (del>0)
        response.sendRedirect("notice.jsp");
    else
        response.setContentType("text/html; charset=UTF-8");
    out.println("<script>alert('삭제오류'); location.href='notice.jsp'</script>");

%>
</body>
</html>
