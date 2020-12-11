<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.awt.event.ItemEvent"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="database.ProductDAO"%>
<%@page import="beans.Product"%>
<html>

<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Tables</title>

<!-- Custom fonts for this template -->
<link
	href="http://localhost:8080/ProjectWebW/Admin/assets/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet
	" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link
	href="http://localhost:8080/ProjectWebW/Admin/assets/css/sb-admin-2.min.css"
	rel="stylesheet">

<!-- Custom styles for this page -->
<link
	href="http://localhost:8080/ProjectWebW/Admin/assets/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">
</head>
<body id="page-top">
	<!-- Page Wrapper -->
	<div id="wrapper">
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">


				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">Tables</h1>
					<!--                     <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below. -->
					<!--                         For more information about DataTables, please visit the <a target="_blank" -->
					<!--                             href="https://datatables.net">official DataTables documentation</a>.</p> -->

					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">DataTables
								Example</h6>
						</div>
						<jsp:useBean id="product" scope="session"
							class="database.ProductDAO" />
						<div class="card-body">
							<div class="table-responsive">
								<form action="http://localhost:8080/ProjectWebW/EditProduct"
									method="get">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<thead>
											<tr>
												<th>ID</th>
												<th>Name</th>
												<th>Loai</th>
												<th>Gia</th>
												<th>FilName1</th>
												<th>Quantity</th>
												<th>Action</th>
											</tr>
										</thead>
										<tfoot>
											<tr>
												<th>ID</th>
												<th>Name</th>
												<th>Loai</th>
												<th>Gia</th>
												<th>FilName1</th>
												<th>Quantity</th>
												<th>Action</th>
											</tr>
										</tfoot>

										<tbody>
											<tr>
												<td><input name="Nid" size="3"
													class="inputText form-control" value="" type="text" /></td>
												<td><input name="Nname" size="3"
													class="inputText form-control" value="" type="text" /></td>
												<td><input name="Nloai" size="3"
													class="inputText form-control" value="" type="text" /></td>
												<td><input name="Ngia" size="3"
													class="inputText form-control" value="" type="number" /></td>
												<td><input name="Nfilename1" size="3"
													class="inputText form-control" value="" type="text" /></td>
												<td><input name="Nsluong"
													class="inputText form-control" value="" type="number" /></td>
												<td><button type="submit" value="Add" name="action">Add</button></td>

											</tr>

											<c:set var="count" value="0" scope="page" />
											<c:forEach var="item" items="${product.showProduct()}"
												varStatus="counter">
												
												  <c:set var="count" value="${count + 1}" scope="page"/>
												<c:set var="deleteURL"
													value="EditProduct?action=Delete&id=${item.id}"
													scope="page" />
<%-- 												<c:set var="editURL" --%>
<%-- 													value="EditProduct?action=Update&id=${item.id}&loai=${item.loai}&name=${''}&gia=${item.gia}&filename1=${item.filename1}&sluong=" --%>
<%-- 													scope="page" /> --%>

												<tr>
													<td><input name="${item.id}id" class="inputText form-control"
														value="${item.id}" type="text" readonly="readonly" /></td>
													<td><input name="${item.id}name" class="inputText form-control"
														value="${item.name}" type="text" /></td>
													<td><input name="${item.id}loai" class="inputText form-control"
														value="${item.loai}" type="text" /></td>
													<td><input name="${item.id}gia" class="inputText form-control"
														value="${item.gia}" type="text" /></td>
													<td><input name="${item.id}filename1"
														class="inputText form-control" value="${item.filename1}"
														type="text" /></td>
													<td><input name="${item.id}sluong" id="${count}"
														class="inputText form-control" value="${item.sluong}"
														type="text" /></td>
													<td>
													<button type="submit" value="${item.id}U" name="action">Update</button>
													<button type="submit" value="${item.id}D" name="action">Delete</button>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</form>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2020</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	<!-- Bootstrap core JavaScript-->
	<script
		src="http://localhost:8080/ProjectWebW/Admin/assets/vendor/jquery/jquery.min.js"></script>
	<script
		src="http://localhost:8080/ProjectWebW/Admin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="http://localhost:8080/ProjectWebW/Admin/assets/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="http://localhost:8080/ProjectWebW/Admin/assets/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="http://localhost:8080/ProjectWebW/Admin/assets/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="http://localhost:8080/ProjectWebW/Admin/assets/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script
		src="http://localhost:8080/ProjectWebW/Admin/assets/js/demo/datatables-demo.js"></script>

</body>

</html>