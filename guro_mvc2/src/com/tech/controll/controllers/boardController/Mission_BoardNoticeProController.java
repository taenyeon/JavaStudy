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
import java.util.List;

public class Mission_BoardNoticeProController implements Controller {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        BoardService boardService = new BoardService();
        List<GuroBoard> boards = boardService.findAll();
        request.setAttribute("boards",boards);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/board/notice.jsp");
        dispatcher.forward(request, response);
    }
}
