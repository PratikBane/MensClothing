<%@ Page Language="C#" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" %>

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
    
    <title>Profile</title>
    
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
                    <li class="nav nav-tabs active"><a  href="Profile.aspx">PROFILE</a></li>
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

        <asp:MultiView ID="MultiView1" runat="server">

<!--Profile-->
            <asp:View ID="View1" runat="server">
            <div class="container">
                <div class="panel panel-default">
                <div class="panel-heading" style="background-color:black; color:white"><h3>Profile</h3></div>
                <div class="panel-body">
                            <table class="nav-justified table-responsive container01 table-bordered">
                                    <tr style="color:black">
                            <th class="text-center" style="color:black"> Name</th>
                             <th class="text-center" style="color:black">Email</th>
                            <th class="text-center" style="color:black">Conact</th>
                            <th class="text-center" style="color:black">Address</th>
                                </tr>
                     <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">
                        <ItemTemplate>
                            <tr>

                            <td data-col-title=" Name:" class="text-center" style="color:black">
                                <asp:Label ID="Label2" ForeColor="#333333" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                <br />        
                                <br />
                                 <asp:Button CssClass="btn btn-link" ID="Button" Text="Edit" runat="server" CommandName="editname"></asp:Button>
                            </td>

                            <td data-col-title="Email:" class="text-center" style="color:black">
                                <asp:Label ID="lbl_pid" ForeColor="#333333" runat="server" Text='<%# Eval("Email") %>' ></asp:Label>
                            </td>

                            <td data-col-title="Contact:" class="text-center" style="color:black">
                                <asp:Label ID="lbl_adddress" ForeColor="#333333" runat="server" Text='<%# Eval("Contact") %>'/>
                                <br />        
                                <br />
                                 <asp:Button CssClass="btn btn-link" ID="Button1" Text="Edit" runat="server" CommandName="editcontact"></asp:Button>   
                            </td>

                            <td data-col-title="Address:" class="text-center" style="color:black">
                                <br />
                                <asp:Label ID="lbl_size" ForeColor="#333333" runat="server" Text='<%# Eval("Address") %>' />
                                <br />        
                                <br />
                                 <asp:Button CssClass="btn btn-link" ID="btn" Text="Edit" runat="server" CommandName="editaddress"></asp:Button>
                            </td>
                        </tr>
                            
                        </ItemTemplate>
                    </asp:Repeater>
                            </table>
                           <br />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProductsConnectionString %>" SelectCommand="SELECT * FROM [Cust_detail] WHERE ([Email]=@session)">
            <SelectParameters>
                <asp:SessionParameter Name="session" SessionField="user" Type="String"/>

            </SelectParameters>
         </asp:SqlDataSource>
                    </div>
                </div>
            </div>
                </asp:View>

<!--edit address-->         
            
            <asp:View ID="View2" runat="server">
               <div class="container">
                <div class="panel panel-default">
                <div class="panel-heading" style="background-color:black; color:white"><h3>Profile</h3></div>
                <div class="panel-body">
                            <table class="nav-justified table-responsive container01 table-bordered">
                                    <tr style="color:black">
                            <th class="text-center" style="color:black"> Name</th>
                             <th class="text-center" style="color:black">Email</th>
                            <th class="text-center" style="color:black">Conact</th>
                            <th class="text-center" style="color:black">Address</th>
                                </tr>
                     <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater2_ItemCommand">
                        <ItemTemplate>
                            <tr>

                            <td data-col-title=" Name:" class="text-center" style="color:black">
                                <asp:Label ID="Label2" ForeColor="#333333" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                <br />        
                                <br />
                                 <asp:Button CssClass="btn btn-link" ID="Button3" Text="Edit" runat="server" CommandName="editname"></asp:Button>
                            </td>

                            <td data-col-title="Email:" class="text-center" style="color:black">
                                <asp:Label ID="lbl_pid" ForeColor="#333333" runat="server" Text='<%# Eval("Email") %>' ></asp:Label>
                                <br />        
                                <br />
                            </td>

                            <td data-col-title="Contact:" class="text-center" style="color:black">
                                <asp:Label ID="lbl_adddress" ForeColor="#333333" runat="server" Text='<%# Eval("Contact") %>'/>
                                <br />        
                                <br />
                                 <asp:Button CssClass="btn btn-link" ID="Button1" Text="Edit" runat="server" CommandName="editcontact"></asp:Button>   
                            </td>

                            <td data-col-title="Address:" class="text-center" style="color:black">
                                <br />
                                <asp:TextBox ID="txt_address" CssClass="form-control" runat="server" Text='<%# Eval("Address") %>'></asp:TextBox>
                                <br />        
                                <br />
                                 <asp:Button CssClass="btn btn-link" ID="btn" Text="Save" runat="server" CommandName="saveaddress"></asp:Button>
                            </td>
                        </tr>
                            
                        </ItemTemplate>
                    </asp:Repeater>
                            </table>
                           <br />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ProductsConnectionString %>" SelectCommand="SELECT * FROM [Cust_detail] WHERE ([Email]=@session)">
            <SelectParameters>
                <asp:SessionParameter Name="session" SessionField="user" Type="String"/>

            </SelectParameters>
         </asp:SqlDataSource>
                    </div>
                </div>
            </div>
                </asp:View>

<!--edit contact-->

            <asp:View ID="View3" runat="server">
               <div class="container">
                <div class="panel panel-default">
                <div class="panel-heading" style="background-color:black; color:white"><h3>Profile</h3></div>
                <div class="panel-body">
                            <table class="nav-justified table-responsive container01 table-bordered">
                                    <tr style="color:black">
                            <th class="text-center" style="color:black"> Name</th>
                             <th class="text-center" style="color:black">Email</th>
                            <th class="text-center" style="color:black">Conact</th>
                            <th class="text-center" style="color:black">Address</th>
                                </tr>
                     <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater3_ItemCommand">
                        <ItemTemplate>
                            <tr>

                            <td data-col-title=" Name:" class="text-center" style="color:black">
                                <asp:Label ID="Label2" ForeColor="#333333" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                <br />        
                                <br />
                                 <asp:Button CssClass="btn btn-link" ID="Button3" Text="Edit" runat="server" CommandName="editname"></asp:Button>
                            </td>

                            <td data-col-title="Email:" class="text-center" style="color:black">
                                <asp:Label ID="lbl_pid" ForeColor="#333333" runat="server" Text='<%# Eval("Email") %>' ></asp:Label>
                                <br />        
                                <br />
                            </td>

                            <td data-col-title="Contact:" class="text-center" style="color:black">
                                <asp:TextBox ID="txt_contact" CssClass="form-control" runat="server" Text='<%# Eval("Contact") %>'></asp:TextBox>
                                <br />        
                                <br />
                                 <asp:Button CssClass="btn btn-link" ID="Button1" Text="Save" runat="server" CommandName="savecontact"></asp:Button>   
                            </td>

                            <td data-col-title="Address:" class="text-center" style="color:black">
                                <br />
                                <asp:Label ID="lbl_size" ForeColor="#333333" runat="server" Text='<%# Eval("Address") %>' />
                                <br />        
                                <br />
                                 <asp:Button CssClass="btn btn-link" ID="btn" Text="Edit" runat="server" CommandName="editaddress"></asp:Button>
                            </td>
                        </tr>
                            
                        </ItemTemplate>
                    </asp:Repeater>
                            </table>
                           <br />
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ProductsConnectionString %>" SelectCommand="SELECT * FROM [Cust_detail] WHERE ([Email]=@session)">
            <SelectParameters>
                <asp:SessionParameter Name="session" SessionField="user" Type="String"/>

            </SelectParameters>
         </asp:SqlDataSource>
                    </div>
                </div>
            </div>
                </asp:View>

<!--edit name-->

            <asp:View ID="View4" runat="server">
               <div class="container">
                <div class="panel panel-default">
                <div class="panel-heading" style="background-color:black; color:white"><h3>Profile</h3></div>
                <div class="panel-body">
                            <table class="nav-justified table-responsive container01 table-bordered">
                                    <tr style="color:black">
                            <th class="text-center" style="color:black"> Name</th>
                             <th class="text-center" style="color:black">Email</th>
                            <th class="text-center" style="color:black">Conact</th>
                            <th class="text-center" style="color:black">Address</th>
                                </tr>
                     <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater4_ItemCommand">
                        <ItemTemplate>
                            <tr>

                            <td data-col-title=" Name:" class="text-center" style="color:black">
                                <asp:TextBox ID="txt_name" CssClass="form-control" runat="server" Text='<%# Eval("Name") %>'></asp:TextBox>
                                <br />        
                                <br />
                                 <asp:Button CssClass="btn btn-link" ID="Button3" Text="save" runat="server" CommandName="savename"></asp:Button>
                            </td>

                            <td data-col-title="Email:" class="text-center" style="color:black">
                                <asp:Label ID="lbl_pid" ForeColor="#333333" runat="server" Text='<%# Eval("Email") %>' ></asp:Label>
                                <br />        
                                <br />
                                
                            </td>

                            <td data-col-title="Contact:" class="text-center" style="color:black">
                                <asp:Label ID="lbl_contact" ForeColor="#333333" runat="server" Text='<%# Eval("Contact") %>'></asp:Label>
                                <br />        
                                <br />
                                 <asp:Button CssClass="btn btn-link" ID="Button1" Text="Edit" runat="server"  CommandName="editcontact"></asp:Button>   
                            </td>

                            <td data-col-title="Address:" class="text-center" style="color:black">
                                <br />
                                <asp:Label ID="lbl_size" ForeColor="#333333" runat="server" Text='<%# Eval("Address") %>' />
                                <br />        
                                <br />
                                 <asp:Button CssClass="btn btn-link" ID="btn" Text="Edit" runat="server" CommandName="editaddress"></asp:Button>
                            </td>
                        </tr>
                            
                        </ItemTemplate>
                    </asp:Repeater>
                            </table>
                           <br />
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ProductsConnectionString %>" SelectCommand="SELECT * FROM [Cust_detail] WHERE ([Email]=@session)">
            <SelectParameters>
                <asp:SessionParameter Name="session" SessionField="user" Type="String"/>

            </SelectParameters>
         </asp:SqlDataSource>
                    </div>
                </div>
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
