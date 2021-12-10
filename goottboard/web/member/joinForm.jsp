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
<h2>Join</h2>
<form action="joinPro.do" method="post">
    ID : <input type="text" name="id" id="id"> <br>
    PASSWORD : <input type="password" name="pwd" id="pwd"> <br>
    NAME : <input type="text" name="name" id="name"> <br>
    tel : <input type="text" name="tel" id="tel"> <br>
    <input type="submit" value="join">
</form>
</body>
</html>