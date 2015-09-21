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

					<div class="col-lg-11">
						<h3>Search client</h3>
						<form class="form-inline" action="/clients" method="post"
							name="paginationForm">
							<div class="form-group">

								<input type="text" class="form-control input-lg"
									name="firstName" placeholder="First Name" value="${fName}">
							</div>
							<div class="form-group">

								<input type="text" class="form-control input-lg" name="lastName"
									placeholder="Last Name" value="${lName}">
							</div>
							<button type="submit" class="btn btn-primary btn-lg">Search</button>
							<a href="/clients/new" class="btn btn-success btn-lg"
								role="button">Create</a> <br> <br>
							<div class="form-group">
								<select class="form-control" name="pageNum" id="resultsOnPage">
									<c:choose>
										<c:when test="${pNum==5}">
											<option value="5" selected="selected">5</option>
										</c:when>
										<c:when test="${pNum==10}">
											<option value="10" selected="selected">10</option>
										</c:when>
										<c:when test="${pNum==20}">
											<option value="20" selected="selected">20</option>
										</c:when>
										<c:when test="${pNum==50}">
											<option value="50" selected="selected">50</option>
										</c:when>
										<c:otherwise>
											<option value="20" selected="selected">20</option>
										</c:otherwise>
									</c:choose>
									<option value="5">5</option>
									<option value="10">10</option>
									<option value="20">20</option>
									<option value="50">50</option>
									<option value="100">100</option>
								</select>
							</div>
							<label for="resultsOnPage">: Results on page</label> <input
								type="hidden" name="currentPage" value="${currentPage}"
								id="currentPage">
						</form>
						<br> <br>
					</div>


					<div class="table-responsive col-lg-11">
						<c:choose>
							<c:when test="${not empty client.content}">
								<table class="table table-striped table-bordered">
									<thead>
										<tr>
											<th>#</th>
											<th>First Name</th>
											<th>Last Name</th>
											<th>Birth Date</th>
											<th>Address</th>
											<th>Phone</th>
											<th>Email</th>

											<th>Card</th>
											<th>Order</th>



										</tr>
									</thead>
									<tfoot>
										<tr>
											<th>#</th>
											<th>First Name</th>
											<th>Last Name</th>
											<th>Birth Date</th>
											<th>Address</th>
											<th>Phone</th>
											<th>Email</th>

											<th>Card</th>
											<th>Order</th>



										</tr>
									</tfoot>
									<tbody>
										<c:forEach var="tbl" items="${client.content}">
											<tr>
												<td>${tbl.id}</td>
												<td>${tbl.firstName}</td>
												<td>${tbl.lastName}</td>
												<td>${tbl.birth}</td>
												<td>${tbl.address}</td>
												<td>${tbl.phone}</td>
												<td>${tbl.email}</td>
												<td><a href="/clients/${tbl.id}"
													class="btn btn-info btn-sm"><span
														class="glyphicon glyphicon-search"></span></a></td>
												<td>


													<button type="button" class="btn btn-warning btn-sm"
														data-toggle="modal" data-target="#myModal${tbl.id}">
														<span class="glyphicon glyphicon-usd"></span> New
													</button> <c:choose>
														<c:when test="${not empty tbl.cars}">
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
																			<form action="/clients/${tbl.id}/cars/neworder"
																				method="post" data-toggle="validator" role="form">
																				<label for="carId">Car</label> <select
																					class="form-control" name="carId" id="carId">
																					<c:forEach var="clientCar" items="${tbl.cars}">
																						<option value="${clientCar.id}">${clientCar.make}
																							${clientCar.model} ${clientCar.year}
																							${clientCar.vin}</option>
																					</c:forEach>
																				</select>

																				<div class="form-group">
																					<label for="amount">Amount</label> <input
																						class="form-control" type="number" min="0"
																						max="10000" id="amount" name="amount"
																						placeholder="Amount" required
																						pattern="^[0-9]{1,}$">
																				</div>

																				<button type="submit" class="btn btn-default">New
																					Order</button>
																			</form>

																		</div>

																	</div>

																</div>
															</div>
														</c:when>
														<c:otherwise>
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
																			<form action="/clients/${tbl.id}/cars/newcarandorder"
																				method="post" data-toggle="validator" role="form">
																				<div class="form-group">
																					<label for="make">Make</label> <input type="text"
																						class="form-control" id="make" name="make"
																						placeholder="Make" maxlength="50"
																						pattern="^[\w\s\-]{1,}$">
																				</div>
																				<div class="form-group">
																					<label for="model">Model</label> <input type="text"
																						class="form-control" id="model" name="model"
																						placeholder="Model" maxlength="50"
																						pattern="^[\w\s\-]{1,}$">
																				</div>
																				<div class="form-group">
																					<label for="year">Model</label> <input
																						type="number" class="form-control" id="year"
																						name="year" placeholder="YYYY" maxlength="4"
																						pattern="^[0-9]{1,}$">
																				</div>
																				<div class="form-group">
																					<label for="vin">VIN</label> <input type="text"
																						class="form-control" id="vin" name="vin"
																						placeholder="VIN" maxlength="50"
																						pattern="^[\w\s\-]{1,}$">
																				</div>
																				<br>

																				<div class="form-group">
																					<label for="amount">Amount</label> <input
																						type="number" min="0" max="10000"
																						class="form-control" id="amount" name="amount"
																						placeholder="Amount" required
																						pattern="^[0-9]{1,}$">
																				</div>

																				<button type="submit" class="btn btn-default">New
																					Order</button>
																			</form>

																		</div>

																	</div>

																</div>
															</div>
														</c:otherwise>
													</c:choose>
												</td>


											</tr>
										</c:forEach>
									</tbody>
								</table>

							</c:when>
							<c:otherwise>
								<br>
								<h3>There are no results</h3>
							</c:otherwise>
						</c:choose>



						<ul class="pagination">
							<c:forEach var="pages" begin="1" end="${client.totalPages}">
								<c:choose>
									<c:when test="${client.number+1==pages}">

										<li class="active"><a href="/clients"
											onClick="document.getElementById('currentPage').value = '${pages}';document.paginationForm.submit();return false">${pages}</a></li>


									</c:when>
									<c:otherwise>
										<li><a href="/clients"
											onClick="document.getElementById('currentPage').value = '${pages}';document.paginationForm.submit();return false">${pages}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>

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