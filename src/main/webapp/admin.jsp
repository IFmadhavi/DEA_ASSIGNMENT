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
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="./css/nav.css">

  <title>Admin Dashboard</title>
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

  <div class="container mt-5">
    <table class="table table-striped">
      <thead>
        <tr>
          <th scope="col">Order ID</th>
          <th scope="col">Product Name</th>
          <th scope="col">Price</th>
          <th scope="col">Status</th>
          <th scope="col">Update Status</th>
        </tr>
      </thead>
      <tbody>
        <%
          java.sql.Connection con = null;
          java.sql.Statement stmt = null;
          java.sql.ResultSet rs = null;
          
          try {
            Class.forName("com.mysql.jdbc.Driver");
            con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopdb", "root", "");
            stmt = con.createStatement();
            rs = stmt.executeQuery("SELECT orders.id AS orderId, products.productName, products.price, orders.status FROM orders INNER JOIN products ON orders.productId = products.id");
            
            while(rs.next()) {
        %>
          <tr>
            <th scope="row"><%=rs.getString("orderId")%></th>
            <td><%=rs.getString("productName")%></td>
            <td><%=rs.getString("price")%></td>
            <td><%=rs.getString("status")%></td>
            <td>
              <form action="/updateStatus.jsp" method="POST">
                <input type="hidden" name="orderId" value="<%=rs.getString("orderId")%>">
                <select name="status" class="form-control" onchange="this.form.submit()">
                  <option <% if(rs.getString("status").equals("Processing")) { %> selected <% } %> >Processing</option>
                  <option <% if(rs.getString("status").equals("Shipped")) { %> selected <% } %> >Shipped</option>
                  <option <% if(rs.getString("status").equals("Delivered")) { %> selected <% } %> >Delivered</option>
                  <option <% if(rs.getString("status").equals("Pickup")) { %> selected <% } %> >Pickup</option>
                </select>
              </form>
            </td>
          </tr>
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
      </tbody>
    </table>
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
  <script src="https://code.jquery.com/jquery-3.5.
