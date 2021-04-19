<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="fa fa-book" />
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/base-mobile.css">
    <link rel="stylesheet" href="css/booklist.css">
    <link rel="stylesheet" href="css/popups.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script defer src="js/nav.js"></script>
    <script defer src="js/index.js"></script>
    <script src="js/basket-add.js"></script>
    <title>BookShelf | Buy Books Online</title>
</head>

<body>

    <!-- HEADER AND NAVIGATION -->
    <header>
    	<div class="logo"><i class="fa fa-book"></i> BookShelf</div>
    	<button class="mobile-btn">
            <span></span>
            <span></span>
            <span></span>
        </button>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="BestsellersServlet">Bestsellers</a></li>
                <li><a href="NonfictionServlet">Nonfiction</a>
                </li>
                <li><a href="#">Fiction</a>
                    <ul>
                        <li><a href="ChildrensServlet">Children's</a></li>
                        <li><a href="ClassicsServlet">Classics</a></li>
                    </ul>
                </li>
                <li class="cart"><a href="basket.jsp">Basket</a></li>
                <% if(session.getAttribute("user")==null) { %>
                	<li id="login-btn"><a href="LoginServlet">Login</a></li>
                <% } else { %>
                	<li id="login-btn"><a href="LogoutServlet">Logout</a></li>
                <%} %>
            </ul>
        </nav>
    </header>

    <!-- MAIN CONTENT OF PAGE -->
    <section class="main-content">
        <h1>${listTitle}</h1>
        <div class="container">
        	
        	<!-- Filter query form -->
        	<form action="BookListServlet" method="POST">
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
			<table>
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
							<td>
								<!-- Add to cart button -->
								<!-- Attach relevant data as data attributes-->
								<button
								data-id="${row.id}"
								data-title="${row.title}"
								data-price="${row.price}"
								data-thumbnail-url="${row.thumbnail_url}"
								data-stock="${row.stock}"
								class="basket-add-button">
								<i class="fa fa-cart-plus"></i>
								</button>
							</td>
						</tr>
					</c:forEach>
			</table>
        </div>
    </section>


    <!-- POPUPS -->
    <!-- NEWSLETTER POPUP -->
    <div class="popup" id="newsletter">
        <div class="popup-content">
            <span class="close-btn" onclick="closePopup('newsletter')">&times</span>
            <h1>Newsletter</h1>
            <p>Subscribe to our newsletter to get 10% off your first order!</p>
            <form action="#" method="POST">
                <input type="email" name="email" id="email" placeholder="Enter your email...">
                <input type="submit" value="Subscribe">
            </form>
        </div>
    </div>

    <!-- ADD TO BASKET POPUP -->
    <div class="popup" id="basket">
        <div class="popup-content">
            <span class="close-btn" onclick="closePopup('basket')">&times</span>
            <h1>Added to Basket</h1>
            <p>This item has been successfully added to your basket!</p>
            <form action="CartServlet" method="post" onsubmit="addCart()" id="book-form">
            	<input type="hidden" id="book-cart" name="book-cart" value="">
                <input type="submit" value="View Basket">
                <input type="submit" value="Proceed to Checkout">
            </form>
        </div>
    </div>

    <!-- FOOTER SECTION -->
    <footer>
        <ul>
            <li>&copy BookShelf</li>
            <li>EE417 Group L</li>
            <li>April 2021</li>
        </ul>
    </footer>

</body>

</html>