package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.UserDAO;
import com.entity.User;

@WebServlet("/login")
public class loginServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		System.out.println(email+" "+password);
		UserDAO dao = new UserDAO(DbConnect.getConn());
		User u = dao.loginUser(email, password);
		
		HttpSession session = request.getSession();
		
		
		if(u!=null) {
			
			session.setAttribute("user", u);
			response.sendRedirect("index.jsp");
			//System.out.println("User is available" + u);
		}
		else {
			session.setAttribute("invalidMsg", "Invlaid Email & Password");
			response.sendRedirect("login.jsp");
			//System.out.println("User Is not Available" + u);
		}
	}
	
}
