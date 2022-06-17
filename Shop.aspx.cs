using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

namespace Shopping
{
    public partial class Shop : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProductsConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                li_logout.Visible = false;
            }
            else
            {
                con.Open();
                SqlCommand cartcount = new SqlCommand("select count (*) from Cart_Product where Email='"+Session["user"].ToString()+"'", con);
                Int32 count = Convert.ToInt32(cartcount.ExecuteScalar());
                con.Close();
                lbl_cart.Text = count.ToString();
               

                lbl_user.Text = "Hii! "+ Session["name"].ToString();
                li_log.Visible = false;
                li_sign.Visible = false;
                li_logout.Visible = true;


            }
        }
        protected void logout(object sender,EventArgs e)
        {
            Session["user"] = null;
            Session["name"] = null;
            Response.Redirect("Shop.aspx");
        }
    }
}