<%@ page import="java.sql.*" %>
<%@ page import="com.tech.db.DBCon" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/member/header.jsp"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/nstyle.css">
</head>
<body>
<%
    String eno = request.getParameter("c");
   Connection con = DBCon.getConnection();
    PreparedStatement pstmt = con.prepareStatement("select * from EDUGOOTT where eNO = ?");
    pstmt.setString(1,eno);

    ResultSet rs = pstmt.executeQuery();
    rs.next();
%>
<table class="twidth">
    <colgroup>
        <col width="18%">
        <col width="18%">
        <col width="18%">
        <col width="46%">
    </colgroup>
    <caption>Detail</caption>
    <tbody>
    <tr>
        <th class="left">글번호</th>
        <td><%=rs.getInt("eno")%></td>
        <th class="left">작성자</th>
        <td><%=rs.getString("eid")%></td>
    </tr>
    <tr>
        <th class="left">작성시간</th>
        <td colspan="3"><%=rs.getString("edate")%></td>
    </tr>
    <tr>
        <th class="left">제목</th>
        <td colspan="3"><%=rs.getString("etitle")%></td>
    </tr>
    <tr>
        <th class="left">내용</th>
        <td colspan="3" id="content"><%=rs.getString("ememo")%></td>
    </tr>
    </tbody>
</table>
<%
    if (rs.getString("eid").equals(login)){

%>
<a href="noticeEdit.jsp?c=<%=rs.getString("eno")%>">수정</a>
<a href="noticeDelete.jsp?c=<%=rs.getString("eno")%>">삭제</a>
<%
    }
%>
<a href="notice.jsp">목록</a>
</body>
</html>
<%
    rs.close();
    pstmt.close();
    con.close();
%>