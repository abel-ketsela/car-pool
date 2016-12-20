
  $('#signup').click(function() {
      
      $("#loader").hide();
    $(document).ajaxStart(function() {
        $("#loader").show();
    }).ajaxStop(function() {
        $("#loader").hide();
    });
      var formData = {
            "fullName": $('#txtFullName').val(),
            "gender": $('#txtGender').val(),
            "state": $('#txtState').val(),
            "city": $('#txtCity').val(),
            "street": $('#txtStreet').val(),
            "zipCode": $('#zipCode').val(),
            "dob": $('#txtDOB').val(),
            "email": $('#txtEmail').val(),
            "password": $('#txtPassword').val(),
            "ACTION": "USER.CREATE"

};

            alert(formData['fullName'] );
           console.log(formData);
            
            // process the form
            
            $.ajax({
    
                type: 'POST', 
                crossDomain: true,
                url: '/user/add', 
                data: formData, // our data object    
                encode: true
            })
            // using the done promise callback
            .done(function (data) {

                // log data to the console so we can see
                for(var i=0; i<data.length; i++){
                    alert(data[i]);
                }
                console.log(data);


                // here we will handle errors and validation messages
            });

  });
 
