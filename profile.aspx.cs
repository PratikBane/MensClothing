using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

public partial class profile : System.Web.UI.Page
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
            lbl_user.Text = "Hii! " + Session["name"].ToString();
            li_log.Visible = false;
            li_sign.Visible = false;
            li_logout.Visible = true;
            MultiView1.ActiveViewIndex = 0;
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
        if(e.CommandName=="editaddress")
        {
            MultiView1.ActiveViewIndex = 1;
        }
        if (e.CommandName == "editcontact")
        {
            MultiView1.ActiveViewIndex = 2;
        }
        if (e.CommandName == "editname")
        {
            MultiView1.ActiveViewIndex = 3;
        }
    }

    protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "saveaddres")
        {
            TextBox address = (TextBox)e.Item.FindControl("txt_address");
            SqlCommand saveaddress = new SqlCommand("update Cust_detail set Name='" + address.ToString() + "'  ", con);
            con.Open();
            saveaddress.ExecuteNonQuery();
            con.Close();
            Response.Redirect("profile.aspx");

        }
        if (e.CommandName == "editcontact")
        {
            MultiView1.ActiveViewIndex = 2;
        }
        if (e.CommandName == "editname")
        {
            MultiView1.ActiveViewIndex = 3;
        }
    }

    protected void Repeater3_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

        if (e.CommandName == "savecontact")
        {
            TextBox contact = (TextBox)e.Item.FindControl("txt_contact");
            SqlCommand saveaddress = new SqlCommand("update Cust_detail set Name='" + contact.ToString() + "'  ", con);
            con.Open();
            saveaddress.ExecuteNonQuery();
            con.Close();
            Response.Redirect("profile.aspx");

        }
        if (e.CommandName == "editaddress")
        {
            MultiView1.ActiveViewIndex = 1;
        }
        if (e.CommandName == "editname")
        {
            MultiView1.ActiveViewIndex = 3;
        }
    }

    protected void Repeater4_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "savename")
        {
            TextBox name = (TextBox)e.Item.FindControl("txt_name");
            SqlCommand saveaddress = new SqlCommand("update Cust_detail set Name='"+name.ToString()+"'  ", con);
            con.Open();
            saveaddress.ExecuteNonQuery();
            con.Close();
            Response.Redirect("profile.aspx");

        }
        if (e.CommandName == "editaddress")
        {
            MultiView1.ActiveViewIndex = 1;
        }
        if (e.CommandName == "editcontact")
        {
            MultiView1.ActiveViewIndex = 2;
        }

    }
}