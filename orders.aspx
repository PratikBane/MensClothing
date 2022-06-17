<%@ Page Language="C#" AutoEventWireup="true" CodeFile="orders.aspx.cs" Inherits="orders" %>

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
    
    <title></title>
     <style type="text/css">
         .auto-style1 {
             text-align: center;
             width: 69px;
         }
     </style>
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
                    <li class="nav nav-tabs"><a  href="shirts.aspx">Shirts</a></li>
                    <li class="nav nav-tabs  active"><a  href="orders.aspx">Orders</a></li> 
                    <li  id="li_customers" runat="server" class="nav nav-tabs"><a  href="customers.aspx">Customers</a></li>
                    <li id="li_admin" runat="server" class="nav nav-tabs"><a  href="admin.aspx">Add Products</a></li>  
                    <li class="nav nav-divider" style="color: #FF0000"></li>
                    <li id="li_sign" runat="server" class="nav nav-tabs btn btn-primary btn-xs" ><a href="Signin.aspx" class="fas fa-user-plus" style="color:white">  SIGNUP</a></></li>
                    <li id="li_log" runat="server" class="nav nav-tabs btn btn-primary btn-xs"><a href="Login.aspx" class="glyphicon glyphicon-log-in" style="color:white"> LOGIN</a></li>
                    <li id="li_logout" runat="server" class="nav nav-tabs btn btn-primary btn-xs"><asp:LinkButton runat="server" onclick="logout" class="glyphicon glyphicon-log-out" style="color:white"> LOG OUT</asp:LinkButton></li>
                    <li id="li_cart" runat="server"><asp:HyperLink ID="HyperLink1" class="glyphicon glyphicon-shopping-cart" runat="server" NavigateUrl="~/cart.aspx"><span class="badge">
                        <asp:Label ID="lbl_cart" runat="server" Text="0"></asp:Label></span></asp:HyperLink></li>
                </ul>
              
                </div>
            </div>
      </nav>
           <br />
           <br />
        <br />
        <br />

        

        <div class="container-fluid">
            <div class="panel panel-default">
                <div class="panel-heading text-center" style="background-color:black; color:white"><h3>Your Orders</h3></div>
                <div class="panel-body">

            <table class="nav-justified table-responsive container01 table-bordered table-condensed">
                
                                    <tr style="color:black">
                            <td class="text-center" style="color:black" colspan="14">
                               <em style="color:red">* </em> <asp:Label ID="Label1" ForeColor="Black" runat="server" Text="Search by Email, Orderid or Transitionid"></asp:Label> <em style="color:red">* </em>
                                <br />
                                <asp:TextBox ID="txt_search" CssClass="text-center" runat="server"></asp:TextBox><asp:Button ID="search" CssClass="btn btn-success" runat="server" Text="Search" OnClick="search_Click" />
                            </td>
                                </tr>
                
                                    <tr style="color:black">
                            <th class="text-center" style="color:black">Email</th>
                            <th class="auto-style1" style="color:black">Product Name</th>
                            <th class="text-center" style="color:black">Product Size</th>
                            <th class="text-center" style="color:black">Quantity</th>
                            <th class="text-center" style="color:black">Product Price</th>
                            <th class="text-center" style="color:black">Total</th>
                            <th class="text-center" style="color:black">Mode Of Payment</th>
                            <th class="text-center" style="color:black">Address</th>
                            <th class="text-center" style="color:black">Amount Paied</th>
                            <th class="text-center" style="color:black">Time</th>
                            <th class="text-center" style="color:black">Order ID</th>
                            <th class="text-center" style="color:black">Transition ID</th>
                            <th class="text-center" style="color:black">Status</th>
                            <th class="text-center" style="color:black">Cancel order</th>


                                </tr>
                     <asp:Repeater ID="Repeater1" runat="server"  OnItemCommand="Repeater1_ItemCommand">
                        <ItemTemplate>
                            <tr>

                            <td data-col-title=" Email :" class="text-center" style="color:black">
                                <asp:Label ID="lbl_email" ForeColor="#333333" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                            </td>

                            <td data-col-title="Product Name :" class="text-center" style="color:black">
                                <asp:Label ID="lbl_pname" ForeColor="#333333" runat="server" Text='<%# Eval("Pname") %>' ></asp:Label>
                            </td>

                            <td data-col-title="Product Size :" class="text-center" style="color:black">
                                <asp:Label ID="lbl_size" ForeColor="#333333" runat="server" Text='<%# Eval("Size") %>'/>
                            </td>

                            <td data-col-title="Quantity :" class="text-center" style="color:black">
                                <asp:Label ID="lbl_pquant" ForeColor="#333333" runat="server" Text='<%# Eval("Pquant") %>' ></asp:Label>
                            </td>

                            <td data-col-title="Product Price :" class="text-center" style="color:black">
                                <asp:Label ID="lbl_pprice" ForeColor="#333333" runat="server" Text='<%# Eval("Pprice") %>' ></asp:Label>
                            </td>

                            <td data-col-title="ProductTotal:" class="text-center" style="color:black">
                                <asp:Label ID="lbl_ptotal" ForeColor="#333333" runat="server" Text='<%# Eval("Ptotal") %>' ></asp:Label>
                            </td>

                            <td data-col-title="Mode Of Payment :" class="text-center" style="color:black">
                                <asp:Label ID="lbl_mop" ForeColor="#333333" runat="server" Text='<%# Eval("Mop") %>' ></asp:Label>
                            </td>

                            <td data-col-title="Address :" class="text-center" style="color:black">
                                <asp:Label ID="lbl_address" ForeColor="#333333" runat="server" Text='<%# Eval("Address") %>' ></asp:Label>

                            </td>

                            <td data-col-title="Amount paied :" class="text-center" style="color:black">
                                <asp:Label ID="lbl_amount" ForeColor="#333333" runat="server" Text='<%# Eval("amount") %>' ></asp:Label>
                            </td>

                            <td data-col-title="Time :" class="text-center" style="color:black">
                                <asp:Label ID="Label6" ForeColor="#333333" runat="server" Text='<%# Eval("datetime") %>' ></asp:Label>
                            </td>

                            <td data-col-title="Order ID:" class="text-center" style="color:black">
                                <asp:Label ID="Label7" ForeColor="#333333" runat="server" Text='<%# Eval("orderid") %>' ></asp:Label>
                            </td>

                            <td data-col-title="Trasition ID:" class="text-center" style="color:black">
                                <asp:Label ID="Label8" ForeColor="#333333" runat="server" Text='<%# Eval("transitionid") %>' ></asp:Label>
                            </td>

                            <td data-col-title="Status :" class="text-center" style="color:black">
                                <asp:Label ID="lbl_status" CssClass="alert alert-warning" ForeColor="#333333" runat="server" Text="Process"></asp:Label>
                            </td>

                            <td class="text-center" style="color:black">
                                <asp:Button ID="btn_cancelorder" CssClass="btn btn-link" runat="server" Text="Cancel Order"  CommandName="cancelorder" CommandArgument='<%# Eval("productid") %>'/>
                            </td>



                        </tr>
                            
                        </ItemTemplate>
                    </asp:Repeater>
                                   
                            </table>
            <br />
           <!--  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProductsConnectionString %>" >
             </asp:SqlDataSource> -->
                    <div class="text-center">
                        <asp:Label ID="lbl_noorder" ForeColor="#333333" runat="server"></asp:Label>
                    </div>
                    </div>
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
