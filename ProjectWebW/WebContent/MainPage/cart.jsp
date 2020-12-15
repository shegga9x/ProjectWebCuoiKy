<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


</head>
<body>
<jsp:include page="../header.jsp"></jsp:include>
<div class="row">
   <jsp:useBean id="cart" scope="session" class="database.CartDAO" />
   <c:set var="currentUser" value='${sessionScope["currentSessionUser"]}'></c:set>
   <c:set var="idU" value='${currentUser.getUsername()}'></c:set>
	<div class="span12">
    <ul class="breadcrumb">
		<li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
		<li class="active">Tính tiền</li>
    </ul>
	<div class="well well-small">
		<h1>Tính tiền <small class="pull-right"> <c:out value="${cart.showProductItem(idU).size()}"/> Items are in the cart </small></h1>
	<hr class="soften"/>	
	<table class="table table-bordered table-condensed">
              <thead>
                <tr>
                  <th>Product</th>
                  <th>Description</th>
				  <th>	Ref. </th>
                  <th>Avail.</th>
                  <th>Unit price</th>
                  <th>Qty </th>
                  <th>Total</th>
				</tr>
              </thead>
              <tbody>
              
               <c:if test="${cart.showProductItem(idU).size() == 0}">
                    <tr> <td colspan="4">- Cart is currently empty -</td></tr>
                </c:if>
                <c:set var="count" value="0" scope="page" />
                
                <c:forEach var="cartItem" items="${cart.showProductItem(idU)}" varStatus="counter">
                <c:set var="count" value="${count + 1}" scope="page"/>
                 <c:set var = "src1" scope = "session" value = "http://localhost:8080/ProjectWebW/assets/imgB/${cartItem.getLoai()}/${cartItem.getFilename1()}.jpg"/>
                    <form name="item" method="POST" action="http://localhost:8080/ProjectWebW/CartServlet">
								<tr>
									<td><img width="100" src="${src1}" alt=""></td>
									<td>${cartItem.name}
									<br>Model :<c:out value="${cartItem.loai} "/>
									<input type="hidden" name="idU" value="${idU}">
									<input type="hidden" name="idP" value="${cartItem.id}">
									</td>
									<td>-</td>
									<td><span class="shopBtn"><span class="icon-ok"></span></span>
									</td>
									<td><c:out value="${cartItem.gia}"/></td>
									<td><input class="span1" style="max-width: 34px"
										placeholder="1" id="appendedInputButtons" size="16"
										type="number" name="quantity" value='<c:out value="${cartItem.sluong}"/>'>
										<div class="input-append">
											<button class="btn " type="submit"  name="action" value="Update">Update</button>
											<button class="btn  btn-danger" type="submit" name="action" value="Delete">
												<span class="icon-remove"></span>
											</button>
										</div></td>
									<td>$<c:out value="${cartItem.totalCost}"/></td>
								</tr>
							</form>
                </c:forEach>
				
				 <tr>
                  <td colspan="6" class="alignR">Total products:	</td>
                  <td class="label label-primary">$<c:out value="${cart.getTotal(idU)}"/></td>
                </tr>
				</tbody>
            </table><br/>
		
		
            <table class="table table-bordered">
			<tbody>
				 <tr>
                  <td> 
				<form class="form-inline">
				  <label style="min-width:159px"> VOUCHERS Code: </label> 
				<input type="text" class="input-medium" placeholder="CODE">
				<button type="submit" class="shopBtn"> ADD</button>
				</form>
				</td>
                </tr>
				
			</tbody>
				</table>
			<table class="table table-bordered">
			<tbody>
                <tr><td>ESTIMATE YOUR SHIPPING & TAXES</td></tr>
                 <tr> 
				 <td>
					<form class="form-horizontal" method="POST" action="http://localhost:8080/ProjectWebW/CartServlet">
					  <div class="control-group">
						<label class="span2 control-label" for="inputEmail">Country</label>
						<div class="controls">
						  <input type="text" placeholder="Country">
						  
						</div>
					  </div>
					  <div class="control-group">
						<label class="span2 control-label" for="inputPassword">Post Code/ Zipcode</label>
						<div class="controls">
						  <input type="password" placeholder="Password">
						  <input type="hidden" name="idU" value="${idU}">
						</div>
					  </div>
					  <div class="control-group">
						<div class="controls">
						  <button type="submit" class="shopBtn" name="action" value="Pay">Click to check the price</button>
						</div>
					  </div>
					</form> 
				  </td>
				  </tr>
              </tbody>
            </table>		

</div>
</div>
</div>
<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>