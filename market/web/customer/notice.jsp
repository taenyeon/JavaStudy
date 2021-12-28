<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.tech.db.DBCon" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/GuroMember/header.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<style>
    section {
        height: 700px;
        /*border: 1px solid red;*/
    }

    #content_box {
        width: 80%;
        height: 600px;
        border: 1px solid #cccccc;
        margin: 30px auto;
    }

    #content_box h3 {
        text-align: center;
    }
    .item{
        width: 140px;
        height: 200px;
        padding : 20px 0 20px 20px;
        float:left;
    }
    .item li{
        list-style: none;
        padding-left: 0px;
        text-align: center;
    }
    .item .item_name{
        font-weight: bold;

    }
    .item .item_price{
        color: #888888;
    }
</style>
<%
    String path = request.getSession().getServletContext().getRealPath("/files/");
    Connection con = DBCon.getConnection();
    PreparedStatement pstmt = con.prepareStatement("select * from ITEM order by ITEM_CODE desc");
    ResultSet rs = pstmt.executeQuery();
%>

<section>
    <div id="content_box">
        <h3>전체 상품</h3>
        <%
            for (int i = 1; i <= 20; i++) {
                if (rs.next()) {
        %>
        <ul class="item">
            <li><img src="<%="/files/" + rs.getString("item_image")%>" alt="" width="140px" height="150px"></li>
            <li class="item_name"><a href="noticeDetail.jsp?code=<%=rs.getString("item_code")%>"><%=rs.getString("item_name")%></a>
            </li>
            <li class="item_price"><%=rs.getString("item_price")%>
            </li>
        </ul>
        <%
                }
            }
        %>
    </div>
</section>

</body>
</html>
<%
    rs.close();
    pstmt.close();
    con.close();
%>