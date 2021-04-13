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
						(rs.getString("username")==null) ? "" : rs.getString("username"),
						(rs.getString("password")==null) ? "" : rs.getString("password"),
						(rs.getString("first_name")==null) ? "" : rs.getString("first_name"),
						(rs.getString("last_name")==null) ? "" : rs.getString("last_name"),
						(rs.getString("email")==null) ? "" : rs.getString("email"),
						(rs.getString("address")==null) ? "" : rs.getString("address"),
						(rs.getString("zipcode")==null) ? "" : rs.getString("zipcode")
						);
			}
		}
	}
	
	//inserts user into database
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
	
	//returns database id for a given user - success returns id - failure returns -1
	public int getUserID(User u) throws SQLException {
		
		//construct sql query
		//username is unique so query should return either a single result or zero
		String query = "SELECT * FROM " + schema + ".bookshelf_user WHERE username = " + "\"" + u.getUsername() + "\"";
		
		//try with resources
		try(Connection con = DriverManager.getConnection(url, dbUsername, dbPassword);
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);) {
			
			//if resultSet is empty - return -1
			//else return id from first result
			if(rs.next()==false) {
				return -1;
			}
			else {
				return rs.getInt("id");
			}
		}
	}
	
}