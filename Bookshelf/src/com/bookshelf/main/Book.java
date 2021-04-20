package com.bookshelf.main;

public class Book {
	
	private int id;
	private String title;
	private String author;
	private String description;
	private String category;
	private String publisher;
	private float rating;
	private float price;
	private String thumbnailURL;
	private int stock;
	
	public Book(int id,
			String title,
			String author,
			String description,
			String category,
			String publisher,
			float rating,
			float price,
			String thumbnailURL,
			int stock) {
		
		super();
		this.id = id;
		this.title = title;
		this.author = author;
		this.description = description;
		this.category = category;
		this.publisher = publisher;
		this.rating = rating;
		this.price = price;
		this.thumbnailURL = thumbnailURL;
		this.stock = stock;
	}
	
	//id
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	//title
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	//author
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	
	//description
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	//category
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	//publisher
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	
	//rating
	public float getRating() {
		return rating;
	}
	public void setRating(float rating) {
		this.rating = rating;
	}
	
	//price
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	
	//thumbnailURL
	public String getThumbnailURL() {
		return thumbnailURL;
	}
	public void setThumbnailURL(String thumbnailURL) {
		this.thumbnailURL = thumbnailURL;
	}
	
	//stock
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
}