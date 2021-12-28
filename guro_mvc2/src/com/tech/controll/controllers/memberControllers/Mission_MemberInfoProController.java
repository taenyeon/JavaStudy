package com.tech.controll.controllers.memberControllers;

import com.tech.controll.controllers.Controller;
import com.tech.controll.service.MemberService;
import com.tech.db.DBCon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import com.sun.tools.internal.xjc.model.Model;
public class Mission_MemberInfoProController implements Controller {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        MemberService memberService = new MemberService();
        String name = request.getParameter("name");
        String tel = request.getParameter("tel");
        String id = request.getParameter("c");
        int info = memberService.updateInfo(id, name, tel);
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter writer = response.getWriter();
        if (info > 0){
            writer.println("<script>alert('수정되었습니다.'); location.href='/member/info.jsp'</script>");
        } else {
            writer.println("<script>alert('수정에 실패하였습니다.'); location.href='/member/info.jsp'</script>");
        }
    }
}
