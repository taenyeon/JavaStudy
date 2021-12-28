<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/member/header.jsp" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/nstyle.css">
</head>
<body>
<div style="border: 1px solid #ccc; height: 50px ">
<span class="title">${requestScope.board.title}</span>
<span class="date">${requestScope.board.regDate}</span>
</div>

<table class="twidth">
    <colgroup>
        <col width="8%">
        <col width="100%">
    </colgroup>
    <tbody>
    <tr style="height: 10%">
        <c:if test="${requestScope.board.fileName != null}">

        <th class="left">첨부파일</th>
        <td><a href="/board/noticeFileDownPro.do?filePath=${requestScope.board.filePath}&fileName=${requestScope.board.fileName}" class="left"
               download>${requestScope.board.fileName}
        </a></td>
        </c:if>
<c:if test="${requestScope.board.fileName == null}">
        <th class="left">첨부파일</th>
        <td><a href="#">없음</a></td>
</c:if>
    </tr>
    <tr style="height: 90%">
        <td colspan="3" class="content">
            <pre>${requestScope.board.content}</pre>
        </td>
    </tr>
    </tbody>
</table>
<c:if test="${requestScope.writer}">
    <a href="board/noticeEdit.do?no=${requestScope.board.no}">수정</a>
    <a href="board/noticeDeletePro.do?no=${requestScope.board.no}">삭제</a>
</c:if>
<a href="/board/noticePro.do">목록</a>
</body>
</html>