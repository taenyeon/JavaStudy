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
<h5>noticeDetail.jsp</h5>
<%
    String gno = request.getParameter("c");
    Connection con = DBCon.getConnection();
    PreparedStatement pstmt = con.prepareStatement("select * from GUROBOARD where GNO = ?");
    pstmt.setString(1, gno);

    ResultSet rs = pstmt.executeQuery();
    rs.next();
%>
<form action="noticeEditProc.jsp" method="post">
<table class="twidth">
    <colgroup>
        <col width="15%">
        <col width="35%">
        <col width="15%">
        <col width="35%">
    </colgroup>
    <caption>Modify</caption>
    <tbody>
    <tr>
        <th class="left">글번호</th>
        <td><%=gno%></td>
        <th class="left">조회수</th>
        <td><%=rs.getInt("ghit")%></td>
    </tr>
    <tr>
        <th class="left">작성자</th>
        <td><%=rs.getString("gwriter")%></td>
        <th class="left">전화번호</th>
        <td><%=rs.getString("gphone")%></td>
    </tr>
    <tr>
        <th class="left">제목</th>
        <td>
            <input type="text" class="inp" name="title" value="<%=rs.getString("gtitle")%>">
        </td>
        <th class="left">작성시간</th>
        <td><%=rs.getString("gdate")%></td>
    </tr>
    <tr>
        <th class="left">내용</th>
        <td colspan="3" id="content">
            <textarea name="content" class="txt"><%=rs.getString("gcontent")%></textarea>
        </td>
    </tr>
    <tr>
        <th class="left">첨부</th>
        <td colspan="3" id="addfile">
            <input type="text" class="inp" name="file" value="<%=rs.getString("gfile")%>">
        </td>
    </tr>
    </tbody>
</table>
    <input type="hidden" name="c" value="<%=gno%>">
    <input type="submit" value="저장">
    <a href="noticeDetail.jsp?c=<%=gno%>">취소</a>
</form>
</body>
</html>
<%
    rs.close();
    pstmt.close();
    con.close();
%>