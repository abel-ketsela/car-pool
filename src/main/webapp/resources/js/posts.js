var commentDiv;
let postSize;
var commentBlankDiv;

$(document).ready(function () {   
	
	$.ajaxSetup ({
	    // Disable caching of AJAX responses
	    cache: false
	});
	
	var loading = true;
	loadAjax();  
	
	setInterval(checkForNewPost, (5 * 1000));
	
	function checkForNewPost()
	{
		 $.ajax("http://localhost:8080/car-pool/post/get?ACTION=POST.GET.REQUEST.NEW"
		            , {
		                "type": "GET",
		                "data":{"BELOW": $("#newId").val()}
		            }).done(loadNewNotification)    
	}
	
	function loadNewNotification(data)
	{
		if (data.length>0)
			{	$("#postNotify").remove();
				$("<div>").addClass("alert").addClass("alert-info").attr("id","postNotify")
							.append($("<a>").attr("href","#").on("click",loadAjax).text("New Post")) 
							.css("position","fixed")
							.css("width","100px")
							.css("top","0px")
							.css("left","50%")
							.appendTo($("body"))
									
				//loadRidePosts(data)
			}
		
	}
	
	var win = $(window);

	// Each time the user scrolls
	win.scroll(function() {
		
		// End of the document reached?
		if ($(document).height() - win.height() == win.scrollTop()) {
			//alert("reached");
			var loading = $("<img>").attr("src","/car-pool/resources/images/loading.gif")
									.css("margin-left","45%");
			$("#requestRideTab").append(loading)
			

			 $.ajax("http://localhost:8080/car-pool/post/get?ACTION=POST.GET.REQUEST"
			            , {
			                "type": "GET",
			                "data":{"BELOW": $("#stopId").val()}
			            }).done(function(data) { loadRidePosts(data); loading.remove()})     
			           
		}
	});
	
	
	
  
});


$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
	  var target = $(e.target).attr("href") // activated tab
	  if(target == "#provideRideTab"){
		  loadRideProvidePosts();
	  }
	});

function loadAjax(){ 	
  
	var loading = $("<img>").attr("src","/car-pool/resources/images/loading.gif")
							.css("margin-left","45%");
	$("#requestRideTab").append(loading)

    $.ajax("http://localhost:8080/car-pool/post/get?ACTION=POST.GET.REQUEST"
            , {
                "type": "GET",
                "data":{"BELOW": "99999"}
            }).done(function (data){$("#requestRideTab").children("div").remove(); loadRidePosts(data); loading.remove();})     
        
}

function loadRidePosts(data) {
    
//    let currentPosts = data.length;
//    if(currentPosts > postSize){
//        alert("Do somthing")
//    }else{
//        alert("No update")
//    }

	$("#postNotify").remove();
    for (let i=0 ; i < data.length  ; i++) {
    	
    	if (i==data.length-1)
    		{
    			$("#stopId").val(data[i].postId);
    		}
    	if (data[i].postId > $("#newId").val())
		{
			$("#newId").val(data[i].postId);
		}
    	
        var mediaDiv = $('<div>').addClass("media well")

        var img = $('<a>').addClass("pull-left").append(
                $('<img>').attr("alt", "Profile Picture")
                .attr("src", "/car-pool/resources/images/profile.png")
                    .css("width","64px")
                    .css("height","64px")
                .addClass("media-object")
                )
        var mediaDivBody = $('<div>').addClass("media-body")
        var mediaHeading = $('<h4>').addClass("media-heading").text(data[i].user.fullName)
        var mediaEmail = $('<p>').text(data[i].user.email)
        var mediaContent = $('<p>').text(data[i].post)
        var mediaComments = $('<button>').addClass("btn btn-primary")
                .text("Comments" ).attr("data-id", data[i].postId)
                .on('click', loadComments)



        mediaDiv.append(img).append(mediaDivBody)
                .append(mediaHeading).append(mediaEmail)
                .append(mediaContent).append(mediaComments).hide().fadeIn(i*700)
                .appendTo("#requestRideTab")

        
       // postSize = data.length;
       // alert(postSize)
    }

var currPost;
var currBtn;
    function loadComments() {    
    	currPost=$(this).attr("data-id");
    	currBtn=$(this);
        $.ajax("http://localhost:8080/car-pool/post/getComments"
                , {
                    "type": "GET",
                    "data": {
                        "postId": $(this).attr("data-id"),
                        "ACTION": "POST.GET.COMMENTS"

                    },
                }).done(getComments)
                
                
                 //alert("test")
        commentBlankDiv = $('<div>').addClass("media well posts").css("margin-left", "50px").append(
                $('<div>').addClass("col-sm-10")
                 .append($('<textarea>').attr("type", "textarea")
                                     .attr("data-id", $(this).attr("data-id"))
                                     .attr("rows","3")
                                     .attr("cols","100")
                                     .attr("placeholder","Write a comment")
                                     .addClass("form-control")
                          )
                .append($('<hr />'))
                .append($('<button>').click(addComment)
                .addClass("btn btn-primary")
                .text("Leave Comment" ).attr("data-id", currPost)));

		//$("[data-id='" + postId + "']").parent().append(commentBlankDiv);
		$(this).parent().append(commentBlankDiv);
                
                
    }
    
    function addComment() {    	
    	
    	//$(this).parent().remove()
        $.ajax("http://localhost:8080/car-pool/post/addComment"
                , {
                    "type": "GET",
                    "data": {
                        "postId": $(this).attr("data-id"),
                        "comment": $(this).siblings("textarea").val(),
                        "ACTION": "POST.ADD.COMMENTS"
                    },
                }).done(getComments)
                
                 $(this).siblings("textarea").val("")
                 
                 
    }
    
  
    
    function getComments(data) {  
    	
    	$("#userComments").remove();
    	
        for (var i = 0; i < data.length; i++) {        	

            var postId = data[i].postId;
            var id = data[i].commentId;
            var name = data[i].user.fullName;
            var email = data[i].user.email;
            var body = data[i].comment;
            var postArray = [postId, id, name, email, body];
            
            var commentsMediaDiv = $('<div>').addClass("media well posts").attr("id","userComments").css("margin-left", "50px")
            var img = $('<a>').addClass("pull-left").append(
                    $('<img>').attr("alt", "Profile Picture")
                    .attr("src", "/car-pool/resources/images/profile.png")
                    .css("width","64px")
                    .css("height","64px")
                    .addClass("media-object")
                    )
                    
                    
            var commentsMediaDivBody = $('<div>').addClass("media-body")
            
            var commentsMediaHeading = $('<h4>').addClass("media-heading").text(data[i].user.fullName)
            var commentsMediaEmail = $('<p>').text(data[i].user.email)
            var commentsMediaContent = $('<p>').text(data[i].comment)
           

                 
            commentDiv = commentsMediaDiv.append(img).append(commentsMediaDivBody)
                    			.append(commentsMediaHeading)
                    			.append(commentsMediaEmail)
                    			.append(commentsMediaContent)
                    			.appendTo(currBtn.parent());
                    			//.insertAfter("[data-id='" + postId + "']")
            
           
        }
        
     
        
        
        
       
          
    }

    $('#loadPosts').on('click', function generateDive() {
        for (var i = 0; i < 5; i++) {
            var commentsMediaDiv = $('<div>').addClass("media well")
            var commentsMediaDivBody = $('<div>').addClass("media-body")
            var commentsMediaHeading = $('<h4>').addClass("media-heading").text("Title" + i)
            var commentsMediaEmail = $('<p>').text("Email Sample" + i)
            var commentsMediaContent = $('<p>').text("Content Sample" + i)
            var loadMoreComments = $('<a>').text("Comments Sample" + i)
            commentDiv = commentsMediaDiv.append(commentsMediaDivBody).append(commentsMediaHeading).append(commentsMediaEmail).append(commentsMediaContent).append(loadMoreComments)

        }
    })
}

$('#newPostButton').on('click', function () {
	
    var postData = {
        "rideText": $('#postBody').val(),
        "rideType": $('input[name="postType"]:checked').val(),       
        "ACTION": "POST.CREATE"};
    console.log(postData);
		    $.ajax({
		        type: 'POST',
		        url: '/car-pool/post/newPost',
		        data: postData,
		    })
        .done(function(data){$("#newId").val($("#newId").val()+1);loadAjax(data);});
		$('#newPost').modal('toggle'); 
		   
})















/* -------------PROVIDE A RIDE POST ------------- */
function loadRideProvidePosts(){
	
    $.ajax("http://localhost:8080/car-pool/post/get?ACTION=POST.GET.PROVIDE"
            , {
                "type": "GET",
            }).done(loadRideProvidePostsData)
            .fail(ajaxFailure);      
    //alert("I have called ")
}

function loadRideProvidePostsData(data) {
	
//    let currentPosts = data.length;
//    if(currentPosts > postSize){
//        alert("Do somthing")
//    }else{
//        alert("No update")
//    }
$("#provideRideTab").children("div").remove();
	
    for (let i=0 ; i < data.length  ; i++) {
    	
        var mediaDiv = $('<div>').addClass("media well")

        var img = $('<a>').addClass("pull-left").append(
                $('<img>').attr("alt", "Profile Picture")
                .attr("src", "/car-pool/resources/images/profile.png")
                    .css("width","64px")
                    .css("height","64px")
                .addClass("media-object")
                )
        var mediaDivBody = $('<div>').addClass("media-body")
        var mediaHeading = $('<h4>').addClass("media-heading").text(data[i].user.fullName)
        var mediaEmail = $('<p>').text(data[i].user.email)
        var mediaContent = $('<p>').text(data[i].post)
        var mediaComments = $('<button>').addClass("btn btn-primary")
                .text("Comments" ).attr("data-id", data[i].postId)
                .on('click', loadComments)



        mediaDiv.append(img).append(mediaDivBody)
                .append(mediaHeading).append(mediaEmail)
                .append(mediaContent).append(mediaComments)
                .appendTo("#provideRideTab")

        
       // postSize = data.length;
       // alert(postSize)
    }

var currPost;
    function loadComments() {
    	currPost=$(this).attr("data-id");
        $.ajax("http://localhost:8080/car-pool/post/getComments"
                , {
                    "type": "GET",
                    "data": {
                        "postId": $(this).attr("data-id"),
                        "ACTION": "POST.GET.COMMENTS"

                    },
                }).done(getComments)

    }
    
    function addComment() {
    	
    	$("#media #well #posts").remove();
    	
        $.ajax("http://localhost:8080/car-pool/post/addComment"
                , {
                    "type": "GET",
                    "data": {
                        "postId": $(this).attr("data-id"),
                        "comment": $(this).siblings("textarea").val(),
                        "ACTION": "POST.ADD.COMMENTS"

                    },
                }).always(getComments)
                
                 $(this).siblings("textarea").val("")
    }


    function getComments(data) {

      alert("test")
    	
        for (var i = 0; i < data.length; i++) {
        	

            var postId = data[i].postId;
            var id = data[i].commentId;
            var name = data[i].user.fullName;
            var email = data[i].user.email;
            var body = data[i].comment;
            var postArray = [postId, id, name, email, body];
            
            var commentsMediaDiv = $('<div>').addClass("media well posts").css("margin-left", "50px")
            var img = $('<a>').addClass("pull-left").append(
                    $('<img>').attr("alt", "Profile Picture")
                   .attr("src", "/car-pool/resources/images/profile.png")
                    .css("width","64px")
                    .css("height","64px")
                    .addClass("media-object")
                    )
            var commentsMediaDivBody = $('<div>').addClass("media-body")
            
            var commentsMediaHeading = $('<h4>').addClass("media-heading").text(data[i].user.fullName)
            var commentsMediaEmail = $('<p>').text(data[i].user.email)
            var commentsMediaContent = $('<p>').text(data[i].comment)
           

                 
            commentDiv = commentsMediaDiv.append(img).append(commentsMediaDivBody)
                    			.append(commentsMediaHeading)
                    			.append(commentsMediaEmail)
                    			.append(commentsMediaContent)
                    			.insertAfter("[data-id='" + postId + "']")
            
           
        }
        
        commentBlankDiv = $('<div>').addClass("media well posts").css("margin-left", "50px").append(
                               $('<div>').addClass("col-sm-10")
                                .append($('<textarea>').attr("type", "textarea")
                                                    .attr("data-id", $(this).attr("data-id"))
                                                    .attr("rows","3")
                                                    .attr("cols","100")
                                                    .attr("placeholder","Write a comment")
                                                    .addClass("form-control")
                                         )
                               .append($('<button>').click(addComment)
                               .addClass("btn btn-primary")
                               .text("Leave Comment" ).attr("data-id", currPost)));
                              
                  
                 

             $("[data-id='" + postId + "']").parent().append(commentBlankDiv);
          
    }

    $('#loadPosts').on('click', function generateDive() {
        for (var i = 0; i < 5; i++) {
            var commentsMediaDiv = $('<div>').addClass("media well")
            var commentsMediaDivBody = $('<div>').addClass("media-body")
            var commentsMediaHeading = $('<h4>').addClass("media-heading").text("Title" + i)
            var commentsMediaEmail = $('<p>').text("Email Sample" + i)
            var commentsMediaContent = $('<p>').text("Content Sample" + i)
            var loadMoreComments = $('<a>').text("Comments Sample" + i)
            commentDiv = commentsMediaDiv.append(commentsMediaDivBody).append(commentsMediaHeading).append(commentsMediaEmail).append(commentsMediaContent).append(loadMoreComments)

        }
    })
}


/*-- SCROLL  */
/*
$(function(){
	loadAjax(); 	
	//Scoll the event of the main div
	$("#tab").Scroll(function(){
			//Get the maximum and current scroll
					var maxScroll = $(this)[0].scrollTop;
					var curScroll = $(this)[0].scrollHeight - $(this).height();
					// Are we the bottom now?
						if((curScroll == maxScroll) && loading == false){		
							//When start loading 
							loading= true;
						alert(loading)
						//add loading box
							$("#tab").appaend("<div class='loading'>" + "Loading ........." + "</div>")
						// Scroll to the bottom of the page
							$(this)[0].scrollTop = $(this)[0].scrollHeight - $(this).height();
						// load more photos
							loadAjax();
						}
	})
		
})*/
