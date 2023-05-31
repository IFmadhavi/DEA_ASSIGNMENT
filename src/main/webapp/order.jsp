<%@ page import="java.sql.*" %>


<%
    String userRole = (String) session.getAttribute("user");

    if (userRole == null || !userRole.equals("admin")) {
        response.sendRedirect("login.jsp"); // Redirect to login page if the user is not an admin
        return;
    }
%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
      <link rel="stylesheet" href="./css/nav.css">

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css" rel="stylesheet">

    <title>Orders</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-white py-3">
    <div class="container">
      <a class="navbar-brand" href="#">Admin Dashboard</a>
     <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                   <li class="nav-item">
                        <a class="nav-link" href="order.jsp">Order manage</a>
                    </li>
                        <li class="nav-item">
                        <a class="nav-link" href="admin.jsp">update order</a>
                    </li>
                     </li>
                        <li class="nav-item">
                        <a class="nav-link" href="product_add.jsp">Add item</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout.jsp">Logout</a>
                    </li>
                </ul>
            </div>
    </div>
  </nav>
    <div class="container">
        <h1 class="my-3">All Orders</h1>

        <%
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopdb", "root", "");
                stmt = con.createStatement();
                rs = stmt.executeQuery("SELECT * FROM orders");

                while(rs.next()) {
        %>
                    <div class="card my-3">
                        <div class="card-body">
                            <h5 class="card-title">Order Number: <%=rs.getString("id")%></h5>
                            <p class="card-text">
                                Name: <%=rs.getString("name")%> <br>
                                Email: <%=rs.getString("email")%> <br>
                                Address: <%=rs.getString("address")%> <br>
                                Status: 
                                <i class="bi bi-bag-check-fill"></i> <!-- This is a bootstrap icon. Change as needed. -->
                                <%=rs.getString("status")%>
                            </p>
                        </div>
                    </div>
        <%
                }
            } catch(Exception e) {
                e.printStackTrace();
            } finally {
                if(rs != null) {
                    try { rs.close(); } catch(Exception e) {}
                }
                if(stmt != null) {
                    try { stmt.close(); } catch(Exception e) {}
                }
                if(con != null) {
                    try { con.close(); } catch(Exception e) {}
                }
            }
        %>

    </div>
<footer class="footer bg-dark text-white mt-5">
    <div class="container">
        <div class="row py-4">
            <div class="col-lg-4 col-md-6 mb-4 mb-md-0">
                <h5 class="text-uppercase">About Our Company</h5>

                <p class="mb-0">We are a leading fashion retailer offering compelling clothing, shoes, and accessories for men, women, and kids since 2023. We believe fashion should be accessible and sustainable for everyone.</p>
            </div>

            <div class="col-lg-2 col-md-6 mb-4 mb-md-0">
                <h5 class="text-uppercase">Quick Links</h5>

                <ul class="list-unstyled mb-0">
                    <li class="mb-2"><a href="#" class="text-white">Home</a></li>
                    <li class="mb-2"><a href="#" class="text-white">Shop</a></li>
                    <li class="mb-2"><a href="#" class="text-white">About us</a></li>
                    <li class="mb-2"><a href="#" class="text-white">Contact us</a></li>
                </ul>
            </div>

            <div class="col-lg-2 col-md-6 mb-4 mb-md-0">
                <h5 class="text-uppercase">Help & Support</h5>

                <ul class="list-unstyled mb-0">
                    <li class="mb-2"><a href="#" class="text-white">Shipping & Returns</a></li>
                    <li class="mb-2"><a href="#" class="text-white">Order Status</a></li>
                    <li class="mb-2"><a href="#" class="text-white">Payment Options</a></li>
                    <li class="mb-2"><a href="#" class="text-white">Contact Us</a></li>
                </ul>
            </div>

            <div class="col-lg-4 col-md-6 mb-md-0">
                <h5 class="text-uppercase">Newsletter</h5>

                <form class="mb-0">
                    <div class="form-group d-flex">
                        <input type="email" class="form-control" placeholder="Enter your email">
                        <button type="submit" class="btn btn-primary ml-2">Subscribe</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="text-center py-3 bg-primary">
        <p class="mb-0 text-white">© 2023 Online Clothing Shop. All rights reserved.</p>
    </div>
</footer>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
