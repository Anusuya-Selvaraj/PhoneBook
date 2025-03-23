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
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
					<h4 class="text-center" style="color: #2633bf">Registration Page</h4>
						<% 
						String successMsg = (String)session.getAttribute("successMsg");
						String errorMsg = (String)session.getAttribute("errorMsg");
						
						if(successMsg!=null){
						%>
							<p class="text-success text-center"><%=successMsg %></p>
						<% 
							session.removeAttribute("successMsg");
						}
						if(errorMsg!=null){
						%>
							<p class="text-danger text-center"><%=errorMsg %></p>
						<%
							session.removeAttribute("errorMsg");
						}
						%>
						<form action="register" method="post">
						  <div class="form-group">
						    <label for="exampleInputEmail1" class="form-label">Enter Name</label>
						    <input type="text" class="form-control" id="exampleInputEmail1" name="name" aria-describedby="emailHelp"> 
						  </div>
						  <div class="form-group">
						    <label for="exampleInputEmail1" class="form-label">Email address</label>
						    <input  type="email" class="form-control" id="exampleInputEmail1" name="email" aria-describedby="emailHelp">
						  </div>
						  <div class="form-group">
						    <label for="exampleInputPassword1" class="form-label">Password</label>
						    <input type="password" class="form-control" id="exampleInputPassword1" nmae="password">
						  </div>
						  <div class="text-center">
						  	<button type="submit" class="btn btn-primary">Register</button>
						  </div>
					   </form>
					</div>
				</div> 
			</div>
		</div>
	</div>
<div style="margin-top: 181.5px">
	<%@include file="component/footer.jsp" %>
</div>
</body>
</html>