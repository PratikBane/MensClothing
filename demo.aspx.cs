using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

public partial class demo: System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProductsConnectionString"].ConnectionString);

   
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand email = new SqlCommand("select * from Cust_detail where Email='" + TextBox1.Text + "'", con);
        con.Open();
        SqlDataReader re = email.ExecuteReader();
        if (re.Read()==null)
        {
            Label2.Text = "hgdfh";

        }
        else
        {
            Label2.Text = "jsgk";
        }
    }
}