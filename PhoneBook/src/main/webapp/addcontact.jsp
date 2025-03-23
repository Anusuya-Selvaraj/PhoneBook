

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allcss.jsp" %>
</head>
<body>
	<%@include file="component/navbar.jsp" %>
	
	<% 
	if(user==null){
		session.setAttribute("invalidMsg","Login please..");
		response.sendRedirect("login.jsp");
	}
	%>
	
	<div class="container-fluid">
		<div class="row p-4">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
					<h4 class="text-center" style="color: #2633bf">Add Contact</h4>
						
						<% 
						String contactsuccessMsg = (String)session.getAttribute("contactsuccessMsg");
						String failedMsg = (String)session.getAttribute("failedMsg");
						
						if(contactsuccessMsg!=null){
						%>
							<p class="text-success text-center"><%=contactsuccessMsg %></p>
						<% 
							session.removeAttribute("contactsuccessMsg");
						}
						if(failedMsg!=null){
						%>
							<p class="text-danger text-center"><%=failedMsg %></p>
						<%
							session.removeAttribute("failedMsg");
						}
						%>
						
						<form action="addContact" method="post">
						
						  <%
						  if(user!=null)
						  {
						  %>
						  <input type="hidden" value="<%= user.getId() %>" name="userId">
						  <%
						  }
						  %>
						  <div class="form-group">
						    <label for="exampleInputEmail1" class="form-label">Enter Name</label>
						    <input name="name" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"> 
						  </div>
						  
						  <div class="form-group">
						    <label for="exampleInputEmail1" class="form-label">Email address</label>
						    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
						  </div>
						  
						  <div class="form-group">
						    <label for="exampleInputEmail1" class="form-label">Enter Contact No</label>
						    <input name="phno" type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
						  </div>
						  
						  <div class="form-group">
						    <label for="exampleInputEmail1" class="form-label">About</label><br>
						    <textarea rows="0" cols="90px" class="form-control" name="about"></textarea>
						  </div>
						  
						  <div class="text-center">
						  	<button type="submit" class="btn btn-success">Save Contact</button>
						  </div>
					   </form>
					</div>
				</div> 
			</div>
		</div>
	</div>
<div style="margin-top: 121.5px">
	<%@include file="component/footer.jsp" %>
</div>
</body>
</html>