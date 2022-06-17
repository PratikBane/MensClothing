<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shirts.aspx.cs" Inherits="shirts" %>

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

    <title>Shopping | Shirts</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="script" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server" ID="updaet">
            <ContentTemplate>

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
                    <li class="nav nav-tabs"><a  href="Shop.aspx">HOME</a></li> 
                    <li class="nav nav-tabs "><a  href="tshirt.aspx">T-Shirts</a></li>
                    <li class="nav nav-tabs active"><a  href="shirts.aspx">Shirts</a></li>
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
     <br />
     <br />
    
         <div class="container02">
                 <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">
                  <ItemTemplate>
                      <a href="Shirts/<%# Eval("title") %>">
                     <table class="nav-justified table-responsive ">
                <tr>
                    <td class="text-center">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("img") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="text-center">
                        <asp:Label ID="Label1" ForeColor="Black" runat="server" Font-Bold="True" Text='<%# Eval("title") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text-center">
                        <asp:Label ID="Label2" ForeColor="Black" runat="server" Text='<%# Eval("discription") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text-center"  >
                        <span style="color:#FF6600; font-size: 15px;" class="fas fa-rupee-sign">&nbsp;</span> <asp:Label ForeColor="#FF6600" ID="Label3" runat="server" Text='<%# Eval("price") %>' Font-Size="20px"></asp:Label>
                    </td>
                </tr>
                <tr  class="text-center">
                    <td>
                        <asp:Label ID="lbl_sizequant" ForeColor="Black" runat="server"></asp:Label>
                        <asp:Label ID="lbl_size" runat="server" Visible="false"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="text-center" style="color:black; font-size: 20px;">
                        <asp:Label runat="server" Text="Select Size:" ForeColor="Black" Font-Size="15px"></asp:Label>
                        <br />
                        <asp:Button CssClass="btn btn-default" ID="btn_s" runat="server" Text="S" CommandName="s" CommandArgument='<%# Eval("productid") %>' />
                        <asp:Button CssClass="btn btn-default" ID="btn_m"  runat="server" Text="M" CommandName="m" CommandArgument='<%# Eval("productid") %>' />
                        <asp:Button CssClass="btn btn-default" ID="btn_l" runat="server" Text="L" CommandName="l" CommandArgument='<%# Eval("productid") %>' />
                        <asp:Button CssClass="btn btn-default" ID="btn_xl" runat="server" Text="XL" CommandName="xl" CommandArgument='<%# Eval("productid") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="text-center">
                        <br />
                        <asp:Button ID="btn_add" runat="server" CssClass="btn btn-warning"  Height="50px" Width="200px"  Text="Add To Cart" CommandName="addtocart"  CommandArgument='<%# Eval("productid") %>' />
                        <asp:Button ID="btn_remove" runat="server" CssClass="btn btn-warning"  Height="50px" Width="200px"  Text="Remove From Cart" CommandName="removefromcart"  CommandArgument='<%# Eval("productid") %>' Visible="False" />
                    </td>
                </tr>
            </table>
                         </a>
                        </ItemTemplate>
                  </asp:Repeater>
                      
            <br />
           <br />
        
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProductsConnectionString %>" SelectCommand="SELECT * FROM [Shirts]"></asp:SqlDataSource>

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

                </ContentTemplate>
        </asp:UpdatePanel>

    </form>
</body>
</html>

