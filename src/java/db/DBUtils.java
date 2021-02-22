/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Perad
 */
public class DBUtils {
    private static Connection connection;
    private static void newConnection() throws ClassNotFoundException, SQLException{
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/abcdevents","root","1234");
        
    }
    
    public static void iud(String string) throws Exception{
        if (connection == null) {
            newConnection();
        }
        connection.createStatement().executeUpdate(string);
    }
    
    public static ResultSet search(String string) throws Exception{
        if (connection == null) {
            newConnection();
        }
        return (ResultSet)connection.createStatement().executeQuery(string);
        
    }
    
    public static Connection getConnection() throws Exception{
        if (connection == null) {
            newConnection();
        }
        return connection;
    }
    
    public static PreparedStatement getPreparedStatement(String sql)throws Exception{
        PreparedStatement ps = null;
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/abcdevents","root","1234");
        
        ps = connection.prepareStatement(sql);
        
        return ps;
    }
    
    
}
