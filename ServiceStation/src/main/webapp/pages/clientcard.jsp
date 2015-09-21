<%@ page contentType="text/html" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Service Station - manager's workspace</title>

<link href="/pages/css/bootstrap.min.css" rel="stylesheet">
<link href="/pages/css/simple-sidebar.css" rel="stylesheet">
<link href="/pages/css/datepicker.css" rel="stylesheet">


<script src="/pages/js/jquery-1.11.3.min.js"></script>
<script src="/pages/js/bootstrap.min.js"></script>
<script src="/pages/js/validator.js"></script>
<script src="/pages/js/bootstrap-datepicker.js"></script>



</head>

<body>

	<div id="wrapper">

		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a href="/"> Service Station </a></li>
				<li><a href="/">Main</a></li>
				<li><a href="/clients/new">New Client</a></li>
				<li><a href="/about">About</a></li>
			</ul>
		</div>
		<!-- /#sidebar-wrapper -->

		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">

				<div class="row">

					<div class="col-md-11">
						<h2>${message}</h2>
						<form class="form-horizontal" method="post"
							data-toggle="validator" role="form">
							<h2>Client Card</h2>
							<div class="form-group">
								<label for="inputFirstName" class="col-sm-2 control-label">First
									Name</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputFirstName"
										placeholder="First Name" name="firstName" value="${fName}"
										pattern="^[A-z\s]{1,}$" maxlength="50"> <span
										class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="inputLastName" class="col-sm-2 control-label">Last
									Name</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputLastName"
										placeholder="Last Name" name="lastName" value="${lName}"
										pattern="^[A-z\s]{1,}$" maxlength="50"> <span
										class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>



							<div class="form-group">
								<label for="inputBirth" class="col-sm-2 control-label">Birth</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputBirth"
										placeholder="YYYY-MM-DD" name="birth" value="${birth}"
										pattern="^[0-9\-]{1,}$" maxlength="10"> <span
										class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>


							<div class="form-group">
								<label for="inputAddress" class="col-sm-2 control-label">Address</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputAddress"
										placeholder="Address" name="address" value="${address}"
										maxlength="255" pattern="^[\w\s\-\.]{1,}$"> <span
										class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="inputPhone" class="col-sm-2 control-label">Phone</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputPhone"
										placeholder="Phone" name="phone" value="${phone}"
										pattern="^[0-9\-]{1,}$" maxlength="50"> <span
										class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>



							<div class="form-group">
								<label for="inputEmail" class="col-sm-2 control-label">Email</label>
								<div class="col-sm-10">
									<input type="email" class="form-control" id="inputEmail"
										placeholder="Email" name="email" value="${email}"
										maxlength="50"> <span
										class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>

							<hr>
							<h2>Car Info</h2>
							<div class="form-group">
								<label for="inputMake" class="col-sm-2 control-label">Make</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputMake"
										placeholder="Make" name="make" value="${make}" maxlength="50"
										pattern="^[\w\s\-]{1,}$"> <span
										class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="inputModel" class="col-sm-2 control-label">Model</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputModel"
										placeholder="Model" name="model" value="${model}"
										maxlength="50" pattern="^[\w\s\-]{1,}$"> <span
										class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="inputYear" class="col-sm-2 control-label">Year</label>
								<div class="col-sm-10">
									<input type="number" class="form-control" id="inputYear"
										placeholder="YYYY" name="year" value="${year}" maxlength="4"
										pattern="^[0-9]{1,}$"> <span
										class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="inputVin" class="col-sm-2 control-label">VIN</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputVin"
										placeholder="VIN" name="vin" value="${vin}" maxlength="50"
										pattern="^[\w\s\-]{1,}$"> <span
										class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>

							<hr>
							<h2>Order Amount</h2>
							<div class="form-group">
								<label for="inputOrder" class="col-sm-2 control-label">Amount</label>
								<div class="col-sm-10">
									<input type="number" min="0" max="10000" class="form-control"
										id="inputVin" placeholder="Amount" name="amount"
										value="${amount}" pattern="^[0-9]{1,}$"
										data-error="Amount must be from 0 to 10000"> <span
										class="glyphicon form-control-feedback" aria-hidden="true"></span>
									<div class="help-block with-errors"></div>
								</div>
							</div>

							<hr>
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-success">Create
										Card & Place Order</button>
								</div>
							</div>

						</form>
						<br> <br>
					</div>

				</div>
			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->



	<!-- Menu Toggle Script -->
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
	</script>

	<script type="text/javascript">
		// When the document is ready
		$(document).ready(function() {

			$('#inputBirth').datepicker({
				format : "yyyy-mm-dd"
			});

		});
	</script>

</body>

</html>