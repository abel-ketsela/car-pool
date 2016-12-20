<html>
    <%@include file="includes.jsp" %>
    

    <body class="skin-blue">
      
     <%@include file="header.jsp" %>
     
     <div class="container">
         <div class="content-wrapper" style="min-height: 858px;">
             <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                       Client Registration
                    </h1>
                </section>
             <section class="content">
                 <div class="row">
                            <div class="col-xs-12">
                                <div class="box box-primary">
                                    <div class="box-header">
                                        <h3 class="box-title">Signup </h3>
                                    </div><!-- /.box-header --> 
                                    
                                    <f:form action="#" commandName="client" method="post" role="form" data-toggle="validator">
                                    <div class="box-body">                                    
                                        <div class="row margin">
                                            <div class="col-sm-6">                                                
                                                <div class="form-group">
                                                    <label for="txtFullName">Full Name</label>
                                                    <input type="text" class="form-control" name="txtFullName" id="txtFullName" placeholder="Enter Full Name" required>
                                                </div>
                                               <div class="form-group">
                                                    <label for="optGender">Gender</label>
                                                    <select name="optGender" id="opt" class="form-control" required>
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
                                                    <label for="txtCity">State</label>
                                                    <input type="text" class="form-control" name="txtCity" id="txtCity" placeholder="Enter City" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtStreet">State</label>
                                                    <input type="text" class="form-control" name="txtStreet" id="txtStreet" placeholder="Enter Street" required>
                                                </div>
                                                <div class="form-group">
                                                    <label for="txtZipCode">State</label>
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
                                                <div class="form-group">
                                                    <input type="submit" class="buttons box-primary" value="Submit">
                                                </div>
                                            </div>                                         
                                        </div>                                     
                                    </div><!-- Form Body end -->
                                    </f:form>
                                    
                                    <!-- /.box-body -->
                                </div>                               
                            </div><!-- /.box -->
                        </div>
             </section>
        </div>
   </div>
    </body>    
     </div>
       <%@include file="scripts.jsp" %>
    
     <%@include file="footer.jsp" %> 

</html>
