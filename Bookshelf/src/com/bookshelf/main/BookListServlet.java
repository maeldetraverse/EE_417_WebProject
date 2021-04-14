package com.bookshelf.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/BookListServlet")
public class BookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	//GET response - return booklist page
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	//set list title
    	request.setAttribute("listTitle", "Library");
    	
    	//set some default query parameters
    	request.setAttribute("category", "");
    	request.setAttribute("publisher", "");
    	request.setAttribute("order", "rating");
    	request.setAttribute("direction", "DESC");
    	request.setAttribute("limit", "20");
    	
    	//return booklist page
    	response.setContentType("text/html");
		request.getRequestDispatcher("booklist.jsp").include(request, response);
	}
	
    //POST response - return booklist page
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//set list title
		request.setAttribute("listTitle", "Library");
		
		//set query parameters from original request
		request.setAttribute("category", request.getParameter("category"));
		request.setAttribute("publisher", request.getParameter("publisher"));
		request.setAttribute("order", request.getParameter("order"));
		request.setAttribute("direction", request.getParameter("direction"));
		request.setAttribute("limit", request.getParameter("limit"));
		
		//return booklist page
		response.setContentType("text/html");
		request.getRequestDispatcher("booklist.jsp").include(request, response);
	}
}
