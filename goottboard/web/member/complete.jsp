<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<html>
<head>
  <title>Title</title>
  <style>
    h2,h3{
      text-align: center;
      margin: 30px;
    }
  </style>
</head>
<body>
<%
  boolean join = (boolean)session.getAttribute("join");
  if (join){
%>
  <h3>완료되었습니다.</h3>
<%
    session.removeAttribute("join");} else {
%>
<h3>실패하였습니다.</h3>
<%
    }
%>

</body>
</html>


