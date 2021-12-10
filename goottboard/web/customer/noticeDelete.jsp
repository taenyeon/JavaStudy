<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.tech.db.DBCon" %>
<%@ page import="java.sql.ResultSet" %>
<%@include file="/member/header.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    int eno = Integer.parseInt(request.getParameter("c"));
    Connection con = DBCon.getConnection();
    PreparedStatement pstmt = con.prepareStatement("select MAX(eNO)as max from EDUGOOTT");
    ResultSet rs = pstmt.executeQuery();
    rs.next();

    int max = rs.getInt("max");
    pstmt = con.prepareStatement("delete from EDUGOOTT where eno=?");
    pstmt.setInt(1,eno);
    int del = pstmt.executeUpdate();

    if (max>eno){
        pstmt = con.prepareStatement("update EDUGOOTT set eNO = eno-1 where eNO >?");
        pstmt.setInt(1,eno);
        pstmt.executeUpdate();

    }
    if (max ==1) {
        pstmt = con.prepareStatement("ALTER SEQUENCE EDUGOOTT_ENOUP INCREMENT BY -1");
        pstmt.executeUpdate();
        pstmt = con.prepareStatement("select EDUGOOTT_ENOUP.nextval from dual");
        pstmt.executeUpdate();
        pstmt = con.prepareStatement("ALTER SEQUENCE EDUGOOTT_ENOUP INCREMENT BY 1");
        pstmt.executeUpdate();
    }

    if (del>0)
        response.sendRedirect("notice.jsp");
    else
        response.setContentType("text/html; charset=UTF-8");
    out.println("<script>alert('삭제오류'); location.href='notice.jsp'</script>");

%>
</body>
</html>
