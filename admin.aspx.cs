using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProductsConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        lbl_user.Text = "Hii! " + Session["name"].ToString();
    }

    protected void btn_shirt_view_Click(object sender, EventArgs e)
    {
        string str = Path.GetFileName(shirt_upload.PostedFile.FileName);
       
        lbl_shirt_image.Text = str.ToString();
        lbl_shirt_title.Text = shirt_title.Text;
        lbl_shirt_disc.Text = shirt_disc.Text;
        lbl_shirt_price.Text = shirt_price.Text;
        lbl_shirt_pid.Text = shirt_pid.Text;
        lbl_shirt_squant.Text = Shirt_s.Text;
        lbl_shirt_lquant.Text = shirt_l.Text;
        lbl_shirt_mquant.Text = shirt_m.Text;
        lbl_shirt_xlquant.Text = shirt_xl.Text;

    }

    protected void btn_tshirt_view_Click(object sender, EventArgs e)
    {
        string str = Path.GetFileName(tshirt_upload.PostedFile.FileName);

        lbl_tshirt_image.Text = str.ToString();
        lbl_tshirt_title.Text = tshirt_title.Text;
        lbl_tshirt_disc.Text = tshirt_disc.Text;
        lbl_tshirt_price.Text = tshirt_price.Text;
        lbl_tshirt_pid.Text = tshirt_pid.Text;
        lbl_tshirt_squant.Text = tshirt_s.Text;
        lbl_tshirt_lquant.Text = tshirt_l.Text;
        lbl_tshirt_mquant.Text = tshirt_m.Text;
        lbl_tshirt_xlquant.Text = tshirt_xl.Text;
    }

    protected void btn_shirt_add_Click(object sender, EventArgs e)
    {
        shirt_upload.SaveAs(Server.MapPath("~\\Images\\shirts\\") + Path.GetFileName(shirt_upload.FileName));

        string str = Path.GetFileName(shirt_upload.PostedFile.FileName);
        string pathname = "~\\Images\\shirts\\" + str;
        
        SqlCommand shirtadd = new SqlCommand("insert into Shirts values ('"+pathname+"','"+shirt_title.Text+"','"+shirt_disc.Text+"','"+shirt_price.Text+"','"+shirt_pid.Text+"') ",con);
        con.Open();
        shirtadd.ExecuteNonQuery();
        con.Close();

        SqlCommand shirtstock = new SqlCommand("insert into Stock values ('"+shirt_pid.Text+"','"+Shirt_s.Text+"','"+shirt_m.Text+"','"+shirt_l.Text+"','"+shirt_xl.Text+"')",con);
        con.Open();
        shirtstock.ExecuteNonQuery();
        con.Close();
        lbl_shirt_addedsuccess.Text = "Added Succesfully";
    }

    protected void btn_tshirt_add_Click(object sender, EventArgs e)
    {
        tshirt_upload.SaveAs(Server.MapPath("~\\Images\\T-Shirts\\") + Path.GetFileName(tshirt_upload.FileName));

        string str = Path.GetFileName(tshirt_upload.PostedFile.FileName);
        string pathname = "~\\Images\\t-Shirts\\" + str;

        SqlCommand shirtadd = new SqlCommand("insert into t_shirts values ('" + pathname + "','" + tshirt_title.Text + "','" + tshirt_disc.Text + "','" + tshirt_price.Text + "','" + tshirt_pid.Text + "') ", con);
        con.Open();
        shirtadd.ExecuteNonQuery();
        con.Close();

        SqlCommand shirtstock = new SqlCommand("insert into Stock values ('" + tshirt_pid.Text + "','" + tshirt_s.Text + "','" + tshirt_m.Text + "','" + tshirt_l.Text + "','" + tshirt_xl.Text + "')", con);
        con.Open();
        shirtstock.ExecuteNonQuery();
        con.Close();
        lbl_tshirt_addedsucess.Text = "Added Succesfully";
    }

    protected void btn_orders_Click(object sender, EventArgs e)
    {
        Response.Redirect("orders.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("customers.aspx");
    }
    protected void logout(object sender, EventArgs e)
    {
        Session["user"] = null;
        Session["name"] = null;
        Response.Redirect("Shop.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Stock.aspx");
    }
}