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
<form action="noticeRegProc.jsp" method="post" enctype="multipart/form-data">
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
            <td>---</td>
            <th class="left">작성자</th>
            <td><%=login%></td>
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
                <textarea rows="10" cols="20" wrap="hard" name="content" class="txt"></textarea>
            </td>
        </tr>
        <tr>
            <th class="left">파일</th>
            <td colspan="3">
                <input type="file" name="file">
            </td>
        </tr>
        </tbody>
    </table>
    <input type="hidden" name="c" value="<%=login%>">
    <input type="submit" value="저장">
    <a href="notice.jsp">취소</a>
</form>

</body>
</html>
