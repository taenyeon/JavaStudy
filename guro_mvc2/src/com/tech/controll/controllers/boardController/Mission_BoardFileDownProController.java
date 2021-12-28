package com.tech.controll.controllers.boardController;

import com.tech.controll.controllers.Controller;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.nio.charset.StandardCharsets;

public class Mission_BoardFileDownProController implements Controller {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        //apple.jpg
        // 파일 이름
        String filePath = request.getParameter("filePath");
        String fileName = request.getParameter("fileName");
        //  /web/files/
        // 폴더 경로
        String path = request.getSession().getServletContext().getRealPath("/files/");
        //  /web/files/apple.jpg
        // 파일의 절대 경로
        String realPath = path+filePath;
        // 절대 경로를 통해 파일 호출
        File fileDown = new File(realPath);
        // 파일을 읽을 수 있는 최대 크기(업로드 최대 크기와 동일하게)
        byte[] maxSize = new byte[15*1024*1024];
        // FileInputStream은 파일을 바이트 단위로 입력할 수 있다. -> 바이트 단위 출력도 가능하다는 의미이다.
        FileInputStream in = new FileInputStream(fileDown);
        // 파일의 유형을 설정 -> 없을경우, 2진수로 구성된 바이트로 읽어야하므로 MimeType을 application.octec-stream로 설정
        String mimeType = request.getSession().getServletContext().getMimeType(realPath);
        if (mimeType==null){
            mimeType="application.octec-stream";
        }
        // ContentType을 미리 설정한 MimeType으로 지정
        response.setContentType(mimeType);
        // 파일에 한글이 포함되어 있을 경우가 있기 때문에, 8859_1로 변환하여 파일의 이름을 설정
        String eucKr = new String(fileName.getBytes(StandardCharsets.UTF_8), "8859_1");
        //Header 설정
        response.setHeader("Content-Disposition","attachment; filename="+eucKr);
        // FileInputStream으로 읽어온 데이터는 ServletOutputStream을 통해 전송 -> out 객체와 혼동 주의
        ServletOutputStream sout = response.getOutputStream();
        int numRead = 0;
        // 바이트 단위로 쪼갠 파일의 데이터를 보내는 역할
        while ((numRead=in.read(maxSize,0,maxSize.length))!=-1){
            sout.write(maxSize,0,numRead);
        }
        sout.flush();
        sout.close();
        in.close();
    }
}
