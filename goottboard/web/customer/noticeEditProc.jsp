<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.tech.db.DBCon" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.io.File" %>
<%@ page import="oracle.jdbc.proxy.annotation.Pre" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>noticeEditProc.jsp</h3>
<%
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
    String title = multipartRequest.getParameter("title");
    String content = multipartRequest.getParameter("content");
    String no = multipartRequest.getParameter("c");
    Connection con = DBCon.getConnection();
    PreparedStatement pstmt = con.prepareStatement("select FILES from SURVEYGG where no =?");
    pstmt.setString(1, no);
    ResultSet rs = pstmt.executeQuery();
    if (rs != null) {
        // 기존에 파일이 있었다면 이를 데이터베이스에서 먼저 뽑아와 서버에서 삭제시킨다.
        String oldFilePath = rs.getString("filepath");
        File oldFile = new File(oldFilePath);
        oldFile.delete();
    }
    pstmt = con.prepareStatement("update SURVEYGG set TITLE=?,CONTENT=?,FILEPATH=?,FILENAME=? where no=?");
    pstmt.setString(1, title);
    pstmt.setString(2, content);
    pstmt.setString(3,path + filename);
    pstmt.setString(4,filename);
    pstmt.setString(5, no);
    pstmt.executeUpdate();
    response.sendRedirect("noticeDetail.jsp?c=" + no);
%>

</body>
</html>
