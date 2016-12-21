            "use strict";
                $(function() {                    
                var postId;
                var userId;
                var commentId;

                $(document).ready(function() {
                  //  alert("Current requested ID is :" + $('#textId').val())
                  $('#rideRequesPosts').empty();
                    $.ajax("http://jsonplaceholder.typicode.com/users?"
                           , {
                        "type": "GET",
                        "data": {
                            "id":  $('#textId').val()

                        },
                    }) .done(ajaxSuccess)
                      .fail(ajaxFailure);
                });
                
                $('#go').click(function() {
                  //  alert("Current requested ID is :" + $('#textId').val())
                    $.ajax("http://jsonplaceholder.typicode.com/users?"
                           , {
                        "type": "GET",
                        "data": {
                            "id":  $('#textId').val()

                        },
                    }) .done(ajaxSuccess)
                      .fail(ajaxFailure);
                });



            });

            var postDiv;
            var commentsDiv;
            var commentsDivNew;
            var divId;


            function ajaxSuccess(data) { 
                $('#ridePostPosts').empty(); 

                for (var i = 0; i < data.length;  i++) {  
                    var userId = data[i].id;
                    var name = data[i].name;
                    var email = data[i].email;
                    var street = data[i].address.street;        
                    var detailsArray = [name, email, street];       

                   // console.log(detailsArray);
                    for(let l = 0; l < detailsArray.length; l++){
                        $('<li>').text(detailsArray[l]).appendTo('#ridePostPosts')
                    }
                    divId = "div" + data[i].id

                    postDiv = $('<div>').css({
                                    "background-color": "white",
                                    "font-size": "100%",
                                    "height" : "auto"
                                    }).attr('data-id',  divId )/*.on('click', function(){
                                                                                alert("My div  : " + $(this).attr("data-id"))
                                })*/

                                .appendTo('#ridePostPosts'); 

                    var showPostsBtn = $('<button>').css({"background-color" : "yellow",
                                      "float": "right",
                                      "height" : "30px"}).text("Show Posts " + userId)
                                        .attr("data-id", userId).on('click', showPosts);



                    postDiv.append(showPostsBtn);

                    } // End of for loop for main


            }

            function showPosts(){
                //alert("Current requested ID is :" +$(this).attr("data-id"))

                $.ajax("http://jsonplaceholder.typicode.com/posts?"
                       , {
                    "type": "GET",
                    "data": {
                        "userId":  $(this).attr("data-id")

                    },
                })  .done(getPosts)
                    .fail(ajaxFailure);
            }

            function getPosts(data){

               // console.log(data.length); 

              //  alert(data.length)

                /* Clear the data for later use */ 

                 for (var i = 0; i < data.length;  i++) {  
                    var postId = data[i].id;
                    var title = data[i].title;
                    var body = data[i].body;           
                    var postArray = [postId, title, body]; 

                     postDiv.append($('<h3>').text("Id :" + postArray[0]).append(
                                        $('<h2>').text("Title: " + postArray[1])).append(
                                        $('<p>').text("Body: " + postArray[2])) 
                     )

                     var showCommentsBtn = $('<button>').css({"float": "right",
                                                              "height" : "30px"}).text("Show Commennts " + postId)
                     .attr("data-id", postId).on('click', showComments);    



                     postDiv.append(showCommentsBtn).append($('<hr />'));

                     var commentDivId = "cDiv-" + postId;

                     commentsDiv = $('<div>').css({
                                 "background-color": "grey",
                                 "font-size": "100%",
                                 "height" : "auto"
                            }).attr('data-id',  commentDivId )

                 }
            }

            function showComments(){
               // alert("Current Comment ID is :" + $(this).attr("data-id"))

               // alert("Curruent Post Div Id is :" + divId)
                $.ajax("http://jsonplaceholder.typicode.com/comments"
                       , {
                    "type": "GET",
                    "data": {
                        "postId":  $(this).attr("data-id")

                    },
                })  .done(getComments)
                    .fail(ajaxFailure);
            }

            function getComments(data){
               // alert("please call me .................")
               // console.log(data); 
              //  alert(data.length)
                for (var i = 0; i < data.length;  i++) {  
                    var postId = data[i].postId;
                    var id = data[i].id;
                    var name = data[i].name; 
                    var email = data[i].email;
                    var body = data[i].body; 

                    var postArray = [postId, id, name, email, body];  

                    var comments  = $('<h3>').text("Post Id :" + postArray[0]).append(
                        $('<h2>').text("Comment Id: " + postArray[1])).append(
                        $('<p>').text("name: " + postArray[2])).append(
                        $('<p>').text("email: " + postArray[3])).append(
                        $('<p>').text("body: " + postArray[4])).append($('<hr />')).insertAfter("[data-id='"+postId+"']")

                }
            }


            function ajaxFailure() {
                $('#errors').text('An ajax error occurred.');
            }

