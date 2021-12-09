<%@ page import="java.sql.*" %>
<%@ page import="com.tech.db.DBCon" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/member/header.jsp"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/nstyle.css">
</head>
<body>
<%
    String gno = request.getParameter("c");
   Connection con = DBCon.getConnection();
    PreparedStatement pstmt = con.prepareStatement("update GUROBOARD set GHIT= GHIT+1 where GNO = ?");
    pstmt.setString(1,gno);
    pstmt.executeUpdate();

    pstmt = con.prepareStatement("select * from GUROBOARD where GNO = ?");
    pstmt.setString(1,gno);

    ResultSet rs = pstmt.executeQuery();
    rs.next();
%>
<table class="twidth">
    <colgroup>
        <col width="15%">
        <col width="35%">
        <col width="15%">
        <col width="35%">
    </colgroup>
    <caption>Detail</caption>
    <tbody>
    <tr>
        <th class="left">글번호</th>
        <td><%=rs.getInt("gno")%></td>
        <th class="left">조회수</th>
        <td><%=rs.getInt("ghit")%></td>
    </tr>
    <tr>
        <th class="left">작성자</th>
        <td><%=rs.getString("gwriter")%></td>
        <th class="left">전화번호</th>
        <td><%=rs.getString("gphone")%></td>
        <th class="left">작성시간</th>
        <td><%=rs.getString("gdate")%></td>
    </tr>
    <tr>
        <th class="left">제목</th>
        <td colspan="3"><%=rs.getString("gtitle")%></td>
    </tr>
    <tr>
        <th class="left">내용</th>
        <td colspan="3" id="content"><%=rs.getString("gcontent")%></td>
    </tr>
    <tr>
        <th class="left">첨부</th>
        <td colspan="3" id="addfile"><%=rs.getString("gfile")%></td>
    </tr>
    </tbody>
</table>
<%
    if (login.equals(rs.getString("gwriter"))){

%>
<a href="noticeEdit.jsp?c=<%=rs.getString("gno")%>">수정</a>
<a href="noticeDelete.jsp?c=<%=rs.getString("gno")%>">삭제</a>
<a href="notice.jsp">목록</a>
<%
    }else {
%>
<a href="notice.jsp">목록</a>
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