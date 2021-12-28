<%@ page import="java.util.List" %>
<%@ page import="com.tech.db.GuroMember" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<html>
<head>
    <title>Title</title>
    <style>
        h2,form{
            text-align: center;
            margin: 30px;
        }
    </style>
</head>
<body>
<h2>Info</h2>
<form action="/member/userInfoPro.do">
        NAME : <input type="text" name="name" id="name" value="${requestScope.member.name}">
        PHONE : <input type="tel" name="phone" id="phone" value="${requestScope.member.tel}">
        <input type="hidden" name="c" value="${requestScope.member.id}">

        <input type="submit" value="개인정보 수정">
    </form>
</body>
</html>

