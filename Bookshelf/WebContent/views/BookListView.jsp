<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>



<form action="BookViewServlet" method="POST">
	<label>Category</label>
	<select name="category">
		<option value="">Any</option>
	</select>
	<label>Publisher</label>
	<select name="publisher">
		<option value="">Any</option>
	</select>
	<label>Order by</label>
	<select name="order" value=${order}>
		<option value="price" <c:if test = "${order == \"price\"}">selected</c:if>>Price</option>
		<option value="rating" <c:if test = "${order == \"rating\"}">selected</c:if>>Rating</option>
	</select>
	<label>Direction</label>
	<select name="direction" value=>
		<option value="ASC" <c:if test = "${direction == \"ASC\"}">selected</c:if>>Ascending Order</option>
		<option value="DESC" <c:if test = "${direction == \"DESC\"}">selected</c:if>>Descending Order</option>
	</select>
	<label>Limit</label>
	<input type="number" step = 1  value=${limit} name="limit">
	<input type="submit" value="apply">
</form>

<!-- datasource -->
<sql:setDataSource
	var = "snapshot"
	driver = "com.mysql.jdbc.Driver"
	url = "jdbc:mysql://ee417.crxkzf89o3fh.eu-west-1.rds.amazonaws.com:3306/testdb"
	user = "ee417"
	password = "ee417"
/>

<!-- query -->
<sql:query dataSource = "${snapshot}" var = "result">
	SELECT *
	FROM testdb.bookshelf_book
	WHERE category LIKE '%${category}%' AND publisher LIKE '%${publisher}%'
	ORDER BY ${order} ${direction}
	LIMIT ${limit}
</sql:query>

<!-- display results -->
<table border = "1" width = "100%">
		<tr>
			<th>ID</th>
			<th>Title</th>
			<th>Author</th>
			<th>Description</th>
			<th>Category</th>
			<th>Publisher</th>
			<th>Rating</th>
			<th>Price</th>
			<th>Thumbnail</th>
			<th>In Stock</th>
		</tr>
		<c:forEach var = "row" items = "${result.rows}">
			<tr>
				<td><c:out value = "${row.id}"/></td>
				<td><c:out value = "${row.title}"/></td>
				<td><c:out value = "${row.author}"/></td>
				<td><c:out value = "${row.description}"/></td>
				<td><c:out value = "${row.category}"/></td>
				<td><c:out value = "${row.publisher}"/></td>
				<td><c:out value = "${row.rating}"/></td>
				<td><c:out value = "${row.price}"/></td>
				<td><img src= <c:out value = "${row.thumbnail_url}"/>></td>
				<td><c:out value = "${row.stock}"/></td>
			</tr>
		</c:forEach>
</table>