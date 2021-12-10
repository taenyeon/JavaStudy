<%@ page import="java.util.List" %>
<%@ page import="com.tech.db.Mission_getMember" %>
<%@ page import="com.tech.db.servey_member" %>
<%@ page import="com.tech.db.servey_member" %>
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
<%
    List<goott_member> members = (List<goott_member>) request.getAttribute("members");
    for (goott_member member:members){
        String id = member.getID();
        String name = member.getName();
        String tel = member.getTel();
%>
<h2>Info</h2>
<form action="/member/userInfoPro.do">
        NAME : <input type="text" name="name" id="name" value="<%=name%>">
        PHONE : <input type="tel" name="phone" id="phone" value="<%=tel%>">
<%
    }
%>
        <input type="hidden" name="c" value="<%=login%>">
        <input type="submit" value="개인정보 수정">
    </form>
</body>
</html>

