<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.tech.db.DBCon" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/GuroMember/header.jsp" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/nstyle.css">
</head>
<body>
<%
    Connection con = DBCon.getConnection();
    PreparedStatement pstmt = con.prepareStatement("select * from SURVEYGG order by NO desc");
    ResultSet rs = pstmt.executeQuery();
%>

<table width="80%" border="1" class="notice">
    <tr style="border-bottom:2px solid black; text-align: center">
        <td>번호</td>
        <td style="text-align: left">제목</td>
        <td>작성일</td>
        <td>조회수</td>
    </tr>
    <%
        while (rs.next()) {
            Date gdate = rs.getDate("writedate");
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            String date = format.format(gdate);
    %>
    <tr style="border-bottom: 1px solid #ccc; text-align: center">
        <td style="width: 10%"><%=rs.getInt("NO")%>
        </td>
        <td style="width: 65%; text-align: left">
            <a style="margin: 0" href="noticeDetail.jsp?c=<%=rs.getString("no")%>">
                <%=rs.getString("title")%>
            </a>
        </td>
        <td style="width: 15%"><%=date%>
        </td>
        <td style="width: 10%"><%=rs.getString("hit")%>
        </td>
    </tr>
    <%
        }
    %>
</table>
<%
    if (login != null) {
%>
<a href="/customer/noticeReg.jsp">글쓰기</a>
<%
    }
%>
</body>
</html>
<%
    rs.close();
    pstmt.close();
    con.close();
%>