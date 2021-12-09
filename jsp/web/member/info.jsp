<%@ page import="java.util.List" %>
<%@ page import="com.tech.db.Mission_getMember" %>
<%@ page import="com.tech.db.guro_member" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<html>
<head>
    <title>Title</title>
    <style>
        h2{
            text-align: center;
            margin: 30px;
        }
        table{
            text-align: center;
            margin: auto;
        }
        td {
            border: 1px solid #333333;
        }
    </style>
</head>
<body>
<h2>Info</h2>
<table>
<tr>
    <th>ID</th>
    <th>NAME</th>
    <th>PHONE</th>
</tr>
<%
    List<guro_member> members = (List<guro_member>) request.getAttribute("members");
    for (guro_member member:members){
        String id = member.getID();
        String name = member.getName();
        String phone = member.getPhone();
%>
    <tr>
        <td><%=id%></td>
        <td><%=name%></td>
        <td><%=phone%></td>
    </tr>
<%
    }
%>
</table>
</body>
</html>

