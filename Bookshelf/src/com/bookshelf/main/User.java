package com.bookshelf.main;

public class User {
	
	private int id;
	private String username;
	private String password;
	private String firstName;
	private String lastName;
	private String email;
	private String address;
	private String zipcode;
	private String[] roles;
	
	public User( int id,
			String username,
			String password,
			String firstName,
			String lastName,
			String email,
			String address,
			String zipcode,
			String[] roles) {
		
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.address = address;
		this.zipcode = zipcode;
		this.roles = roles;
	}
	
	//id
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	//username
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	//password
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	//firstName
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	//lastName
	public String getLastName() {
	    return lastName;
	}
	public void setLastName(String lastName) {
	    this.lastName = lastName;
	}
	
	//email
	public String getEmail() {
	    return email;
	}
	public void setEmail(String email) {
	    this.email = email;
	}
	
	//address
	public String getAddress() {
	    return address;
	}
	public void setAddress(String address) {
	    this.address = address;
	}
	
	//zipcode
	public String getZipcode() {
	    return zipcode;
	}
	public void setZipcode(String zipcode) {
	    this.zipcode = zipcode;
	}
	
	//roles
	public String[] getRoles() {
	    return roles;
	}
	public void setRoles(String[] roles) {
	    this.roles = roles;
	}
	
}