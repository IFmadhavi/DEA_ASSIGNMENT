<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="./css/nav.css">

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">

    <title>Checkout Success</title>
</head>
<body>
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
                        <a class="nav-link" href="#">Contact Us</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center">
                <i class="fas fa-check-circle fa-5x text-success mb-3"></i>
                <h2>Checkout Success!</h2>
                <p class="lead">Thank you for your order. Your order number is:</p>
                <p class="text-success"><strong><%= request.getParameter("orderNumber") %></strong></p>
                <p>We've sent a confirmation email with this order number. We will update you about the shipment soon.</p>
                <a href="#" class="btn btn-primary mt-3">Continue Shopping</a>
            </div>
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
</body>

</html>
