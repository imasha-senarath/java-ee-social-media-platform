<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="model.FollowDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.PageDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DBUtils"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    </head>
    <%
        User user = null;

        try {
            if (session.getAttribute("user") != null) {
                user = (User) session.getAttribute("user");


    %>
    <body>

        <div>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <img class="ml-5 mr-5" src="img/social-crowd.png" alt="Logo" style="width: 60px; height: auto">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="userDashboard.jsp">Home <span class="sr-only"></span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="followers.jsp">Followers</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="UserLogout">Logout</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>

        <!--End Nav bar-->

        <%
            List<Page> allpagelist = PageDAO.getAllPages();
            request.setAttribute("allpagelist", allpagelist);
        %>

        <div class="container mt-5">
            <div class="row">
                <div class="col">
                    <h4>All Pages</h4>
                    <table class="table table-striped">
                        <c:forEach items="${allpagelist}" var="apl">
                            <form action="followNew" method="POST">
                                <tr>
                                    <td>${apl.getCompanyName()}</td>
                                    <td>${apl.getCompanyAddress()}</td>
                                    <td><button type="submit" class="btn btn-primary btn-sm" name="fpidBtn" value="${apl.getPageId()}">Follow</button></td>
                                </tr>
                            </form>
                        </c:forEach>
                    </table>
                </div>


                <div class="col">
                    <h4>Followed Pages</h4>
                    <table class="table table-striped">

                        <%
                            try {
                                int uId = user.getUserId();
                                ResultSet rs = DBUtils.search("SELECT * FROM followDetailsAcc WHERE userID='" + uId + "' ");
                                while (rs.next()) {
                                    ResultSet resultSet = DBUtils.search("SELECT * FROM companyProfile WHERE pID='" + rs.getInt("pID") + "' ");
                        %>
                        <% while (resultSet.next()) {%>
                        <form action="unFollow" method="POST">
                            <tr>
                                <td><%=resultSet.getString("profileName")%></td>
                                <td><%=resultSet.getString("companyAddress")%></td>
                                <td><button type="submit" class="btn btn-danger btn-sm" name="unFollowBtn" value="<%=resultSet.getInt("pId")%>">Unfollow</button></td>
                            </tr>
                        </form>
                        <% } %>
                        <%
                                }

                            } catch (Exception ex) {
                                ex.printStackTrace();
                            }
                        %>
                    </table>

                </div>
            </div>
        </div>


    </body>

    <%        } else {
                response.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</html>
