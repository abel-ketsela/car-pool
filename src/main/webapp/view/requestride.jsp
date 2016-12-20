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
                    <div>                        
                        <button id="go">Go!</button>
                        <input id="textId" type="text" value="1" />
                    </div>
                    <div class="nav-tabs-custom">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#requestRide" data-toggle="tab" aria-expanded="false">Request Ride</a></li>
                                <li class=""><a href="#postRide" data-toggle="tab" aria-expanded="false">Post Ride</a></li>
                                                              
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="requestRide">
                                   
                                   
                                    <div id="rideRequesPosts">
                                    </div>
                                </div><!-- /.tab-pane -->
                                <div class="tab-pane" id="tab_3">
                                    <table id="postRide"></table>
                                    <div id="pagerStatus"></div>
                                    <input type="hidden" name="statusData" id="StatusData">                                          
                                </div>                              

                            </div><!-- /.tab-content -->
                        </div>
                    <div id="scroll">
                        
                    </div>
                </section>
                <!-- Main content -->
                <section class="content">                   
                   
                </section><!-- /.content -->
            </div><!-- /.content-wrapper -->
            <%@include file="footer.jsp" %>
        </div><!-- ./wrapper -->
       
        <%@include file="scripts.jsp" %>  

       
        <script type="text/javascript">
            $(function(){
                $('#scroll').lazyLoader({
                    ajaxLoader: 'http://jsonplaceholder.typicode.com/users' 
                });
            });
            
            
            </script>
      
    </body>
</html>