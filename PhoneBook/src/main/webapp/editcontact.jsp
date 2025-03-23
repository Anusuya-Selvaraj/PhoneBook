<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.Connection" %>
<%@ page import="com.dao.ContactDAO" %>
<%@ page import="com.entity.Contact" %>
<%@ page import="com.conn.DbConnect" %>

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
					<h4 class="text-center" style="color: #2633bf">Edit Contact Details</h4>
						
						<% 
						String editsuccessMsg = (String)session.getAttribute("editsuccessMsg");
						String editfailedMsg = (String)session.getAttribute("editfailedMsg");
						
						if(editsuccessMsg!=null){
						%>
							<p class="text-success text-center"><%=editsuccessMsg %></p>
						<% 
							session.removeAttribute("editsuccessMsg");
						}
						if(editfailedMsg!=null){
						%>
							<p class="text-danger text-center"><%=editfailedMsg %></p>
						<%
							session.removeAttribute("editfailedMsg");
						}
						%>
						
						<form action="update" method="post">
						
						  <%
						  int cid = Integer.parseInt(request.getParameter("cid"));
						  ContactDAO dao = new ContactDAO(DbConnect.getConn());
						  Contact c = dao.getContactByID(cid);
						  %>
						  
						  <input type="hidden" value="<%=cid%>" name="cid">
						  
						  <div class="form-group">
						    <label for="exampleInputEmail1" class="form-label">Enter Name</label>
						    <input value="<%=c.getName() %>" name="name" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"> 
						  </div>
						  
						  <div class="form-group">
						    <label for="exampleInputEmail1" class="form-label">Email address</label>
						    <input value="<%=c.getEmail() %>" name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
						  </div>
						  
						  <div class="form-group">
						    <label for="exampleInputEmail1" class="form-label">Enter Contact No</label>
						    <input value="<%=c.getPhno() %>" name="phno" type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
						  </div>
						  
						  <div class="form-group">
						    <label for="exampleInputEmail1" class="form-label">About</label><br>
						    <textarea rows="0" cols="90px" class="form-control" name="about"><%=c.getAbout() %></textarea>
						  </div>
						  
						  <div class="text-center">
						  	<button type="submit" class="btn btn-success">Update Contact</button>
						  </div>
					   </form>
					</div>
				</div> 
			</div>
		</div>
	</div>
</body>
</html>