package com.bookshelf.main;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;

@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//GET response - return checkout page
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.getRequestDispatcher("checkout.jsp").include(request, response);
	}
	
	//POST response - processes order - calls GET with success/fail notification
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int userID;
		String notification;
		JSONArray ja;
		Book[] books;
		
		//create manager for cloud database
		DatabaseManager cloudDB = new DatabaseManager("ee417.crxkzf89o3fh.eu-west-1.rds.amazonaws.com", "3306", "testdb", "ee417", "ee417");
		
		//check for valid user id
		try {
			HttpSession session = request.getSession();
			User u = (User) session.getAttribute("user");
			userID = u.getId();
		}
		catch (Exception e) {
			notification = "<span class=\"failure\">" + "Error: " + "Please log in" + "</span>";
			request.setAttribute("notification", notification);
			doGet(request,response);
			return;
		}
		
		//catch empty basket
		String basketData = request.getParameter("basketData");
		if(basketData.isBlank()) {
			notification = "<span class=\"failure\">" + "Error: " + "Basket is empty" + "</span>";
			request.setAttribute("notification", notification);
			doGet(request,response);
			return;
		}
		
		//convert basket data to JSON array
		try {
			ja = new JSONArray(request.getParameter("basketData"));
		}
		catch(Exception e){
			notification = "<span class=\"failure\">" + "Error: " + e.getMessage() + "</span>";
			request.setAttribute("notification", notification);
			doGet(request,response);
			return;
		}
		
		//initialize books array
		books = new Book[ja.length()];
		
		//fill books array
		for(int i=0; i<ja.length(); i++) {
			JSONObject jo = ja.getJSONObject(i);
			try {
				books[i] = cloudDB.getBook(jo.getInt("id"));
			}
			catch (Exception e) {
				notification = "<span class=\"failure\">" + "Error: " + e.getMessage() + "</span>";
				request.setAttribute("notification", notification);
				doGet(request,response);
				return;
			}
		}
		
		//process an order with the given information
		try {
			cloudDB.createOrder(userID,books);
			int orderID = cloudDB.getLastOrderID();
			cloudDB.createOrderLines(orderID,books);
		}
		catch(Exception e) {
			notification = "<span class=\"failure\">" + "Error: " + e.getMessage() + "</span>";
			request.setAttribute("notification", notification);
			doGet(request,response);
			return;
		}
		
		//Display success notification
		notification = "<span class=\"success\">" + "Order placed successfully" + "</span>";
		request.setAttribute("notification", notification);
		doGet(request,response);
	}

}