<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


<title>Sign Up</title>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">RideWithMe.net</a>
    </div>
    <ul class="nav navbar-nav navbar-right">
      <li class="active"><a href="#">About Us</a></li>
      <li><a href="#">Our Service</a></li>
      <li><a href="#">Contact Us</a></li>
    </ul>
   
  </div>
</nav>

	<div class="container">
		<div class="panel panel-default">
		 <div class="panel-body">
		 <form action="#" commandName="client" method="post" role="form" data-toggle="validator">
                        <!-- Default box -->
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="box box-primary">
                                    <div class="box-header">
                                        <h3 class="box-title">Sign Up</h3>                                      
                                        
                                        
                                    </div><!-- /.box-header -->                                
                                    <div class="box-body">                                    
                                        <div class="row margin">
                                            <div class="col-sm-6">
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
                                                
                                            </div>

                                            <div class="col-sm-6">
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
                                            </div>  
                                        </div>                                    
                                    </div>
                                    <!-- /.box-body -->
                                </div>                               
                            </div><!-- /.box -->
                             <div class="box-footer" style="text-align: center;">
                                  <div id="loader">
                                             <img src="../images/loading.gif" alt=""/>
                                        </div> 
                            <input type="button" id="signup" name="submit" value="Signup" class="btn btn-primary">
                            <input type="button" name="btnClose" id="btnClose" value="Close" class="btn btn-primary">
                        </div>
                        </div>
                        <!-- /.box -->                       
                       
                    </form>
			</div>
        </div>
</div>
<script src="../js/signup.js" type="text/javascript"></script>
</body>
</html>