package servlet;

import dao.FollowDetailsDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

public class unFollow extends HttpServlet {

    User user = null;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        user = (User) req.getSession(false).getAttribute("user");
        int userId = user.getUserId();
        String pageId = req.getParameter("unFollowBtn");

        FollowDetailsDAO detailsDAO = new FollowDetailsDAO();
        detailsDAO.unFollow(userId ,Integer.parseInt(pageId));
        
        resp.sendRedirect("followers.jsp");
    }

}
