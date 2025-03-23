<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, com.conn.DbConnect" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PhoneBook</title>
<%@include file="component/allcss.jsp" %>
<style type="text/css">
	.back-img{
	background: url("img/home-phone-book.png");
	width: 100vh;
	height:80vh;
	background-size:cover;
	background-repeat: no-repeat;
	
	}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp" %>
	
	

	<div class="container-fluid back-img text-center text-primary ">
		<h1 class="mt-3" style="color: #2633bf">Welcome to phone book!</h1>
	</div>
	<%@include file="component/footer.jsp" %>
</body>
</html>