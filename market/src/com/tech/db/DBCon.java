package com.tech.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBCon {
    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        String url = "jdbc:oracle:thin:@192.168.1.156:1521:XE";
        String user = "hr";
        String pw = "1234";
        return DriverManager.getConnection(url,user,pw);
    }
}
