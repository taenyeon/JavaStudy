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
    String no = request.getParameter("c");
    Connection con = DBCon.getConnection();
    PreparedStatement pstmt = con.prepareStatement("select * from SURVEYGG where no = ?");
    pstmt.setString(1, no);

    ResultSet rs = pstmt.executeQuery();
    rs.next();
%>
<form action="noticeEditProc.jsp" method="post" enctype="multipart/form-data">
    <!-- multipart/form-data는 모든 데이터를 인코딩하지 않고 처리한다는 의미-->
    <!-- 넘긴 데이터는 cos를 통해서 처리-->
<table class="twidth">
    <colgroup>
        <col width="18%">
        <col width="18%">
        <col width="46%">
        <col width="18%">
    </colgroup>
    <caption>Modify</caption>
    <tbody>
    <tr>
        <th class="left">글번호</th>
        <td><%=rs.getInt("no")%></td>
        <th class="left">작성자</th>
        <td><%=rs.getString("id")%></td>
    </tr>
    <tr>
        <th class="left">제목</th>
        <td colspan="3">
            <input type="text" class="inp" name="title" value="<%=rs.getString("title")%>">
        </td>
    </tr>
    <tr>
        <th class="left">내용</th>
        <td colspan="3" id="content">
            <textarea name="content" class="txt"><%=rs.getString("content")%></textarea>
        </td>
    </tr>
    <tr>
        <th class="left">파일</th>
        <td colspan="3">
            <input type="file" name="file" value="<%=rs.getString("filename")%>">
        </td>
    </tr>
    </tbody>
</table>
    <input type="hidden" name="c" value="<%=no%>">
    <input type="submit" value="저장">
    <a href="noticeDetail.jsp?c=<%=no%>">취소</a>
</form>
</body>
</html>
<%
    rs.close();
    pstmt.close();
    con.close();
%>