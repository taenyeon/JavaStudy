<%@ page import="java.util.List" %>
<%@ page import="com.tech.db.Mission_getMember" %>
<%@ page import="com.tech.db.GuroMemebermeber" %>
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
    List<servey_member> guroMembers = (List<servey_member>) request.getAttribute("guroMembers");
    for (servey_member GuroMember:guroMembers){
        String id = GuroMember.getID();
        String name = GuroMember.getName();
        String tel = GuroMember.getTel();
%>
<h2>Info</h2>
<form action="/GuroMember/userInfoPro.do">
        NAME : <input type="text" name="name" id="name" value="<%=name%>">
        PHONE : <input type="tel" name="phone" id="phone" value="<%=tel%>">
        <input type="hidden" name="c" value="<%=id%>">
<%
    }
%>
        <input type="submit" value="개인정보 수정">
    </form>
</body>
</html>

