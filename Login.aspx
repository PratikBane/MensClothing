<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

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

    <title>Login</title>
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
           </div>
            <div class="collapse navbar-collapse navbar-right" id="navbarResponsive">
                <ul class="nav navbar-nav ">
                    <li class="nav nav-tabs"><a  href="Shop.aspx">HOME</a></li> 
                    <li class="nav nav-tabs "><a  href="Jeans.aspx">Jeans</a></li>
                    <li class="nav nav-tabs"><a  href="shirts.aspx">Shirts</a></li>
                    <li class="nav nav-tabs"><a  href="Contactus.aspx">Contact Us</a></li>
                    <li class="nav divider" style="color: #FF0000"></li>
                    <li class="nav nav-tabs btn btn-primary btn-xs" ><a href="Signin.aspx" class="glyphicon glyphicon-user" style="color:white"> SIGNUP</a></></li>
                   
                </ul>
              
                </div>
            </div>
      </nav>
       <br />
        <br />
        <br />
        <br />

       <div class="container boxedit jumbotron text-center boxshadow">
           <div class="nav-pills" style="background-color:black">
               <h2 style="color:white">Login</h2>
           </div>
           <hr />
               <label style="color:dimgray">Email Address :</label>
               <div runat="server" id="txtdiv_user" class="input-group">
                   <span class="input-group-addon" ><i class="glyphicon glyphicon-user" style="color:black"></i></span>
                   <asp:TextBox ID="txt_user" runat="server" CssClass="form-control"></asp:TextBox>
               </div>

               <label style="color:dimgray">Password :</label>
               <div runat="server" id="txtdiv_pass" class="input-group">
               <span class="input-group-addon"><i class="glyphicon glyphicon-lock" style="color:black"></i></span>
                   <asp:TextBox ID="txt_pass" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
               </div> 

           <div class="checkbox">
               <asp:CheckBox ID="CheckBox1" runat="server"/>
               <asp:Label ID="Label1" runat="server" Text="Label" style="color:dimgray">Remember me</asp:Label>
           </div>
           
           <div>
               <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="Button1_Click"/>
           </div>
           <br />
           <div>
           <asp:label runat="server" id="alert" CssClass="alert alert-danger">
               Invalid Email Or Password
           </asp:label>
           </div>
           <div runat="server" id="br">
               <br />
           </div>
           <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" >Forget Passwrd?</asp:LinkButton>
           &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" >New user</asp:LinkButton>
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
