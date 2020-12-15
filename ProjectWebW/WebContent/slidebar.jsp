<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="cart" scope="session" class="database.CartDAO"></jsp:useBean>
<c:set var="currentUser" value='${sessionScope["currentSessionUser"]}'></c:set>
<c:set var="idU" value='${currentUser.getUsername()}'></c:set>
<div id="sidebar" class="span3">
<div class="well well-small">
	<ul class="nav nav-list">
		 	  <li class=""><a href="http://localhost:8080/ProjectWebW/MainPage/index.jsp" class="whatever">Home	</a></li>
			  <li class=""><a href="http://localhost:8080/ProjectWebW/MainPage/dienthoai.jsp" class="whatever">Điện Thoại</a></li>
			  <li class=""><a href="http://localhost:8080/ProjectWebW/MainPage/dongho.jsp" class="whatever">Đồng Hồ</a></li>
			  <li class=""><a href="http://localhost:8080/ProjectWebW/MainPage/phukien.jsp" class="whatever" >Phụ Kiện</a></li>
			  <li class=""><a href="http://localhost:8080/ProjectWebW/MainPage/tablet.jsp" class="whatever" >Máy Tính Bảng</a></li>
			  <li class=""><a href="http://localhost:8080/ProjectWebW/MainPage/general.jsp" class="whatever">Nội Dung</a></li>

		<li style="border:0"> &nbsp;</li>
		<li> <a
						href="http://localhost:8080/ProjectWebW/MainPage/cart.jsp"><span
						class="icon-shopping-cart"></span> <c:out value="${cart.showProductItem(idU).size() }"></c:out> Item(s) - <span
						class="badge badge-warning"> $<c:out value="${cart.showCartByID(idU).getTotal() }"></c:out></span></a></li>
	</ul>
</div>

			  <div class="well well-small alert alert-warning cntr">
				  <h2>50% Discount</h2>
				  <p> 
					 only valid for online order. <br><br><a class="defaultBtn" href="#">Click here </a>
				  </p>
			  </div>
			  <div class="well well-small" ><a href="#"><img src="assets/img/paypal.jpg" alt="payment method paypal"></a></div>
			
			<a class="shopBtn btn-block" href="#">Upcoming products <br><small>Click to view</small></a>
			<br>
			<br>
			<ul class="nav nav-list promowrapper">
			<li>
			  <div class="thumbnail">
				<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<img src="assets/img/bootstrap-ecommerce-templates.png" alt="bootstrap ecommerce templates">
				<div class="caption">
				  <h4><a class="defaultBtn" href="product_details.html">VIEW</a> <span class="pull-right">$22.00</span></h4>
				</div>
			  </div>
			</li>
			<li style="border:0"> &nbsp;</li>
			<li>
			  <div class="thumbnail">
				<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<img src="assets/img/shopping-cart-template.png" alt="shopping cart template">
				<div class="caption">
				  <h4><a class="defaultBtn" href="product_details.html">VIEW</a> <span class="pull-right">$22.00</span></h4>
				</div>
			  </div>
			</li>
			<li style="border:0"> &nbsp;</li>
			<li>
			  <div class="thumbnail">
				<a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
				<img src="assets/img/bootstrap-template.png" alt="bootstrap template">
				<div class="caption">
				  <h4><a class="defaultBtn" href="product_details.html">VIEW</a> <span class="pull-right">$22.00</span></h4>
				</div>
			  </div>
			</li>
		  </ul>

	</div>