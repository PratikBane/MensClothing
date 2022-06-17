<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

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

    <title>Cart</title>
    
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
                    <li class="nav nav-tabs "><a  href="Shop.aspx">HOME</a></li> 
                    <li class="nav nav-tabs "><a  href="tshirt.aspx">T-Shirts</a></li>
                    <li class="nav nav-tabs"><a  href="shirts.aspx">Shirts</a></li>
                    <li class="nav nav-tabs"><a  href="orders.aspx">Orders</a></li>
                    <li class="nav nav-divider" style="color: #FF0000"></li>
                    <li id="li_logout" runat="server" class="nav nav-tabs btn btn-primary btn-xs"><a runat="server" onclick="logout()" class="glyphicon glyphicon-log-out" style="color:white"> LOG OUT</a></li>
                    <li><asp:HyperLink ID="HyperLink1" class="glyphicon glyphicon-shopping-cart" runat="server" NavigateUrl="~/cart.aspx"><span class="badge">0</span></asp:HyperLink></li>
                </ul>
              
                </div>
            </div>
      </nav>
        <br />
        <br />
        <br />
        <br />

<asp:MultiView ID="MultiView1" runat="server">

<!--Cart-->
   
     <asp:View ID="View1" runat="server">
        
            
         <div class="container">
            <div class="panel panel-default">
                <div class="panel-heading" style="background-color:black; color:white"><h3>Cart</h3></div>
                <div class="panel-body">

                    
                    <div class="container01">
                            <table class="nav-justified table-responsive table-condensed">
                                    <tr style="color:black">
                            <th class="text-center" style="color:black">Product Name</th>
                             <th class="text-center" style="color:black">Product Id</th>
                            <th class="text-center" style="color:black">Product Image</th>
                            <th class="text-center" style="color:black">Size</th>
                            <th class="text-center" style="color:black">Product Price</th>
                            <th class="text-center" style="color:black">Quanitiy</th>
                            <th class="text-center" style="color:black">Total</th>
                                </tr>
            
                     <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">
                        <ItemTemplate>
                            <tr>
                            <td data-col-title="Product Name:" class="text-center" style="color:black">
                                <asp:Label ID="Label2" ForeColor="#333333" runat="server" Text='<%# Eval("Pname") %>'></asp:Label>
                            </td>
                            <td data-col-title="Product Id:" class="text-center" style="color:black">
                                <asp:Label ID="lbl_pid" ForeColor="#333333" runat="server" Text='<%# Eval("productid") %>' ></asp:Label>
                            </td>
                            <td data-col-title="Product Image:" class="text-center" style="color:black">
                                <asp:Image ID="Image1" ForeColor="#333333" runat="server" ImageUrl='<%# Eval("Pimage") %>' AlternateText="IMG not available" />
                            </td>
                            <td data-col-title="size:" class="text-center" style="color:black">
                                <asp:Label ID="lbl_size" ForeColor="#333333" runat="server" Text='<%# Eval("Size") %>' />
                            </td>
                            <td data-col-title="Product Price" class="text-center" style="color:black">
                                <asp:Label ID="Label3" ForeColor="#333333" runat="server" Text='<%# Eval("Pprice") %>'></asp:Label>
                            </td>
                            <td data-col-title="Product Quantity:" class="text-center" style="color:black">
                                   <asp:LinkButton runat="server" ForeColor="Black" ID="lb_inc" CssClass="glyphicon glyphicon-plus" CommandName="increment" CommandArgument='<%# Eval("productid") %>'></asp:LinkButton>
                                   <asp:TextBox ID="txt_quant" runat="server" Width="20%" Text='<%# Eval("Pquant") %>' CssClass="text-center"></asp:TextBox>
                                   <asp:LinkButton runat="server" ForeColor="Black" ID="lb_dec" CssClass="glyphicon glyphicon-minus" CommandName="decrement" CommandArgument='<%# Eval("productid") %>'></span></asp:LinkButton>
                            </td>
                            <td data-col-title="Total:" class="text-center" style="color:black">
                                <asp:Label ID="lbl_total" ForeColor="#333333" runat="server" Text='<%# Eval("Ptotal") %>'></asp:Label>
                            </td>
                            <td class="text-right">
                                <asp:LinkButton ID="Linkbutton2" ForeColor="#333333" runat="server" CommandArgument='<%# Eval("productid") %>' CommandName="Delete"><i style="font-size:30px;color:black;padding-left:50px" class="fas fa-trash-alt"></i></asp:LinkButton>
                            </td>

                        </tr>

                        </ItemTemplate>
                    </asp:Repeater>
                             
                            </table>
                        </div>
                    <div runat="server" id="div_noitem" class="text-center">
                    <br />
                    <br />
                      
                          <asp:Label ID="lbl_noitem" ForeColor="Black" runat="server" Text="Label"></asp:Label>
                      
                    <br />
                    <br />
                        </div>

                </div>
            </div>
            <div class="panel panel-default">
            <div class="panel-body">

                 <table class="nav-justified table-responsive table table-condensed">
                                    <tr style="color:black">
                            <th  style="color:black;float:left">Product Name</th>
                           
                            <th  style="color:black;float:right">Price</th>
                                </tr>
                     <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">
                        <ItemTemplate>
                            <tr>
                         <td data-col-title="Product Name:" style="color:black;float:left">
                                
                              <asp:Label ID="Label2" ForeColor="#333333" runat="server" Text='<%# Eval("Pname") %>'></asp:Label>

                             <asp:Label ID="Label22" ForeColor="Black" runat="server" Text="Label">X</asp:Label>
                                <asp:Label  ID="lbl_quant" ForeColor="#333333" runat="server" Text='<%# Eval("Pquant") %>' />
                              </td>
                            
                           
                            
                            <td data-col-title="Total:" style="color:black;float:right">
                                
                             <asp:Label ID="lbl_total" ForeColor="#333333" runat="server" Text='<%# Eval("Ptotal") %>'></asp:Label>
                            
                                </td>
                            </tr>


                        </ItemTemplate>
                    </asp:Repeater>
                            </table>
                
                <hr />
                <table class="nav-justified" >
                        <tr>
                             <td class="text-right">
                                 <strong>
                                 <asp:Label ID="lbl_total" runat="server" ForeColor="Black"></asp:Label>
                                     <i class="fas fa-rupee" style="color:black"></i>
                                 </strong>
                             </td>
                         </tr>
                </table>
                </div>

            </div>
        </div>
         
         <div class="container text-right">
               <asp:Button ID="btn_checkout" runat="server" Text="Checkout" CssClass="btn btn-success" OnClick="Button1_Click" />
               <asp:Button ID="btn_continue" runat="server" Text="Continue Shopping" CssClass="btn btn-warning" OnClick="btn_continue_Click" />
          </div>
         <br />
         <br />

         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProductsConnectionString %>" SelectCommand="SELECT * FROM [Cart_Product] WHERE ([Email]=@session)">
            <SelectParameters>
                <asp:SessionParameter Name="session" SessionField="user" Type="String"/>

            </SelectParameters>
         </asp:SqlDataSource>

           
      </asp:View>

<!--Checkout-->

    <asp:View ID="View2" runat="server">
        <div class="container">
            <div class="text-center">
            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/checkout.png" Width="200"  />
            </div>
            <div class="panel panel-default">
                <div class="panel-heading text-center" style="background-color:lightgray; color:black"><h3>Checkout Page</h3></div>
                <div class="panel-body" style="color:black">
                    <h2 style="color:black">Billing / Delivery Address</h2>
                    <hr />
                    <table class="nav-justified">
                        <tr>
                            <td>
                                <asp:Label ID="lbl_address" ForeColor="Black" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:HyperLink ID="HyperLink2" runat="server">Edit</asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                    <hr/>
                        <h2>
                            Payment
                        </h2>
                    <div class="container" runat="server" id="methodalert">
                         <asp:label runat="server" id="alert" CssClass="alert alert-danger">
               Please select one of the method
           </asp:label>
                    </div>
                    <br />

                    <asp:RadioButton ID="radio_cod" runat="server" GroupName="payment" /><asp:Label ID="Label1" ForeColor="Black" runat="server" Text=" Cash On Delivery"></asp:Label><br />
                    <asp:RadioButton ID="radio_credit" runat="server" GroupName="payment" /><asp:Label ID="Label4" ForeColor="Black" runat="server" Text=" Credit Card"></asp:Label><br />
                    <asp:RadioButton ID="radio_debit" runat="server" GroupName="payment" /><asp:Label ID="Label5" ForeColor="Black" runat="server" Text=" Debit Card"></asp:Label><br />
                 
                    <hr />
                    <div>
                    <h2 style="color:black;">Your Cart <span class="badge">
                        <asp:Label ID="lbl_cart" runat="server" Text="0"></asp:Label>
                        </span></h2>
                    </div>
                    <div class="panel-body">

                         <table class="nav-justified table table-condensed">
                                    <tr style="color:black">
                            <th style="color:black;float:left">Product Name</th>
                            
                            <th style="color:black;float:right">Price</th>
                                </tr>
                     <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">
                        <ItemTemplate>
                            <tr>
                            <td  style="color:black;float:left">
                                <asp:Label ID="Label2" ForeColor="#333333" runat="server" Text='<%# Eval("Pname") %>'></asp:Label>
                                <asp:Label ID="Label23" ForeColor="#333333" runat="server" Text="X"></asp:Label>
                                <asp:Label data-col-title="Quantity:" ID="lbl_size" ForeColor="#333333" runat="server" Text='<%# Eval("Pquant") %>' />
                            </td>
                            
                            
                            <td data-col-title="Total:" style="color:black;float:right">
                                <asp:Label ID="lbl_total" ForeColor="#333333" runat="server" Text='<%# Eval("Ptotal") %>'></asp:Label>
                            </td>
                            </tr>

                        </ItemTemplate>
                    </asp:Repeater>
                            </table>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ProductsConnectionString %>" SelectCommand="SELECT * FROM [Cart_Product] WHERE ([Email]=@session)">
            <SelectParameters>
                <asp:SessionParameter Name="session" SessionField="user" Type="String"/>

            </SelectParameters>
         </asp:SqlDataSource>

                            <table class="nav-justified table table-condensed"  style="border-width: 1px; border-style: solid;">
                                <tr>
                                    <td>
                                       <span style="float:left"><asp:Label ID="Label6" ForeColor="Black" runat="server" Text="Cart Total"></asp:Label></span>
                                        <span style="float:right"><asp:Label ID="lbl_ct" ForeColor="Black" runat="server"></asp:Label></span>

                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span style="float:left"><asp:Label ID="Label8" ForeColor="Black" runat="server" Text="Shipping Charge"></asp:Label></span>
                                         <span style="float:right"><asp:Label ID="Label9"  ForeColor="Black" runat="server" Text="30"></asp:Label></span></td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong><span style="float:left">
                                        <asp:Label ID="Label10" runat="server" ForeColor="Black" Text="Total (Rupees)"></asp:Label>
                                        </span></strong>
                                     
                                        <strong><span style="float:right">
                                            <i class="fas fa-rupee" style="color:black"></i>
                                        <asp:Label ID="lbl_t" runat="server" ForeColor="Black" Text="Label"></asp:Label>
                                        </span></strong></td>
                                </tr>
                                </table>
                         <br />
                        <div>
                        <div class="text-right">
                         <asp:Button ID="Button2" runat="server" CssClass="btn btn-success" Text="Procced To Pay" OnClick="Button2_Click" />
                       </div>
                            </div>
                            </div>     
                </div>
                </div>
            </div>
    </asp:View>

<!--proced to pay-->
    
    <asp:View ID="View3" runat="server">

        <div class="container">
            <div class="text-center">
            <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/checkout.png" Width="200"  />
            </div>
            <div class="panel panel-default">
                <div class="panel-heading text-center" style="background-color:lightgray; color:black"><h3>Checkout Page</h3></div>
                <div class="panel-body" style="color:black">
                    <h2 style="color:black">Finalize Checkout</h2>
                    <hr />
                 
                    <table class="nav-justified table table-condensed">
                        <tr>
                            <td><span style="float:left"><strong>
                                <asp:Label ID="Label7" runat="server" ForeColor="Black" Text="Order ID:"></asp:Label>
                                </strong></span>
                                <span style="float:right"><asp:Label ForeColor="Black" ID="lbl_orderid" runat="server"></asp:Label></span></td>
                        </tr>
                        <tr>
                            <td><span style="float:left"><strong>
                                <asp:Label ID="Label11" runat="server" ForeColor="Black" Text="Your Email:"></asp:Label>
                                </strong></span>
                             <span style="float:right"><asp:Label ForeColor="Black" ID="lbl_email" runat="server"></asp:Label></span></td>
                            
                        </tr>
                        <tr>
                            <td><span style="float:left"><strong>
                                <asp:Label ID="Label13" runat="server" ForeColor="Black" Text="Your Address"></asp:Label>
                                </strong></span>
                            <span style="float:right"><asp:Label ForeColor="Black" ID="lbl_Add" runat="server"></asp:Label></span></td>
                        </tr>
                        <tr>
                            <td><span style="float:left"><strong>
                                <asp:Label ID="Label12" runat="server" ForeColor="Black" Text="Total Pay:"></asp:Label>
                                </strong></span>
                             <span style="float:right"><asp:Label ForeColor="Black" ID="lbl_cost" runat="server"></asp:Label></span></td>
                        </tr>
                        <tr>
                            <td><span style="float:left"><strong>
                                <asp:Label ID="Label21" runat="server" ForeColor="Black" Text="Payment Method:"></asp:Label>
                                </strong></span>
                            <span style="float:right"><asp:Label ForeColor="Black" ID="lbl_paymethod" runat="server"></asp:Label></span></td>
                        </tr>
                    </table>

                    <hr />
                    <div>
                    <h2 style="color:black;">Your Cart <span class="badge">
                        <asp:Label ID="lbl_pbadge" runat="server" Text="0"></asp:Label>
                        </span></h2>
                    </div>
                    <div class="panel-body">
                        <div class="container01">
                         <table class="nav-justified table-responsive table table-condensed">
                                    <tr style="color:black">
                            <th class="text-left" style="color:black">Product Name</th>
                            <th class="text-center" style="color:black">Quanitiy</th>
                            <th class="text-right" style="color:black">Price</th>
                                </tr>
                     <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource1" >
                        <ItemTemplate>
                            <tr>
                            <td data-col-title="Product Name:" class="text-left" style="color:black">
                                <asp:Label ID="Label2" ForeColor="#333333" runat="server" Text='<%# Eval("Pname") %>'></asp:Label>
                            </td>
                            
                            <td data-col-title="Quantity:" class="text-center" style="color:black">
                                <asp:Label ID="lbl_size" ForeColor="#333333" runat="server" Text='<%# Eval("Pquant") %>' />
                            </td>
                            
                            <td data-col-title="Total:" class="text-right" style="color:black">
                                <asp:Label ID="lbl_total" ForeColor="#333333" runat="server" Text='<%# Eval("Ptotal") %>'></asp:Label>
                            </td>
                            </tr>

                        </ItemTemplate>
                    </asp:Repeater>
                            </table>
                            </div>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ProductsConnectionString %>" SelectCommand="SELECT * FROM [Cart_Product] WHERE ([Email]=@session)">
            <SelectParameters>
                <asp:SessionParameter Name="session" SessionField="user" Type="String"/>

            </SelectParameters>
         </asp:SqlDataSource>


                            <table class="nav-justified table table-condensed "  style="border-width: 1px; border-style: solid;">
                                <tr>
                                    <td >
                                        <span style="float:left">
                                        <asp:Label ID="Label15" ForeColor="Black" runat="server" Text="Cart Total"></asp:Label>
                                        </span>                                  
                                        <span style="float:right">
                                        <asp:Label ID="lbl_pct" ForeColor="Black" runat="server" ></asp:Label>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span style="float:left">
                                        <asp:Label ID="Label17" ForeColor="Black" runat="server" Text="Shipping Charge"></asp:Label>
                                        </span>
                                        <span style="float:right">
                                        <asp:Label ID="Label18"  ForeColor="Black" runat="server" Text="30"></asp:Label>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <span style="float:left">
                                        <strong>
                                        <asp:Label ID="Label19" runat="server" ForeColor="Black" Text="Total (Rupees)"></asp:Label>
                                        </strong>
                                        </span>
                                        <span style="float:right">
                                        <strong>
                                            <i class="fas fa-rupee" style="color:black"></i>
                                        <asp:Label ID="lbl_pt" runat="server" ForeColor="Black"></asp:Label>
                                        </strong>
                                        </span>
                                    </td>
                                </tr>
                                </table>
                         <br />

                         <input type="hidden" runat="server" id="key" name="key" value="LTqBodvP" />
                         <input type="hidden" runat="server" id="salt" name="salt" value="3lPHaT1iWg" />
                         <input type="hidden" runat="server" id="hash" name="hash" />
                         <input type="hidden" runat="server" id="txnid" name="txnid"/>

                        <div>
                        <div class="text-right">
                         <asp:Button ID="Button1" runat="server" CssClass="btn btn-success" Text="Procced To Pay" OnClick="Button1_Click1" />
                       </div>
                            </div>
                            </div>     
                </div>
                </div>
            </div>

    </asp:View>
<!--invoice-->

    <asp:View ID="View4" runat="server">
        <br />
        <div class="text-center">
        <asp:Label ID="lbl_alert" runat="server" CssClass="alert alert-success">Order Success, check your orderlist for more information <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/orders.aspx">Click Here</asp:HyperLink> </asp:Label>
        <br />
        <br />
        </div>
            <div runat="server" class="container boxedit jumbotron" id="invoice" style="border-width: 1px">
                        <h3 class="text-center" style="color:black">Invoice</h3>
                        <hr style="color:black"/>
                        <br />
                        <div class="text-center">
                            <asp:Label ID="lbl_invoice_date" ForeColor="Black" runat="server"></asp:Label>
                        </div>
                        <br />
                        <div class="text-center">
                        <asp:Label ID="Label14" ForeColor="Black" runat="server" Text="Product Details" Font-Bold="True"></asp:Label>
                        </div>
                        <table class="table table-responsive">
                        <asp:Repeater ID="Repeater5" runat="server" DataSourceID="SqlDataSource4">
                        <ItemTemplate>
                            <tr>
                                <td>
                                <span style="float:left">
                                    <asp:Label ID="lbl_productname" ForeColor="Black" runat="server" Text='<%# Eval("Pname") %>'></asp:Label>
                                     <asp:Label ID="Label24" ForeColor="Black" runat="server" Text="X"></asp:Label>
                                    <asp:Label ID="lbl_invoice_quant" ForeColor="Black" runat="server" Text='<%# Eval("Pquant") %>'></asp:Label>
                                </span>
                                <span style="float:right">
                                    <asp:Label ID="lbl_price" ForeColor="Black" runat="server" Text='<%# Eval("Ptotal") %>'></asp:Label>
                                </span>
                                </td>
                            </tr>
                       </ItemTemplate>
                       </asp:Repeater>
                            </table>
                             <hr />
                            <table class="table table-responsive">
                            <tr>
                                <td>
                                    <span style="float:left">
                                    <asp:Label ID="lbl_invoice_order" ForeColor="Black" runat="server" Text="OrderID :"></asp:Label>
                                </span>
                                <span style="float:right">
                                    <asp:Label ID="lbl_invoice_orderid" ForeColor="Black" runat="server"></asp:Label>
                                </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span style="float:left">
                                    <asp:Label ID="lbl_invoice_tnxid" ForeColor="Black" runat="server" Text="TransactionID :"></asp:Label>
                                </span>
                                <span style="float:right">
                                    <asp:Label ID="lbl_invoice_transitionid" ForeColor="Black" runat="server"></asp:Label>
                                </span>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span style="float:left">
                                    <asp:Label ID="lbl_modeofpay" ForeColor="Black" runat="server" Text="Mode of Payment :"></asp:Label>
                                    </span>
                                    <span style="float:right">
                                    <asp:Label ID="lbl_invoice_modeofpayment" ForeColor="Black" runat="server"></asp:Label>
                                    </span>
                               </td>
                           </tr>
                           <tr>
                               <td>
                                   <hr/>
                                   <span style="float:left">
                                    <asp:Label ID="lbl_i_a" ForeColor="Black" runat="server"></asp:Label>
                                    </span>
                                    <span style="float:right">
                                    <asp:Label ID="lbl_invoice_amount" ForeColor="Black" runat="server"></asp:Label>
                                    </span>
                               </td>
                           </tr>

            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ProductsConnectionString %>" >
            </asp:SqlDataSource>
                       </table>
                    </div>
        <div class="container-fluid text-center">
            <br />
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
