
package servlet;

import dao.UserDAO;
import db.DBUtils;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

@WebServlet(name = "UserReg", urlPatterns = {"/UserReg"})
public class UserReg extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String birthday = req.getParameter("birthday");
        String address = req.getParameter("address");
        String telephone = req.getParameter("telephone");
        String userEmail = req.getParameter("userEmail");
        String userPassword = req.getParameter("userPassword");
        String reEnterPW = req.getParameter("reEnterPassword");
        ResultSet rstUser = null;

        if (userPassword.equals(reEnterPW)) {
            try {
                rstUser = DBUtils.search("SELECT * from normaluser where userEmail = '" + userEmail + "' ");

                if (rstUser.next()) {
                    resp.sendRedirect("index.jsp?msgOne=Email Allreddy Registered!");
                } else {
                    User user = new User(firstName, lastName, birthday, address, userEmail, telephone, userPassword);
                    UserDAO userDAO = new UserDAO();
                    userDAO.addUser(user);

                    resp.sendRedirect("userDashboard.jsp");
                }
            } catch (Exception ex) {
                Logger.getLogger(UserReg.class.getName()).log(Level.SEVERE, null, ex);
            }
            
        } else {

            resp.sendRedirect("index.jsp?msg=Password Not Equal!");

            System.out.println("PW Not Equal!");
        }

    }

}
