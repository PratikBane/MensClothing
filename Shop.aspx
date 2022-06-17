<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="Shopping.Shop" CodeFile="~/Shop.aspx.cs"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <script src="bootstrap/JavaScript.js"></script>
    <script src="bootstrap/JavaScript1.js"></script>
    <link href="bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="StyleSheet.css" rel="stylesheet" />

    <link href="fontawesome/all.css" rel="stylesheet" />

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>
    
    <title>Shopping</title>
</head>
<body>
       <form id="form1" runat="server">
           
       <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
          <div class="navbar-header">
          <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbarResponsive" > 
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
          </button>
              <a class="navbar-brand"  href="Shop.aspx" style="color: #FF0000;font-family:cursive" ><em style="color:white;font-family:cursive"> SJ </em>Fashion</a>
              <asp:HyperLink runat="server" NavigateUrl="profile.aspx"><asp:Label ID="lbl_user" runat="server" Text="user" ForeColor="#c0c0c0" CssClass="navbar-brand"></asp:Label></asp:HyperLink>
           </div>
            <div class="collapse navbar-collapse navbar-right" id="navbarResponsive">
                <ul class="nav navbar-nav ">
                    <li class="nav nav-tabs active"><a  href="Shop.aspx">HOME</a></li> 
                    <li class="nav nav-tabs "><a  href="tshirt.aspx">T-Shirts</a></li>
                    <li class="nav nav-tabs"><a  href="shirts.aspx">Shirts</a></li>
                    <li class="nav nav-tabs"><a  href="orders.aspx">Orders</a></li>   
                    <li class="nav nav-divider" style="color: #FF0000"></li>
                    <li id="li_sign" runat="server" class="nav nav-tabs btn btn-primary btn-xs" ><a href="Signin.aspx" class="fas fa-user-plus" style="color:white">  SIGNUP</a></></li>
                    <li id="li_log" runat="server" class="nav nav-tabs btn btn-primary btn-xs"><a href="Login.aspx" class="glyphicon glyphicon-log-in" style="color:white"> LOGIN</a></li>
                    <li id="li_logout" runat="server" class="nav nav-tabs btn btn-primary btn-xs"><asp:LinkButton runat="server" onclick="logout" class="glyphicon glyphicon-log-out" style="color:white"> LOG OUT</asp:LinkButton></li>
                    <li><asp:HyperLink ID="HyperLink1" class="glyphicon glyphicon-shopping-cart" runat="server" NavigateUrl="~/cart.aspx"><span class="badge">
                        <asp:Label ID="lbl_cart" runat="server" Text="0"></asp:Label></span></asp:HyperLink></li>
                </ul>
              
                </div>
            </div>
      </nav>
           <br />
           <br />
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>

    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
    
        <div class="item active">
        <img src="Images/jeans.jpg" alt="Image"/>
        <div class="carousel-caption">
          <h3>Sell <i class="fas fa-rupee-sign"></i> </h3>
          <p>@ 999</p>
        </div>      
      </div>

      <div class="item">
        <img src="Images/jeansunder.jpg" alt="Image" />
        <div class="carousel-caption">
          <h3> Sell <i class="fas fa-rupee-sign"></i></h3>
          <p>@ 699</p>
        </div>      
      </div>
   

    <div class="item">
        <img src="Images/tshirt.jpg" alt="Image" />
        <div class="carousel-caption">
          <h3>Sell <i class="fas fa-rupee-sign"></i> </h3>
          <p>@ 400</p>
        </div>      
      </div>
     </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
  <br />
           <br />

<div class="container-fluid text-center container02">
<table class="table table-responsive">
        <tr>
            <td > 
                <span class="fa fa-truck" style="font-size: 25px;color:black"></span>
                <p style="color:black">Quick Delivery</p>
                <p style="color:black">Faster Than You Can Imagine</p>

            </td>
        </tr>
        <tr>
            <td>
                <span class="fa fa-rotate-left" style="font-size: 25px;color:black"></span>
                <p style="color:black">Return Policy</p>
                <p style="color:black">10 Days Return Policy</p>
            </td>
        </tr>
        <tr>
            <td>
                <i class="fas fa-headset"  style="font-size: 25px;color:black"></i>
                <p style="color:black">24/7 Support</p>
                <p style="color:black">Keeping You Always Connected</p>

            </td>
        </tr>
        <tr>
            <td>
                <i class="far fa-credit-card" style="font-size: 25px;color:black"></i>
                <p style="color:black">Secure Payment</p>
                <p style="color:black">100% Secure Purchase Payment</p>
            </td>
        </tr>
    </table>
    </div>

<div class="container-fluid">
<table class="table table-responsive table-hover container02">
    <tr>
        <td>
             <a href="#"><img class="img-responsive" src="Images/jeansunder.jpg" height="200" width="1300"/></a>
      
        </td>
    </tr>
    <tr>
        <td>
           <a href="tshirt.aspx"><img class="img-responsive" src="Images/tees.jpg" height="200" width="1300"/></a>
        </td>
    </tr>
    <tr>
        <td>
               <a href="shirt.aspx"><img class="img-responsive" src="Images/shirt.jpeg" height="200" width="1300" /></a>
        </td>
    </tr>
</table>
   </div>
 <br/>

     <hr />


<footer>
      <div class="main-content">
        <div class="left box">
          <h2>
About us</h2>
<div class="content">
            <p>Shopping Website</p>
            <p><a href="Shop.aspx">Home-</a><a href="Contactus.aspx">Contact-</a><a href="Shop.aspx">Products</a></p>
            <p>Shopping Website <i class="fa fa-copyright"></i> 2020 </p>
  
    </div>
</div>
<div class="center box">
          <h2>Address</h2>
    <div class="content">
            <div class="place">
              <span class="fas fa-map-marker"></span>
              <span class="text">Viva College, Virar, India</span>
            </div>
    <div class="phone">
              <span class="fas fa-phone"></span>
              <span class="text">+91-9820519699 / 8767012493</span>
            </div>
    <div class="email">
              <span class="fas fa-envelope"></span>
              <span class="text">pbane05121999@gmail.com</span>
            </div>
    </div>
</div>
<div class="right box">
          <h2>Contact us</h2>
    <div class="content">
        <h2>Join Us On</h2>

        <div class="social">
               <a href="#"><span class="fa fa-facebook"></span></a>
              <a href="#"><span class="fa fa-twitter"></span></a>
              <a href="#"><span class="fa fa-instagram"></span></a>
              <a href="#"><span class="fa fa-youtube"></span></a>
            <br />
              <a href="#"><span class="fa fa-linkedin"></span></a>
              <a href="#"><span class="fa fa-github"></span></a>
        </div>
    </div>
    </div>
     </div>

     <div class="down box">
     <div class="content">
     <div class="container text-center">
         <p>Copy write <i class="fas fa-copyright"></i> 2020</p>
     </div>
         </div>
     </div>
     <br />
     
</footer>


    </form>
</body>
</html>

