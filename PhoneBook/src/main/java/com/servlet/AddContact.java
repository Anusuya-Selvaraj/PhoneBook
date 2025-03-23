package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DbConnect;
import com.dao.ContactDAO;
import com.entity.Contact;

@WebServlet("/addContact")
public class AddContact extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userId=Integer.parseInt(request.getParameter("userId"));
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phno=request.getParameter("phno");
		String about=request.getParameter("about");
		
		Contact c = new Contact(name,email,phno,about,userId);
		ContactDAO dao = new ContactDAO(DbConnect.getConn());
		
		HttpSession session=request.getSession();
		boolean f= dao.saveContact(c);
		if(f) {
			session.setAttribute("contactsuccessMsg","Your contact is Saved.. " );
			response.sendRedirect("addcontact.jsp");
		}
		else {
			session.setAttribute("failedMsg","Your contact is not Saved.." );
			response.sendRedirect("addcontact.jsp");
		}
	}

}
