 <%@page import="beans.User"%>

<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>


<jsp:include page="../header.jsp"></jsp:include>
	<div class="row">
<jsp:include page="../slidebar.jsp"></jsp:include>
	<div class="span9">
    <ul class="breadcrumb">
		<li><a href="index.jsp">Home</a> <span class="divider">/</span></li>
		<li class="active">Login</li>
    </ul>
	<h3> Login</h3>	
	<hr class="soft"/>
	<div class="row">
		<div class="span4">
			<div class="well">
			<h5>CREATE YOUR ACCOUNT</h5><br/>
			Create a new account ?<br/><br/><br/>
			<form action="register.jsp">
			  <div class="controls">
			  <button type="submit" class="btn block">Create Your Account</button>
			  </div>
			</form>
		</div>
		</div>
		<div class="span1"> &nbsp;</div>
		<div class="span4">
			<div class="well">
			<h5>ALREADY REGISTERED ?</h5>
			<form action="../UserServlet" method="post">
			  <div class="control-group">
				<label class="control-label" for="inputEmail">Email</label>
				<div class="controls">
				  <input class="span3"  type="text" placeholder="Email" name ="un">
				</div>
			  </div>
			  <div class="control-group">
				<label class="control-label" for="inputPassword">Password</label>
				<div class="controls">
				  <input type="password" class="span3" placeholder="Password" name = "pw">
				</div>
			  </div>
			  <div class="control-group">
				<div class="controls">
				  <button type="submit" class="defaultBtn" value="Sign In" name="action" onclick="myFunction()">Sign in</button> <a href="#">Forget password?</a>
				</div>
			  </div>
			</form>
		</div>
		</div>
		<script >
    
		</script>
	</div>	
</div>
</div><jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
