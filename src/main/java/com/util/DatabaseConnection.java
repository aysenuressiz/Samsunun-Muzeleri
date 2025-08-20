package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    private static final String URL = System.getenv("DATABASE_URL") != null ? 
        System.getenv("DATABASE_URL") : 
        "jdbc:mysql://localhost:3306/samsunmuzeleri?useSSL=false&serverTimezone=UTC";
    
    private static final String USERNAME = System.getenv("DATABASE_USERNAME") != null ? 
        System.getenv("DATABASE_USERNAME") : "root";
    
    private static final String PASSWORD = System.getenv("DATABASE_PASSWORD") != null ? 
        System.getenv("DATABASE_PASSWORD") : "123456";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL JDBC Driver bulunamadı", e);
        }
    }
}