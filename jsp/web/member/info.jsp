<%@ page import="java.util.List" %>
<%@ page import="com.tech.db.Mission_getMember" %>
<%@ page import="com.tech.db.GuroMemebermeber" %>
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
    List<guro_member> guroMembers = (List<guro_member>) request.getAttribute("guroMembers");
    for (guro_member GuroMember:guroMembers){
        String id = GuroMember.getID();
        String name = GuroMember.getName();
        String phone = GuroMember.getPhone();
%>
<h2>Info</h2>
<form action="/GuroMember/userInfoPro.do">
        NAME : <input type="text" name="name" id="name" value="<%=name%>">
        PHONE : <input type="tel" name="phone" id="phone" value="<%=phone%>">
<%
    }
%>
        <input type="hidden" name="c" value="<%=login%>">
        <input type="submit" value="개인정보 수정">
    </form>
</body>
</html>

