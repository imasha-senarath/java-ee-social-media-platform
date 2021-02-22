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
                        <li class="nav-item">
                            <a class="nav-link" href="#">Followers</a>
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
                                <a class="dropdown-item" href="companyDashboard.jsp?pageid=<%=rs.getInt(1)%>"> <%=rs.getString(3)%> </a>

                                <% } %>

                                <%      } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>


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

        <div class="container">
            <div class="mt-4">
                <h4 class="mr-3">Create a new page</h4>
            </div>

            <div class="col mt-4" style="background-color: #F8F9FA">

                <form action="addPage" method="POST" style="padding: 20px">
                    <div class="form-group">
                        <label for="inputCompanyName">Company Name</label>
                        <input type="text" name="companyName" class="form-control" id="inputCompanyName" placeholder="Company Name" required="">
                    </div>

                    <div class="form-group">
                        <label for="inputAddress">Address</label>
                        <input type="text" name="address" class="form-control" id="inputAddress" placeholder="Address" required="">
                    </div>

                    <div class="form-group">
                        <label for="inputTelephone">Telephone</label>
                        <input type="text" name="telephone" class="form-control" id="inputTelephone" placeholder="Telephone" required="">
                    </div>

                    <div class="form-group">
                        <label for="inputEmail">Email</label>
                        <input type="email" name="companyEmail" class="form-control" id="inputEmail" placeholder="Email" required="">
                    </div>

                    <button type="submit" class="btn btn-primary">Done</button>
                </form>
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
