using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

public partial class orders : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProductsConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
           
            if(Session["user"].ToString()=="admin")
            {
                lbl_user.Text = "Hii! " + Session["name"].ToString();
                con.Open();
                string abc = "select * from orders";
                SqlDataAdapter sda = new SqlDataAdapter(abc, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
                con.Close();

                lbl_user.Text = Session["name"].ToString();
                li_log.Visible = false;
                li_sign.Visible = false;
                li_logout.Visible = true;
                li_admin.Visible = true;
                li_customers.Visible = true;
                li_cart.Visible = false;

            }
            else
            {
                con.Open();
                SqlCommand cartcount = new SqlCommand("select count (*) from Cart_Product where Email='" + Session["user"].ToString() + "'", con);
                Int32 count = Convert.ToInt32(cartcount.ExecuteScalar());
                con.Close();
                lbl_cart.Text = count.ToString();

                lbl_user.Text = "Hii! " + Session["name"].ToString();
                li_log.Visible = false;
                li_sign.Visible = false;
                li_logout.Visible = true;
                li_admin.Visible = false;
                li_customers.Visible = false;
                

                con.Open();
                string abc = "select * from orders where Email='"+Session["user"].ToString()+"'";
                SqlDataAdapter sda = new SqlDataAdapter(abc, con);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                Repeater1.DataSource = dt;
                Repeater1.DataBind();
                con.Close();

                lbl_noorder.Visible = false;
                SqlCommand order = new SqlCommand("select count(*) from Cart_Product where Email='" + Session["user"].ToString() + "'", con);
                con.Open();
                Int32 countorder = Convert.ToInt32(order.ExecuteScalar());
                con.Close();
                if (countorder == 0)
                {
                    lbl_noorder.Text = "No orders";
                }
            }
        }

    }

    protected void logout(object sender, EventArgs e)
    {
        Session["user"] = null;
        Session["name"] = null;
        Response.Redirect("Shop.aspx");
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

        if (e.CommandName == "cancelorder")
        {
            string pid = e.CommandArgument.ToString();

            Label lbl_size = (Label)e.Item.FindControl("lbl_size");
            


            SqlCommand deleteorder =new SqlCommand("delete from orders where Email='"+Session["user"].ToString()+"' and productid='"+pid+"' and Size='"+lbl_size.Text+"' ",con);
            con.Open();
            deleteorder.ExecuteNonQuery();
            con.Close();
            Response.Redirect("orders.aspx");
        }
    }

    protected void search_Click(object sender, EventArgs e)
    {
        con.Open();
        string abc = "select * from orders where Email like '"+txt_search.Text+ "%' or orderid like  '" + txt_search.Text + "%' or transitionid like '" + txt_search.Text + "%' ";
        SqlDataAdapter sda = new SqlDataAdapter(abc,con);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        Repeater1.DataSource = dt;
        Repeater1.DataBind();
        con.Close();
    }
}