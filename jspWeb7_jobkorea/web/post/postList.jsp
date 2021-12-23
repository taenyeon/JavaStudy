<%@ page import="dao.PostDao" %>
<%@ page import="vo.Post" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        div {
            height: 100px;
        }
        a{
            text-decoration: none;
            font-weight: bold;
            color: #525252;
            font-size: large;
        }
        p,span{
            font-size: small;
        }
    </style>
</head>
<body>
<%
    PostDao dao = new PostDao();
    List<Post> postList = dao.postList();
%>
<h3 style="text-align: center">POST LIST</h3>
<section>
<%
    for (Post post : postList){
%>
    <div style="width: 1200px; border-bottom: 1px solid #cccccc; margin: auto">

        <div style="float: left; width: 300px;">
            <p><a href="/post/post.jsp?postNum=<%=post.getHire_post_num()%>"><%=post.getCom_name()%></a></p>
        </div>
        <div style="float: left; width: 700px;">
            <p><a href="/post/post.jsp?postNum=<%=post.getHire_post_num()%>"><%=post.getHire_post_name()%></a></p>

            <% // 카테고리 꺼내기
                for (String category : post.getCategory()){
            %>
            <span><%=category+" "%></span>
            <%
                }
            %>
        </div>
        <div style="float: left; width: 200px; color: black">
            <p><%=post.getWork_condition().get("고용형태")%></p>
            <p><%=post.getApply_condition().get("학력")%></p>
        </div>
    </div>
    <%
        }
    %>
</section>
</body>
</html>
