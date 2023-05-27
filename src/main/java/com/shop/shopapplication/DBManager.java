package com.shop.shopapplication;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBManager {
    private static final String URL = "jdbc:mysql://localhost:3306/onlineshopdb";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "";

    // The static instance of the singleton class
    private static DBManager instance;

    private Connection connection;

    // Private constructor so it can't be instantiated from outside this class
    private DBManager() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    // The public method to retrieve the single instance of this class
    public static DBManager getInstance() {
        if (instance == null) {
            instance = new DBManager();
        }
        return instance;
    }

    // Method to return the connection
    public Connection getConnection() {
        return connection;
    }
}
