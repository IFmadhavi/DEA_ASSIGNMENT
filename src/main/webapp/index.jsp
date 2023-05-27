<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Online Clothing Shop</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Online Clothing Shop</a>
    <div class="collapse navbar-collapse">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="#">Home</a>
        </li>

        <li class="nav-item">
          <a class="nav-link" href="#">Contact Us</a>
        </li>
      </ul>
    </div>
  </nav>
  <style>
    .card {
      box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
      transition: 0.3s;
      border-radius: 5px; 
    }

    .card:hover {
      box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
    }

    .container {
      padding: 2px 16px;
    }

    .btn-primary {
      background-color: #ff6384;
      border-color: #ff6384;
    }

    .card-img-top {
      height: 200px;
      object-fit: cover;
    }
  </style>

  <div class="container mt-4">
    <div class="row">
      <%
        java.sql.Connection con = null;
        java.sql.Statement stmt = null;
        java.sql.ResultSet rs = null;
        
        try {
          Class.forName("com.mysql.jdbc.Driver");
          con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopdb", "root", "");
          stmt = con.createStatement();
          rs = stmt.executeQuery("SELECT * FROM products");
          
          while(rs.next()) {
      %>
            <div class="col-4 mb-4">
              <div class="card h-100">
                <img class="card-img-top" src="<%=rs.getString("imageUrl")%>" alt="Card image cap">
                <div class="card-body">
                  <h5 class="card-title"><%=rs.getString("productName")%></h5>
                  <p class="card-text"><%=rs.getString("description")%></p>
                </div>
                <div class="card-footer">
                  <a href="#" class="btn btn-primary btn-block">Shop Now</a>
                </div>
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
  <!-- Rest of your HTML -->

  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
