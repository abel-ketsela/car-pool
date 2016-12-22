<%-- 
    Document   : iindex_
    Created on : Dec 20, 2016, 8:38:05 AM
    Author     : samue
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ taglib uri="/WEB-INF/custom.tld" prefix="l" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1252">
<title>CAR Pooling</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="/car-pool/resources/js/weather.js"></script>
<link href="/car-pool/resources/bootstrap/css/bootstrap.css"
	rel="stylesheet" type="text/css" />

<style type="text/css">
#gotop {
	cursor: pointer;
	position: relative;
	float: right;
	right: 20px;
	/*top:0px;*/
}


.newPostNotify {
	position: fixed;
	top: opx;
	left: 50%;
    background: radial-gradient( 5px -9px, circle, white 8%, red 26px );
    background-color: blue;
    width: 200px;
    border: 2px solid white;
    border-radius: 12px; /* one half of ( (border * 2) + height + padding ) */
    box-shadow: 1px 1px 1px black;
    color: white;
    font: bold 15px/13px Helvetica, Verdana, Tahoma;
    height: 16px; 
    min-width: 14px;
    padding: 4px 3px 0 3px;
    text-align: center;
    z-index:10;
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

								<button type="button" class="navbar-toggle"
									data-toggle="collapse"
									data-target="#bs-example-navbar-collapse-1">
									<span class="sr-only">Toggle navigation</span><span
										class="icon-bar"></span><span class="icon-bar"></span><span
										class="icon-bar"></span>
								</button>
								<!--<a class="navbar-brand" href="#">CAR POOLING</a> -->
								 <a class="navbar-brand" href="#">
								 <img src="/car-pool/resources/images/ride-pool.png" width="44px" style="margin-top:1px" alt="CAR POOLING">
								  </a> 
       							<l:logo text="CAR POOLING" foreColor="#82030c"></l:logo>
								
							</div>

							<div class="collapse navbar-collapse navbar-right"
								id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav">

									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown">My Account<strong class="caret"></strong></a>
										<ul class="dropdown-menu">
											<li><a href="#">Update Profile</a></li>

											<li class="divider"></li>
											<li><a href="#">Travel History</a></li>
											<li class="divider"></li>
											<li><a href="#">Logout</a></li>
										</ul></li>
								</ul>
								<form class="navbar-form navbar-left" id="city-form"
									role="search">
									<div class="form-group">
										<input type="text" class="form-control" id="txtStateName" 
											placeholder="Enter State "  />
									</div>
									<div class="form-group">
										<input type="text" class="form-control" id="txtCityName"
											placeholder="Enter City " />
									</div>
									<div class="form-group">
										<input type="text" class="form-control" id="txtZip" 
											placeholder="Enter Zip code " />
											<input type="hidden" id="txtZipCodeHidden" value="${currentUser.zipCode}" />
									</div>
									<button type="submit" class="btn btn-default">Search
										Weather Info</button>
								</form>
								
								
							</div>

						</nav>

					</div>
				</div>



				<div class="row">

					<div class="col-md-4">
						<div>

							<div class="jumbotron">
								<h2>Welcome ${currentUser.fullName} </h2>
								<h3> here is your city weather information on the current area</h3>
						<div class="panel-body jumbotron">
									<div class="row col-lg-12 daily">
										<div class="col-lg-12">
											Country: <span id="spanCountry"></span>
										</div>
										<div class="col-lg-12">
											City: <span id="spanCity"></span>
										</div>
										<div class="col-lg-12">
											Temperature: <span id="spanTemperature"></span>
										</div>
										<div class="col-lg-12">
											Weather: <span id="spanWeather"></span>
										</div>
										<div class="col-lg-12" id="show_images" style="width: auto;"></div>					
									</div>
								</div>							
							</div>
						</div>
						
						<div class="row">
								<div class="panel-heading">Map</div>
								<div class="panel-body jumbotron ">
									<div class="row col-lg-12">
										<div id="map" style="width: 100%; height: 300px;"></div>
									</div>
								</div>
						</div>
						
						<div class="row">
								<div class="panel-heading jumbotron">Five Days Weather</div>
								<div class="panel-body">
									<div class="row col-lg-12 row" id="fiveDays">
										<div class="col-lg-2"></div>
									</div>
								</div>
						</div>
						<div class="row">
						<div class="panel-heading">Weather Detail</div>
						<div class="panel-body">
							<div class="row col-lg-12 daily">
			
								<div class="col-lg-12">
									Humidity: <span id="spanHumidity"></span>
								</div>
								<div class="col-lg-12">
									Pressure: <span id="spanPressure"></span>
								</div>
								<div class="col-lg-12">
									Visibility: <span id="spanVisibility"></span>
								</div>
								<div class="col-lg-12">
									Temp Min/Max: <span id="spanMinMax"></span>
								</div>
			
							</div>
						</div>
						</div>
					</div>
					
					
					<div class="col-md-8">

						<div id="posts"></div>
						<input type="hidden" id="stopId" value="9999"/>
						<input type="hidden" id="newId" value="0"/>
						<div class="tabbable" id="tab">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#requestRideTab"
									data-toggle="tab">Request Ride</a></li>
								<li><a href="#provideRideTab" data-toggle="tab">Provide
										Ride </a></li>
								<li><a href="#newPost" data-toggle="modal">You have
										some thing to post? </a></li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane active" id="requestRideTab">
									<p></p>
								</div>
								<div class="tab-pane" id="provideRideTab">
									<p></p>

								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>


	<!-- POST MODAL -->
	<div class="modal fade" id="newPost" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">

					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">
						<p>Your Post</p>
					</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<label class="col-sm-2 control-label"> Message </label>
							<div class="col-sm-10">
								<textarea id="postBody" rows="4" cols="50"
									placeholder="Enter your post...."></textarea>


							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="checkbox">

									<label><input type="radio" id="postType"
										name="postType" value="REQUEST">Request Ride</label> <label><input
										type="radio" id="postType" name="postType" value="PROVIDE">Provide
										Ride</label>


								</div>
							</div>
						</div>

					</form>
				</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-default" data-dismiss="modal">
						Close</button>
					<button id="newPostButton" type="newPost" class="btn btn-primary">
						Post it!!</button>
				</div>
			</div>

		</div>

	</div>
	<!-- END POST MODAL -->

	<!-- COMMENT MODAL -->

	<!-- COMMENT MODAL -->

	
	<!--  weather end  -->

	<a id="gotop" href="#">Go Top </a>
	<footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b>Version</b> 1.0
		</div>
		<strong>Copyright © 2016 <a href="">CAR POOLING.</strong> All
		rights reserved.
	</footer>

	<script src="/car-pool/resources/bootstrap/js/jquery.min.js"
		type="text/javascript"></script>
	<script src="/car-pool/resources/bootstrap/js/bootstrap.js"
		type="text/javascript"></script>
	<script src="/car-pool/resources/js/rideRequest.js"
		type="text/javascript"></script>
	<script src="/car-pool/resources/js/scroll.js"
		type="text/javascript"></script>
	<script src="/car-pool/resources/js/posts.js" type="text/javascript"></script>
	<!--   <script src="/car-pool/resources/js/provideRequest.js"
		type="text/javascript"></script>-->
	<script
		src="/car-pool/resources/bootstrap/js/jquery.infinitescroll.min.js"
		type="text/javascript"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAm6Pl25udn3_CdnlmDjUsUjfbDQeY-ooc&callback=initMap"></script>
	<script type="text/javascript">
		$('a#gotop').click(function() {
			$("html").animate({
				scrollTop : 0
			}, "slow");
			//alert('Animation complete.');
			//return false;
		});
	</script>


</body>
</html>
