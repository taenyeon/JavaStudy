package com.tech.controll.controllers.boardController;

import com.tech.controll.controllers.Controller;
import com.tech.controll.service.BoardService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class Mission_BoardDeleteProController implements Controller {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        BoardService boardService = new BoardService();
        String no = request.getParameter("no");
        int result = boardService.deleteBoard(no);

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter w = response.getWriter();
        if (result >0){
            w.println("<script>alert('게시판이 삭제되었습니다.'); location.href='/board/notice.do'</script>");
        } else {
            w.println("<script>alert('게시판 삭제에 실패하였습니다.'); location.href='/board/notice.do'</script>");
        }
    }
}
