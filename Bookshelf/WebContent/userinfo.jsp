<%@ page import="com.bookshelf.main.User"%>
<!DOCTYPE html>
<html lang="en">

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="shortcut icon" type="image/x-icon" href="fa fa-book" />
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/base-mobile.css">
    <link rel="stylesheet" href="css/signup.css">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script defer src="js/nav.js"></script>
    <script defer src="js/index.js"></script>
    <script defer src="js/signup.js"></script>
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
                <li><a href="NovelServlet">Novels</a>
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
                	<li><a href="userinfo.jsp">Account</a>
                	<li id="login-btn"><a href="LogoutServlet">Logout</a></li>
                <%} %>
            </ul>
        </nav>
    </header>

	<% User u = (User) session.getAttribute("user"); %>
    <!-- MAIN CONTENT OF PAGE -->
    <section class="container">
    
    	<!-- USER DETAILS -->
        <div class="signup-form">
            <h1>Welcome to your Account</h1>
            <label for="username">Username</label>
            <p><%= u.getUsername() %></p>

            <label for="firstname">First Name</label>
            <p><%= u.getFirstName() %></p>

            <label for="lastname">Last Name</label>
            <p><%= u.getLastName() %></p>

            <label for="email">Email</label>
            <p><%= u.getEmail() %></p>

            <label for="address">Address</label>
            <p><%= u.getAddress() %></p>

            <label for="zipcode">Zip Code</label>
            <p><%= u.getZipcode() %></p>
        </div>
        
        <!-- ORDER HISTORY -->
        <div class="order-details">
        
	        <!-- datasource -->
	        <h1>My recent orders</h1>
			<sql:setDataSource
				var = "snapshot"
				driver = "com.mysql.jdbc.Driver"
				url = "jdbc:mysql://ee417.crxkzf89o3fh.eu-west-1.rds.amazonaws.com:3306/testdb"
				user = "ee417"
				password = "ee417"
			/>
			
			<!-- query -->
			<sql:query dataSource = "${snapshot}" var = "result">
				SELECT id, t_stamp, amount
				FROM testdb.bookshelf_order
				WHERE user_id = ${user.getId()}
				ORDER BY t_stamp DESC
				LIMIT 10
			</sql:query>
			
			<!-- display results -->
			<table>
				<tr>
					<th>ID</th>
					<th>Date</th>
					<th>Total Amount</th>
				</tr>
				<c:forEach var = "row" items = "${result.rows}">
					<tr>
						<td><c:out value = "${row.id}"/></td>
						<td><c:out value = "${row.t_stamp}"/></td>
						<td><c:out value = "${row.amount}"/></td>
					</tr>
				</c:forEach>
			</table>
		</div>
        
    </section>
    
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