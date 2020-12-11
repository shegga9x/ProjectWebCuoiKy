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
		<jsp:useBean id="product" class="database.ProductDAO"></jsp:useBean>
		<c:forEach var="item" items="${requestScope.item}">
		<div class="span9">
			<div class="well well-small">
				<div class="row-fluid">
					<div class="span2">
					<c:set var="src" value="http://localhost:8080/ProjectWebW/assets/imgB/${item.loai}/${item.filename1}.jpg"></c:set>
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
						<form class="form-horizontal qtyFrm">
							<h3>${item.gia}</h3>
							<label class="checkbox"> <input type="checkbox">
								Adds product to compair
							</label><br>
							<div class="btn-group">
								<a href="product_details.jsp" class="defaultBtn"><span
									class=" icon-shopping-cart"></span> Add to cart</a> <a
									href="../SPdon/DienThoai/dienthoai1.jsp" class="shopBtn">VIEW</a>
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