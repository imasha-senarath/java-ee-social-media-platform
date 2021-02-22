/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import db.DBUtils;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author Perad
 */
public class UserLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        String email = req.getParameter("loginEmail");
        String password = req.getParameter("loginPassword");
        
        try {
            ResultSet resultSet = DBUtils.search("SELECT * FROM normalUser WHERE userEmail = '"+email+"' AND userPassword = '"+password+"'");
            
            if (resultSet.next()) {
                int userID = resultSet.getInt("userID");
                String firstName = resultSet.getString("firstName");
                
                req.getSession().setAttribute("user", new User(userID, firstName));
                
                resp.sendRedirect("userDashboard.jsp");
                
            }else{
                resp.sendRedirect("index.jsp?loginERMsg=Email or Password is Incorrect!");
            }
            
        } catch (Exception ex) {
            Logger.getLogger(UserLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }

    
}
