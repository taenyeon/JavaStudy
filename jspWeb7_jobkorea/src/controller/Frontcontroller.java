package controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Frontcontroller extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Controller controller = null;
        String requestURI = req.getRequestURI();
        if (requestURI.equals("/post/postList.do")){
            controller = new ListController();
        }

        try {
            controller.execute(req,resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
