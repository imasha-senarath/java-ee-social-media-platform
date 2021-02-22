<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>ABC Events</title>
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">

    </head>

    <body style="background-color: #d3d9de">

        <div class="mt-4">

        </div>

        <div class="container mb-4">
            <div class="row">

                <div class="col mr-3" style="background-color: #F8F9FA; padding: 20px;">
                    <form action="UserLogin" method="POST">
                        <div class="form-group mt-1">
                            <h3>Sign in</h3>
                        </div>
                        <div class="form-group" style="padding-left: 100px; padding-right: 100px">
                            <label for="exampleInputEmail1">Email address</label>
                            <input type="email" name="loginEmail" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required="">
                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                        </div>
                        <div class="form-group" style="padding-left: 100px; padding-right: 100px">
                            <label for="exampleInputPassword1">Password</label>
                            <input type="password" name="loginPassword" class="form-control" id="exampleInputPassword1" placeholder="Password" required="">
                        </div>

                        <div class="form-group" style="padding-left: 100px; padding-right: 100px">
                            <span style="color: red"><%= (request.getParameter("loginERMsg") == null) ? "" : request.getParameter("loginERMsg")%></span>
                        </div>
                        
                        <button type="submit" class="btn btn-primary" style="margin-left: 100px">Login</button>
                    </form>

                    <div>
                        <img src="img/social-crowd.png" alt="" style="width: 500px; height: auto">
                    </div>
                </div>

                <%--seperator--%>

                <div class="col" style="background-color: #F8F9FA; padding: 20px">
                    <form action="UserReg" method="POST">
                        <div class="form-group mt-1">
                                        <h3 class="mr-3">New User</h3>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputFirstName">First Name</label>
                                <input type="text" name="firstName" class="form-control" id="inputFirstName" placeholder="First Name" required="">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputLastName">Last Name</label>
                                <input type="text" name="lastName" class="form-control" id="inputLastName" placeholder="Last Name" required="">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="inputBirthday">Birthday</label>
                            <input type="date" name="birthday" class="form-control" id="inputBirthday" required="">
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
                            <input type="email" name="userEmail" class="form-control" id="inputEmail" placeholder="Email" required="">
                            <span style="color: red"><%= (request.getParameter("msgOne") == null) ? "" : request.getParameter("msgOne")%></span>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="inputPassword">Password</label>
                                <input type="password" name="userPassword" class="form-control" id="inputPassword" placeholder="Password" required="">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputConfPassword">Re-Enter Password</label>
                                <input type="password" name="reEnterPassword" class="form-control" id="inputConfPassword" placeholder="Re-Enter Password" required="">
                                <span style="color: red"><%= (request.getParameter("msg") == null) ? "" : request.getParameter("msg")%></span>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="form-check">
                                <input class="form-check-input" name="agreeCheck" type="checkbox" id="agreementCheck" required="">
                                <label class="form-check-label" for="agreementCheck">
                                    I agree with terms and conditions
                                </label>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary">Register</button>
                    </form>
                </div>

            </div>
        </div>

    </body>
</html>
