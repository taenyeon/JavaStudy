<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/member/header.jsp"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/nstyle.css">
</head>
<form action="noticeRegProc.jsp" method="post">
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
            <th class="left">작성자</th>
            <td><%=login%></td>
            <th class="left">전화번호</th>
            <td></td>
            <th class="left">부서</th>
            <td><input type="text" class="inp" name="depart"></td>
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
        <tr>
            <th class="left">첨부</th>
            <td colspan="3" id="addfile">
                <input type="text" class="inp" name="gfile">
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
