package servlet;

import dao.NewsDAO;
import db.DBUtils;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.News;

public class addNews extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String pageId = req.getParameter("ppIdBtn");
        int a = Integer.parseInt(pageId);

        String title = req.getParameter("title");
        String category = req.getParameter("category");
        String postBody = req.getParameter("postBody");
        String pName = "";

        try {
            ResultSet pageName = DBUtils.search("SELECT profileName FROM companyProfile WHERE pID='" + a + "' ");
            if (pageName.next()) {
                pName = pageName.getString("profileName");
            }
            
            News n = new News(a, pName, title, category, postBody);
            NewsDAO newsDAO = new NewsDAO();
            newsDAO.addNews(n);

            resp.sendRedirect("userDashboard.jsp");
            
        } catch (Exception ex) {
            Logger.getLogger(addNews.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
