package com.bookshelf.main;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

public class DatabaseManager {
	
	private String host;
	private String port;
	private String schema;
	private String url;
	private String dbUsername;
	private String dbPassword;
	
	public DatabaseManager(String host, String port, String schema, String dbUsername, String dbPassword) {
		
		//set attributes
		this.host = host;
		this.port = port;
		this.schema = schema;
		this.url = "jdbc:mysql://" + host + ":" + port + "/" + schema;
		this.dbUsername = dbUsername;
		this.dbPassword = dbPassword;
		
		System.out.println("Database manager: " + url);
		
		//explicitly declare driver
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}
		catch(Exception e){
			System.out.println("Database driver not found!");
        	e.printStackTrace();
		}
	}
	
	//get user from username - success returns user - failure returns null
	public User getUser(String username) throws SQLException {
		
		//construct sql query
		//username is unique so query should return either a single result or zero
		String query = "SELECT * FROM " + schema + ".bookshelf_user WHERE username = " + "\"" + username + "\"";
		
		//try with resources
		try(Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);) {
			
			//if resultSet is empty - return null
			//else return first result - null fields return empty strings
			if(rs.next()==false) {
				return null;
			}
			else {
				return new User(
						(rs.getInt("id")),
						(rs.getString("username")==null) ? "" : rs.getString("username"),
						(rs.getString("password")==null) ? "" : rs.getString("password"),
						(rs.getString("first_name")==null) ? "" : rs.getString("first_name"),
						(rs.getString("last_name")==null) ? "" : rs.getString("last_name"),
						(rs.getString("email")==null) ? "" : rs.getString("email"),
						(rs.getString("address")==null) ? "" : rs.getString("address"),
						(rs.getString("zipcode")==null) ? "" : rs.getString("zipcode"),
						(rs.getString("roles")==null) ? new String[0] : rs.getString("roles").split(",")
						);
			}
		}
	}
	
	//inserts a new user into user
	public void setUser(User newUser) throws SQLException{
		
		//construct sql query
		String query = "INSERT INTO " + schema + 
				".bookshelf_user(username,password,first_name,last_name,email,address,zipcode) VALUES (?,?,?,?,?,?,?)";
		
		//try with resources
		try(Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
			PreparedStatement pstmt = con.prepareStatement(query);) {
        	
        	//set parameters - blank string is null
        	pstmt.clearParameters();
    		pstmt.setString(1, newUser.getUsername().isBlank() ? null : newUser.getUsername());
    		pstmt.setString(2, newUser.getPassword().isBlank() ? null : newUser.getPassword());
    		pstmt.setString(3, newUser.getFirstName().isBlank() ? null : newUser.getFirstName());
    		pstmt.setString(4, newUser.getLastName().isBlank() ? null : newUser.getLastName());
    		pstmt.setString(5, newUser.getEmail().isBlank() ? null : newUser.getEmail());
    		pstmt.setString(6, newUser.getAddress().isBlank() ? null : newUser.getAddress());
    		pstmt.setString(7, newUser.getZipcode().isBlank() ? null : newUser.getZipcode());
    		
    		//execute prepareStatement
    		pstmt.executeUpdate();
		}
	}
	
	//validate username and password - success returns user - failure returns null
	public User validateUserCredentials(String username, String password) throws SQLException {
		User u = getUser(username);
		if(u!=null && password.equals(u.getPassword())) {
			return u;
		}
		return null;
	}
	
	//get book from id - success returns book - failure returns null
	public Book getBook(int id) throws SQLException {
			
			//construct sql query
			//username is unique so query should return either a single result or zero
			String query = "SELECT * FROM " + schema + ".bookshelf_book WHERE id = " + id;
			
			//try with resources
			try(Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(query);) {
				
				//if resultSet is empty - return null
				//else return first result - null fields return empty strings
				if(rs.next()==false) {
					return null;
				}
				else {
					return new Book(
							(rs.getInt("id")),
							(rs.getString("title")==null) ? "" : rs.getString("title"),
							(rs.getString("author")==null) ? "" : rs.getString("author"),
							(rs.getString("description")==null) ? "" : rs.getString("description"),
							(rs.getString("category")==null) ? "" : rs.getString("category"),
							(rs.getString("publisher")==null) ? "" : rs.getString("publisher"),
							(rs.getFloat("rating")),
							(rs.getFloat("price")),
							(rs.getString("thumbnail_url")==null) ? "" : rs.getString("thumbnail_url"),
							(rs.getInt("stock"))
							);
				}
			}
		}
	
	//inserts a new record into order
	public void createOrder(int userID, Book[] books) throws SQLException {
		
		//get total value of order
		float total = 0;	
		for(int i=0; i<books.length; i++) {
			total += books[i].getPrice();
		}
		
		//construct sql query
		String query = "INSERT INTO " + schema + 
				".bookshelf_order(user_id,t_stamp,amount) VALUES (?,?,?)";
		
		//try with resources
		try(Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
			PreparedStatement pstmt = con.prepareStatement(query);) {
        	
        	//set parameters - blank string is null
        	pstmt.clearParameters();
    		pstmt.setInt(1, userID);
    		pstmt.setTimestamp(2, new Timestamp(new java.util.Date().getTime()));
    		pstmt.setFloat(3, total);
    		
    		//execute prepareStatement
    		pstmt.executeUpdate();
    		
		}
		
	}

	//returns the id of the most recent record in the order table - failure returns -1
	public int getLastOrderID() throws SQLException {
		
		//construct sql query
		String query = "SELECT * FROM " + schema + ".bookshelf_order ORDER BY id DESC Limit 1";
		
		//try with resources
		try(Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);) {
    		
    		//if resultSet is empty - return -1
			//else return id of last inserted row
			if(rs.next()==false) {
				return -1;
			}
			else {
				return rs.getInt("id");
			}
		}
	}

	//inserts a record into order_line for each book in the order
	public void createOrderLines(int orderID, Book[] books) throws SQLException {
		
		//construct sql query
		String query = "INSERT INTO " + schema + 
				".bookshelf_order_line(order_id,order_line_number,book_id,quantity) VALUES (?,?,?,?)";
		
		//try with resources
		try(Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);) {
			
			for(int i=0; i<books.length; i++) {
				try(PreparedStatement pstmt = con.prepareStatement(query);) {
					//set parameters - blank string is null
		        	pstmt.clearParameters();
		    		pstmt.setInt(1, orderID);
		    		pstmt.setInt(2, i+1);
		    		pstmt.setInt(3, books[i].getId());
		    		pstmt.setInt(4, 1);
		    		
		    		//execute prepareStatement
		    		pstmt.executeUpdate();
				}
			}
		}
	}

}