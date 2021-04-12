package com.bookshelf.main;

public class User {
	
	private String username;
	private String password;
	private String firstName;
	private String lastName;
	private String email;
	private String address1;
	private String addressPostcode;
	
	public User( String username,
			String password,
			String firstName,
			String lastName,
			String email,
			String address1,
			String addressPostcode) {
		
		super();
		this.username = username;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.address1 = address1;
		this.addressPostcode = addressPostcode;
	}
	
	//username
	public String getUsername() {
		return username;
	}
	public void setusernamename(String username) {
		this.username = username;
	}
	
	//password
	public String getPassword() {
		return password;
	}
	public void setPasswordname(String password) {
		this.password = password;
	}
	
	//firstName
	public String getFirstName() {
		return firstName;
	}
	public void setFirstNamename(String firstName) {
		this.firstName = firstName;
	}
	
	//lastName
	public String getLastName() {
	    return lastName;
	}
	public void setLastNamename(String lastName) {
	    this.lastName = lastName;
	}
	
	//email
	public String getEmail() {
	    return email;
	}
	public void setEmailname(String email) {
	    this.email = email;
	}
	
	//address1
	public String getAddress1() {
	    return address1;
	}
	public void setAddress1(String address1) {
	    this.address1 = address1;
	}
	
	//addressPostcode
	public String getAddressPostcode() {
	    return addressPostcode;
	}
	public void setAddressPostcode(String addressPostcode) {
	    this.addressPostcode = addressPostcode;
	}

}