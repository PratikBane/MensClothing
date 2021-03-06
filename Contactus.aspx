<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contactus.aspx.cs" Inherits="Contactus" %>

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

    <title>Contact US</title>
</head>
<body>
    <form id="form1" runat="server">
        < <nav class="navbar navbar-inverse navbar-fixed-top">
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
                    <li class="nav nav-tabs"><a  href="Shop.aspx">HOME</a></li> 
                    <li class="nav nav-tabs "><a  href="Jeans.aspx">Jeans</a></li>
                    <li class="nav nav-tabs"><a  href="shirts.aspx">Shirts</a></li>
                    <li class="nav nav-tabs"><a  href="orders.aspx">Orders</a></li>
                    <li class="nav divider" style="color: #FF0000"></li>
                    <li id="li_sign" runat="server" class="nav nav-tabs btn btn-primary btn-xs" ><a href="Signin.aspx" class="fas fa-user-plus" style="color:white">  SIGNUP</a></></li>
                    <li id="li_log" runat="server" class="nav nav-tabs btn btn-primary btn-xs"><a href="Login.aspx" class="glyphicon glyphicon-log-in" style="color:white"> LOGIN</a></li>
                    <li id="li_logout" runat="server" class="nav nav-tabs btn btn-primary btn-xs"><asp:LinkButton runat="server" onclick="logout" class="glyphicon glyphicon-log-out" style="color:white"> LOG OUT</asp:LinkButton></li>
                   
                </ul>
              
                </div>
            </div>
      </nav>
        <br />
        <br />
        <br />
        <br />
        
         <div class="container boxedit jumbotron text-center boxshadow">
           <h3 style="color:black">Contact Us</h3>
             <hr />
             <label style="color:dimgray">Email :</label>
               <div class="text-center">
                   <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" ></asp:TextBox>
               </div>
             <br />
              <label style="color:dimgray">Whats this about?</label>
               <div class="text-center">
                   <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
               </div>
             <br />
               <div class="text-center">
                   <asp:TextBox ID="TextBox1" runat="server" Placeholder="Go ahead, we are listerning..." CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
               </div>
             <br />
             <asp:Label ID="Label1" runat="server" ForeColor="#33ccff"></asp:Label>
             <br />
             <br />
             <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="Button1_Click" />
           </div>

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
