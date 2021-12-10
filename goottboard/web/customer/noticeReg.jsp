<%@ page import="com.tech.db.DBCon" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/member/header.jsp"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/nstyle.css">
</head>
<body>
<%
    Connection con = DBCon.getConnection();
    PreparedStatement pstmt = con.prepareStatement("select name from GOOTTUSER where ID=?");
    pstmt.setString(1,login);
    ResultSet resultSet = pstmt.executeQuery();
    resultSet.next();
    String name = resultSet.getString("name");
%>
<form action="noticeRegProc.jsp" method="post">
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
            <td>---</td>
            <th class="left">작성자</th>
            <td><%=name%></td>
        </tr>
        <tr>
            <th class="left" >작성시간</th>
            <td colspan="3">---</td>
        </tr>
        <tr>
            <th class="left">제목</th>
            <td colspan="3">
                <input type="text" class="inp" name="title">
            </td>
        </tr>
        <tr>
            <th class="left">내용</th>
            <td colspan="3" id="content">
                <textarea name="content" class="txt"></textarea>
            </td>
        </tr>
        </tbody>
    </table>
    <input type="hidden" name="login" value="<%=login%>">
    <input type="submit" value="저장">
    <a href="notice.jsp">취소</a>
</form>

</body>
</html>
