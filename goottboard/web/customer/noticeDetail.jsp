<%@ page import="java.sql.*" %>
<%@ page import="com.tech.db.DBCon" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/GuroMember/header.jsp" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/nstyle.css">
</head>
<body>
<%
    String no = request.getParameter("c");
    Connection con = DBCon.getConnection();
    PreparedStatement pstmt = con.prepareStatement("update SURVEYGG set HIT= HIT+1 where NO = ?");
    pstmt.setString(1, no);
    pstmt.executeUpdate();

    pstmt = con.prepareStatement("select * from SURVEYGG where NO = ?");
    pstmt.setString(1, no);

    ResultSet rs = pstmt.executeQuery();
    rs.next();
    Date gdate = rs.getDate("writedate");
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    String date = format.format(gdate);
%>

<div style="border: 1px solid #ccc; height: 50px ">
<span class="title"><%=rs.getString("title")%></span>
<span class="date"><%=date%></span>
</div>

<table class="twidth">
    <colgroup>
        <col width="8%">
        <col width="100%">
    </colgroup>
    <tbody>
    <tr style="height: 10%">
    <%
        if (rs.getString("filename") != null) {
    %>
        <th class="left">첨부파일</th>
        <td><a href="fileGet.jsp?filename=<%=rs.getString("filename")%>" class="left"
               download><%=rs.getString("filename")%>
        </a></td>
    <%
    } else {
    %>
        <th class="left">첨부파일</th>
        <td><a href="#">없음</a></td>
    <%
        }
    %>
    </tr>
    <tr style="height: 90%">
        <td colspan="3" class="content">
            <pre><%=rs.getString("content")%></pre>
        </td>
    </tr>
    </tbody>
</table>
<%
    if (rs.getString("id").equals(login)) {

%>
<a href="noticeEdit.jsp?c=<%=rs.getString("no")%>">수정</a>
<a href="noticeDelete.jsp?c=<%=rs.getString("no")%>">삭제</a>
<%
    }
%>
<a href="notice.jsp">목록</a>
</body>
</html>
<%
    rs.close();
    pstmt.close();
    con.close();
%>