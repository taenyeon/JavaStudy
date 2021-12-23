<%@ page import="java.sql.*" %>
<%@ page import="com.tech.db.DBCon" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/member/header.jsp" %>
<script type="text/javascript" src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
<script type="text/javascript" src="/js/option.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String code = request.getParameter("code");
    Connection con = DBCon.getConnection();
    PreparedStatement pstmt = con.prepareStatement("select * from item where ITEM_CODE = ?");
    pstmt.setString(1, code);

    ResultSet rs = pstmt.executeQuery();
    rs.next();
%>
<section style="width: 80%; margin: auto">
<div style="width:400px; height:500px; border:1px solid red; float:left; margin: auto">
    <img src="<%="/files/"+rs.getString("item_image")%>" alt="" width="400px" height="500px">
</div>
<div style="width:400px; height:500px; border:1px solid green; float:left; margin: auto">
    <h4 style="text-align: left"><%=rs.getString("item_name")+" "+rs.getString("item_code")%></h4>
    <hr>
    <table>
        <tr>
        <th>판매가격</th>
        <td><%=rs.getString("item_price")%></td>
        </tr>
    </table>
    <hr>
    <h5 style="text-align: left">기본옵션</h5>
    <select name="selOp1" id="selOp1" style="width: 100px;" >
        <%
            pstmt = con.prepareStatement("select * from ITEM_OPTIONS where ITEM_CODE=?");
            pstmt.setString(1,code);
            rs = pstmt.executeQuery();
            while (rs.next()){
        %>
        <option value="<%=rs.getString("option_code")%>"><%=rs.getString("option_name")%></option>
        <%
            }
        %>
            <select name="selOp2" id="selOp2" style="width: 100px;" disabled>
        <%
            pstmt = con.prepareStatement("select * from ITEM_CHILDOPTIONS inner join ITEM_OPTION on ITEM_OPTION.OPTION_CODE = ITEM_CHILDOPTION.OPTION_CODE where ITEM_OPTION.ITEM_CODE = ?");
            pstmt.setString(1,code);
            rs = pstmt.executeQuery();
            while (rs.next()){
        %>
        <option value="<%=rs.getString("childoption_code")%>"><%=rs.getString("childoption_name")%></option>
        <%
            }
        %>
    </select>
</div>
</section>
<div style="clear: both"></div>
<div style="text-align: center">
    <a href="noticeEdit.jsp?c=<%=code%>">수정</a>
    <a href="noticeDelete.jsp?c=<%=code%>">삭제</a>
    <a href="notice.jsp">목록</a>
</div>
</body>
</html>
<%
    rs.close();
    pstmt.close();
    con.close();
%>