<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta content="width=device-width, initial-scale=1.0" name="viewport">	
	<title>Crud Operation</title>
	<meta content="" name="description">
	<meta content="" name="keywords">
		
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="/js/main.js"></script>
	<script src="/js/customervalidation.js"></script>
		
	<!-- Favicons -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" 
		integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link href="assets/img/favicon.png" rel="icon">
	<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
	
	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
		rel="stylesheet">

	<!-- Vendor CSS Files -->
	<link href="assets/vendor/aos/aos.css" rel="stylesheet">
	<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
	<link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
	<link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
	<link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
	
	<!-- Template Main CSS File -->
	<link href="/css/style.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="/views/customer_popup.jsp"></jsp:include>
	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top d-flex align-items-center">
		<div class="container d-flex justify-content-between">
			<div class="logo">
				<h1>
					<a href="customer_view.html">QDEV TECHNOLAB</a>
				</h1>
			</div>

			<nav id="navbar" class="navbar">
				<ul>
					<li><a class="nav-link scrollto active" href="#hero">Home</a></li>
					<li><a class="nav-link scrollto" href="#Show Customer">Show Customer</a></li>
					<li><a class="AddupdateCustomer">Add/update Customer</a></li>
					<li><a class="nav-link scrollto" href="#services">Services</a></li>
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->
		</div>
	</header>
	<!-- End Header -->

	<!-- ======= Hero Section ======= -->
	<section id="hero"class="d-flex flex-column justify-content-center align-items-center">
		<div class="container text-center text-md-left" data-aos="fade-up">
			<h1>Welcome</h1>
			<h2>Click here to See Total Customer List</h2>
			<a href="#Show Customer" class="btn-get-started scrollto">Show Customer Details</a>
		</div>
	</section>
	<!-- End Hero -->

	<main id="main">

		<!-- ======= About Section ======= -->
		<section id="Show Customer" class="Show Customer">
			<div class="container">
				<div class="table">
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">Sr.no</th>
								<th scope="col">Name</th>
								<th scope="col">Date of Birth</th>
								<th scope="col">Mobile No</th>
								<th scope="col">Address</th>
								<th scope="col">Age</th>
								<th scope="col">Gender</th>
								<th scope="col">Email</th>
								<th scope="col">Edit</th>
								<th scope="col">Delete</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="customer" items="${customers}">
								<tr>
									<td></td>
									<td class="name">${customer.firstName} ${customer.lastName}</td>
									<td class="dob">${customer.dateOfBirth}</td>
									<td class="mobile">${customer.mobile}</td>
									<td class="address">${customer.address1} ${customer.address2}</td>
									<td class="age">${customer.age}</td>
									<td class="gender">
									<c:choose>
										<c:when test="${customer.gender=='1'}">
											Female
										</c:when>
										<c:otherwise>
											Male
										</c:otherwise>
									</c:choose>
									</td>
									<td class="email">${customer.email}</td>
									<td>
											<a class="customerupdate" dataId = "${customer.id}" >
											<span class="glyphicon glyphicon-pencil"  ></span></a>
									</td>
									<td>
										<form action="/deleteData" method="post">
										<a href="#Show Customer" onclick="deleteCustomer(${customer.id})">
										<span class="glyphicon glyphicon-trash" ></span></a>
										</form>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</section>
		
		<!-- End About Section -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services section-bg">
			<div class="container">
				<div class="section-title" data-aos="fade-up">
					<h2>Services</h2>
					<p>Magnam dolores commodi suscipit. Necessitatibus eius
						consequatur ex aliquid fuga eum quidem. Sit sint consectetur
						velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit
						suscipit alias ea. Quia fugiat sit in iste officiis commodi quidem
						hic quas.</p>
				</div>

				<div class="row">
					<div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="fade-up">
						<div class="icon-box icon-box-pink">
							<div class="icon">
								<i class="bx bxl-dribbble"></i>
							</div>
							<h4 class="title">
								<a href="">Lorem Ipsum</a>
							</h4>
							<p class="description">Voluptatum deleniti atque corrupti
								quos dolores et quas molestias excepturi sint occaecati
								cupiditate</p>
						</div>
					</div>

					<div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="fade-up" data-aos-delay="100">
						<div class="icon-box icon-box-cyan">
							<div class="icon">
								<i class="bx bx-file"></i>
							</div>
							<h4 class="title">
								<a href="">Sed ut perspiciatis</a>
							</h4>
							<p class="description">Duis aute irure dolor in reprehenderit
								in voluptate velit esse cillum dolore eu fugiat nulla</p>
						</div>
					</div>

					<div
						class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="fade-up" data-aos-delay="200">
						<div class="icon-box icon-box-green">
							<div class="icon">
								<i class="bx bx-tachometer"></i>
							</div>
							<h4 class="title">
								<a href="">Magni Dolores</a>
							</h4>
							<p class="description">Excepteur sint occaecat cupidatat non
								proident, sunt in culpa qui officia deserunt mollit anim</p>
						</div>
					</div>

					<div
						class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0" data-aos="fade-up" data-aos-delay="300">
						<div class="icon-box icon-box-blue">
							<div class="icon">
								<i class="bx bx-world"></i>
							</div>
							<h4 class="title">
								<a href="">Nemo Enim</a>
							</h4>
							<p class="description">At vero eos et accusamus et iusto odio
								dignissimos ducimus qui blanditiis praesentium voluptatum</p>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- End Services Section -->

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
		<footer id="footer">
		<div class="footer-top">
			<div class="container">
				<div class="row">

					<div class="col-lg-3 col-md-6">
						<div class="footer-info">
							<h3>QDEV</h3>
							<p>
								A108 Adam Street <br> NY 535022, USA<br> <br> <strong>Phone:</strong>
								+1 5589 55488 55<br> <strong>Email:</strong>
								info@qdevtechnolab.com<br>
							</p>
							<div class="social-links mt-3">
								<a href="#" class="twitter"><i class="bx bxl-twitter"></i></a> <a
									href="#" class="facebook"><i class="bx bxl-facebook"></i></a> <a
									href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
								<a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
								<a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
							</div>
						</div>
					</div>

					<div class="col-lg-2 col-md-6 footer-links">
						<h4>Useful Links</h4>
						<ul>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Show Customer</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
						</ul>
					</div>

					<div class="col-lg-4 col-md-6 footer-newsletter">
						<h4>Our Newsletter</h4>
						<p>Tamen quem nulla quae legam multos aute sint culpa legam noster magna</p>
						<form action="" method="post">
							<input type="email" name="email"><input type="submit" value="Subscribe">
						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="copyright">
				&copy; Copyright <strong><span>QDEV</span></strong>. All Rights Reserved
			</div>
			<div class="credits"> Designed by Shivang</div>
		</div>
	</footer>
	<!-- End Footer -->

	<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/aos/aos.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>

	<script type="text/javascript">
		function deleteCustomer(id){
			swal({
				title: "Are you sure?",
				text: "You want to delete this Customer?",
				icon: "warning",
				buttons:true,
				dangerMode: true,
			}).then((value) => {
				if (value) {
					swal("Data Deleted Sucessfully",{
						}).then((value) => {
							if (value) {
								window.location.href ="/deleteData/" + id;
							};
						});
					};
				});
		}
	</script>
</body>
</html>