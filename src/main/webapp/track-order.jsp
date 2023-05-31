<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/nav.css">

<%
  String trackingNumber = request.getParameter("trackingNumber");

  Connection con = null;
  PreparedStatement stmt = null;
  ResultSet rs = null;

  try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopdb", "root", "");
    String query = "SELECT orders.id, products.productName, products.price, orders.status " +
                   "FROM orders INNER JOIN products ON orders.productId = products.id " +
                   "WHERE orders.id=?";
    stmt = con.prepareStatement(query);
    stmt.setString(1, trackingNumber);
    rs = stmt.executeQuery();
    
    if(rs.next()) {
%>

    <nav class="navbar navbar-expand-lg navbar-light bg-white py-3">
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
                        <a class="nav-link" href="#">Order track</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
  <div class="container mt-5">
      <div class="row justify-content-center">
      <div class="container mt-5">
        <div class="card">
          <h5 class="card-header">Order Details</h5>
          <div class="card-body">
            <p class="card-text"><i class="bi bi-file-earmark-bar-graph"></i> <strong>Tracking Number:</strong> <%=rs.getString("id")%></p>
            <p class="card-text"><i class="bi bi-box-seam"></i> <strong>Item Name:</strong> <%=rs.getString("productName")%></p>
            <p class="card-text"><i class="bi bi-cash-stack"></i> <strong>Price:</strong> <%=rs.getString("price")%></p>
            <p class="card-text"><i class="bi bi-card-checklist"></i> <strong>Status:</strong> <%=rs.getString("status")%></p>
          </div>
        </div>
      </div>
               </div>
      </div>
<%
    } else {
%>
<nav class="navbar navbar-expand-lg navbar-light bg-white py-3">
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
                        <a class="nav-link" href="#">Order track</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
      <div class="container mt-5">
        <div class="alert alert-danger" role="alert">
          <i class="bi bi-exclamation-triangle"></i> No order found with the given tracking number.
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