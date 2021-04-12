package com.bookshelf.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//GET response - redirect to index
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response writer
		response.setContentType("text/html");
		
		//include form in response
		request.getRequestDispatcher("index.jsp").include(request, response);
		
	}
	
	//POST response - validate user credentials against database - redirect to index if successful
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//create manager for local database
		DatabaseManager localDB = new DatabaseManager("localhost", "3306", "bookshelf", "root", "password");
		
		//validate username and password
		User u = localDB.validateUserCredentials(request.getParameter("username"),request.getParameter("password"));
		
		//if successful - redirect to index
		//else - TODO: error message pop up?
		if(u!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", u.getUsername());
			session.setMaxInactiveInterval(30*60);
			request.getRequestDispatcher("index.jsp").include(request, response);
		}
		else {
			request.getRequestDispatcher("login.jsp").include(request, response);
			
		}
			
	}

}