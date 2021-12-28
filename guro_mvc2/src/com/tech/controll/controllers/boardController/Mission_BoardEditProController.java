package com.tech.controll.controllers.boardController;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tech.controll.controllers.Controller;
import com.tech.controll.service.BoardService;
import com.tech.db.GuroBoard;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

public class Mission_BoardEditProController implements Controller {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        BoardService boardService = new BoardService();

        String path = request.getSession().getServletContext().getRealPath("/files/");

        int size = 15 * 1024 * 1024; // 15MB
        MultipartRequest multipartRequest = new MultipartRequest(request, path, size,"utf-8", new DefaultFileRenamePolicy());
        Enumeration files = multipartRequest.getFileNames();
            String file = (String) files.nextElement();

        String filePath = multipartRequest.getFilesystemName(file);
        String fileName = multipartRequest.getOriginalFileName(file);
        String title = multipartRequest.getParameter("title");
        String content = multipartRequest.getParameter("content");
        String no = multipartRequest.getParameter("no");

        int result = boardService.updateBoard(no,title, content, filePath, fileName);
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter w = response.getWriter();
        if (result >0){
            w.println("<script>alert('게시판이 수정되었습니다.'); location.href='/board/noticePro.do'</script>");
        } else {
            w.println("<script>alert('게시판 수정에 실패하였습니다.'); location.href='/board/noticePro.do'</script>");
        }

    }
}
