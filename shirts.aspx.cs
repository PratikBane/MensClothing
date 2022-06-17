using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

public partial class shirts : System.Web.UI.Page
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
            lbl_user.Text = "Hii! " + Session["name"].ToString();
            con.Open();
            SqlCommand cartcount = new SqlCommand("select count (*) from Cart_Product where Email='" + Session["user"].ToString() + "'", con);
            Int32 count = Convert.ToInt32(cartcount.ExecuteScalar());
            con.Close();
            lbl_cart.Text = count.ToString();

            lbl_user.Text = Session["name"].ToString();
            li_log.Visible = false;
            li_sign.Visible = false;
            li_logout.Visible = true;


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
        if (e.CommandName == "s")
        {
            SqlCommand check = new SqlCommand("select * from Cart_Product where productid='" + e.CommandArgument.ToString() + "' and Email='" + Session["user"].ToString() + "' and Size='S' ", con);
            con.Open();
            SqlDataReader rc = check.ExecuteReader();
            if (rc.Read())
            {
                Label la = (Label)(e.Item.FindControl("lbl_sizequant"));
                la.Text = "Alredy In Cart View Cart";
                la.ForeColor = System.Drawing.Color.Green;

                Button btn_s = (Button)(e.Item.FindControl("btn_s"));
                btn_s.Enabled = false;
                btn_s.BorderStyle = BorderStyle.Dashed;

                Button btn_add = (Button)(e.Item.FindControl("btn_add"));
                btn_add.Visible = false;

                Button btn_remove = (Button)(e.Item.FindControl("btn_remove"));
                btn_remove.Visible = true;

                Label las = (Label)(e.Item.FindControl("lbl_size"));
                las.Text = "S";

            }
            else
            {
                SqlCommand small = new SqlCommand("select * from Stock where productid='" + e.CommandArgument.ToString() + "'", con);
            SqlDataReader reader = small.ExecuteReader();
                if (reader.Read())
                {
                    Int32 q = Convert.ToInt32(reader["s"]);
                    if (q == 0)
                    {
                        Button btn_remove = (Button)(e.Item.FindControl("btn_remove"));
                        btn_remove.Visible = false;

                        Label la = (Label)(e.Item.FindControl("lbl_sizequant"));
                        la.Text = " Out Of Stock";
                        la.ForeColor = System.Drawing.Color.Red;

                        Button btn_s = (Button)(e.Item.FindControl("btn_s"));
                        btn_s.Enabled = false;
                        btn_s.BorderStyle = BorderStyle.Dashed;

                        Button btn_add = (Button)(e.Item.FindControl("btn_add"));
                        btn_add.Enabled = false;

                    }
                    else
                    {
                        Int32 qu = Convert.ToInt32(reader["s"]);
                        Button btn_remove = (Button)(e.Item.FindControl("btn_remove"));
                        btn_remove.Visible = false;

                        Button btn_add = (Button)(e.Item.FindControl("btn_add"));
                        btn_add.Visible = true;
                        btn_add.Enabled = true;

                        Label la = (Label)(e.Item.FindControl("lbl_sizequant"));
                        la.ForeColor = System.Drawing.Color.Black;
                        la.Text ="S "+ qu.ToString() + " Left In Stock";

                        Label las = (Label)(e.Item.FindControl("lbl_size"));
                        las.Text = "S";

                    }
                }
                con.Close();
            }
        }

        if (e.CommandName == "m")
        {
            SqlCommand check = new SqlCommand("select * from Cart_Product where productid='" + e.CommandArgument.ToString() + "' and Email='" + Session["user"].ToString() + "' and Size='M' ", con);
            con.Open();
            SqlDataReader rc = check.ExecuteReader();
            if (rc.Read())
            {
                Label la = (Label)(e.Item.FindControl("lbl_sizequant"));
                la.Text = "Alredy In Cart View Cart";
                la.ForeColor = System.Drawing.Color.Green;

                Button btn_m = (Button)(e.Item.FindControl("btn_m"));
                btn_m.Enabled = false;
                btn_m.BorderStyle = BorderStyle.Dashed;

                Button btn_add = (Button)(e.Item.FindControl("btn_add"));
                btn_add.Visible = false;

                Button btn_remove = (Button)(e.Item.FindControl("btn_remove"));
                btn_remove.Visible = true;

                Label las = (Label)(e.Item.FindControl("lbl_size"));
                las.Text = "M";

            }
            else
            {
                string pid = e.CommandArgument.ToString();
            SqlCommand small = new SqlCommand("select * from Stock where productid='" + e.CommandArgument.ToString() + "'", con);
            SqlDataReader reader = small.ExecuteReader();
                if (reader.Read())
                {
                    Int32 q = Convert.ToInt32(reader["m"]);
                    if (q == 0)
                    {
                        Button btn_remove = (Button)(e.Item.FindControl("btn_remove"));
                        btn_remove.Visible = false;

                        Label la = (Label)(e.Item.FindControl("lbl_sizequant"));
                        la.Text = " Out Of Stock";
                        la.ForeColor = System.Drawing.Color.Red;

                        Button btn_m = (Button)(e.Item.FindControl("btn_m"));
                        btn_m.Enabled = false;
                        btn_m.BorderStyle = BorderStyle.Dashed;

                        Button btn_add = (Button)(e.Item.FindControl("btn_add"));
                        btn_add.Enabled = false;

                    }

                    else
                    {
                        Int32 qu = Convert.ToInt32(reader["m"]);
                        Button btn_remove = (Button)(e.Item.FindControl("btn_remove"));
                        btn_remove.Visible = false;

                        Button btn_add = (Button)(e.Item.FindControl("btn_add"));
                        btn_add.Visible = true;
                        btn_add.Enabled = true;

                        Label la = (Label)(e.Item.FindControl("lbl_sizequant"));
                        la.ForeColor = System.Drawing.Color.Black;
                        la.Text ="M "+ qu.ToString() + " Left In Stock";

                        Label las = (Label)(e.Item.FindControl("lbl_size"));
                        las.Text = "M";

                    }
                }
                con.Close();
            }
        }

        if (e.CommandName == "l")
        {
            SqlCommand check = new SqlCommand("select * from Cart_Product where productid='" + e.CommandArgument.ToString() + "' and Email='" + Session["user"].ToString() + "' and Size='L' ", con);
            con.Open();
            SqlDataReader rc = check.ExecuteReader();
            if (rc.Read())
            {
                Label la = (Label)(e.Item.FindControl("lbl_sizequant"));
                la.Text = "Alredy In Cart View Cart";
                la.ForeColor = System.Drawing.Color.Green;

                Button btn_l = (Button)(e.Item.FindControl("btn_l"));
                btn_l.Enabled = false;
                btn_l.BorderStyle = BorderStyle.Dashed;

                Button btn_add = (Button)(e.Item.FindControl("btn_add"));
                btn_add.Visible = false;

                Button btn_remove = (Button)(e.Item.FindControl("btn_remove"));
                btn_remove.Visible = true;

                Label las = (Label)(e.Item.FindControl("lbl_size"));
                las.Text = "L";

            }
            else
            {
                SqlCommand small = new SqlCommand("select * from Stock where productid='" + e.CommandArgument.ToString() + "'", con);
            SqlDataReader reader = small.ExecuteReader();
                if (reader.Read())
                {
                    Int32 q = Convert.ToInt32(reader["l"]);
                    if (q == 0)
                    {
                        Button btn_remove = (Button)(e.Item.FindControl("btn_remove"));
                        btn_remove.Visible = false;

                        Label la = (Label)(e.Item.FindControl("lbl_sizequant"));
                        la.Text = " Out Of Stock";
                        la.ForeColor = System.Drawing.Color.Red;

                        Button btn_l = (Button)(e.Item.FindControl("btn_l"));
                        btn_l.Enabled = false;
                        btn_l.BorderStyle = BorderStyle.Dashed;

                        Button btn_add = (Button)(e.Item.FindControl("btn_add"));
                        btn_add.Enabled = false;

                    }
                    else
                    {
                        Int32 qu = Convert.ToInt32(reader["l"]);
                        Button btn_remove = (Button)(e.Item.FindControl("btn_remove"));
                        btn_remove.Visible = false;

                        Button btn_add = (Button)(e.Item.FindControl("btn_add"));
                        btn_add.Visible = true;
                        btn_add.Enabled = true;

                        Label la = (Label)(e.Item.FindControl("lbl_sizequant"));
                        la.ForeColor = System.Drawing.Color.Black;
                        la.Text ="L"+ qu.ToString() + " Left In Stock";

                        Label las = (Label)(e.Item.FindControl("lbl_size"));
                        las.Text = "L";

                    }
                }
                con.Close();
            }
        }

        if (e.CommandName == "xl")
        {
            SqlCommand check = new SqlCommand("select * from Cart_Product where productid='" + e.CommandArgument.ToString() + "' and Email='"+Session["user"].ToString()+"' and Size='XL' ", con);
            con.Open();
            SqlDataReader rc = check.ExecuteReader();
            if (rc.Read())
            {
                Label la = (Label)(e.Item.FindControl("lbl_sizequant"));
                la.Text = "Alredy In Cart View Cart";
                la.ForeColor = System.Drawing.Color.Green;

                Button btn_xl = (Button)(e.Item.FindControl("btn_xl"));
                btn_xl.Enabled = false;
                btn_xl.BorderStyle = BorderStyle.Dashed;

                Button btn_add = (Button)(e.Item.FindControl("btn_add"));
                btn_add.Visible = false;

                Button btn_remove = (Button)(e.Item.FindControl("btn_remove"));
                btn_remove.Visible=true;

                Label las = (Label)(e.Item.FindControl("lbl_size"));
                las.Text = "XL";

            }
            else
            { 
            SqlCommand small = new SqlCommand("select * from Stock where productid='" + e.CommandArgument.ToString() + "' ", con);
            
            SqlDataReader reader = small.ExecuteReader();
                if (reader.Read())
                {
                    Int32 q = Convert.ToInt32(reader["xl"]);
                    if (q == 0)
                    {
                        Button btn_remove = (Button)(e.Item.FindControl("btn_remove"));
                        btn_remove.Visible = false;

                        Label la = (Label)(e.Item.FindControl("lbl_sizequant"));
                        la.Text = " Out Of Stock";
                        la.ForeColor = System.Drawing.Color.Red;

                        Button btn_xl = (Button)(e.Item.FindControl("btn_xl"));
                        btn_xl.Enabled = false;
                        btn_xl.BorderStyle = BorderStyle.Dashed;

                        Button btn_add = (Button)(e.Item.FindControl("btn_add"));
                        btn_add.Enabled = true;

                    }
                    else
                    {
                        Int32 qu = Convert.ToInt32(reader["xl"]);
                        Button btn_remove = (Button)(e.Item.FindControl("btn_remove"));
                        btn_remove.Visible = false;

                        Button btn_add = (Button)(e.Item.FindControl("btn_add"));
                        btn_add.Visible = true;
                        btn_add.Enabled = true;

                        Label la = (Label)(e.Item.FindControl("lbl_sizequant"));
                        la.ForeColor = System.Drawing.Color.Black;
                        la.Text ="XL "+ qu.ToString() + " Left In Stock";

                        Label las = (Label)(e.Item.FindControl("lbl_size"));
                        las.Text = "XL";

                    }
                }
                con.Close();
            }
        }

        if (e.CommandName == "addtocart")
        {
            if (Session["user"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                Label la = (Label)(e.Item.FindControl("lbl_sizequant"));
                Label las = (Label)(e.Item.FindControl("lbl_size"));
                if (las.Text == string.Empty)
                {
                    la.ForeColor = System.Drawing.Color.Red;
                    la.Text = "Select Size";
                    Button btn_remove = (Button)(e.Item.FindControl("btn_remove"));
                    btn_remove.Visible = false;

                }
                else
                {
                    /*fetching the data*/
                    string pid = e.CommandArgument.ToString();
                    SqlCommand sda = new SqlCommand("select * from Shirts where productid = '" + pid + "'", con);
                    con.Open();
                    SqlDataReader r = sda.ExecuteReader();

                    if (r.Read())
                    {
                        string img = r["img"].ToString();
                        string title = r["title"].ToString();
                        string price = r["price"].ToString();
                        string productid = r["productid"].ToString();


                        /*storing data into cart*/

                        SqlCommand addtocart = new SqlCommand("insert into Cart_Product values ('" + title + "','" + img + "','" + price + "','1','" + price + "','" + Session["user"].ToString() + "','" + productid + "','" + las.Text + "')", con);
                        addtocart.ExecuteNonQuery();
                    }
                    con.Close();
                    int cartvalue = Convert.ToInt32(lbl_cart.Text);
                    cartvalue = cartvalue + 1;
                    lbl_cart.Text = cartvalue.ToString();

                    Button btn_add = (Button)(e.Item.FindControl("btn_add"));
                    btn_add.Visible = false;

                    Button btn_remove = (Button)(e.Item.FindControl("btn_remove"));
                    btn_remove.Visible = true;

                }
            }

        }
        if (e.CommandName == "removefromcart")
        {
            Label las = (Label)(e.Item.FindControl("lbl_size"));
            string s = las.Text;
            string pid = e.CommandArgument.ToString();

            SqlCommand deletecmd = new SqlCommand("delete from Cart_Product where Email='" + Session["user"].ToString() + "' and productid='" + pid + "' and Size='" + s + "' ", con);
            con.Open();
            deletecmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("shirts.aspx");
        }
    }
}