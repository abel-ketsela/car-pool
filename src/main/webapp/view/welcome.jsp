<%-- 
    Document   : welcome
    Created on : Dec 20, 2016, 9:04:14 AM
    Author     : samue
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Welcome Page</title>
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>        
        <script src="../resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="jumbotron">
                        <h2>
                            CAR POOLING
                        </h2>
                        <p>
                            Welcome to RideWithMe.net       

                        </p>
                        <p>
                            <a id="modal-716219" href="#modal-container-716219" role="button" class="btn btn-primary btn" data-toggle="modal">Sign Up</a>
                            <a id="modal-716219" href="#login" role="button" class="btn btn-primary" data-toggle="modal">login</a>    </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modal-container-716219" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">

                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            ×
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            Sign Up
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form action="#" method="post"  role="form" data-toggle="validator" >
                            <input type="hidden" id="userId" name="userId" />


                            <div class="form-group">
                                <label for="txtFullName">Full Name</label>
                                <input type="text" class="form-control" name="txtFullName" id="txtFullName" placeholder="Enter Full Name" required>
                            </div>
                            <div class="form-group">
                                <label for="optGender">Gender</label>
                                <select name="optGender" id="optGender" class="form-control" required>
                                    <option value="">Select Gender</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </select>
                            </div> 
                            <div class="form-group">
                                <label for="txtState">State</label>
                                <input type="text" class="form-control" name="txtState" id="txtState" placeholder="Enter State" required>
                            </div>
                            <div class="form-group">
                                <label for="txtCity">City</label>
                                <input type="text" class="form-control" name="txtCity" id="txtCity" placeholder="Enter City" required>
                            </div>
                            <div class="form-group">
                                <label for="txtStreet">Street</label>
                                <input type="text" class="form-control" name="txtStreet" id="txtStreet" placeholder="Enter Street" required>
                            </div>
                            <div class="form-group">
                                <label for="txtZipCode">Zipcode</label>
                                <input type="text" class="form-control" name="txtZipCode" id="txtZipCode" placeholder="Enter ZipCode" required>
                            </div>   
                            <div class="form-group">
                                <label for="txtDOB">DOB</label>
                                <div class="input-group">
                                    <div class="input-group-addon">
                                        <i class="fa fa-calendar"></i>
                                    </div>
                                    <input type="text" class="form-control" data-provide="datepicker" name="txtDOB" id="txtDOB" placeholder="click to show datepicker" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="txtEmail">Email</label>
                                <input type="text" class="form-control" name="txtEmail" id="txtEmail" placeholder="Enter ZipCode" required>
                            </div> 
                            <div class="form-group">
                                <label for="txtPassword">Password</label>
                                <input type="password" class="form-control" name="txtPassword" id="txtPassword" placeholder="Enter Passord" required>
                            </div>  
                            <div class="form-group">
                                <label for="txtConfirmPassword">Confirm Password</label>
                                <input type="text" class="form-control" name="txtConfirmPassword" id="txtConfirmPassword" placeholder="Retype your password" required>
                            </div>


                        </form>
                    </div>
                    <div class="modal-footer">

                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            Close
                        </button> 
                        <button type="button"  id="signup"  class="btn btn-primary">
                            Save changes
                        </button>
                    </div>
                </div>

            </div>

        </div>


        <div class="modal fade" id="login" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">

                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            ×
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            Login
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" role="form">
                            <div class="form-group">                               
                               
                                <label for="inputEmail3" class="col-sm-2 control-label">
                                    Email
                                </label>
                                <div class="col-sm-10">
                                    <input type="text" id="loginId" class="form-control" id="inputEmail3" />
                                </div>
                            </div>
                            <div class="form-group">

                                <label for="inputPassword3" class="col-sm-2 control-label">
                                    Password
                                </label>
                                <div class="col-sm-10">
                                    <input type="password" id="password" class="form-control" id="inputPassword3" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <div class="checkbox">

                                        <label>
                                            <input type="checkbox" /> Remember me
                                        </label>
                                       
                                    </div>
                                        <div id="loader">
                                            <img src="../resources/images/loading.gif" alt=""/>
                                        </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">


                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">

                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            Close
                        </button> 
                        <button type="button" id="signIn" class="btn btn-primary">
                            Signin
                        </button>
                    </div>
                </div>

            </div>

        </div>
        <footer class="main-footer">
            <div class="pull-right hidden-xs">
                <b>Version</b> 1.0
            </div>
            <strong>Copyright © 2016 <a href="">CAR POOLING.</strong> All rights reserved.
        </footer>
        <script src="../resources/bootstrap/js/jquery.min.js" type="text/javascript"></script>
        <script src="../resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <script src="../resources/plugins/datepicker/bootstrap-datepicker.js" type="text/javascript"></script>
        <script src="../resources/js/login.js" type="text/javascript"></script>
        <script src="../resources/js/signup.js" type="text/javascript"></script>
        
        <link href="../resources/plugins/datepicker/datepicker3.css" rel="stylesheet" type="text/css"/>
    </body>
</html>
