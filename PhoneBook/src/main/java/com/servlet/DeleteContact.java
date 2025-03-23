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


@WebServlet("/delete")
public class DeleteContact extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cid= Integer.parseInt(request.getParameter("cid"));
		
		ContactDAO dao = new ContactDAO(DbConnect.getConn());
		
		boolean f=dao.deleteContactById(cid);
		HttpSession session = request.getSession();
		if(f==true) {
			session.setAttribute("deletesuccessMsg","Contact deleted Successfulyy..");
			response.sendRedirect("viewcontact.jsp");
		}
		else {
			session.setAttribute("deletefailedMsg","Contact not deleted..");
			response.sendRedirect("viewcontact.jsp");
		}
		
	}

}
