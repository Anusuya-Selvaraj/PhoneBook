<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allcss.jsp" %>
</head>
<body style="background-color: #d9e9fa;">
	<%@include file="component/navbar.jsp" %>
	<div class="container-fluid">
		<div class="row p-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<h4 class="text-center" style="color: #2633bf">Login Page</h4>
						<form action="login" method="post">
						  
						  <%
						  	String invalidMsg = (String)session.getAttribute("invalidMsg");
						  if(invalidMsg!=null){
						  %>  
						  	<p class="text-danger text-center"><%=invalidMsg %></p>
						  <%
						  session.removeAttribute("invalidMsg");
						  }
						  %>
						  <%
						  	String logMsg = (String)session.getAttribute("logMsg");
						  if(logMsg!=null){
						  %>  
						  	<p class="text-success text-center"><%=logMsg %></p>
						  <%
						  session.removeAttribute("logMsg");
						  }
						  %>
						  
						  <div class="form-group">
						    <label for="exampleInputEmail1" class="form-label">Email address</label>
						    <input type="email" class="form-control" id="exampleInputEmail1" name="email" aria-describedby="emailHelp">
						  </div>
						  <div class="form-group">
						    <label for="exampleInputPassword1" class="form-label">Password</label>
						    <input type="password" class="form-control" id="exampleInputPassword1" name="password" >
						  </div>
						  <div class="text-center">
						  	<button type="submit" class="btn btn-primary">Login</button>
						  </div>
					   </form>
					</div>
				</div> 
			</div>
		</div>
	</div>
<div style="margin-top: 267.5px">
	<%@include file="component/footer.jsp" %>
</div>
</body>
</html>