<%@ page import="vo.Post" %>
<%@ page import="dao.PostDao" %>
<%@ page import="java.util.Iterator" %><%--
  Created by IntelliJ IDEA.
  User: gimtaeyeon
  Date: 2021/12/23
  Time: 11:01 오후
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .container {
            height: 300px;
            width: 1000px;
            margin: 100px auto auto;
            border-bottom: 2px solid #cccccc;
            border-left: 2px solid #cccccc;
            border-right: 2px solid #cccccc;
            padding: 20px;
        }

        .condition {
            float: left;
            height: 400px;
            width: 500px;
        }
    </style>
</head>
<body>
<%
    String postNum = request.getParameter("postNum");
    PostDao dao = new PostDao();
    Post post = dao.post(postNum);

%>
<div class="container">
    <p style="font-size: medium"><%=post.getCom_name()%>
    </p>
    <p style="font-size: x-large"><b><%=post.getHire_post_name()%>
    </b></p>
    <hr style="color: #a1a1a1">
    <div class="condition">
        <p style="font-weight: bold">지원자격</p>
        <%
            // Map을 List처럼 키 값을 한개씩 꺼내는 방법
            // Iterator는 컬렉션을 읽는 표준화 방법이다.
            // foreach로도 가능하지만 그럴 경우, 한개씩 변수로 따로 저장하지 않는 이상,
            // jsp에서 사용하는건 제약이 많았다.
            Iterator<String> apply_iterator = post.getApply_condition().keySet().iterator();
            while (apply_iterator.hasNext()) {
                String key = apply_iterator.next();
        %>
        <p style="font-size: small">
            <span style="color: #a1a1a1"><%=key+"   "%></span>
            <span style="margin-left: 15px"><%=post.getApply_condition().get(key)%></span>
        </p>
        <%
            }
        %>
    </div>
    <div class="condition">
        <p style="font-weight: bold">근무조건</p>
        <%
            Iterator<String> work_iterator = post.getWork_condition().keySet().iterator();
            while (work_iterator.hasNext()) {
                String key = work_iterator.next();
        %>
        <p style="font-size: small">
            <span style="color: #a1a1a1;"><%=key%></span>
            <span style="margin-left: 15px"><%=post.getWork_condition().get(key)%></span>
        </p>
        <%
            }
        %>
    </div>
</div>
</body>
</html>
