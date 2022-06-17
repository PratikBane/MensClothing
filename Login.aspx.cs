using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProductsConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        alert.Visible = false;
        br.Visible = false;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == true)
        {
            Response.Cookies["Email"].Value = txt_user.Text;
            Response.Cookies["Password"].Value = txt_pass.Text;
            Response.Cookies["Email"].Expires = DateTime.Now.AddDays(30);
            Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
        }

        con.Open();
        SqlCommand login = new SqlCommand("select * from Cust_detail where Email=@email and Password=@pass",con);
        login.Parameters.AddWithValue("@email",txt_user.Text.ToString());
        login.Parameters.AddWithValue("@pass", txt_pass.Text.ToString());
        SqlDataReader reader = login.ExecuteReader();
        if (reader.Read())
        {
            Session["user"] = reader["Email"].ToString();
            Session["name"] = reader["Name"].ToString();
            Session["contact"] = reader["Contact"].ToString();
            Response.Redirect("Shop.aspx");
           
        }
        else
        {
            if(txt_user.Text=="admin" && txt_pass.Text=="admin")
            {
                
                Session["user"] = "admin";
                Session["Name"] = "admin";
                Response.Redirect("admin.aspx");
            }
        else
            {
                txtdiv_pass.Attributes.Add("class", "input-group has-error");
                txtdiv_user.Attributes.Add("class", "input-group has-error");
                br.Visible = true;
                alert.Visible = true;
            }

        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("forgetpass.aspx");

    }

    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Signin.aspx");
    }
}