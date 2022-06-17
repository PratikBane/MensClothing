using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProductsConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        div1.Visible = false;
        div2.Visible = false;
      
        if(TextBox8.Text!= TextBox9.Text)
        {
            div2.Visible = true;
           
        }
    }



    protected void Button1_Click(object sender, EventArgs e)
        
    {
        SqlCommand email = new SqlCommand("select * from Cust_detail where Email='" + TextBox2.Text + "'", con);
        con.Open();
        SqlDataReader re = email.ExecuteReader();
        if (re.Read())
        {
            div2.Visible = true;
            
        }
       
        else
        {
            con.Close();
            SqlCommand insert = new SqlCommand("insert into Cust_detail values ('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox6.Text + "','" + TextBox10.Text + "','" + TextBox9.Text + "')", con);
            con.Open();
            insert.ExecuteNonQuery();
            con.Close();

            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";
            TextBox10.Text = "";

            div1.Visible = true;
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox10.Text = TextBox3.Text + ", " + TextBox4.Text + ", " + TextBox5.Text + ", " + TextBox7.Text;
    }
}