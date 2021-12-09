package com.tech.controll.disp;

import com.tech.controll.controllers.Controller;
import com.tech.controll.controllers.MemberJoinController;
import com.tech.controll.controllers.MemberJoinProcController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MemDispatcher extends HttpServlet {
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestURI = request.getRequestURI();

        System.out.println("requestURI = " + requestURI);
        Controller controller = null;
        try{
        if (requestURI.equals("/join/memberjoin.do")){
            controller = new MemberJoinController();
        }
        if (requestURI.equals("/join/memberjoinproc.do")){
                controller = new MemberJoinProcController();
        }
            controller.execute(request,response);
        }catch (Exception e) {
            e.printStackTrace();
        }

    }
}
