/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
           
"use strict";
  
           function getDailyWeatherWithGeo(pos)
           {
               $.ajax("http://api.openweathermap.org/data/2.5/weather?lat="+pos.lat+"&lon="+pos.lng+"&units=imperial&appid=95edb73272b4dd14ab4ba0d82aefcd0e", {"type": "GET","data": { "userId": $(this).parent().attr("user-id")}})
           .done(displayDailyWeather)
           .fail(ajaxFailure);  
           }
           function getDailyWeatherWithName()
           {
               
           }
           function getDailyWeatherWithID()
           {
               
           }
           function displayDailyWeather(data){
               console.log(data);
               show_images
               $('#show_images').empty();
               $('span').css({fontSize: "15px"});
               $("#spanCountry")                       
                       .text(data.sys.country);
               $("#spanCity")
                       .text(data.name);
               $("#spanTemperature")
                       .css({fontSize: "50px",color: "green"})                     
                       .text(data.main.temp)
                       .append("&#8457;");
               $("#spanWeather")
                       .text(data.weather[0].main);
               $("#spanHumidity")
                       .text(data.main.humidity)
                       .append("%");
               $("#spanPressure")
                       .text(data.main.pressure)
                       .append("in");
                $("#spanVisibility")
                       .text(data.visibility)
                       .append("mi");;
               $("#spanMinMax")
                       .text(data.main.temp_min+"/"+data.main.temp_max)
                       .append("&#8457;");
               $('<img />').attr('src',"http://openweathermap.org/img/w/"+data.weather[0].icon+".png"+"")      
                            .attr('title', "cool")
                            .attr('alt', "icon")
                            .width('113px').height('113px')
                        .appendTo($('#show_images')); 
           }
           function ajaxFailure() {
	$('#errors').text('An ajax error occurred.');
}
function dailyDetail(data)
{
     var selectedDate=$(this).attr("data-id");
    // var selectedDate=data.currentDate
     console.log(selectedDate+"uou"+data);
      $('#fiveDaysDetail').empty();
     for ( var key=0; key < data.list.length;key++) { 
     if(datechange(selectedDate)===datechange(data.list[key].dt_txt))
     {
         console.log(datechange(data.list[key].dt_txt));
          var currentDay= datechange(data.list[key].dt_txt);
      
        var day=$('<p>') 
                .text(currentDay);
        var temp=$('<p>').text(data.list[key].main.temp).append("&#8457;");
        var decription=$('<p>').text(data.list[key].weather[0].description);
        var dateTime=$('<p>').text(data.list[key].dt_txt);
        var icon=$('<img />').attr('src',"http://openweathermap.org/img/w/"+data.list[key].weather[0].icon+".png"+"")      
                            .attr('title', "cool")
                            .attr('alt', "icon")
                            .width('113px').height('113px');
        $('<div>')
                .attr("forcastDId",datechange(data.list[key].dt_txt))
                .append(day)
                .append(dateTime)
                .append(temp)
                .append(decription)
                .append(icon)
                .css({fontSize: "12px",color: "blue"})
                .addClass("col-lg-12")            
                .appendTo('#fiveDaysDetail'); 
     }
    }
}

               function getFiveWeather(city){
                    $('#fiveDays').empty();
          $.get("http://api.openweathermap.org/data/2.5/forecast?q="+city+"&units=imperial&appid=95edb73272b4dd14ab4ba0d82aefcd0e",function(data){ 
    console.log(data);
     data.currentDate=datechange(data.list[0].dt_txt);
      dailyDetail(data);
    for (var key=0; key < data.list.length;key=key+8) { 
       var currentDay= datechange(data.list[key].dt_txt);      
        var day=$('<p>') 
                .text(currentDay);
        var temp=$('<p>').text(data.list[key].main.temp).append("&#8457;");
        var decription=$('<p>').text(data.list[key].weather[0].description);
        var dateTime=$('<p>').text(data.list[key].dt_txt);
        var icon=$('<img />').attr('src',"http://openweathermap.org/img/w/"+data.list[key].weather[0].icon+".png"+"")      
                            .attr('title', "cool")
                            .attr('alt', "icon")
                            .width('113px').height('113px');
        data.currentDate=data.list[key].dt_txt;
                  $('<div>')
                .attr("data-id",datechange(data.list[key].dt_txt))        
                .append(day)
                .append(dateTime)
                .append(temp)
                .append(decription)
                .append(icon)
                .css({fontSize: "12px",color: "blue"})
                .addClass("col-lg-2")
                /*.append($('<button>')
                          .text('show post')
                          .on('click',function(){ 
                    dailyDetail(data);
               })) */      
                .on('click',function(){ 
                   dailyDetail(data);
               }).appendTo('#fiveDays');
}
})
}


function GoeWithCurrentLocation()
{
                  var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat:40.6103384, lng:-92.82779629999999},
          zoom: 10
        });
        
        var infoWindow = new google.maps.InfoWindow({map: map});
        // Try HTML5 geolocation.
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
            infoWindow.setPosition(pos);
            infoWindow.setContent('Location found.'+"<br>"+pos.lat+pos.lng);
            map.setCenter(pos);       
            getDailyWeatherWithGeo(pos)
          }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
          });
        } else {
          // Browser doesn't support Geolocation
          handleLocationError(false, infoWindow, map.getCenter());
        }
            
}
function geoLocater(address)
{
          var geocoder = new google.maps.Geocoder();
            // "52557 Fairfield IOWA";
            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    var latitude = results[0].geometry.location.lat();
                    var longitude = results[0].geometry.location.lng();
                    console.log("Latitude: " + latitude + "\nLongitude: " + longitude);
                  
                   var map=   new google.maps.Map(document.getElementById('map'), {
          center: {lat:latitude, lng: longitude},
          zoom: 10
        });
           var pos = {
              lat: latitude,
              lng: longitude
            };
               new google.maps.Marker({
          position: pos,
          map: map,
          title: 'Hello World!'
        });
         getDailyWeatherWithGeo(pos);
                } else {
                    GoeWithCurrentLocation();
           }
            });
}
      function initMap() {
    	  
    	 
          
      var Adress=$('#txtZipCodeHidden').val(); 
      geoLocater(Adress);
      getFiveWeather(Adress);      
        $("#city-form").submit(function(event){
               event.preventDefault();
               var txtStateName=$("#txtStateName").val();
               var txtCityName=$("#txtCityName").val();
               var txtZip=$("#txtZip").val();               
               Adress=txtZip+txtCityName+txtStateName;
               geoLocater(Adress);
               getFiveWeather(Adress);
           } );
      }
      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
      }
  
function placeMarker(map, lon,lat) {
  var marker = new google.maps.Marker({
    position: new google.maps.LatLng( lat,lon),
    map: map
  });
  var infowindow = new google.maps.InfoWindow({
    content: 'Latitude: ' +lat + '<br>Longitude: ' + lon
  });
  infowindow.open(map,marker);
}
function datechange(givenDate){
var d = new Date(givenDate);
var weekday = new Array(7);
weekday[0] =  "Sunday";
weekday[1] = "Monday";
weekday[2] = "Tuesday";
weekday[3] = "Wednesday";
weekday[4] = "Thursday";
weekday[5] = "Friday";
weekday[6] = "Saturday";
var n = weekday[d.getDay()];
return n;
}
      