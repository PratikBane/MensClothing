using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
public partial class Fp : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProductsConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        Button2.Visible = false;
        MultiView1.ActiveViewIndex = 0;
        Label2.Text = Session["mail"].ToString();

        Label3.Text = "OTP will valid for 5 Minutes Only";
        Label3.ForeColor = System.Drawing.Color.Black;
        Label1.Visible = false;
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Label1.Text = "Password successfully updated";
        MultiView1.ActiveViewIndex = 1;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        
        con.Open();
        SqlCommand otp = new SqlCommand("select * from verifyotp where Email='" + Label2.Text + "' and created >=DATEADD(MINUTE,-5,getdate()) ", con);
        SqlDataReader r = otp.ExecuteReader();
        if (r.Read())
        {
            string o = r["otp"].ToString();
            if (TextBox2.Text == o)
            {
                SqlCommand delete = new SqlCommand("delete from verifyotp where Email='" + Label2.Text + "'", con);
                
                delete.ExecuteNonQuery();
                
                MultiView1.ActiveViewIndex = 1;

            }
            else
            {            
                Label3.Text = "Wrong OTP entered";
                Label3.ForeColor = System.Drawing.Color.Red;

            }
        }
        else
        {
            SqlCommand delete = new SqlCommand("delete from verifyotp where Email='" + Label2.Text + "'", con);
            delete.ExecuteNonQuery();
            Label3.Text = "Time Expire Try Again";
            Label3.ForeColor = System.Drawing.Color.Red;
            Button1.Visible = false;
            Button2.Visible = true;
        }

        con.Close();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("forgetpass.aspx");
    }

    protected void TextBox3_TextChanged(object sender, EventArgs e)
    {
        SqlCommand change = new SqlCommand("update  Cust_detail set Password='" + TextBox3.Text + "' where Email='" + Session["mail"].ToString() + "' ", con);
        con.Open();
        change.ExecuteNonQuery();
        con.Close();
        Label1.Text = "Password Change Successfully";
        Label1.Visible = true;
        TextBox3.Text = "";
        TextBox4.Text = "";
    }
}