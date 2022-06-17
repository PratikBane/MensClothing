<%@ Page Language="C#" AutoEventWireup="true" CodeFile="customers.aspx.cs" Inherits="customers" %>

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
                    <li class="nav nav-tabs "><a  href="shirts.aspx">Shirts</a></li>
                    <li class="nav nav-tabs "><a  href="orders.aspx">Orders</a></li> 
                    <li class="nav nav-tabs active"><a  href="customers.aspx">Customers</a></li>
                    <li  class="nav nav-tabs"><a  href="admin.aspx">Add Products</a></li>  
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

        <div class="container-fluid">
            <table class="nav-justified table-responsive container01 table-bordered table-condensed">

                 <tr style="color:black">
                            <td class="text-center" style="color:black" colspan="14">
                               <em style="color:red">* </em> <asp:Label ID="Label1" ForeColor="Black" runat="server" Text="Search by Email or Name"></asp:Label> <em style="color:red">* </em>
                                <br />
                                <asp:TextBox ID="txt_search" CssClass="text-center" runat="server"></asp:TextBox><asp:Button ID="search" CssClass="btn btn-success" runat="server" Text="Search" OnClick="search_Click" />
                            </td>
                                </tr>

                                    <tr style="color:black">
                            <th class="text-center" style="color:black"> Nameee</th>
                             <th class="text-center" style="color:black">Email</th>
                            <th class="text-center" style="color:black">Conact</th>
                            <th class="text-center" style="color:black">Address</th>
                                </tr>
                     <asp:Repeater ID="Repeater1" runat="server" >
                        <ItemTemplate>
                            <tr>

                            <td data-col-title=" Name:" class="text-center" style="color:black">
                                <asp:Label ID="Label2" ForeColor="#333333" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                            </td>

                            <td data-col-title="Email:" class="text-center" style="color:black">
                                <asp:Label ID="lbl_pid" ForeColor="#333333" runat="server" Text='<%# Eval("Email") %>' ></asp:Label>
                            </td>

                            <td data-col-title="Contact:" class="text-center" style="color:black">
                                <asp:Label ID="lbl_adddress" ForeColor="#333333" runat="server" Text='<%# Eval("Contact") %>'/>
                            </td>

                            <td data-col-title="Address:" class="text-center" style="color:black">
                                <asp:Label ID="lbl_size" ForeColor="#333333" runat="server" Text='<%# Eval("Address") %>' ></asp:Label>
                            </td>
                        </tr>
                            
                        </ItemTemplate>
                    </asp:Repeater>
                            </table>
            <br />
             
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