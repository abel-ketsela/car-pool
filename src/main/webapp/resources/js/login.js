
$("#loader").hide();
                $(document).ajaxStart(function() {
                $("#loader").show();
                }).ajaxStop(function() {
                 $("#loader").hide();
                });
/*
$('#signIn').click(function() {
//      
        alert("test");
    
      var formData = {
            "loginId": $('#loginId').val(),          
            "password": $('#password').val(),           
            "ACTION": "USER.LOGIN"

};

          
            console.log(formData);
            $.ajax({    
                type: 'POST',
                url: '/car-pool/user/login', 
                data: formData,   
            })
         
            .done(function (data) {
             alert("Succesfull")
              
            });

  });*/



 


