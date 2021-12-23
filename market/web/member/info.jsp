<%@ page import="java.util.List" %>
<%@ page import="com.tech.db.market_member" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp" %>
<html>
<head>
    <title>Title</title>
    <style>
        h2, form {
            text-align: center;
            margin: 30px;
        }
    </style>
</head>
<body>
<%
    List<market_member> members = (List<market_member>) request.getAttribute("members");
    for (market_member member : members) {
        String adress = member.getAdress();
        String birth = member.getBirth();
        String tel = member.getTel();
%>
<h2>Info</h2>
<form action="/member/userInfoPro.do">
    ADRESS : <input type="text" name="name" id="name" value="<%=adress%>">
    PHONE : <input type="tel" name="phone" id="phone" value="<%=tel%>">
    BIRTHDAY : <input type="text" name="birth" id="birth" value="<%=birth%>">
    <input type="hidden" name="c" value="<%=login%>">
    <%
        }
    %>
    <input type="submit" value="개인정보 수정">
</form>
</body>
</html>

