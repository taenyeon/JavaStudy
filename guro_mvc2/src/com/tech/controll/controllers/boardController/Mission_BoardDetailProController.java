package com.tech.controll.controllers.boardController;

import com.tech.controll.controllers.Controller;
import com.tech.controll.service.BoardService;
import com.tech.db.GuroBoard;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

public class Mission_BoardDetailProController implements Controller {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String no = request.getParameter("no");
        HttpSession session = request.getSession(true);
        String id = (String) session.getAttribute("login");

        BoardService boardService = new BoardService();
        GuroBoard board = boardService.findById(no);
        System.out.println(board.getWriter());
        boolean writer = false;
        if (id != null){
                if (board.getWriter().equals(id)){
                    writer = true;
                }
        }
        request.setAttribute("board",board);
        request.setAttribute("writer",writer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/board/noticeDetail.jsp");
        dispatcher.forward(request, response);
    }
}
