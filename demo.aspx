<%@ Page Language="C#" AutoEventWireup="true" CodeFile="demo.aspx.cs" Inherits="demo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="productid" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="productid" HeaderText="productid" ReadOnly="True" SortExpression="productid" />
                    <asp:BoundField DataField="s" HeaderText="s" SortExpression="s" />
                    <asp:BoundField DataField="m" HeaderText="m" SortExpression="m" />
                    <asp:BoundField DataField="l" HeaderText="l" SortExpression="l" />
                    <asp:BoundField DataField="xl" HeaderText="xl" SortExpression="xl" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        &nbsp;</div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProductsConnectionString %>" DeleteCommand="DELETE FROM [Stock] WHERE [productid] = @productid" InsertCommand="INSERT INTO [Stock] ([productid], [s], [m], [l], [xl]) VALUES (@productid, @s, @m, @l, @xl)" SelectCommand="SELECT * FROM [Stock]" UpdateCommand="UPDATE [Stock] SET [s] = @s, [m] = @m, [l] = @l, [xl] = @xl WHERE [productid] = @productid">
            <DeleteParameters>
                <asp:Parameter Name="productid" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="productid" Type="String" />
                <asp:Parameter Name="s" Type="Int32" />
                <asp:Parameter Name="m" Type="Int32" />
                <asp:Parameter Name="l" Type="Int32" />
                <asp:Parameter Name="xl" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="s" Type="Int32" />
                <asp:Parameter Name="m" Type="Int32" />
                <asp:Parameter Name="l" Type="Int32" />
                <asp:Parameter Name="xl" Type="Int32" />
                <asp:Parameter Name="productid" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
