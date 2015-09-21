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
						<h3>Service Station manager's workspace example by Evgeny Smirnov</h3>
						<p>using Spring Boot, MySQL and Bootstrap</p>
						<br>
						<br>
						<p>Contacts:</p>
						<p>illerax@gmail.com</p>
						<p>Skype - smirnov.bel</p>
						
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