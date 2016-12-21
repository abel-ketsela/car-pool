<%-- 
    Document   : iindex_
    Created on : Dec 20, 2016, 8:38:05 AM
    Author     : samue
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>CAR Pooling </title>
        <script
        src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

        <link href="/car-pool/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>  
        <style type="text/css" >
            #gotop {
                cursor: pointer;
                position: relative;
                float: right;
                right: 20px;
                /*top:0px;*/
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-12">
                            <nav class="navbar navbar-default" role="navigation">
                                <div class="navbar-header">

                                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                        <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                                    </button> <a class="navbar-brand" href="#">CAR POOLING</a>
                                </div>

                                <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
                                    <ul class="nav navbar-nav">

                                        <li class="dropdown">

                                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">My Account<strong class="caret"></strong></a>
                                            <ul class="dropdown-menu">
                                                <li>
                                                    <a href="#">Update Profile</a>
                                                </li>


                                                <li class="divider">
                                                </li>
                                                <li>
                                                    <a href="#">Travel History</a>
                                                </li>
                                                <li class="divider">
                                                </li>
                                                <li>
                                                    <a href="#">Logout</a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                    <form class="navbar-form navbar-left" id="searchWeather" role="search">
                                        <div class="form-group">
                                            <input type="text" class="form-control"  placeholder="Enter Zip code "/>
                                        </div> 
                                        <button type="submit" class="btn btn-default">
                                            Search Weather Info
                                        </button>
                                    </form>

                                </div>

                            </nav>

                        </div>
                    </div>



                    <div class="row">			

                        <div class="col-md-4">
                            <div>                        
                               
                                <div class="jumbotron">
                                    <h2>
                                        Weather information on the current area
                                    </h2>
                                    <p>
                                        some wether info
                                    </p>
                                    <p>
                                        <a class="btn btn-primary btn-large" href="#">Click here to know more</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8">
                            
                            <div id="posts">

                            </div>
                            <div class="tabbable" id="tab">
                                <ul class="nav nav-tabs">
                                    <li class="active">
                                        <a href="#requestRideTab" data-toggle="tab">Request Ride</a>
                                    </li>
                                    <li>
                                        <a href="#provideRideTab" data-toggle="tab">Provide Ride </a>
                                    </li>
                                    <li>
                                        <a href="#newPost" data-toggle="modal">You have some thing to post? </a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="requestRideTab">
                                        <p>

                                        </p>
                                    </div>
                                    <div class="tab-pane" id="provideRideTab">
                                        <p>		
                                        </p>
                                        <p>Ride Provider Posts</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>


        <!-- POST MODAL -->
        <div class="modal fade" id="newPost" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">

                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            ×
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            <p>Your Post</p>
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">
                                    Message 
                                </label>
                                <div class="col-sm-10">
                                    <textarea id="postBody" rows="4" cols="50" placeholder="Enter your post....">
                                        
                                    </textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <div class="checkbox">

                                        <label><input type="radio" name="postType" value="REQUEST" checked>Request Ride</label>
                                        <label><input type="radio" name="postType" value="PROVIDE" >Provide Ride</label>


                                    </div>
                                </div>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">

                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            Close
                        </button> 
                        <button type="newPost" class="btn btn-primary">
                            Post it!!
                        </button>
                    </div>
                </div>

            </div>

        </div>
        <!-- END POST MODAL -->

        <!-- COMMENT MODAL -->
        
        <!-- COMMENT MODAL -->
        <a id="gotop" href="#">Go Top </a>
        <footer class="main-footer">
            <div class="pull-right hidden-xs">
                <b>Version</b> 1.0
            </div>
            <strong>Copyright © 2016 <a href="">CAR POOLING.</strong> All rights reserved.
        </footer>


        <script src="/car-pool/resources/bootstrap/js/jquery.min.js" type="text/javascript"></script>
        <script src="/car-pool/resources/bootstrap/js/bootstrap.js" type="text/javascript"></script>
        <script src="/car-pool/resources/js/rideRequest.js" type="text/javascript"></script>
        <script src="/car-pool/resources/js/posts.js" type="text/javascript"></script>
        <script src="/car-pool/resources/bootstrap/js/jquery.infinitescroll.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            $('a#gotop').click(function () {
                $("html").animate({scrollTop: 0}, "slow");
                //alert('Animation complete.');
                //return false;
            });
        </script>


    </body>
</html>
