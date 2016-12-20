<%-- 
    Document   : index
    Created on : Dec 20, 2016, 1:40:18 AM
    Author     : samue
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>               
        <link href="../resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>        
        <script src="../resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
      
    </head>
    <body>
        <div class="container">
            <form action="/" method="post"  role="form" data-toggle="validator" >
                <input type="hidden" id="userId" name="userId" />
                <h2>Sign Up</h2>
                <div class="form-group col-xs-4">
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

                    <br></br>
                    <button type="submit" class="btn btn-primary  btn-md">Signup</button> 
                    <button type="submit" class="btn btn-primary  btn-md">Cancel</button>
                </div>                                                      
            </form>
        </div>
        <!-- Signup -->
		<script src="../resources/js/signup.js" type="text/javascript"></script>
    </body>
</html>