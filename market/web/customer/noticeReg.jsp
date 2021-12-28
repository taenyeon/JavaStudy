<%@ page import="com.tech.db.DBCon" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/GuroMember/header.jsp"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/nstyle.css">
    <script type="text/javascript" src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
    <script type="text/javascript" src="/js/option.js"></script>
</head>
<body>
<%
    Connection con = DBCon.getConnection();
    PreparedStatement pstmt = con.prepareStatement("select * from CATEGORY");
    ResultSet rs = pstmt.executeQuery();
%>
<form action="noticeRegProc.jsp" method="post" enctype="multipart/form-data">
    <!-- multipart/form-data는 모든 데이터를 인코딩하지 않고 처리한다는 의미-->
    <!-- 넘긴 데이터는 cos를 통해서 처리-->
    <table class="twidth">
        <colgroup>
            <col width="18%">
            <col width="18%">
            <col width="18%">
            <col width="18%">
            <col width="18%">
            <col width="18%">
        </colgroup>
        <caption>Modify</caption>
        <tbody>
        <tr>
            <th class="left">상품코드</th>
            <td >
                <input type="text" class="inp" name="code">
            </td>
            <th class="left">이름</th>
            <td>
                <input type="text" class="inp" name="name">
            </td>
        </tr>
        <tr>
            <th class="left">가격</th>
            <td colspan="2"><input type="number" name="cost" class="cost"></td>
            <th class="left">작성자</th>
            <td colspan="2"><%=login%></td>
        </tr>
        <tr>
            <th class="left">카테고리</th>
            <td colspan="3">
                <select name="category" id="category">
                    <%
                        while(rs.next()){
                            String category_code = rs.getString("CATEGORY_CODE");
                            String category_name = rs.getString("CATEGORY_NAME");
                    %>
                    <option value="<%=category_code%>"><%=category_name%>(0<%=category_code%>)</option>
                    <%
                        }
                    %>
                </select>
            </td>
        </tr>
        <tr id="add_Option1">
            <th class="left">옵션1</th>
            <td><button type="button" id="option1">생성</button></td>
        </tr>
        <tr id="add_Option2">
            <th class="left">옵션2</th>
            <td><button type="button" id="option2">생성</button></td>
        </tr>
        <tr>
            <th class="left">내용</th>
            <td colspan="5" id="content">
                <textarea name="content" class="txt"></textarea>
            </td>
        </tr>
        <tr>
            <th class="left">메인 이미지</th>
            <td colspan="5">
                <input type="file" name="file">
            </td>
        </tr>
        </tbody>
    </table>
    <input type="hidden" name="c" value="<%=login%>">
    <input type="submit" value="저장">
     <a href="notice.jsp">취소</a>
</form>

</body>
</html>
