<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.tech.db.DBCon" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/GuroMember/header.jsp"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/nstyle.css">
</head>
<body>
<h3>Notice.jsp</h3>
<%
    Connection con = DBCon.getConnection();
    PreparedStatement pstmt = con.prepareStatement("select * from GUROBOARD order by GNO desc");
    ResultSet rs = pstmt.executeQuery();
%>

<table width="800" border="1">
    <tr>
        <td>번호</td>
        <td>제목</td>
        <td>부서</td>
        <td>작성자</td>
        <td>작성일</td>
        <td>조회수</td>
        <td>파일</td>
    </tr>
    <%
        while (rs.next()){
            Date gdate = rs.getDate("gdate");
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            String date = format.format(gdate);
    %>
    <tr>
        <td><%=rs.getInt("GNO")%></td>
        <td><a href="noticeDetail.jsp?c=<%=rs.getString("gno")%>"><%=rs.getString("gtitle")%></a></td>
        <td><%=rs.getString("gdepart")%></td>
        <td><%=rs.getString("gwriter")%></td>
        <td><%=date%></td>
        <td><%=rs.getInt("ghit")%></td>
        <td><%=rs.getString("gfile")%></td>
    </tr>
    <%
        }
    %>
</table>
<%
    if (login != null){
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