package com.bookshelf.main;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//GET response - return signup page
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.getRequestDispatcher("signup.jsp").include(request, response);	
	}
	
	//POST response - creates user from form data, adds user to database
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String notification;
		
		//create user from request data
		User u = new User(
				-1,
				request.getParameter("username"),
				request.getParameter("password"),
				request.getParameter("first_name"),
				request.getParameter("last_name"),
				request.getParameter("email"),
				request.getParameter("address_1"),
				request.getParameter("address_postcode")
				);
		
		//create manager for cloud database
		DatabaseManager cloudDB = new DatabaseManager("ee417.crxkzf89o3fh.eu-west-1.rds.amazonaws.com", "3306", "testdb", "ee417", "ee417");
		
		//if user with that username doesn't already exist in database - create user
		try {
			if(cloudDB.getUser(u.getUsername())==null) {
				cloudDB.setUser(u);
				notification = "<span class=\"success\">" + "Successfully added user " + u.getUsername() + "</span>";
			}
			else {
				notification = "<span class=\"failure\">" + "Username or email already in use" + "</span>";
			}
		} catch (SQLException e) {
			e.printStackTrace();
			notification = "<span class=\"failure\">" + "Error: " + e.getMessage() + "</span>";
		}
		
		//call GET with appropriate notification
		request.setAttribute("notification", notification);
		doGet(request,response);
	}

}