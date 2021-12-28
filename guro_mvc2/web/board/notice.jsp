<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.tech.db.DBCon" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/member/header.jsp" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/nstyle.css">
</head>
<body>

<table width="80%" border="1" class="notice">
    <tr style="border-bottom:2px solid black; text-align: center">
        <td>번호</td>
        <td style="text-align: left">제목</td>
        <td>작성일</td>
        <td>조회수</td>
    </tr>

    <c:forEach var="board" items="${boards}">

    <tr style="border-bottom: 1px solid #ccc; text-align: center">
        <td style="width: 10%"><c:out value="${board.no}"/>
        </td>
        <td style="width: 65%; text-align: left">
            <a style="margin: 0" href="noticeDetailPro.do?no=<c:out value="${board.no}"/>">
                <c:out value="${board.title}"/>
            </a>
        </td>
        <td style="width: 15%"><c:out value="${board.regDate}"/>
        </td>
        <td style="width: 10%"><c:out value="${board.hit}"/>
        </td>
    </tr>
    </c:forEach>
</table>
<c:if test="${login != null}">
<a href="/board/noticeWrite.do">글쓰기</a>
</c:if>
</body>
</html>