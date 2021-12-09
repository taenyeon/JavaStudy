<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h1><a href="/member">Main</a></h1>
<div>
<%
    String login = (String)session.getAttribute("login");
    if (login == null){

%>
<a href="/member/loginForm.do" class="link">login</a> |
<%
    }else {
%>
<a style="font-size: 22px"><b><%=login%></b> 님 환영합니다.</a><br>
    <a href="/member/userInfo.do" class="link">user_info</a> |
    <a href="/member/logoutPro.do" class="link">logout</a> |
    <%
    }
%>
<a href="/member/joinForm.do" class="link">join</a>
</div>
<hr>
<style>
  h1{
    text-align: center;
    margin: 20px 0 0 0;
  }
  div,.link{
      font-size: 22px;
    color: #333333;
      text-align: right;
    text-decoration: none;
  }
  .link:hover, .link:focus { animation-duration: 1s; animation-name: rainbowLink; animation-iteration-count: infinite; }
  @keyframes rainbowLink {
      0% { color: #ff2a2a; }
      15% { color: #ff7a2a; }
      30% { color: #ffc52a; }
      45% { color: #43ff2a; }
      60% { color: #2a89ff; }
      75% { color: #202082; }
      90% { color: #6b2aff; }
      100% { color: #e82aff; }
  }
  .link{
      color: #333333;
      font-size: 20px;
      text-decoration: none;
  }
  a{
      color: #333333;
      text-decoration: none;
  }

  b{
      color: #3399ff;
  }
</style>
