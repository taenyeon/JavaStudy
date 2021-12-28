package com.tech.controll.controllers.boardController;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tech.controll.controllers.Controller;
import com.tech.controll.service.BoardService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.Enumeration;

public class Mission_BoardWriteProController implements Controller {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        BoardService boardService = new BoardService();

        String path = request.getSession().getServletContext().getRealPath("/files/");
        HttpSession session = request.getSession();
        String writer = (String) session.getAttribute("login");


        int size = 15 * 1024 * 1024; // 15MB
        MultipartRequest multipartRequest = new MultipartRequest(request, path, size,"utf-8", new DefaultFileRenamePolicy());
        Enumeration files = multipartRequest.getFileNames();
        String file = (String) files.nextElement();

        String filePath = multipartRequest.getFilesystemName(file);
        String fileName = multipartRequest.getOriginalFileName(file);
        String title = multipartRequest.getParameter("title");
        String content = multipartRequest.getParameter("content");

        int result = boardService.writeBoard(title, writer, content, filePath, fileName);
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter w = response.getWriter();
        if (result >0){
            w.println("<script>alert('게시판이 업로드되었습니다.'); location.href='/board/noticePro.do'</script>");
        } else {
            w.println("<script>alert('게시판이 업로드에 실패하였습니다.'); location.href='/board/noticePro.do'</script>");
        }

    }
}
