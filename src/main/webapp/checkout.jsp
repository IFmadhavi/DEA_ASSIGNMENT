<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/nav.css">

</head> <nav class="navbar navbar-expand-lg navbar-light bg-white py-3">
        <div class="container">
            <a class="navbar-brand" href="#">Online Clothing Shop</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="order_tracking.jsp">Order track</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
<body>
    <div class="container">
        <%
            String productId = request.getParameter("id");
            Connection con = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopdb", "root", "");
                stmt = con.createStatement();
                rs = stmt.executeQuery("SELECT * FROM products WHERE id = " + productId);
                
                if(rs.next()) {
        %>
                    <div class="row mt-4">
                        <div class="col-md-6">
                            <img src="<%=rs.getString("imageUrl")%>" class="img-fluid" alt="<%=rs.getString("productName")%>">
                        </div>
                        <div class="col-md-6">
                            <h2><%=rs.getString("productName")%></h2>
                            <p>Category: <%=rs.getString("category")%></p>
                            <p>Description: <%=rs.getString("description")%></p>
                            <h4>Price: <%=rs.getDouble("price")%></h4>
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

        <div class="row mt-4">
            <div class="col-12">
                <h2>Checkout Information</h2>
                <form action="completeCheckout" method="post">
                    <input type="hidden" name="productId" value="<%=productId%>">
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" class="form-control" id="name" name="name">
                    </div>
                    <div class="form-group">
                        <label for="address">Address:</label>
                        <input type="text" class="form-control" id="address" name="address">
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="email" name="email">
                    </div>
                    <button type="submit" class="btn btn-primary">Complete Checkout</button>
                </form>
            </div>
        </div>
    </div><footer class="footer bg-dark text-white mt-5">
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
</body>
</html>
