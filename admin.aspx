<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>

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
    
    <title>Admin</title>
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
                     <li class="nav nav-tabs"><a  href="Shop.aspx">HOME</a></li> 
                    <li class="nav nav-tabs "><a  href="tshirt.aspx">T-Shirts</a></li>
                    <li class="nav nav-tabs "><a  href="shirts.aspx">Shirts</a></li>
                    <li class="nav nav-tabs"><a  href="orders.aspx">Orders</a></li>
                    <li class="nav nav-tabs"><a  href="customers.aspx">Customers</a></li>
                    <li class="nav nav-divider" style="color: #FF0000"></li>
                    <li id="li_logout" runat="server" class="nav nav-tabs btn btn-primary btn-xs"><asp:LinkButton runat="server" onclick="logout" class="glyphicon glyphicon-log-out" style="color:white"> LOG OUT</asp:LinkButton></li>
                </ul>
              
                </div>
            </div>
      </nav>
           <br />
           <br />
        <br />
        <br />

        <div class="container">
                <div class="panel panel-default">
                <div class="panel-heading" style="background-color:black; color:white"><h3>Add Shirt</h3></div>
                <div class="panel-body">

                    <table class="nav-justified table-responsive container01 table-bordered">
                                    <tr style="color:black">
                            <th class="text-center" style="color:black"> Image</th>
                             <th class="text-center" style="color:black">Title</th>
                            <th class="text-center" style="color:black">Discription</th>
                            <th class="text-center" style="color:black">Price</th>
                            <th class="text-center" style="color:black">Product ID</th>
                            <th class="text-center" style="color:black">Size S Quantity</th>
                            <th class="text-center" style="color:black">Size M Quantity</th>
                            <th class="text-center" style="color:black">Size L Quantity</th>
                            <th class="text-center" style="color:black">Size XL Quantity</th>

                                </tr>
                            <tr>

                            <td data-col-title=" Image:" class="text-center" style="color:black">
                                <br />
                                <asp:FileUpload ID="shirt_upload" runat="server" CssClass="form-control" />
                                <asp:Label ID="lbl_shirt_image" ForeColor="Black" runat="server"></asp:Label>
                                <br />        
                                <br />
                            </td>
                            <td data-col-title="Title:" class="text-center" style="color:black">
                                <br />
                                <asp:TextBox ID="shirt_title" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:Label ID="lbl_shirt_title" ForeColor="Black" runat="server"></asp:Label>
                                <br />        
                                <br />
                            </td>
                            <td data-col-title="Discription:" class="text-center" style="color:black">
                                <br />
                                <asp:TextBox ID="shirt_disc" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:Label ID="lbl_shirt_disc" ForeColor="Black" runat="server"></asp:Label>
                                <br />        
                                <br />
                            </td>

                            <td data-col-title="Price:" class="text-center" style="color:black">
                                <br />
                                <asp:TextBox ID="shirt_price" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:Label ID="lbl_shirt_price" ForeColor="Black" runat="server"></asp:Label>
                                <br />        
                                <br />
                            </td>
                            <td data-col-title="Product Id:" class="text-center" style="color:black">
                                <br />
                                <asp:TextBox ID="shirt_pid" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:Label ID="lbl_shirt_pid" ForeColor="Black" runat="server"></asp:Label>
                                <br />        
                                <br />
                            </td>
                            <td data-col-title="Size S Quantity" class="text-center" style="color:black">
                                <br />
                                <asp:TextBox ID="Shirt_s" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:Label ID="lbl_shirt_squant" ForeColor="Black" runat="server"></asp:Label>
                                <br />        
                                <br />
                            </td>
                            <td data-col-title="Size M Quantity" class="text-center" style="color:black">
                                <br />
                                <asp:TextBox ID="shirt_m" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:Label ID="lbl_shirt_mquant" ForeColor="Black" runat="server"></asp:Label>
                                <br />        
                                <br />
                            </td>    
                            <td data-col-title="Size L Quantity" class="text-center" style="color:black">
                                <br />
                                <asp:TextBox ID="shirt_l" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:Label ID="lbl_shirt_lquant" ForeColor="Black" runat="server"></asp:Label>
                                <br />        
                                <br />
                            </td>  
                            <td data-col-title="Size XL Quantity" class="text-center" style="color:black">
                                <br />
                                <asp:TextBox ID="shirt_xl" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:Label ID="lbl_shirt_xlquant" ForeColor="Black" runat="server"></asp:Label>
                                <br />        
                                <br />
                            </td>    
                        </tr>
                            </table>
                    <br />
                    <div class="text-center">
                    <asp:Button ID="btn_shirt_view" CssClass="btn btn-primary" runat="server" Text="Check Data" OnClick="btn_shirt_view_Click" />
                        </div>
                    </div>
                    <div class="text-center">
                    <asp:Button ID="btn_shirt_add" runat="server" CssClass="btn btn-success" Text="Add" OnClick="btn_shirt_add_Click" />
                        <br />
                        <asp:Label ID="lbl_shirt_addedsuccess" ForeColor="Green" runat="server"></asp:Label>
                    </div>
                    <br />
                    </div>
            </div>

<!--tshirt-->

        <div class="container">
                <div class="panel panel-default">
                <div class="panel-heading" style="background-color:black; color:white"><h3>Add T-Shirt</h3></div>
                <div class="panel-body">

                    <table class="nav-justified table-responsive container01 table-bordered">
                                    <tr style="color:black">
                            <th class="text-center" style="color:black"> Image</th>
                             <th class="text-center" style="color:black">Title</th>
                            <th class="text-center" style="color:black">Discription</th>
                            <th class="text-center" style="color:black">Price</th>
                            <th class="text-center" style="color:black">Product ID</th>
                            <th class="text-center" style="color:black">Size S Quantity</th>
                            <th class="text-center" style="color:black">Size M Quantity</th>
                            <th class="text-center" style="color:black">Size L Quantity</th>
                            <th class="text-center" style="color:black">Size XL Quantity</th>

                                </tr>
                            <tr>

                            <td data-col-title=" Image:" class="text-center" style="color:black">
                                <br />
                                <asp:FileUpload ID="tshirt_upload" runat="server" CssClass="form-control" />
                                <asp:Label ID="lbl_tshirt_image" runat="server"></asp:Label>
                                <br />        
                                <br />
                            </td>
                            <td data-col-title="Title:" class="text-center" style="color:black">
                                <br />
                                <asp:TextBox ID="tshirt_title" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:Label ID="lbl_tshirt_title" ForeColor="Black" runat="server"></asp:Label>
                                <br />        
                                <br />
                            </td>
                            <td data-col-title="Discription:" class="text-center" style="color:black">
                                <br />
                                <asp:TextBox ID="tshirt_disc" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:Label ID="lbl_tshirt_disc" ForeColor="Black" runat="server"></asp:Label>
                                <br />        
                                <br />
                            </td>

                            <td data-col-title="Price:" class="text-center" style="color:black">
                                <br />
                                <asp:TextBox ID="tshirt_price" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:Label ID="lbl_tshirt_price" ForeColor="Black" runat="server"></asp:Label>
                                <br />        
                                <br />
                            </td>
                            <td data-col-title="Product Id:" class="text-center" style="color:black">
                                <br />
                                <asp:TextBox ID="tshirt_pid" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:Label ID="lbl_tshirt_pid" ForeColor="Black" runat="server"></asp:Label>
                                <br />        
                                <br />
                            </td>
                            <td data-col-title="Size S Quantity" class="text-center" style="color:black">
                                <br />
                                <asp:TextBox ID="tshirt_s" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:Label ID="lbl_tshirt_squant" ForeColor="Black" runat="server"></asp:Label>
                                <br />        
                                <br />
                            </td>
                            <td data-col-title="Size M Quantity" class="text-center" style="color:black">
                                <br />
                                <asp:TextBox ID="tshirt_m" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:Label ID="lbl_tshirt_mquant" ForeColor="Black" runat="server"></asp:Label>
                                <br />        
                                <br />
                            </td>    
                            <td data-col-title="Size L Quantity" class="text-center" style="color:black">
                                <br />
                                <asp:TextBox ID="tshirt_l" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:Label ID="lbl_tshirt_lquant" ForeColor="Black" runat="server"></asp:Label>
                                <br />        
                                <br />
                            </td>  
                            <td data-col-title="Size XL Quantity" class="text-center" style="color:black">
                                <br />
                                <asp:TextBox ID="tshirt_xl" CssClass="form-control" runat="server"></asp:TextBox>
                                <asp:Label ID="lbl_tshirt_xlquant" ForeColor="Black" runat="server"></asp:Label>
                                <br />        
                                <br />
                            </td>    
                        </tr>
                            </table>
                    <br />
                    <div class="text-center">
                    <asp:Button ID="btn_tshirt_view" CssClass="btn btn-primary" runat="server" Text="Check Data" OnClick="btn_tshirt_view_Click"/>
                        </div>
                    </div>
                    <div class="text-center">
                    <asp:Button ID="btn_tshirt_add" runat="server" CssClass="btn btn-success" Text="Add" OnClick="btn_tshirt_add_Click" />
                        <br />
                        <asp:Label ID="lbl_tshirt_addedsucess" ForeColor="Green" runat="server"></asp:Label>
                    </div>
                    <br />
                    </div>
            </div>

        <div class="container-fluid text-center">
            <asp:Button ID="btn_orders" runat="server" Text="View Orders" CssClass="btn btn-primary" OnClick="btn_orders_Click" />&nbsp;&nbsp;&nbsp; <asp:Button ID="Button1" runat="server" Text="view customers" CssClass="btn btn-primary" OnClick="Button1_Click" />
        &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary" Text="View Stock" OnClick="Button2_Click" />
        </div>
        <br />

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
