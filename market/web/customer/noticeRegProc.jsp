<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.tech.db.DBCon" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>noticeRegProc.jsp</h3>
<%
    // 웹 서버에 파일 업로드

    // 현재 서블릿 webapp의 절대경로를 기준으로 파일을
    String path = request.getSession().getServletContext().getRealPath("/files/");
    int size = 15 * 1024 * 1024; // 15MB
    String str, filename, original_filename;
    // 중복 정책을 따라서 중복된 파일 이름이 있을경우, 뒤에 숫자를 붙이게 한다.
    MultipartRequest multipartRequest = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
    // 파일들을 모두 files에 담는다.
    Enumeration files = multipartRequest.getFileNames();
    // nextElement() 메소드를 통해서 file을 가져온다. -> 해당 예제에서는 파일을 한개만 업로드 할 수 있도록 하였기 때문에 한번만 실행하였다.
    str = (String) files.nextElement();
    // 중복이 생길경우, 원래 이름과 달라지기 때문에 원래 이름의 파일이 필요한 경우, 아래와 같은 코드로 따로 저장해놓을 수 있다.
    original_filename = multipartRequest.getOriginalFileName(str);
    // 중복 처리를 한 이름을 담는 코드
    filename = multipartRequest.getFilesystemName(str);

    String code = multipartRequest.getParameter("code");
    String name = multipartRequest.getParameter("name");
    String login = multipartRequest.getParameter("c");
    int cost = Integer.parseInt(multipartRequest.getParameter("cost"));
    int category = Integer.parseInt(multipartRequest.getParameter("category"));
    String content = multipartRequest.getParameter("content");
    //옵션들
    List<String> options1 = new ArrayList<>();
    List<String> options2 = new ArrayList<>();
    for (int i=1; i<4; i++){
        options1.add(multipartRequest.getParameter("option_child1_"+i));
        options2.add(multipartRequest.getParameter("option_child2_"+i));
    }
    Connection con = DBCon.getConnection();
    PreparedStatement pstmt = con.prepareStatement("insert into ITEM(item_code, member_id, category_code, item_name, item_price, item_image, item_info) " +
            "VALUES (?,?,?,?,?,?,?)");
    pstmt.setString(1,code);
    pstmt.setString(2,login);
    pstmt.setInt(3,category);
    pstmt.setString(4,name);
    pstmt.setInt(5,cost);
    if (filename != null){
    pstmt.setString(6,filename);

    }else {
        pstmt.setString(6,null);
    }
    pstmt.setString(7, content);
    pstmt.executeUpdate();
    for (String option : options1){
        if (option != null){

    pstmt = con.prepareStatement("insert into ITEM_OPTIONS (option_code, item_code, option_name) VALUES (OPTION_CODE_UP.nextval,?,?)");
    pstmt.setString(1,code);
    pstmt.setString(2,option);
        pstmt.executeQuery();
        }
    }
    for (String option : options2){
        if (option != null){
        pstmt = con.prepareStatement("insert into ITEM_CHILDOPTIONS (childoption_code, option_code, childoption_name) VALUES (CHILDOPTION_CODE_UP.nextval,(select ITEM_OPTIONS.OPTION_CODE from ITEM_OPTIONS where ITEM_CODE=?),?)");
        pstmt.setString(1,code);
        pstmt.setString(2,option);
        pstmt.executeQuery();
        }
    }
    response.sendRedirect("notice.jsp");
%>

</body>
</html>
