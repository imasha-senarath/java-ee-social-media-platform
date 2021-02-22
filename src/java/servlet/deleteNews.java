package servlet;

import dao.NewsDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class deleteNews extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String btnP = req.getParameter("btnpid");
        int btnPInt = Integer.parseInt(btnP);
        
        NewsDAO newsDAO = new NewsDAO();
        newsDAO.deleteNews(btnPInt);
        
        resp.sendRedirect("userDashboard.jsp");
    }

    
}
