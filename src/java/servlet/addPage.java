package servlet;

import dao.PageDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Page;
import model.User;

public class addPage extends HttpServlet {
    User user = null;
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        user = (User) req.getSession(false).getAttribute("user");
        int userId = user.getUserId();
        
        String companyName = req.getParameter("companyName");
        String address = req.getParameter("address");
        String telephone = req.getParameter("telephone");
        String email = req.getParameter("companyEmail");
        
        Page page = new Page(userId, companyName, address, telephone, email);
        PageDAO pageDAO = new PageDAO();
        pageDAO.addNewPage(page);
        
        resp.sendRedirect("userDashboard.jsp");
        
    }

    
}
