<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
	<script	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
	<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
	<link href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="/css/customer_popup.css">
	<title>popup</title>
</head>
<body>
	<form id="form" method="post" >
		<!-- The Modal -->
		<div id="myModal" class="modal">
			<!-- Modal content -->
			<div class="modal-content">
				<span class="close">&times;</span>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span>x</span>
				</button>
				<div class="modal-body">
					<h3 class="title">Add Customer</h3>
					<p class="description">You can add customer here..!</p>
					<div>
						<input type="hidden" name="id" id="updateHiddenId" />
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="firstName" id="letter" placeholder="First Name*" />
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="lastName" id="letters" placeholder="Last Name*" />
					</div>
					<div class="form-group date">
						<input type="text" class="form-control" name="dateOfBirth" placeholder="dateofbirth*" id="date" />
					</div>
					<div class="form-group">
						<input type="tel" class="form-control" name="mobile" id="numbers" placeholder="Mobile*" />
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="address1" placeholder="Address 1*" />
					</div>
					<div class="form-group">
						<input type="text" class="form-control" name="address2" placeholder="Address 2" />
					</div>
					<div class="form-group">
						<input type="number" class="form-control" name="age" id="age" placeholder="Age*" />
					</div>
					<div class="gender">
						<input type="radio" name="gender" value="0" > Male 
						<input type="radio" name="gender" value="1" > Female
					</div>
					<div class="form-group">
						<input type="email" class="form-control" name="email" placeholder="Email*" />
					</div>
					<button type="submit" class="btn" id="Add">Save</button>
					<h3 id="errorMsg"></h3>
				</div>
			</div>
		</div>
	</form>
</body>
</html>