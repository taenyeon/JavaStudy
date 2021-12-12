<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.tech.db.DBCon" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.io.File" %>
<%@include file="/member/header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    int no = Integer.parseInt(request.getParameter("c"));
    Connection con = DBCon.getConnection();
    PreparedStatement pstmt = con.prepareStatement("select FILEPATH from SURVEYGG where no=?");
    pstmt.setInt(1,no);
    ResultSet rs = pstmt.executeQuery();
    rs.next();
    if (rs.getString("filepath") != null){
        String filePath = rs.getString("filepath");
        File file = new File(filePath);
        file.delete();
    }
    pstmt = con.prepareStatement("select MAX(NO)as max from SURVEYGG");
    rs = pstmt.executeQuery();
    rs.next();
    int max = rs.getInt("max");
    pstmt = con.prepareStatement("delete from SURVEYGG where no=?");
    pstmt.setInt(1, no);
    int del = pstmt.executeUpdate();

    if (max == 1){
        pstmt = con.prepareStatement("drop sequence SURVEYGG_NOUP");
        pstmt.executeUpdate();
        pstmt = con.prepareStatement("create sequence surveygg_noUp start with 1 increment by 1 maxvalue 9999 nocache nocycle");
        pstmt.executeUpdate();

    }else if (max > no) {
        pstmt = con.prepareStatement("update SURVEYGG set NO = no-1 where NO <?");
        pstmt.setInt(1, no);
        pstmt.executeUpdate();
        pstmt = con.prepareStatement("ALTER SEQUENCE SURVEYGG_NOUP INCREMENT BY -1");
        pstmt.executeUpdate();
        pstmt = con.prepareStatement("select SURVEYGG_NOUP.nextval from dual");
        pstmt.executeUpdate();
        pstmt = con.prepareStatement("ALTER SEQUENCE SURVEYGG_NOUP INCREMENT BY 1");
        pstmt.executeUpdate();
    }

    if (del > 0)
        response.sendRedirect("notice.jsp");
    else
        response.setContentType("text/html; charset=UTF-8");
    out.println("<script>alert('삭제오류'); location.href='notice.jsp'</script>");

%>
</body>
</html>
