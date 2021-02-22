
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="db.DBUtils"%>
<%@page import="model.User"%>
<%@page import="dao.NewsDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.News"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                String pageId = request.getParameter("pageid");
                ResultSet set = DBUtils.search("SELECT profileName FROM companyProfile WHERE userID='" + user.getUserId() + "' AND pID='" + pageId + "' ");
                if (set.next()) {

    %>

    <body>

        <!--Start Nav bar-->
        <%
            String p = request.getParameter("pageid");
            int pIdInt = Integer.parseInt(pageId);
            String cname = "";
            if (pIdInt != 0) {
                ResultSet rs = DBUtils.search("SELECT profileName FROM companyProfile WHERE pID='" + pIdInt + "' ");
                while (rs.next()) {
                    cname = rs.getString("profileName");
                }
            }
        %>

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
                            <a class="nav-link" href="companyDashboard.jsp"><%=cname%><span class="sr-only"></span></a>
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


            <!--Start Collapse-->

            <div class="accordion mb-4" id="accordionExample">
                <div class="card">
                    <div class="card-header" id="headingOne">
                        <h5 class="mb-0">
                            <button class="btn btn-secondary btn-lg btn-block collapsed" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                + Add New Post
                            </button>
                        </h5>
                    </div>

                    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                        <div class="card-body">
                            <form action="addNews?ppIdBtn=<%=pageId%>" method="POST">
                                <div class="form-group">
                                    <label for="inputTitle">Title</label>
                                    <input name="title" type="text" class="form-control" id="inputTitle" placeholder="Enter Title" required="">
                                </div>
                                <div class="form-group">
                                    <label for="inputCategory">Category</label>
                                    <select name="category" class="custom-select" id="inputCategory" required="">
                                        <option selected>Open this select menu</option>
                                        <option value="internship">Internship</option>
                                        <option value="jobVacancy">Job Vacancy</option>
                                        <option value="workshop">Workshop</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="inputPostBody">Post Body</label>
                                    <textarea name="postBody" class="form-control" id="inputPostBody" rows="3" required=""></textarea>
                                </div>

                                <!--                                <div class="form-group">
                                                                    <label for="inputImage">Add Image</label>
                                                                    <input name="postImg" type="file" id="inputImage">
                                                                </div>-->

                                <button type="submit" class="btn btn-primary">Post</button>
                            </form>

                        </div>
                    </div>
                </div>
            </div>

            <!--End Collapse-->

            <!--Start Card-->

            <%
                ResultSet rst = DBUtils.search("SELECT * FROM pagePost WHERE pageId='" + pIdInt + "' ");
                while (rst.next()) {
            %>

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
                    <!--<button type="button" class="btn btn-light">Light</button>-->
                    <form action="deleteNews" method="POST">
                        <button type="submit" name="btnpid" value="<%=rst.getString("postId")%>" class="btn btn-danger btn-sm mt-2">Delete</button>
                    </form>
                </div>
            </div>

            <%
                }

            %>

            <!--End Card-->

        </div>

        <!--End Home-->

        <script rel="script" type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
        <script rel="script" type="text/javascript" src="js/bootstrap.min.js"></script>

    </body>
    <%        }

            } else {
                response.sendRedirect("index.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</html>
