<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="io.FileCreater"%>
<%@page import="database.ProductDAO"%>
<%@page import="beans.User"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>

<html>
<head>

<title>Twitter Bootstrap shopping cart</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- Bootstrap styles -->
<link href="http://localhost:8080/ProjectWebW/assets/css/bootstrap.css"
	rel="stylesheet" />
<!-- Customize styles -->
<link href="http://localhost:8080/ProjectWebW/assets/css/style.css"
	rel="stylesheet" />
<!-- font awesome styles -->
<link
	href="http://localhost:8080/ProjectWebW/assets/font-awesome/css/font-awesome.css"
	rel="stylesheet">
<!--[if IE 7]>
			<link href="css/font-awesome-ie7.min.css" rel="stylesheet">
		<![endif]-->

<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

<!-- Favicons -->
<link rel="shortcut icon"
	href="http://localhost:8080/ProjectWebW/favicon.ico">
</head>
<body>

	<!-- 
	Upper Header Section 
-->


	<jsp:useBean id="cart" scope="session" class="beans.Cart"></jsp:useBean>
	<c:set var="currentUser" value='${sessionScope["currentSessionUser"]}'></c:set>
	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="topNav">
			<div class="container">
				<div class="alignR">
					<div class="pull-left socialNw">
						<a href="#"><span class="icon-twitter"></span></a> <a href="#"><span
							class="icon-facebook"></span></a> <a href="#"><span
							class="icon-youtube"></span></a> <a href="#"><span
							class="icon-tumblr"></span></a>
					</div>
					<a href="http://localhost:8080/ProjectWebW/MainPage/index.jsp">
						<span class="icon-home"></span> Home
					</a>
					<c:choose>
						<c:when test="${currentUser == null}">
							<a href="http://localhost:8080/ProjectWebW/MainPage/login.jsp"><span
								class="icon-user"></span> My Account</a>
							<a href="http://localhost:8080/ProjectWebW/MainPage/contact.jsp"><span
								class="icon-envelope"></span> Contact us</a>
							<a href="http://localhost:8080/ProjectWebW/MainPage/cart.jsp"><span
								class="icon-shopping-cart"></span> <c:out
									value="${cart.getLineItemCount() }"></c:out> Item(s) - <span
								class="badge badge-warning"> $<c:out
										value="${cart.total }"></c:out></span></a>

						</c:when>
						<c:otherwise>
							<a href="#"><span class="icon-user"></span>
								${currentUser.firstName} ${currentUser.lastName}</a>
							<a href="http://localhost:8080/ProjectWebW/MainPage/contact.jsp"><span
								class="icon-envelope"></span> Contact us</a>
							<a href="http://localhost:8080/ProjectWebW/MainPage/cart.jsp"><span
								class="icon-shopping-cart"></span> <c:out
									value="${cart.getLineItemCount() }"></c:out> Item(s) - <span
								class="badge badge-warning"> $<c:out
										value="${cart.total }"></c:out></span></a>
							<a href="http://localhost:8080/ProjectWebW/MainPage/logout.jsp"><span
								class="icon-signout"> </span> Log out</a>
						</c:otherwise>
					</c:choose>

				</div>
			</div>
		</div>
	</div>

	<!--
Lower Header Section 
-->
	<div class="container">
		<div id="gototop"></div>
		<header id="header">
			<div class="row">
				<div class="span4">
					<h1>
						<a class="logo"
							href="http://localhost:8080/ProjectWebW/MainPage/index.jsp"><span>Twitter
								Bootstrap ecommerce template</span> <img
							src="http://localhost:8080/ProjectWebW/assets/img/logo-bootstrap-shoping-cart.png"
							alt="bootstrap sexy shop"> </a>
					</h1>
				</div>
				<div class="span4">
					<div class="offerNoteWrapper">
						<h1 class="dotmark">
							<i class="icon-cut"></i> Twitter Bootstrap shopping cart HTML
							template is available @ $14
						</h1>
					</div>
				</div>
				<div class="span4 alignR">
					<p>
						<br> <strong> Support (24/7) : 0800 1234 678 </strong><br>
						<br>
					</p>
					<a href="http://localhost:8080/ProjectWebW/MainPage/cart.jsp"><span
						class="btn btn-mini">[ 2 ] <span class="icon-shopping-cart"></span></span></a>
					<span class="btn btn-warning btn-mini">$</span> <span
						class="btn btn-mini">&pound;</span> <span class="btn btn-mini">&euro;</span>
				</div>
			</div>
		</header>

		<!--
Navigation Bar Section 
-->
		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<a data-target=".nav-collapse" data-toggle="collapse"
						class="btn btn-navbar"> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
					</a>
					<div class="nav-collapse">
						<ul class="nav" id="nav">
							<li><a
								href="http://localhost:8080/ProjectWebW/MainPage/index.jsp"
								class="whatever">Home</a></li>
							<li><a
								href="http://localhost:8080/ProjectWebW/MainPage/dienthoai.jsp"
								class="whatever">Điện Thoại</a></li>
							<li><a
								href="http://localhost:8080/ProjectWebW/MainPage/dongho.jsp"
								class="whatever">Đồng Hồ</a></li>
							<li><a
								href="http://localhost:8080/ProjectWebW/MainPage/phukien.jsp"
								class="whatever">Phụ Kiện</a></li>
							<li><a
								href="http://localhost:8080/ProjectWebW/MainPage/tablet.jsp"
								class="whatever">Máy Tính Bảng</a></li>
							<li><a
								href="http://localhost:8080/ProjectWebW/MainPage/general.jsp"
								class="whatever">Nội Dung</a></li>
						</ul>
						<form action="http://localhost:8080/ProjectWebW/ProductServlet"
							method="GET" class="navbar-search pull-left">
							<input type="text" placeholder="Search"
								class="search-query span2" name="name" value="">
						</form>
						<!-- 			   <form action="MyServlet" method="get"> -->
						<!--                         NameProduct: <input class="inputText_search" type="text" -->
						<!--                                           name="name" /> <input type="submit" value="Search.." /> -->
						<!--                         (Type First name vistor and Click Search button) -->
						<!--                     </form> -->

						<c:if test="${currentUser == null}">

							<ul class="nav pull-right">
								<li class="dropdown"><a data-toggle="dropdown"
									class="dropdown-toggle" href="#"><span class="icon-lock"></span>
										Login <b class="caret"></b></a>
									<div class="dropdown-menu">
										<form class="form-horizontal loginFrm"
											action="http://localhost:8080/ProjectWebW/UserServlet">
											<div class="control-group">
												<input type="text" class="span2" id="inputEmail"
													placeholder="Email" name="un">
											</div>
											<div class="control-group">
												<input type="password" class="span2" id="inputPassword"
													placeholder="Password" name="pw">
											</div>
											<div class="control-group">
												<label class="checkbox"> <input type="checkbox">
													Remember me
												</label>
												<button type="submit" class="shopBtn btn-block"
													value="Sign In" name="action">Sign in</button>
											</div>
										</form>
									</div></li>
							</ul>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<!-- 
Body Section 
-->