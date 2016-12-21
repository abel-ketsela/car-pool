
  $('#signup').click(function() {
      
      $("#loader").hide();
    $(document).ajaxStart(function() {
        $("#loader").show();
    }).ajaxStop(function() {
        $("#loader").hide();
    });
      var formData = {
            "fullName": $('#txtFullName').val(),
            "gender": $('#optGender').val(),
            "state": $('#txtState').val(),
            "city": $('#txtCity').val(),
            "street": $('#txtStreet').val(),
            "zipCode": $('#zipCode').val(),
            "dob": $('#txtDOB').val(),
            "email": $('#txtEmail').val(),
            "password": $('#txtPassword').val(),
            "zipCode": $('#txtZipCode').val(),            
            "ACTION": "USER.CREATE"

        };

            var age = validateAge()
            if (age <= 18){
                alert("Please ")
                return false;
            }else{
                
           alert(formData['fullName'] );
           console.log(formData);  
            $.ajax({
    
                type: 'POST',
                url: '/car-pool/user/add', 
                data: formData, //  
            })
          
            .done(function (data) {
            	alert("Succesfull")              
            });
        }
  });
  
    
  function validateAge(){
    var dob = $("#txtDOB").val();
        var now = new Date();
        var birthdate = dob.split("/");
        var born = new Date(birthdate[2], birthdate[1]-1, birthdate[0]);
        age=get_age(born,now);     
  }
 
    function get_age(born, now) {
      var birthday = new Date(now.getFullYear(), born.getMonth(), born.getDate());
      
        if (now >= birthday) 
        return now.getFullYear() - born.getFullYear();
      else
        return now.getFullYear() - born.getFullYear() - 1;
    }

 
