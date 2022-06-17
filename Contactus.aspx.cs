using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
public partial class Contactus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            TextBox3.Text = Session["user"].ToString();
            lbl_user.Text = "Hii! " + Session["name"].ToString();
            li_sign.Visible = false;
            li_log.Visible = false;
        }
        else
        {
            li_sign.Visible = true;
            li_log.Visible = true;
            li_logout.Visible = false;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("collegesocialnetwork@gmail.com", "9820519699P");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
        msg.Subject = Session["user"].ToString() + " " + TextBox4.Text;
        msg.Body = TextBox1.Text;
        string toaddress = "collegesocialnetwork@gmail.com";
        msg.To.Add(toaddress);
        string fromaddress = Session["user"].ToString();
        msg.From = new MailAddress(fromaddress);
        try
        {
            smtp.Send(msg);
            TextBox1.Text = "";
            TextBox4.Text = "";
            Label1.Text = "Your response has been send";
        }
        catch(Exception ex)
        {
            Label1.Text = ex.ToString()+ "Try again later";
            Label1.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void logout(object sender, EventArgs e)
    {
        Session["user"] = null;
        Session["name"] = null;
        Response.Redirect("Shop.aspx");
    }
}