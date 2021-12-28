package com.tech.controll.service;

import com.tech.controll.repository.BoardRepository;
import com.tech.db.GuroBoard;

import javax.naming.NamingException;
import java.io.File;
import java.sql.SQLException;
import java.util.List;

public class BoardService {
    BoardRepository boardRepository = new BoardRepository();

    public BoardService() throws SQLException, NamingException, ClassNotFoundException {
    }

    public int writeBoard(String title, String writer, String content, String filePath, String fileName) throws SQLException {
       return boardRepository.insertBoard(title, writer, content, filePath, fileName);
    }

    public int updateBoard(String no,String title, String content, String filePath, String fileName) throws SQLException {
        deleteFile(no);
        System.out.println("no = " + no);
        System.out.println("title = " + title);
        System.out.println("content = " + content);
        System.out.println("filePath = " + filePath);
        System.out.println("fileName = " + fileName);
        return boardRepository.updateBoard(no,title, content, filePath, fileName);
    }

    public GuroBoard findById(String no) throws SQLException {
        boardRepository.hitUp(no);
       return boardRepository.findById(no);
    }
    public List<GuroBoard> findAll() throws SQLException {
        return boardRepository.findAll();
    }

    public void deleteFile(String no) throws SQLException {
        String filePath = boardRepository.findFile(no);
        if (filePath != null){
            File oldFile = new File(filePath);
            oldFile.delete();
        }
    }

    public int deleteBoard(String no) throws SQLException {
        deleteFile(no);
        return boardRepository.deleteBoard(no);
    }

}
