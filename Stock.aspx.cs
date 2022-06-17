using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

public partial class Stock : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProductsConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_user.Text = "Hii! " + Session["name"].ToString();

        string abc = "select * from Stock";
        SqlDataAdapter sda = new SqlDataAdapter(abc, con);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        Repeater1.DataSource = dt;
        Repeater1.DataBind();
        con.Close();
    }
    protected void logout(object sender, EventArgs e)
    {
        Session["user"] = null;
        Session["name"] = null;
        Response.Redirect("Shop.aspx");
    }

    protected void search_Click(object sender, EventArgs e)
    {
        con.Open();
        string abc = "select * from Stock where productid like '" + txt_search.Text + "%' ";
        SqlDataAdapter sda = new SqlDataAdapter(abc, con);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        Repeater1.DataSource = dt;
        Repeater1.DataBind();
        con.Close();
    }
}