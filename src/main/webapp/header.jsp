<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="shortcut icon" href="images/favicon.png" type="">

  <title> Feane </title>

  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous" />
  <link href="css/font-awesome.min.css" rel="stylesheet" />

  <link href="css/style.css" rel="stylesheet" />
  <link href="css/responsive.css" rel="stylesheet" />

</head>

<body>

  <div class="hero_area">
    <div class="bg-box">
      <img src="images/hero-bg.jpg" alt="">
    </div>
    <header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="index.jsp">
            <span>
              Feane
            </span>
          </a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class=""> </span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav  mx-auto ">
              <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="menu.jsp">Menu</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="about.jsp">About</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="book.jsp">Book Table</a>
              </li>
            </ul>
            <div class="user_option">
                <div class="dropdown">
                  <a class="user_link dropdown-toggle" href="#" role="button" id="userMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fa fa-user" aria-hidden="true" style="font-size: 20px;"></i>
                  </a>

                  <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userMenuLink">
                    <a class="dropdown-item" href="login.jsp">
                      <i class="fa fa-sign-in" aria-hidden="true" style="margin-right: 10px;"></i> Login
                    </a>
                    <a class="dropdown-item" href="register.jsp">
                      <i class="fa fa-user-plus" aria-hidden="true" style="margin-right: 10px;"></i> Register
                    </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item admin-link" href="admin/index.jsp?halaman=produk">
                      <i class="fa fa-tachometer" aria-hidden="true" style="margin-right: 10px;"></i> Admin Panel
                    </a>
                  </div>
                </div>

                <a class="cart_link" href="#">
                  </a>
              <form class="form-inline">
                <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit">
                  <i class="fa fa-search" aria-hidden="true"></i>
                </button>
              </form>
              <a href="" class="order_online">
                Order Online
              </a>
            </div>
          </div>
        </nav>
      </div>
    </header>