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
						<form class="form-horizontal" action="/clients/${clientId}"
							method="post" data-toggle="validator" role="form">
							<h2>Client Card</h2>
							<div class="form-group">
								<label for="inputFirstName" class="col-sm-2 control-label">First
									Name</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputFirstName"
										placeholder="First Name" name="firstName"
										value="${client.firstName}" pattern="^[A-z\s]{1,}$"
										maxlength="50"> <span
										class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="inputLastName" class="col-sm-2 control-label">Last
									Name</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputLastName"
										placeholder="Last Name" name="lastName"
										value="${client.lastName}" pattern="^[A-z\s]{1,}$"
										maxlength="50"> <span
										class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>



							<div class="form-group">
								<label for="inputBirth" class="col-sm-2 control-label">Birth</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputBirth"
										placeholder="YYYY-MM-DD" name="birth" value="${client.birth}"
										pattern="^[0-9\-]{1,}$" maxlength="10"> <span
										class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>


							<div class="form-group">
								<label for="inputAddress" class="col-sm-2 control-label">Address</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputAddress"
										placeholder="Address" name="address" value="${client.address}"
										maxlength="255" pattern="^[\w\s\-\.]{1,}$"> <span
										class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="inputPhone" class="col-sm-2 control-label">Phone</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputPhone"
										placeholder="Phone" name="phone" value="${client.phone}"
										pattern="^[0-9\-]{1,}$" maxlength="50"> <span
										class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>



							<div class="form-group">
								<label for="inputEmail" class="col-sm-2 control-label">Email</label>
								<div class="col-sm-10">
									<input type="email" class="form-control" id="inputEmail"
										placeholder="Email" name="email" value="${client.email}"
										maxlength="50"> <span
										class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-success">Edit
										User</button>
								</div>
							</div>
						</form>

						<hr>
						<h2>Client Cars</h2>

						<div class="table-responsive col-sm-offset-2 col-sm-10">
							<c:choose>
								<c:when test="${not empty client.cars}">
									<table class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>#</th>
												<th>Make</th>
												<th>Model</th>
												<th>Year</th>
												<th>VIN</th>
												<th>Info</th>
												<th>Order</th>



											</tr>
										</thead>
										<tfoot>
											<tr>
												<th>#</th>
												<th>Make</th>
												<th>Model</th>
												<th>Year</th>
												<th>VIN</th>
												<th>Info</th>
												<th>Order</th>



											</tr>
										</tfoot>
										<tbody>
											<c:forEach var="tbl" items="${client.cars}">
												<tr>
													<td>${tbl.id}</td>
													<td>${tbl.make}</td>
													<td>${tbl.model}</td>
													<td>${tbl.year}</td>
													<td>${tbl.vin}</td>
													<td><a href="/clients/${client.id}/cars/${tbl.id}"
														class="btn btn-info btn-sm"><span
															class="glyphicon glyphicon-search"></span></a></td>

													<td>

														<div class="col-sm-offset-2 col-sm-10">
															<button type="button" class="btn btn-warning btn-sm"
																data-toggle="modal" data-target="#myModal${tbl.id}">
																<span class="glyphicon glyphicon-usd"></span> New
															</button>
														</div>


														<div class="modal fade" id="myModal${tbl.id}"
															role="dialog">
															<div class="modal-dialog">

																<!-- Modal content-->
																<div class="modal-content">
																	<div class="modal-header">
																		<button type="button" class="close"
																			data-dismiss="modal">&times;</button>
																		<h4 class="modal-title">New Order</h4>
																	</div>
																	<div class="modal-body">
																		<p>Make: ${tbl.make}</p>
																		<p>Model: ${tbl.model}</p>
																		<p>Year: ${tbl.year}</p>
																		<p>VIN: ${tbl.vin}</p>
																		<form
																			action="/clients/${tbl.clientId}/cars/${tbl.id}/neworder"
																			method="post" data-toggle="validator" role="form">
																			<div class="form-group">
																				<label for="amount">Amount</label> <input
																					type="number" min="0" max="10000"
																					class="form-control" id="amount" name="amount"
																					placeholder="Amount" required pattern="^[0-9]{1,}$"
																					data-error="Amount must be from 0 to 10000">
																			</div>

																			<button type="submit" class="btn btn-default">New
																				Order</button>
																		</form>

																	</div>

																</div>

															</div>
														</div>
													</td>


												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:when>
								<c:otherwise>

									<h3>There are no cars</h3>
									<br></br>

								</c:otherwise>
							</c:choose>

						</div>


						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" class="btn btn-success" data-toggle="modal"
								data-target="#myModal">New Car</button>
						</div>


						<div class="modal fade" id="myModal" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">New Car</h4>
									</div>
									<div class="modal-body">
										<p>Client name: ${client.firstName} ${client.lastName}</p>
										<form action="/clients/${client.id}/newcar" method="post">
											<div class="form-group">
												<label for="make">Make</label> <input type="text"
													class="form-control" id="make" name="make"
													placeholder="Make">
											</div>
											<div class="form-group">
												<label for="model">Model</label> <input type="text"
													class="form-control" id="model" name="model"
													placeholder="Model">
											</div>
											<div class="form-group">
												<label for="year">Year</label> <input type="text"
													class="form-control" id="year" name="year"
													placeholder="YYYY">
											</div>
											<div class="form-group">
												<label for="vin">VIN</label> <input type="text"
													class="form-control" id="vin" name="vin" placeholder="VIN">
											</div>

											<button type="submit" class="btn btn-default">New
												Car</button>
										</form>

									</div>

								</div>


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