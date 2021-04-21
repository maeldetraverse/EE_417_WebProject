package com.bookshelf.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/NovelServlet")
public class NovelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	//GET response - return booklist page with "novel" parameters
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	//set list title
    	request.setAttribute("listTitle", "Novels");
    	
    	//set "classics" query parameters
    	request.setAttribute("category", "novel");
    	request.setAttribute("publisher", "");
    	request.setAttribute("order", "rating");
    	request.setAttribute("direction", "DESC");
    	request.setAttribute("limit", "20");
    	
    	//return booklist page
    	response.setContentType("text/html");
		request.getRequestDispatcher("booklist.jsp").include(request, response);
	}
	
    //POST response should not be used - call GET
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
