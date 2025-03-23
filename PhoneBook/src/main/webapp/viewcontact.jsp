<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.dao.ContactDAO" %>
<%@ page import="com.entity.Contact" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.conn.DbConnect" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allcss.jsp" %>
<style type="text/css">
	.crd-ho:hover{
	background-color:#edeff2;
	}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp" %>
	
	<%
	if(user==null){
		session.setAttribute("invalidMsg","Login please..");
		response.sendRedirect("login.jsp");
	}
	%>
	
	<%
	String editsuccessMsg = (String)session.getAttribute("editsuccessMsg");
	String deletefailedMsg = (String)session.getAttribute("deletefailedMsg");
	if(editsuccessMsg!=null)
	{%>
	<div class="alert alert-success" role="alert"><%=editsuccessMsg%></div>
	
	<%	
	session.removeAttribute("editsuccessMsg");
	}
	if(deletefailedMsg!=null){
		%>
			<p class="text-danger text-center"><%=deletefailedMsg %></p>
		<%
			session.removeAttribute("deletefailedMsg");
		}
		%>
	
	
	<div class="container">
		<div class="row p-4">
			<%
			if(user!=null){
				
			
			ContactDAO dao = new ContactDAO(DbConnect.getConn());
			List<Contact> contact = dao.getAllContact(user.getId());
			for(Contact c: contact){
			%>
						
			<div class="col-md-4">
				<div class="card crd-ho">
						<div class="card-body ">
							<h5>Name: <%=c.getName() %></h5>
							<p>Ph no: <%=c.getPhno() %></p>
							<p>Email: <%=c.getEmail() %></p>
							<p>About: <%=c.getAbout() %></p>
							<div class="text-center ">
								<a href="editcontact.jsp?cid=<%=c.getId() %>" class="btn btn-success btn-sm text-white">Edit</a> 
								<a href="delete?cid=<%=c.getId() %>" class="btn btn-danger btn-sm text-white">Delete</a>
						    </div>
						</div>
				</div>
			</div>
			<%
			}
			}
			%>
			
		</div>
	</div>
<div style="margin-top: 350.5px">
	<%@include file="component/footer.jsp" %>
</div>
</body>
</html>