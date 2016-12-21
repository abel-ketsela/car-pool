
$("#loader").hide();
                $(document).ajaxStart(function() {
                $("#loader").show();
                }).ajaxStop(function() {
                 $("#loader").hide();
                });

$('#newPost').click(function() {
//      
        
    
      var formData = {
            "post": $('#postMessage').text(),          
            "postType": $('#postType').val(),           
            "ACTION": "POST.CREATE"};

          
            console.log(formData);
            $.ajax({    
                type: 'POST',
                url: '/car-pool/user/login', 
                data: formData,   
            })
         
            .done(function (data) {
             alert("Succesfull")
              
            });

  });



 




