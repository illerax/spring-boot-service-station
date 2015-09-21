<%@ page contentType="text/html" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>

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
								role="button">Create</a> <br>
							<br>
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
						<br>
						<br>
						<img src="/pages/images/logo.png">
					</div>

				</div>


			</div>
		</div>
		<!-- /#page-content-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Menu Toggle Script -->
	<script>
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});
	</script>

</body>

</html>