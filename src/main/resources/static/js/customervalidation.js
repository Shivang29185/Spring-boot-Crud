$(document).ready(function() {

	$('.AddupdateCustomer').click(function() {
		$('#myModal').fadeIn(2000);
		$("#updateHiddenId").val(0);
	});

	$('.customerupdate').click(function() {
		$('#myModal').fadeIn(2000);
	});

	$('.close').click(function() {
		$("#myModal").fadeOut(2000);
		$("#form").trigger('reset');
	});

	function Totalvalidation() {
		$("#form").validate({
			rules: {
				firstName: {
					required: true,
					minlength: 3,
					nowhitespace: true,
					lettersonly: true,
					maxlength: 15,
				},
				lastName: {
					required: true,
					minlength: 3,
					nowhitespace: true,
					lettersonly: true,
					maxlength: 15,
				},
				dateOfBirth: {
					required: true
				},
				mobile: {
					required: true,
					minlength: 10,
					maxlength: 17,
					nowhitespace: true,
					number: true,
				},
				address1: {
					required: true,
					nowhitespace: true,
					minlength: 10,
					maxlength: 40
				},
				address2: {
					nowhitespace: true,
					minlength: 10,
					maxlength: 40
				},
				age: {
					required: true,
					number: true,
					max: 120,
				},
				gender: {
					required: true
				},
				email: {
					required: true,
					email: true,
					maxlength: 40,
				}
			},
			messages: {
				firstName: {
					maxlength: "Maximum length of First name must be 15"
				},
				lastName: {
					maxlength: "Maximum length of Last name must be 15"
				},
				mobile: {
					minlength: "Mobile no must be of minimum 10 digits",
					maxlength: "Mobile no must be of maximum 17 digits"
				},
				address1: {
					maxlength: "Maximum length of Address1 must be 30"
				},
				address2: {
					maxlength: "Maximum length of Address1 must be 30"
				},
				age: {
					max: "your age must be less than 120 "
				},
				email: {
					email: "Please enter valid Email"
				},
			},
		})
	}
	
	$("#letter").keypress(function(event) {
		$('#errorMsg').text("");
		var inputValue = event.charCode;
		if (!((inputValue > 64 && inputValue < 91) || (inputValue > 96 && inputValue < 123) || (inputValue == 32) || (inputValue == 0))) {
			event.preventDefault();
		}
	});

	$("#letters").keypress(function(event) {
		$('#errorMsg').text("");
		var inputValue = event.charCode;
		if (!((inputValue > 64 && inputValue < 91) || (inputValue > 96 && inputValue < 123) || (inputValue == 32) || (inputValue == 0))) {
			event.preventDefault();
		}
	});

	$("#numbers").keypress(function(event) {
		$('#errorMsg').text("");
		var inputValue = event.charCode;
		if (!((inputValue > 47 && inputValue < 58) || (inputValue == 32) || (inputValue == 0))) {
			event.preventDefault();
		}
	});

	var age = "";
	$('#date').datepicker({
		
		onSelect: function() {
			$('#errorMsg').text("");
			var today = new Date($("input[name='dateOfBirth']").val());
			age = 2022 - today.getFullYear();
			$('#age').val(age);
		},
		required: true,
		showOn: 'button',
		buttonImageOnly: true,
		buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
		changeMonth: true,
		changeYear: true,
		maxDate: '0d',
		dateFormat: 'dd-mm-yy',
		
	});

	$('.customerupdate').click(function() {
		if($(this).hasClass('customerupdate')){ $('.modal-body .title').text("Update Customer"); $('.modal-body .description').text("You can update customer details  here..!"); }
		let names = ($(this).parent().siblings('.name').text().trim()).split(' ')
		let dob = $(this).parent().siblings('.dob').text().trim()
		let addresses = ($(this).parent().siblings('.address').text().trim()).split(' ')
		let email = $(this).parent().siblings('.email').text().trim()
		let age = $(this).parent().siblings('.age').text().trim()
		let mobile = $(this).parent().siblings('.mobile').text().trim()
		let gender = ($(this).parent().siblings('.gender').text().trim() === 'Male') ? 0 : 1;
		let id = $(this).attr('dataId');

		$("input[name='firstName']").val(names[0])
		$("input[name='lastName']").val(names[1])
		$("input[name='address1']").val(addresses[0])
		$("input[name='address2']").val(addresses[1])
		$("input[name='dateOfBirth']").val(dob)
		$("input[name='email']").val(email)
		$("input[name='mobile']").val(mobile)
		$("input[name='age']").val(age)
		$("input[value=" + gender + "]").prop('checked', true);
		$("#updateHiddenId").val(id);

	});

	$('#form').on('submit', function(e) {

		e.preventDefault();
		Totalvalidation();
		if ($('#form').valid()) {
			callAPI();
		}

		function callAPI() {

			let enteredFirstName = $("input[name='firstname']").val().trim();
			let enteredLastName = $("input[name='lastname']").val()
			let enteredAddressOne = $("input[name='address1']").val()
			let enteredAddressTwo = $("input[name='address2']").val()
			let enteredDateOfBirth = $("input[name='dateofbirth']").val()
			let enteredEmail = $("input[name='email']").val()
			let enteredMobileNumber = $("input[name='mobile']").val()
			let enteredAge = $("input[name='age']").val()
			let enteredGender = $('input[name="gender"]:checked').val();;
			let enteredId = $("#updateHiddenId").val();
			$.ajax({
				type: "POST",
				url: "http://localhost:9090/save/",
				dataType: 'json',
				cache: false,
				data: {
					id: enteredId,
					firstname: enteredFirstName,
					lastname: enteredLastName,
					dateofbirth: enteredDateOfBirth,
					mobile: enteredMobileNumber,
					address1: enteredAddressOne,
					address2: enteredAddressTwo,
					age: enteredAge,
					gender: enteredGender,
					email: enteredEmail
				},
				complete: function(er) {
					switch (er.status) {
						case 200:
							alert(er.responseText);
							window.location.replace("http://localhost:9090/");
							break;
						case 201:
							alert(er.responseText);
							window.location.replace("http://localhost:9090/");
							break;
						case 500:
							$('#errorMsg').text(er.responseText);
					}
				}
			});
		}
	});

});