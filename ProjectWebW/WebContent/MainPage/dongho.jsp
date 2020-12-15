<%@page import="database.ProductDAO"%>
<%@page import="beans.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>

	<div class="row">

		<jsp:include page="../slidebar.jsp"></jsp:include>
		<jsp:useBean id="product" scope="session" class="database.ProductDAO"/>
		<c:set var="currentUser" value='${sessionScope["currentSessionUser"]}'></c:set>
		<c:set var="idU" value='${currentUser.getUsername()}'></c:set>
		<c:forEach var="item" items="${product.listByType('dongho')}">
		<div class="span9">
			<div class="well well-small">
				<div class="row-fluid">
					<div class="span2">
						<c:set var="src1" value="${item.loai}/${item.filename1}"></c:set>
						<c:set var="src" value="http://localhost:8080/ProjectWebW/assets/imgB/${src1}.jpg"> </c:set>
						<img src="${src}" alt="">
					</div>
					<div class="span6">
						<h5>${item.name}</h5>
						<p>Nowadays the lingerie industry is one of the most
							successful business spheres. We always stay in touch with the
							latest fashion tendencies - that is why our goods are so
							popular..</p>
					</div>
					<div class="span4 alignR">
						<form class="form-horizontal qtyFrm" method="POST"
							action="http://localhost:8080/ProjectWebW/CartServlet">
							<input type="hidden" name="idU" value="${idU}">
							<input type="hidden" name="idP" value="${item.id}">
							<input type="hidden" name="loai" value="${item.loai}">
							<input type="hidden" name="filename1" value="${item.filename1}">
							<input type="hidden" name="id" value="${item.id}">
							<h5>
								Price:${item.gia}<input type="hidden" name="price" value="${item.gia}">
							</h5>
							<h5>
								Quantity:<input type="number" name="quantity" value="1"
									style="width: 50%;">
							</h5>
							<input type="hidden" name="description" value="Tech-Freaks imaginary model 1.">
							<div class="btn-group">
								<button name="action" value="Add To Cart" class="defaultBtn">
								<span  class=" icon-shopping-cart"></span>
								</button> 
								<input type="button" class="shopBtn" onclick="location.href='../SPdon/${src1}.jsp'" value="View" />

							</div>
						</form>
					</div>
				</div>
				<hr class="soften">
			</div>
		</div>
		 </c:forEach>
	</div>

	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>