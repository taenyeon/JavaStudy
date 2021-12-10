z<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<h2>Login</h2>
<form action="loginPro.do" method="post">
    ID : <input type="text" name="id" id="id" required>
    PASSWORD : <input type="password" name="pwd" id="pwd" required>
    <input type="submit" value="login">
</form>
</body>
</html>