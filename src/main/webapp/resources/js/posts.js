$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
    var target = $(e.target).attr("href") // activated tab
  
});


var commentDiv;
let postSize;
var commentBlankDiv;
$(document).ready(function () {    
     loadAjax();  
  //  setInterval(loadAjax, (1 * 1000));
});

function loadAjax(){
    
    $.ajax("http://localhost:8080/car-pool/post/get?ACTION=POST.GET.REQUEST"
            , {
                "type": "GET",
            }).done(loadRidePosts)
            .fail(ajaxFailure);      
    //alert("I have called ")
}

function loadRidePosts(data) {
    
//    let currentPosts = data.length;
//    if(currentPosts > postSize){
//        alert("Do somthing")
//    }else{
//        alert("No update")
//    }

    for (let i=0 ; i < data.length  ; i++) {
        var mediaDiv = $('<div>').addClass("media well")

        var img = $('<a>').addClass("pull-left").append(
                $('<img>').attr("alt", "Profile Picture")
                .attr("src", "http://lorempixel.com/64/64/")
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
                .appendTo("#requestRideTab")

        
       // postSize = data.length;
       // alert(postSize)
    }


    function loadComments() {
        $.ajax("http://jsonplaceholder.typicode.com/comments"
                , {
                    "type": "GET",
                    "data": {
                        "postId": $(this).attr("data-id")

                    },
                }).done(getComments)

    }

    function getComments(data) {

      
             
        for (var i = 0; i < data.length; i++) {
        	

            var postId = data[i].postId;
            var id = data[i].id;
            var name = data[i].name;
            var email = data[i].email;
            var body = data[i].body;
            var postArray = [postId, id, name, email, body];
            
            var commentsMediaDiv = $('<div>').addClass("media well posts").css("margin-left", "50px")
            var img = $('<a>').addClass("pull-left").append(
                    $('<img>').attr("alt", "Profile Picture")
                    .attr("src", "http://lorempixel.com/64/64/")
                    .addClass("media-object")
                    )
            var commentsMediaDivBody = $('<div>').addClass("media-body")
            var commentsMediaHeading = $('<h4>').addClass("media-heading").text("Title" + i)
            var commentsMediaEmail = $('<p>').text("Email Sample" + i)
            var commentsMediaContent = $('<p>').text("Content Sample" + i)
            var loadMoreComments = $('<a>').text("Comments Sample" + i)

                 
            commentDiv = commentsMediaDiv.append(img).append(commentsMediaDivBody)
                    .append(commentsMediaHeading).append(commentsMediaEmail).append(commentsMediaContent).append(loadMoreComments).insertAfter("[data-id='" + postId + "']")
            
           
        }
        
        commentBlankDiv = $('<div>').addClass("media well posts").css("margin-left", "50px").append(
                   $('<form>').addClass("form-horizontal")
                    .attr("role", "form").append($('<div>').addClass("form-group").append(
                               $('<div>').addClass("col-sm-10")
                                .append($('<input>').attr("type", "textarea")
                                                    .attr("data-id", $(this).attr("data-id"))
                                                    .addClass("form-control"))
                                )).append($('<div>').addClass("form-group").append(
                                $('<div>').addClass("col-sm-10")
                                .append($('<button>').attr("value", "Comment")
                                                    .attr("data-id", 1)
                                                   .addClass("form-control"))
                               ))
                  )
                 

             commentBlankDiv.insertAfter("[data-id='" + postId + "']")
          
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
$('#newPost').on('click', function () {
    var postData = {
        "post": $('#postBody').text(),
        "postType": $('#postType').val(),
        "ACTION": "POST.CREATE"};
    console.log(formData);
    $.ajax({
        type: 'POST',
        url: '/car-pool/post/newPost',
        data: postData,
    })
            .done(function (data) {
                alert("Succesfull")
            });

})


function updatePostList(){
    
}
