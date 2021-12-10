<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.tech.db.DBCon" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/member/header.jsp"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/nstyle.css">
</head>
<body>
<h3>Notice.jsp</h3>
<%
    Connection con = DBCon.getConnection();
    PreparedStatement pstmt = con.prepareStatement("select * from EDUGOOTT order by ENO desc");
    ResultSet rs = pstmt.executeQuery();
%>

<table width="800" border="1">
    <tr>
        <td>번호</td>
        <td>작성자</td>
        <td>제목</td>
        <td>작성일</td>
    </tr>
    <%
        while (rs.next()){
            Date gdate = rs.getDate("edate");
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            String date = format.format(gdate);
    %>
    <tr>
        <td><%=rs.getInt("eNO")%></td>
        <td><%=rs.getString("eid")%></td>
        <td><a href="noticeDetail.jsp?c=<%=rs.getString("eno")%>"><%=rs.getString("etitle")%></a></td>
        <td><%=date%></td>
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