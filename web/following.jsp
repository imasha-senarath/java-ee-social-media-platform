<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ABC Events</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    </head>

    <body>

        <!--Start Nav bar-->
        <div>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <img class="ml-5 mr-5" src="img/social-crowd.png" alt="Logo" style="width: 60px; height: auto">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="companyDashboard.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="following.jsp">Following</a>
                        </li>
                        
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                User
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">page A</a>
                                <a class="dropdown-item" href="#">page B</a>
                                <div class="dropdown-divider"></div>
                                <!--<button type="button" class="btn btn-primary btn-lg btn-block">Create new page</button>-->
                                <button type="button" class="btn btn-primary btn-sm btn-block">Create new page</button>
                                
                            </div>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link" href="#">Logout</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>

        <!--End Nav bar-->

        <div class="container mt-4 mb-5">

            <table class="table table-striped">
                
                <tbody>
                    <tr>
                        <td>Mark</td>
                        <td>Otto</td>
                    </tr>
                    <tr>
                        <td>Jacob</td>
                        <td>Thornton</td>
                    </tr>
                    <tr>
                        <td>Larry</td>
                        <td>the Bird</td>
                    </tr>
                </tbody>
            </table>

        </div>

    </body>
</html>
