/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBUtils;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;

/**
 *
 * @author Perad
 */
public class UserDAO {
    public void addUser(User user){
        try {
            PreparedStatement statement = DBUtils.getPreparedStatement("INSERT INTO normalUser(firstName,lastName,birthday,address,telephone,userEmail,userPassword) VALUES (?,?,?,?,?,?,?)");
            statement.setString(1, user.getFirstName());
            statement.setString(2, user.getLastName());
            statement.setString(3, user.getBirthday());
            statement.setString(4, user.getAddress());
            statement.setString(5, user.getUserEmail());
            statement.setString(6, user.getTelephone());
            statement.setString(7, user.getUserPassword());
            statement.executeUpdate();
            
        } catch (Exception ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
