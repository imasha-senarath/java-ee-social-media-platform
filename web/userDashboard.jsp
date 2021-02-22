<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DBUtils"%>
<%@page import="model.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>ABC Events</title>
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
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Home <span class="sr-only"></span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="followers.jsp">Followers</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <%=user.getFirstName()%>
                            </a>

                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <%
                                    try {
                                        PreparedStatement ps = DBUtils.getPreparedStatement("SELECT * FROM companyProfile WHERE userId=? ");
                                        int uId = user.getUserId();
                                        ps.setInt(1, uId);
                                        ResultSet rs = ps.executeQuery();


                                %>
                                <% while (rs.next()) {%>    
                                <a id="pageName" class="dropdown-item" href="companyDashboard.jsp?pageid=<%=rs.getInt(1)%>"> <%=rs.getString(3)%> </a>


                                <% } %>

                                <%      } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                                <!--<a class="dropdown-item" href="#">page B</a>-->
                                <div class="dropdown-divider"></div>
                                <a type="button" class="btn btn-primary btn-lg btn-block" href="newPage.jsp">Create a New Page</a>

                            </div>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="UserLogout">Logout</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>

        <!--End Nav bar-->

        <!--Start Home-->

        <div class="container mt-4">

            <a type="submit" href="userDashboard.jsp" class="btn btn-outline-secondary btn-lg btn-block mb-4">See New Posts..</a>

            <!--Start Card-->
            <%
                int uId = user.getUserId();
                ResultSet rs = DBUtils.search("SELECT * FROM followDetailsAcc WHERE userID='" + uId + "' ");

                while (rs.next()) {
                    ResultSet resultSet = DBUtils.search("SELECT * FROM companyProfile WHERE pID='" + rs.getInt("pID") + "' ");

                    while (resultSet.next()) {
                        ResultSet rst = DBUtils.search("SELECT * FROM pagePost WHERE pageId='" + resultSet.getInt("pID") + "' ");

                        while (rst.next()) {%>                             



            <div class="card mb-3">
                <div class="card-header">
                    <b><%=rst.getString("pageName")%></b> <p><small><%=rst.getString("posted_on")%></small></p>
                </div>
                <div class="card-body">
                    <h5 class="card-title"><%=rst.getString("postTitle")%><p style="font-size: 15px"><small><%=rst.getString("postCategory")%></small></p></h5>

                    <p class="card-text"><%=rst.getString("postBody")%></p>
                    <!--                        <div>
                                                <img class="card-img-bottom" src="" alt="Card image cap" style="width: 480px; height: auto">
                                            </div>-->
                </div>
            </div>

            <%
                        }
                    }
                }
            %>

        </div>

        <!--End Home-->

        <script rel="script" type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
        <script rel="script" type="text/javascript" src="js/bootstrap.min.js"></script>


    </body>

    <%        } else {
                response.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</html>
