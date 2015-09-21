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

<script src="/pages/js/jquery-1.11.3.min.js"></script>
<script src="/pages/js/bootstrap.min.js"></script>
<script src="/pages/js/validator.js"></script>



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
						<form class="form-horizontal"
							action="/clients/${car.clientId}/cars/${car.id}"
							data-toggle="validator" role="form" method="post">
							<h2>Car Info</h2>
							<div class="form-group">
								<label for="inputMake" class="col-sm-2 control-label">Make</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputMake"
										placeholder="Make" name="make" value="${car.make}"
										maxlength="50" pattern="^[\w\s\-]{1,}$"> <span
										class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>
							<div class="form-group">
								<label for="inputModel" class="col-sm-2 control-label">Last
									Name</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputModel"
										placeholder="Model" name="model" value="${car.model}"
										maxlength="50" pattern="^[\w\s\-]{1,}$"> <span
										class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>



							<div class="form-group">
								<label for="inputYear" class="col-sm-2 control-label">Year</label>
								<div class="col-sm-10">
									<input type="number" class="form-control" id="inputYear"
										placeholder="YYYY" name="year" value="${car.year}"
										maxlength="4" pattern="^[0-9]{1,}$"> <span
										class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>


							<div class="form-group">
								<label for="inputVin" class="col-sm-2 control-label">Vin</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputVin"
										placeholder="VIN" name="vin" value="${car.vin}" maxlength="50"
										pattern="^[\w\s\-]{1,}$"> <span
										class="glyphicon form-control-feedback" aria-hidden="true"></span>
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<button type="submit" class="btn btn-success">Edit Car</button>
								</div>
							</div>
						</form>

						<hr>
						<h2>Orders</h2>

						<div class="table-responsive col-sm-offset-2 col-sm-10">
							<c:choose>
								<c:when test="${not empty car.orders}">
									<table class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>#</th>
												<th>Date</th>
												<th>Amount, $</th>
												<th>Status</th>
												<th>Edit</th>
												<th>Delete</th>

											</tr>
										</thead>
										<tfoot>
											<tr>
												<th>#</th>
												<th>Date</th>
												<th>Amount, $</th>
												<th>Status</th>
												<th>Edit</th>
												<th>Delete</th>

											</tr>
										</tfoot>
										<tbody>
											<c:forEach var="tbl" items="${car.orders}">
												<c:choose>
													<c:when test="${tbl.status=='Completed'}">
														<tr class="success">
													</c:when>
													<c:when test="${tbl.status=='Cancelled'}">
														<tr class="danger">
													</c:when>
													<c:otherwise>
														<tr class="active">
													</c:otherwise>
												</c:choose>
												<td>${tbl.id}</td>
												<td>${tbl.date}</td>
												<td>${tbl.amount}</td>
												<td>${tbl.status}</td>
												<td><a href="" class="btn btn-warning btn-sm"
													data-toggle="modal" data-target="#myModal${tbl.id}"><span
														class="glyphicon glyphicon-edit"></span></a>

													<div class="modal fade" id="myModal${tbl.id}" role="dialog">
														<div class="modal-dialog">

															<!-- Modal content-->
															<div class="modal-content">
																<div class="modal-header">
																	<button type="button" class="close"
																		data-dismiss="modal">&times;</button>
																	<h4 class="modal-title">Edit Order #${tbl.id}</h4>
																</div>
																<div class="modal-body">
																	<form
																		action="/clients/${car.clientId}/cars/${car.id}/editorder"
																		method="post" data-toggle="validator" role="form">
																		<input type="hidden" name="id" value="${tbl.id}" />
																		<div class="form-group">
																			<label for="date">Date</label> <input type="text"
																				class="form-control" id="date" name="date"
																				placeholder="YYYY-MM-DD" value="${tbl.date}"
																				pattern="^[0-9\-]{1,}$" maxlength="10">

																		</div>
																		<div class="form-group">
																			<label for="amount">Amount</label> <input
																				type="number" min="0" max="10000"
																				class="form-control" id="amount" name="amount"
																				placeholder="Amount" value="${tbl.amount}"
																				pattern="^[0-9]{1,}$"
																				data-error="Amount must be from 0 to 10000">

																		</div>
																		<label for="status">Status</label> <select
																			class="form-control" name="status" id="status">
																			<c:choose>
																				<c:when test="${tbl.status=='In Progress'}">
																					<option value="In Progress" selected="selected">In
																						Progress</option>
																					<option value="Completed">Completed</option>
																					<option value="Cancelled">Cancelled</option>
																				</c:when>
																				<c:when test="${tbl.status=='Completed'}">
																					<option value="Completed" selected="selected">Completed</option>
																					<option value="In Progress">In Progress</option>
																					<option value="Cancelled">Cancelled</option>
																				</c:when>
																				<c:otherwise>
																					<option value="Completed">Completed</option>
																					<option value="In Progress">In Progress</option>
																					<option value="Cancelled" selected="selected">Cancelled</option>
																				</c:otherwise>
																			</c:choose>
																		</select> <br>

																		<button type="submit" class="btn btn-default">Edit
																			Order</button>
																	</form>

																</div>

															</div>

														</div>
													</div></td>
												<td>
													<form
														action="/clients/${car.clientId}/cars/${car.id}/deleteorder"
														method="post">
														<input type="hidden" name="orderId" value="${tbl.id}" />
														<button type="submit" class="btn btn-danger btn-sm">
															<span class="glyphicon glyphicon-remove"></span>
														</button>
													</form>
												</td>


												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:when>
								<c:otherwise>
									<div class="col-sm-10">
										<form
											action="/clients/${car.clientId}/cars/${car.id}/deletecar"
											method="post">
											<label for="removeCar">There are no orders. You can
												remove this car - </label>
											<button type="submit" class="btn btn-danger btn-sm"
												id="removeCar">
												<span class="glyphicon glyphicon-remove"></span>
											</button>
										</form>
									</div>
									<br>
									<br>
								</c:otherwise>
							</c:choose>

						</div>

						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" class="btn btn-success" data-toggle="modal"
								data-target="#myModal">New Order</button>
						</div>


						<div class="modal fade" id="myModal" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">New Order</h4>
									</div>
									<div class="modal-body">
										<p>Make: ${car.make}</p>
										<p>Model: ${car.model}</p>
										<p>Year: ${car.year}</p>
										<p>VIN: ${car.vin}</p>
										<form
											action="/clients/${car.clientId}/cars/${car.id}/neworder"
											method="post" data-toggle="validator" role="form">
											<div class="form-group">
												<label for="amount">Amount</label> <input type="number"
													min="0" max="10000" class="form-control" id="amount"
													name="amount" placeholder="Amount" required
													pattern="^[0-9]{1,}$"
													data-error="Amount must be from 0 to 10000">

											</div>

											<button type="submit" class="btn btn-default">New
												Order</button>
										</form>

									</div>

								</div>

							</div>
						</div>


						<br>

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

</body>

</html>