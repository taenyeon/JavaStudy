
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
<form action="/GuroMember/userInfoPwdCheck.do" method="post">
    <h2>Check </h2><br>
    PASSWORD : <input type="password" name="pwd" id="pwd">
    <input type="hidden" name="login" id="login" value="<%=login%>">
    <input type="submit" value="확인">
</form>
</body>
</html>
