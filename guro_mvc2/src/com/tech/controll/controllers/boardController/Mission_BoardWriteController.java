package com.tech.controll.controllers.boardController;

import com.tech.controll.controllers.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Mission_BoardWriteController implements Controller {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        response.sendRedirect("/board/noticeReg.jsp");
    }
}
