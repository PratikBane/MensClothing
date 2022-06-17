using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Text;
using System.Security.Cryptography;
using System.Configuration;

public partial class Cart : System.Web.UI.Page
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
            if (!IsPostBack)
            {
                Random tx = new Random();
                txnid.Value = (Convert.ToString(tx.Next(10000, 20000)));
                txnid.Value = "SJ" + txnid.Value.ToString();
            }
            methodalert.Visible = false;
            MultiView1.ActiveViewIndex = 0;
            HyperLink1.Visible = false;
            lbl_user.Text = "Hii ! "+ Session["name"].ToString();

            SqlCommand total = new SqlCommand("select sum(Ptotal) from Cart_Product where Email='" + Session["user"].ToString() + "'", con);
            con.Open();
            SqlDataReader r;
            r = total.ExecuteReader();
            r.Read();
            try
            {

                int d = r.GetInt32(0);
                int t = d + 30;
                lbl_total.Text = "GRAND TOTAL : " + d.ToString() +".00";
                lbl_ct.Text = d.ToString();
                lbl_pct.Text = d.ToString();

                con.Close();
                lbl_t.Text = t.ToString()+".00";
                lbl_pt.Text = t.ToString() +".00";
                lbl_cost.Text = t.ToString();

                lbl_noitem.Visible = false;
                div_noitem.Visible = false;
                btn_continue.Visible = false;
                btn_checkout.Visible = true;
            }
            catch
            {
                div_noitem.Visible = true;
                lbl_noitem.Visible = true;
                lbl_noitem.Text = "No items in cart";
                btn_checkout.Visible = false;
                btn_continue.Visible = true;
            }
            con.Close();
            
            SqlCommand cartcount = new SqlCommand("select count (*) from Cart_Product where Email='" + Session["user"].ToString() + "'", con);
            con.Open();
            Int32 count = Convert.ToInt32(cartcount.ExecuteScalar());
            con.Close();
            lbl_cart.Text = count.ToString();
            lbl_pbadge.Text = count.ToString();

            

        }

        SqlCommand detail = new SqlCommand("select * from Cust_detail where Email='"+Session["user"].ToString()+"'",con);
        con.Open();
        SqlDataReader re=detail.ExecuteReader();
        re.Read();
        string address = re["Address"].ToString();
        con.Close();
        lbl_address.Text = address;

        lbl_email.Text = Session["user"].ToString();
        lbl_Add.Text = address;

    }

    protected void delete_cartitem(object sender, EventArgs e)
    {
        int pid = int.Parse(((sender as LinkButton).NamingContainer.FindControl("lbl_pid") as Label).Text);
        SqlCommand deletecartitem = new SqlCommand("delete from Cust_Product where Email='" + Session["user"].ToString() + "' and productid=@pid ", con);
        deletecartitem.Parameters.AddWithValue("@pid", pid);
        con.Open();
        deletecartitem.ExecuteNonQuery();
        con.Close();
        Response.Redirect("Cart.aspx");

        
        
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            Label size = (Label)e.Item.FindControl("lbl_size");
            string s = size.Text;
            string pid = Convert.ToString(e.CommandArgument);
            SqlCommand deletecmd = new SqlCommand("delete from Cart_Product where Email='" + Session["user"].ToString() + "' and productid='" + pid + "' and Size='"+s+"' ", con);
            con.Open();
            deletecmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("Cart.aspx");
            
        }
        if (e.CommandName == "increment")
        {
            string pid = Convert.ToString(e.CommandArgument);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select * from Cart_Product where Email='" + Session["user"].ToString() + "' and  productid='" + pid + "'", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            string size = ds.Tables[0].Rows[0]["Size"].ToString();

            switch (size)
            {
                case "S":

                    SqlCommand stocks = new SqlCommand("select s from Stock where productid='" + pid + "'", con);
                    SqlDataReader rs;
                    rs = stocks.ExecuteReader();
                    if (rs.Read())
                    {
                        string d = rs[0].ToString();
                        int ss = Convert.ToInt32(d);

                        Label quant = (Label)(e.Item.FindControl("lbl_quant"));

                        Label lbl_size = (Label)(e.Item.FindControl("lbl_size"));
                        string s = lbl_size.Text;

                        string pprice = ds.Tables[0].Rows[0]["Pprice"].ToString();
                        int price = Convert.ToInt32(pprice);

                        Label lbl_total = (Label)(e.Item.FindControl("lbl_total"));
                        int to = Convert.ToInt32(lbl_total.Text);

                        TextBox box = (TextBox)(e.Item.FindControl("txt_quant"));
                        int inc = Convert.ToInt32(box.Text);

                        if (inc < ss)
                        {
                            inc = inc + 1;
                            box.Text = inc.ToString();
                            to = to + price;
                            lbl_total.Text = to.ToString();
                            SqlCommand incre = new SqlCommand("update Cart_Product set Pquant='" + inc + "',Ptotal='" + to + "' where Email='" + Session["user"].ToString() + "' and productid='" + pid + "' and Size='" + s.ToString() + "' ", con);

                            incre.ExecuteNonQuery();

                            box.Text = inc.ToString();

                            Response.Redirect("Cart.aspx");

                        }
                        else
                        {
                            LinkButton lbinc = (LinkButton)e.Item.FindControl("lb_inc");
                            lbinc.Enabled = false;
                            lbinc.ForeColor = System.Drawing.Color.LightGray;
                        }
                    }
                    break;

                case "M":

                    SqlCommand stockm = new SqlCommand("select m from Stock where productid='" + pid + "'", con);
                    SqlDataReader rm;
                    rm = stockm.ExecuteReader();
                    if (rm.Read())
                    {
                        string d = rm[0].ToString();
                        int sm = Convert.ToInt32(d);

                        Label lbl_size = (Label)(e.Item.FindControl("lbl_size"));
                        string s = lbl_size.Text;

                        string pprice = ds.Tables[0].Rows[0]["Pprice"].ToString();
                        int price = Convert.ToInt32(pprice);

                        Label lbl_total = (Label)(e.Item.FindControl("lbl_total"));
                        int to = Convert.ToInt32(lbl_total.Text);

                        TextBox box = (TextBox)(e.Item.FindControl("txt_quant"));
                        int inc = Convert.ToInt32(box.Text);

                        if (inc < sm)
                        {
                            inc = inc + 1;
                            box.Text = inc.ToString();
                            to = to + price;
                            lbl_total.Text = to.ToString();
                            SqlCommand incre = new SqlCommand("update Cart_Product set Pquant = '" + inc + "', Ptotal = '" + to + "' where Email = '" + Session["user"].ToString() + "' and productid = '" + pid + "' and Size = '" + s.ToString() + "' ", con);

                            incre.ExecuteNonQuery();

                            Response.Redirect("Cart.aspx");
                        }
                        else
                        {
                            LinkButton lbinc = (LinkButton)e.Item.FindControl("lb_inc");
                            lbinc.Enabled = false;
                            lbinc.ForeColor = System.Drawing.Color.LightGray;
                        }
                    }
                    break;

                case "L":

                    SqlCommand stockl = new SqlCommand("select l from Stock where productid='" + pid + "'", con);
                    SqlDataReader rl;
                    rl = stockl.ExecuteReader();
                    if (rl.Read())
                    {
                        string d = rl[0].ToString();
                        int sl = Convert.ToInt32(d);

                        Label lbl_size = (Label)(e.Item.FindControl("lbl_size"));
                        string s = lbl_size.Text;

                        string pprice = ds.Tables[0].Rows[0]["Pprice"].ToString();
                        int price = Convert.ToInt32(pprice);

                        Label lbl_total = (Label)(e.Item.FindControl("lbl_total"));
                        int to = Convert.ToInt32(lbl_total.Text);

                        TextBox box = (TextBox)(e.Item.FindControl("txt_quant"));
                        int inc = Convert.ToInt32(box.Text);

                        if (inc < sl)
                        {
                            inc = inc + 1;
                            box.Text = inc.ToString();
                            to = to + price;
                            lbl_total.Text = to.ToString();
                            SqlCommand incre = new SqlCommand("update Cart_Product set Pquant = '" + inc + "', Ptotal = '" + to + "' where Email = '" + Session["user"].ToString() + "' and productid = '" + pid + "' and Size = '" + s.ToString() + "' ", con);

                            incre.ExecuteNonQuery();

                            Response.Redirect("Cart.aspx");
                        }
                        else
                        {
                            LinkButton lbinc = (LinkButton)e.Item.FindControl("lb_inc");
                            lbinc.Enabled = false;
                            lbinc.ForeColor = System.Drawing.Color.LightGray;
                        }
                    }
                    break;

                case "XL":

                    SqlCommand stockxl = new SqlCommand("select xl from Stock where productid='" + pid + "'", con);
                    SqlDataReader rxl;
                    rxl = stockxl.ExecuteReader();
                    if (rxl.Read())
                    {
                        string d = rxl[0].ToString();
                        int sxl = Convert.ToInt32(d);

                        Label lbl_size = (Label)(e.Item.FindControl("lbl_size"));
                        string s = lbl_size.Text;

                        string pprice = ds.Tables[0].Rows[0]["Pprice"].ToString();
                        int price = Convert.ToInt32(pprice);

                        Label lbl_total = (Label)(e.Item.FindControl("lbl_total"));
                        int to = Convert.ToInt32(lbl_total.Text);

                        TextBox box = (TextBox)(e.Item.FindControl("txt_quant"));
                        int inc = Convert.ToInt32(box.Text);

                        if (inc < sxl)
                        {
                            inc = inc + 1;
                            box.Text = inc.ToString();
                            to = to + price;
                            lbl_total.Text = to.ToString();
                            SqlCommand incre = new SqlCommand("update Cart_Product set Pquant = '" + inc + "', Ptotal = '" + to + "' where Email = '" + Session["user"].ToString() + "' and productid = '" + pid + "' and Size = '" + s.ToString() + "' ", con);

                            incre.ExecuteNonQuery();

                            Response.Redirect("Cart.aspx");
                        }
                        else
                        {
                            LinkButton lbinc = (LinkButton)e.Item.FindControl("lb_inc");
                            lbinc.Enabled = false;
                            lbinc.ForeColor = System.Drawing.Color.LightGray;
                        }
                    }
                    break;
            }

 }

        if(e.CommandName=="decrement")
        {
            string pid = Convert.ToString(e.CommandArgument);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("select * from Cart_Product where Email='" + Session["user"].ToString() + "' and  productid='" + pid + "'", con);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            string si= ds.Tables[0].Rows[0].ToString();

            string pprice = ds.Tables[0].Rows[0]["Pprice"].ToString();
            int price = Convert.ToInt32(pprice);

            Label lbl_total = (Label)(e.Item.FindControl("lbl_total"));
            int to = Convert.ToInt32(lbl_total.Text);

            TextBox box = (TextBox)(e.Item.FindControl("txt_quant"));
            int dec = Convert.ToInt32(box.Text);

            if (dec >= 2)
            {
                dec = dec - 1;
                box.Text = dec.ToString();
                to = to - price;
                lbl_total.Text = to.ToString();
                SqlCommand incre = new SqlCommand("update Cart_Product set Pquant='" + dec + "',Ptotal='" + to + "' where Email='" + Session["user"].ToString() + "' and productid='" + pid + "' ", con);

                incre.ExecuteNonQuery();

                Response.Redirect("Cart.aspx");

            }
            else
            {
                LinkButton lbdec = (LinkButton)e.Item.FindControl("lb_dec");
                lbdec.Enabled = false;
                lbdec.ForeColor = System.Drawing.Color.LightGray;
            }




        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }

    protected void btn_continue_Click(object sender, EventArgs e)
    {
        Response.Redirect("Shop.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (lbl_paymethod.Text == string.Empty)
        {
            MultiView1.ActiveViewIndex = 1;
            methodalert.Visible = true;
        }


        if (radio_cod.Checked)
        {
            lbl_paymethod.Text = "Cash On Delivery";
            MultiView1.ActiveViewIndex = 2;
            orderid(10);
        }
       if (radio_credit.Checked)
        { 
            lbl_paymethod.Text = "Credit Card";
            MultiView1.ActiveViewIndex = 2;
            orderid(10);
        }
        if (radio_debit.Checked)
        {
            lbl_paymethod.Text = "Debit Card";
            MultiView1.ActiveViewIndex = 2;
            orderid(10);
        }

        
        
    }
    public void orderid(int l )
    {
        StringBuilder val = new StringBuilder();
        Random id = new Random();
        int chartype = 1;
        for(int i=0;i<l;i++)
        {
            chartype = id.Next(1,3);
            switch(chartype)
            {
                case 1:
                    val.Append(id.Next(0, 9));
                    break;
                case 2:
                    val.Append((char)id.Next(65, 90));
                    break;
               
            }
            lbl_orderid.Text = val.ToString();
        }
    }


    protected void Button1_Click1(object sender, EventArgs e)
    {
        SqlDataSource4.SelectCommand = "SELECT * FROM orders WHERE Email='"+Session["user"].ToString()+"' and orderid='"+lbl_orderid.Text+"'";

        SqlDataAdapter sda = new SqlDataAdapter("select * from Cart_Product where Email = '"+Session["user"].ToString()+"'", con);
        DataTable ds = new DataTable();
        sda.Fill(ds);
        
        for(int i=0;i<ds.Rows.Count;i++)
        {
            string Pname = ds.Rows[i]["Pname"].ToString();
            string Pprice = ds.Rows[i]["Pprice"].ToString();
            string Pquant = ds.Rows[i]["Pquant"].ToString();
            string Ptotal = ds.Rows[i]["Ptotal"].ToString();
            string size = ds.Rows[i]["Size"].ToString();
            string pid = ds.Rows[i]["productid"].ToString();
            DateTime date = DateTime.Now ;
            int P = Convert.ToInt32(Ptotal);
            
            /*storing data into cart*/

            SqlCommand addtoorders = new SqlCommand("insert into orders values ('" + Session["user"].ToString() + "','" + Pprice + "','" + Pquant + "','"+Pname+"','" + P + "','" + size + "','" + lbl_paymethod.Text + "','" + lbl_cost.Text + "','"+date.ToString()+"','"+lbl_orderid.Text+"','"+txnid.Value+"','"+lbl_Add.Text+"','"+pid+"')", con);
            con.Open();
            addtoorders.ExecuteNonQuery();
            con.Close();

            SqlCommand addtopay = new SqlCommand("insert into payment values ('"+lbl_orderid.Text+"','"+date.ToString()+"','"+txnid.Value.ToString()+"','"+lbl_cost.Text+"','"+lbl_modeofpay.Text+"')",con);
            con.Open();
            addtopay.ExecuteNonQuery();
            con.Close();

            SqlCommand deleteiemfromcart = new SqlCommand("delete from Cart_Product where Email='"+Session["user"].ToString()+"'", con);
            con.Open();
            deleteiemfromcart.ExecuteNonQuery();
            con.Close();
        }

        SqlCommand invoice = new SqlCommand("select * from payment where orderid='"+lbl_orderid.Text+"'", con);
        con.Open();
        SqlDataReader invoi;
        invoi = invoice.ExecuteReader();
        if(invoi.Read())
        {
            lbl_invoice_date.Text = invoi["datetime"].ToString();
            lbl_invoice_modeofpayment.Text = invoi["Mop"].ToString();
            lbl_invoice_orderid.Text = invoi["orderid"].ToString();
            lbl_invoice_amount.Text = invoi["amount"].ToString();
            lbl_invoice_transitionid.Text = invoi["transitionid"].ToString();

            if(lbl_invoice_modeofpayment.Text=="COD")
            {
                lbl_i_a.Text = "Amount To Be Paid :";
            }
            else
            {
                lbl_i_a.Text = "Amount Paid :";
            }
        }
       
        MultiView1.ActiveViewIndex = 3;

        /*
        SqlCommand pdetail=new SqlCommand("select productid from Cart_Product where Email='"+Session["user"].ToString()+"'",con);
        con.Open();
        SqlDataReader re;
        re = pdetail.ExecuteReader();
        re.Read();
        string pname;
        pname = re[0].ToString();
        con.Close();
        
        string name = Session["name"].ToString();

        double amount =Convert.ToDouble(lbl_cost.Text);
        string text = key.Value.ToString() + "|" + txnid.Value.ToString() + "|" + amount + "|"+ pname +"|"+name+"|"+Session["user"].ToString()+"|"+"1"+"|"+"1"+"|"+"1"+"|"+"1"+"|"+"1"+"||||||"+salt.Value.ToString();

        byte[] message = Encoding.UTF8.GetBytes(text);
        UnicodeEncoding UE = new UnicodeEncoding();
        
        byte[] hashvalue;
        SHA512Managed hashString = new SHA512Managed();
        string hex = "";
        hashvalue = hashString.ComputeHash(message);
        foreach(byte x in hashvalue)
        {
            hex += String.Format("{0:x2}", x);
        }
        hash.Value = hex;

        System.Collections.Hashtable data = new System.Collections.Hashtable();
        data.Add("hash", hex.ToString());
        data.Add("txnid", txnid.Value);
        data.Add("key", key.Value);
        data.Add("amount", amount);
        data.Add("firstname", Session["name"].ToString());
        data.Add("email", Session["user"].ToString());
        data.Add("phone",Session["contact"].ToString() );
        data.Add("productinfo",pname );
        data.Add("udf1","1");
        data.Add("udf2", "1");
        data.Add("udf3", "1");
        data.Add("udf4", "1");
        data.Add("udf5", "1");

        data.Add("surl","paysuccess.aspx");
        data.Add("furl", "http://localhost:49677/payfailed.aspx");

        data.Add("service_provider", "");

        string strForm = PreparePOSTForm("https://test.payu.in/_payment", data);
        Page.Controls.Add(new LiteralControl(strForm));
        */

    }
    private string PreparePOSTForm(string url, System.Collections.Hashtable data)
    {
        string formID = "PostForm";
        StringBuilder strForm = new StringBuilder();
        strForm.Append("<form id=\"" + formID + "\" name=\""+formID+"\" action=\"" +url+ "\" method=\"POST\">");

        foreach(System.Collections.DictionaryEntry key in data)
        {
            strForm.Append("<input type=\"hidden\"name=\"" + key.Key + "\"value=\"" + key.Value + "\">");
        }
        strForm.Append("</form>");

        StringBuilder strScript = new StringBuilder();
        strScript.Append("<script language='javascript'>");
        strScript.Append("var v" +formID+ "=document."+formID+";");
        strScript.Append("v"+formID+".submit();");
        strScript.Append("</script>");

        return strForm.ToString() + strScript.ToString();
    }


}