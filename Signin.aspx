<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Signin.aspx.cs" Inherits="_Default" %>

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

    <title>Register</title>
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
                    <li class="nav nav-tabs"><a  href="Contactus.aspx">contact US</a></li>
                    <li class="nav divider" style="color: #FF0000"></li>
                    <li id="li_log" runat="server" class="nav nav-tabs btn btn-primary btn-xs"><a href="Login.aspx" class="glyphicon glyphicon-log-in" style="color:white"> LOGIN</a></li>
                </ul>
              
                </div>
            </div>
      </nav>
       <br />
        <br />
        <br />
        <br />

       <div class="container boxedit jumbotron text-center boxshadow">
           <h5 style="color:black"><em style="color:red">* </em>This indicates Required Fields</h5>
           <div class="nav-pills" style="background-color:black">
               <h2 style="color:white">Registration</h2>
           </div>

          
           <div runat="server" id="div1">
                 <br />
           <asp:label runat="server" id="Label2" CssClass="alert alert-success">
               You are successfully registered
           </asp:label>
                <br />
           </div>
           

           
           <div runat="server" id="div2">
               <br />
           <asp:label runat="server" id="alert" CssClass="alert alert-danger">
              Email Already Exists
           </asp:label>
               <br />
           </div>
           

           <hr />
               <em style="color:red">* </em><label style="color:dimgray">Name :</label>
               <div class="text-center">
                   
                   <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Name Contains Only Alphabets" ControlToValidate="TextBox1" ForeColor="#CC0000" ValidationExpression="[a-zA-Z]*$"></asp:RegularExpressionValidator>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="#CC0000" ErrorMessage="Can't be Empty" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
               </div>

               <label style="color:dimgray">Flat No/House NO :</label>
               <div class="text-center">
                   <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" ></asp:TextBox>
               </div>

              <label style="color:dimgray">Street :</label>
               <div class="text-center">
                   <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
               </div>

              <label style="color:dimgray">Landmark :</label>
               <div class="text-center">
                   <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox>
               </div>

              <label style="color:dimgray">Pincode :</label>
               <div class="text-center">
                   <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control"></asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Only Numeric Value" ControlToValidate="TextBox7" ForeColor="#CC0000" ValidationExpression="[0-9]{6}"></asp:RegularExpressionValidator>
               </div>
             
              <em style="color:red">* </em><label style="color:dimgray">Contact :</label>
               <div class="text-center">
                   <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"></asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Invalid Number" ControlToValidate="TextBox6" ForeColor="#CC0000" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="#CC0000" ErrorMessage="Can't be Empty" ControlToValidate="TextBox6"></asp:RequiredFieldValidator>
               </div>

                <em style="color:red">* </em><label style="color:dimgray">Email :</label>
               <div class="text-center">
                   <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                   <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Invalid Email" ControlToValidate="TextBox2" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ForeColor="#CC0000" ErrorMessage="Can't be Empty" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
               </div>
          
                 <em style="color:red">* </em><label style="color:dimgray">Password :</label>
               <div class="text-center">
                   <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ForeColor="#CC0000" ErrorMessage="Can't be Empty" ControlToValidate="TextBox8"></asp:RequiredFieldValidator>
               </div>

                 <em style="color:red">* </em><label style="color:dimgray">Confirm Password :</label>
               <div class="text-center">
                   <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control"></asp:TextBox>
                   <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Didn't Match" ControlToCompare="TextBox8"  ForeColor="#CC0000" ControlToValidate="TextBox9"></asp:CompareValidator>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ForeColor="#CC0000" ErrorMessage="Can't be Empty" ControlToValidate="TextBox9"></asp:RequiredFieldValidator>
               </div>
           
                <div>
                    <asp:Label runat="server" style="color:dimgray">if you want the address same as above then click here</asp:Label>
                        <asp:Button ID="Button2" runat="server" Text="same as above" CssClass="btn btn-primary" OnClick="Button2_Click"/> 
                </div>

                 <div>
                    <asp:Label runat="server" style="color:dimgray">or else type manually</asp:Label>
                 </div>
           <br />

                <em style="color:red">* </em><label style="color:dimgray">Address :</label>
               <div class="text-center">
                   <asp:TextBox ID="TextBox10" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="#CC0000" ErrorMessage="Can't be Empty" ControlToValidate="TextBox10"></asp:RequiredFieldValidator>
               </div>

               <div class="checkbox">
               <asp:CheckBox ID="CheckBox1" runat="server"/>
               <asp:Label ID="Label1" runat="server" Text="Label" style="color:dimgray">Save the address as delivery address</asp:Label>
               </div>

                 <div>
               <asp:Button ID="Button1" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="Button1_Click"/>
           </div>
          
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
              <span class="text">+91-9820519699</span>
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
