package com.bookshelf.main;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//GET response - return login page
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.getRequestDispatcher("login.jsp").include(request, response);
	}
	
	//POST response - validate user credentials against database
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User u;
		String notification;
		
		//create manager for cloud database
		DatabaseManager cloudDB = new DatabaseManager("ee417.crxkzf89o3fh.eu-west-1.rds.amazonaws.com", "3306", "testdb", "ee417", "ee417");
		
		//validate username and password
		try {
			u = cloudDB.validateUserCredentials(request.getParameter("username"),request.getParameter("password"));
			if(u!=null) {
				HttpSession session = request.getSession();
				session.setMaxInactiveInterval(30*60);
				session.setAttribute("user", u);
				notification = "<span class=\"success\">" + "Successfully logged in as " + u.getUsername() + "</span>";
			}
			else {
				notification = "<span class=\"failure\">" + "Username or password incorrect" + "</span>";
			}		
		} catch (SQLException e) {
			e.printStackTrace();
			notification = "<span class=\"failure\">" + "Error: " + e.getMessage() + "</span>";
		}
		
		//call GET with appropriate notification
		request.setAttribute("notification", notification);
		request.getRequestDispatcher("userinfo.jsp").include(request, response);
	}

}