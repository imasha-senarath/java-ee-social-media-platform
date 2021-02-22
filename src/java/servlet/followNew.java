package servlet;

import dao.FollowDetailsDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.FollowDetails;
import model.User;

public class followNew extends HttpServlet {
    User user = null;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        user = (User) req.getSession(false).getAttribute("user");
        int userId = user.getUserId();

        String pageId = req.getParameter("fpidBtn");

        FollowDetails fd = new FollowDetails(userId, Integer.parseInt(pageId));
        FollowDetailsDAO followDetailsDAO = new FollowDetailsDAO();
        followDetailsDAO.follow(fd);
        resp.sendRedirect("followers.jsp");

    }

}
