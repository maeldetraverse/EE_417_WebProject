package com.bookshelf.main;

import java.sql.*;
import java.util.*;

public class DatabaseManager {
	
	private String host;
	private String port;
	private String schema;
	private String url;
	private String dbUsername;
	private String dbPassword;
	
	public DatabaseManager(String host, String port, String schema, String dbUsername, String dbPassword) {
		
		//set attrubutes
		this.host = host;
		this.port = port;
		this.schema = schema;
		this.url = "jdbc:mysql://" + host + ":" + port + "/" + schema;
		this.dbUsername = dbUsername;
		this.dbPassword = dbPassword;
		
		//explicitly declare driver
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}
		catch(Exception e){
			System.out.println("Driver class not found!");
        	e.printStackTrace();
		}
	}
	
	public void createUser(User newUser) {
		
		//construct sql query
		String query = "INSERT INTO " + schema + 
				".user(username,password,first_name,last_name,email,address_1,address_postcode) VALUES (?,?,?,?,?,?,?)";
		
		//try with resources
		try(Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
			PreparedStatement pstmt = con.prepareStatement(query);) {
        	
        	//set parameters
        	pstmt.clearParameters();
    		pstmt.setString(1, newUser.getUsername());
    		pstmt.setString(2, newUser.getPassword());
    		pstmt.setString(3, newUser.getFirstName());
    		pstmt.setString(4, newUser.getLastName());
    		pstmt.setString(5, newUser.getEmail());
    		pstmt.setString(6, newUser.getAddress1());
    		pstmt.setString(7, newUser.getAddressPostcode());
    		
    		//execute prepareStatement
    		pstmt.executeUpdate();
		}
		
		//catch exceptions
		catch(Exception e) {
        	System.out.println("Create user operation failed!");
        	System.out.println(query);
        	e.printStackTrace();
        }
		
	}
	
	public User getUser(String username) {
		
		//construct sql query
		String query = "SELECT * FROM " + schema + ".user WHERE username = " + "\"" + username + "\"";
		
		//try with resources
		try(Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);) {
			
			//if result set is empty - return null
			//else return a new user based on the first result
			if(rs.next()==false) {
				return null;
			}
			else {
				return new User(
						rs.getString("username"),
						rs.getString("password"),
						rs.getString("first_name"),
						rs.getString("last_name"),
						rs.getString("email"),
						rs.getString("address_1"),
						rs.getString("address_postcode")
						);
			}
		}
		
		//catch exceptions
		//in case of failure return null
		catch(Exception e) {
        	System.out.println("Get user operation failed!");
        	System.out.println(query);
        	e.printStackTrace();
        	return null;
        }
		
	}
	
	public User validateUserCredentials(String username, String password) {
		User u = getUser(username);
		if(u!=null) {
			if(password.equals(u.getPassword())){
				return u;
			}
		}
		return null;
	}
	
	public String getUserViewTable() {
		
		//construct sql query
		String query = "SELECT * FROM " + schema + ".user";
		
		//construct html table header
		String html = "<table><tr>" + "<th>username</th>" + "<th>password</th>" + "<th>first_name</th>" + "<th>last_name</th>" + "<th>email</th>" +
				"<th>address_1</th>" + "<th>address_postcode</th></tr>";
		
		//try with resources
		try(Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);) {
			
			//add table row for each result
			//if no results - close table and return
			if(rs.next()==false) {
				html += "</table>";
				return html;
			}
			else {
				do {
					html += "<tr>" +
							"<td>" + rs.getString("username") + "</td>" +
							"<td>" + rs.getString("password") + "</td>" +
							"<td>" + rs.getString("first_name") + "</td>" +
							"<td>" + rs.getString("last_name") + "</td>" +
							"<td>" + rs.getString("email") + "</td>" +
							"<td>" + rs.getString("address_1") + "</td>" +
							"<td>" + rs.getString("address_postcode") + "</td>" +
							"</tr>";
				}while(rs.next());
				html += "</table>";
				return html;
			}
		}
		
		//catch exceptions
		//if exception occurs - close table and return
		catch(Exception e) {
        	System.out.println("Print user records operation failed!");
        	System.out.println(query);
        	e.printStackTrace();
        	html += "</table>";
			return html;
        }
		
	}
	
	public String getBookViewTable(String author, String category, String publisher, String order, String direction, String limit) {
		
		//construct sql query
		String selectClause = "SELECT * ";
		
		String fromClause = "FROM " + schema + ".book ";
		
		String whereClause = "WHERE " +
				"author LIKE " + "\"%" + author + "%\"" + " AND " +
				"category LIKE " + "\"%" + category + "%\"" + " AND " +
				"publisher LIKE " + "\"%" + publisher + "%\" ";
		
		String orderClause = "ORDER BY " +
				((order.isEmpty()) ? "id" : order) + " " +
				((direction.isEmpty()) ? "ASC" : direction) + " ";
		
		String limitClause = "LIMIT " + limit + ";";
		
		//final query
		String query = selectClause + fromClause + whereClause + orderClause + limitClause;
		
		//construct html table header
		String html = "<table><tr>" + "<th>Title</th>" + "<th>Author</th>" + "<th>Description</th>" + "<th>Category</th>" + "<th>Publisher</th>" +
				"<th>Publication Date</th>" + "<th>Rating</th>" + "<th>Price</th>" + "<th>Thumbnail URL</th>" + "<th>Stock</th>";
		
		//try with resources
		try(Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);) {
			
			//add table row for each result
			//if no results - close table and return
			if(rs.next()==false) {
				html += "</table>";
				return html;
			}
			else {
				do {
					html += "<tr>" +
							"<td>" + rs.getString("title") + "</td>" +
							"<td>" + rs.getString("author") + "</td>" +
							"<td>" + rs.getString("description") + "</td>" +
							"<td>" + rs.getString("category") + "</td>" +
							"<td>" + rs.getString("publisher") + "</td>" +
							"<td>" + rs.getString("publication_date") + "</td>" +
							"<td>" + rs.getString("rating") + "</td>" +
							"<td>" + rs.getString("price") + "</td>" +
							"<td>" + rs.getString("thumbnail_url") + "</td>" +
							"<td>" + rs.getString("stock") + "</td>" +
							"</tr>";
				}while(rs.next());
				html += "</table>";
				return html;
			}
		}
		
		//catch exceptions
		//if exception occurs - close table and return
		catch(Exception e) {
        	System.out.println("Get book view operation failed!");
        	System.out.println(query);
        	e.printStackTrace();
        	html += "</table>";
			return html;
        }
		
	}
	
	public String getBookViewGrid(String author, String category, String publisher, String order, String direction, String limit) {
		
		//construct sql query
		String selectClause = "SELECT * ";
		
		String fromClause = "FROM " + schema + ".book ";
		
		String whereClause = "WHERE " +
				"author LIKE " + "\"%" + author + "%\"" + " AND " +
				"category LIKE " + "\"%" + category + "%\"" + " AND " +
				"publisher LIKE " + "\"%" + publisher + "%\" ";
		
		String orderClause = "ORDER BY " +
				((order.isEmpty()) ? "id" : order) + " " +
				((direction.isEmpty()) ? "ASC" : direction) + " ";
		
		String limitClause = "LIMIT " + limit + ";";
		
		//final query
		String query = selectClause + fromClause + whereClause + orderClause + limitClause;
		
		//construct html table header
		String html = "<table border = \"1\" width = \"100%\">";
		
		//try with resources
		try(Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);) {
			
			List<String> results = new ArrayList<String>(); 
			
			//add table data for each result
			//if no results - close table and return
			if(rs.next()==false) {
				html += "</table>";
				return html;
			}
			else {
				int i = 0;
				html += "<tr>";
				do {
					html += "<td>" + "<img height=\"64px\" width=\"64px\" src=" + rs.getString("thumbnail_url") + ">" +
						rs.getString("title") + 
						rs.getString("price") + "</td>";
					i++;
					if(i>=4) {
						html += "</tr>";
						i = 0;
					}
					}while(rs.next());
						
				html += "</table>";
				return html;
			}
		}
		
		//catch exceptions
		//if exception occurs - close table and return
		catch(Exception e) {
        	System.out.println("Get book view operation failed!");
        	System.out.println(query);
        	e.printStackTrace();
        	html += "</table>";
			return html;
        }
		
	}
	
}