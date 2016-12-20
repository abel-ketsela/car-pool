<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<html>
    <%@include file="includes.jsp" %>

    <body class="skin-blue">
        <%@include file="header.jsp" %>
        <!-- Site wrapper -->
        <div class="wrapper">
            <%@include file="sideBar.jsp" %>
            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper" style="min-height: 858px;">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1> New user registration </h1>
                </section>
                <!-- Main content -->
                <section class="content">                   
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
                                             <img src="../resources/images/loading.gif" alt=""/>
                                        </div> 
                            <input type="button" id="signup" name="submit" value="Signup" class="btn btn-primary">
                            <input type="button" name="btnClose" id="btnClose" value="Close" class="btn btn-primary">
                        </div>
                        </div>
                        <!-- /.box -->                       
                       
                    </form>
                </section><!-- /.content -->
            </div><!-- /.content-wrapper -->
            <%@include file="footer.jsp" %>
        </div><!-- ./wrapper -->
       
        <%@include file="scripts.jsp" %> 
       
        <script type="text/javascript">
            $(document).ready(function(){
                $("#loader").hide();
                $(document).ajaxStart(function() {
                    $("#loader").show();
                }).ajaxStop(function() {
                    $("#loader").hide();
                });
                
                
            })
            
            
        </script>
      
    </body>
</html>