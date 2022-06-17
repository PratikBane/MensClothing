<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Fp.aspx.cs" Inherits="Fp" %>

<!DOCTYPE html>

<<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <script src="bootstrap/JavaScript.js"></script>
    <script src="bootstrap/JavaScript1.js"></script>
    <link href="bootstrap/bootstrap.min.css" rel="stylesheet" />

    <link href="StyleSheet.css" rel="stylesheet" />

    <link href="fontawesome/all.css" rel="stylesheet" />
    
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>

    <title>Forget password</title>
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
                    
        <asp:MultiView ID="MultiView1" runat="server">

           

            <asp:View ID="View1" runat="server">
               
                <div class="container boxedit jumbotron text-center boxshadow">
          
               <label style="color:dimgray">Enter the OTP sent to your email (<asp:Label ForeColor="#0066ff" ID="Label2" runat="server" Text="Label"></asp:Label>)</label>
               <div class="text-center">
                   <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
               </div>

                    <asp:Label ID="Label3"  runat="server"></asp:Label>
                    <br />
                    <asp:Button ID="Button1" CssClass="btn btn-success" runat="server" Text="Verify" OnClick="Button1_Click" />
                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary" Text="Try Again" OnClick="Button2_Click" />
            <br />
           </div>
                            
            </asp:View>

            <asp:View ID="View2" runat="server">
                 <div class="container boxedit jumbotron text-center boxshadow">
           <h3 style="color:black">Set New Password</h3>
                      <hr />
               <label style="color:dimgray">New Password</label>
               <div class="text-center">
                   <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" TextMode="Password" OnTextChanged="TextBox3_TextChanged"></asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="upto 10 Characters" ValidationExpression="[a-zA-Z0-9]{10}" ControlToValidate="TextBox3" ForeColor="Red"></asp:RegularExpressionValidator>
               </div>
                     <label style="color:dimgray">Confirm Password</label>
               <div class="text-center">
                   <asp:TextBox ID="TextBox4"  runat="server" CssClass="form-control"></asp:TextBox>
                   <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password didn't match" ControlToCompare="TextBox3" ControlToValidate="TextBox4" ForeColor="Red"></asp:CompareValidator>
               </div>
      
                     <asp:Label ID="Label1" CssClass="alert alert-success" runat="server"></asp:Label>
                    
            <br />
             <asp:Button ID="Button3" CssClass="btn btn-success" runat="server" Text="Change" OnClick="Button3_Click"  />
           </div>
            </asp:View>
                           
        </asp:MultiView>
       

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
