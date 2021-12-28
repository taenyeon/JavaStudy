package com.tech.controll.controllers.boardController;

import com.tech.controll.controllers.Controller;
import com.tech.controll.service.BoardService;
import com.tech.db.GuroBoard;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Mission_BoardEditController implements Controller {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        BoardService boardService = new BoardService();
        String no = request.getParameter("no");
        GuroBoard board = boardService.findById(no);
        request.setAttribute("board",board);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/board/noticeEdit.jsp?no="+no);
        dispatcher.forward(request, response);
    }
}
