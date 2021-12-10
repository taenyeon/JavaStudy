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
    String eno = request.getParameter("c");
    Connection con = DBCon.getConnection();
    PreparedStatement pstmt = con.prepareStatement("select * from EDUGOOTT where eno = ?");
    pstmt.setString(1, eno);

    ResultSet rs = pstmt.executeQuery();
    rs.next();
%>
<form action="noticeEditProc.jsp" method="post">
<table class="twidth">
    <colgroup>
        <col width="18%">
        <col width="18%">
        <col width="18%">
        <col width="46%">
    </colgroup>
    <caption>Modify</caption>
    <tbody>
    <tr>
        <th class="left">글번호</th>
        <td><%=rs.getInt("eno")%></td>
        <th class="left">작성자</th>
        <td><%=rs.getString("eid")%></td>
    </tr>
    <tr>
        <th class="left">작성시간</th>
        <td colspan="3"><%=rs.getString("edate")%></td>
    </tr>
    <tr>
        <th class="left">제목</th>
        <td colspan="3">
            <input type="text" class="inp" name="title" value="<%=rs.getString("etitle")%>">
        </td>
    </tr>
    <tr>
        <th class="left">내용</th>
        <td colspan="3" id="content">
            <textarea name="content" class="txt"><%=rs.getString("ememo")%></textarea>
        </td>
    </tr>
    </tbody>
</table>
    <input type="hidden" name="c" value="<%=eno%>">
    <input type="submit" value="저장">
    <a href="noticeDetail.jsp?c=<%=eno%>">취소</a>
</form>
</body>
</html>
<%
    rs.close();
    pstmt.close();
    con.close();
%>