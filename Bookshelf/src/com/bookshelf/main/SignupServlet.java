package com.bookshelf.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//include form in response
		request.getRequestDispatcher("index.jsp").include(request, response);
		
	}
	
	//POST response - creates user from form data, adds user to database
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//create manager for local database
		DatabaseManager localDB = new DatabaseManager("localhost", "3306", "bookshelf", "root", "password");
		
		//create user from request data
		User newUser = new User(
				request.getParameter("username"),
				request.getParameter("password"),
				request.getParameter("first_name"),
				request.getParameter("last_name"),
				request.getParameter("email"),
				request.getParameter("address_1"),
				request.getParameter("address_postcode")
				);
		
		//if user with that username doesn't already exist in database - create user
		if(localDB.getUser(newUser.getUsername()) == null) {
			localDB.createUser(newUser);
		}
		
		//include form in response
		request.getRequestDispatcher("index.jsp").include(request, response);	
	}

}