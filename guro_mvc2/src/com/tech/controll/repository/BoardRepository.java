package com.tech.controll.repository;

import com.tech.db.GuroBoard;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.LinkedList;
import java.util.List;

public class BoardRepository {
    Connection con;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    public BoardRepository() throws SQLException, ClassNotFoundException, NamingException {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource) envCtx.lookup("jdbc/noticeXe");
        con = ds.getConnection();
    }

    public List<GuroBoard> findAll() throws SQLException {
        pstmt = con.prepareStatement("select board_no," +
                " board_title," +
                " board_regdate," +
                " board_writer," +
                " board_content," +
                " board_filepath," +
                " board_filename," +
                "BOARD_HIT" +
                " from GURO_BOARD" +
                " order by " +
                "BOARD_NO" +
                " desc ");
        rs = pstmt.executeQuery();
        List<GuroBoard> guroBoards = new LinkedList<>();
        while(rs.next()){
            GuroBoard guroBoard = getGuroBoard(rs);
            guroBoards.add(guroBoard);
        }

        return guroBoards;
    }


    public GuroBoard findById(String no) throws SQLException {
        pstmt = con.prepareStatement("select board_no," +
                " board_title," +
                " board_regdate," +
                " board_writer," +
                " board_content," +
                " board_filepath," +
                " board_filename," +
                "BOARD_HIT" +
                " from GURO_BOARD" +
                " where BOARD_NO=?");
        pstmt.setString(1,no);
        rs = pstmt.executeQuery();
        rs.next();

        return getGuroBoard(rs);

    }

    public String findFile(String no) throws SQLException {
        pstmt = con.prepareStatement("select BOARD_FILEPATH from GURO_BOARD where BOARD_NO =?");
        pstmt.setString(1, no);
        ResultSet rs = pstmt.executeQuery();
        String result = null;
        if (rs.next()){
         result = rs.getString("board_filepath");
        }

        return result;
    }

    public int updateBoard(String no,String title, String content, String filePath, String fileName) throws SQLException {
        pstmt = con.prepareStatement("update GURO_BOARD set BOARD_TITLE=?,BOARD_CONTENT=?,BOARD_FILEPATH=?,BOARD_FILENAME=?,BOARD_REGDATE=sysdate where BOARD_NO=?");
        pstmt.setString(1,title);
        pstmt.setString(2,content);
        pstmt.setString(3,filePath);
        pstmt.setString(4,fileName);
        pstmt.setString(5,no);
        return pstmt.executeUpdate();
    }

    public int insertBoard(String title, String writer, String content, String filePath, String fileName) throws SQLException {
        pstmt = con.prepareStatement("insert into GURO_BOARD values (GURO_BOARD_NO.nextval,?,sysdate,?,?,?,?,0)");
        pstmt.setString(1,title);
        pstmt.setString(2,writer);
        pstmt.setString(3,content);
        pstmt.setString(4,filePath);
        pstmt.setString(5,fileName);
        return pstmt.executeUpdate();
    }

    public int deleteBoard(String no) throws SQLException {
        pstmt = con.prepareStatement("select MAX(BOARD_NO)as max from GURO_BOARD");
        rs = pstmt.executeQuery();
        rs.next();
        int max = rs.getInt("max");
        pstmt = con.prepareStatement("delete from GURO_BOARD where BOARD_NO=?");
        pstmt.setString(1, no);
        int del = pstmt.executeUpdate();

        if (max == 1){
            pstmt = con.prepareStatement("drop sequence GURO_BOARD_NO");
            pstmt.executeUpdate();
            pstmt = con.prepareStatement("create sequence GURO_BOARD_NO start with 1 increment by 1 maxvalue 9999 nocache nocycle");
            pstmt.executeUpdate();

        }else if (max >Integer.parseInt(no)) {
            pstmt = con.prepareStatement("update GURO_BOARD set BOARD_NO = BOARD_NO-1 where BOARD_NO <?");
            pstmt.setString(1, no);
            pstmt.executeUpdate();
            pstmt = con.prepareStatement("ALTER SEQUENCE GURO_BOARD_NO INCREMENT BY -1");
            pstmt.executeUpdate();
            pstmt = con.prepareStatement("select GURO_BOARD_NO.nextval from dual");
            pstmt.executeUpdate();
            pstmt = con.prepareStatement("ALTER SEQUENCE GURO_BOARD_NO INCREMENT BY 1");
            pstmt.executeUpdate();
        }
        return del;
    }

    public void hitUp(String no) throws SQLException {
        pstmt = con.prepareStatement("update GURO_BOARD set BOARD_HIT= GURO_BOARD.BOARD_HIT+1 where BOARD_NO = ?");
        pstmt.setString(1, no);
        pstmt.executeUpdate();
    }

    private GuroBoard getGuroBoard(ResultSet rs) throws SQLException {
        Date date = rs.getDate("board_regdate");
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

        GuroBoard guroBoard = new GuroBoard();
        guroBoard.setNo(rs.getInt("board_no"));
        guroBoard.setTitle(rs.getString("board_title"));
        guroBoard.setWriter(rs.getString("board_writer"));
        guroBoard.setContent(rs.getString("board_content"));
        guroBoard.setFilePath(rs.getString("board_filepath"));
        guroBoard.setFileName(rs.getString("board_filename"));
        guroBoard.setHit(rs.getInt("board_hit"));
        guroBoard.setRegDate(format.format(date));

        return guroBoard;
    }

}
