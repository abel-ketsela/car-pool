
$(document).ready(		
		function() {
			$('#txtDOB').datepicker({}).on('changeDate', dateChanged);
			var age;

			function dateChanged(ev) {
				var dob = $("#txtDOB").val();
				var now = new Date();
				var birthdate = dob.split("/");
				var born = new Date(birthdate[2], birthdate[1] - 1,
						birthdate[0]);
				age = get_age(born, now);
				
			}

			function get_age(born, now) {
				var birthday = new Date(now.getFullYear(), born.getMonth(),
						born.getDate());

				if (now >= birthday)
					return now.getFullYear() - born.getFullYear();
				else
					return now.getFullYear() - born.getFullYear() - 1;

			}
			alert(age);
			$('#signup').click(function() {
				var formData = {
					"fullName" : $('#txtFullName').val(),
					"gender" : $('#optGender').val(),
					"state" : $('#txtState').val(),
					"city" : $('#txtCity').val(),
					"street" : $('#txtStreet').val(),
					"zipCode" : $('#zipCode').val(),
					"dob" : $('#txtDOB').val(),
					"email" : $('#txtEmail').val(),
					"password" : $('#txtPassword').val(),
					"zipCode" : $('#txtZipCode').val(),
					"ACTION" : "USER.CREATE"

				};

				
				if (age <= 18 || age==="undefined") {
					alert("Please check your age, we only allow age 18 and above your current age is : " + age)
					return false;
				} else {

					//alert(formData['fullName']);
					console.log(formData);
					$.ajax({
						type : 'POST',
						url : '/car-pool/user/add',
						data : formData, //  
					})

					.done(function(data) {
					alert("Succesfully Registerd")
					});
				}
			});


		})

