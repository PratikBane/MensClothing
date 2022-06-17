using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;

public partial class forgetpass : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProductsConnectionString"].ConnectionString);
    string activationcode = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        div2.Visible = false; 
    }

    protected void Button1_Click(object sender, EventArgs e)

    {
        SqlCommand email = new SqlCommand("select * from Cust_detail where Email='" + TextBox1.Text + "'", con);
        con.Open();
        SqlDataReader re = email.ExecuteReader();
        if (re.Read())
        {
            Random random = new Random();
            activationcode = random.Next(1001, 9999).ToString();

            SqlCommand stock = new SqlCommand("insert into verifyotp (Email,otp) values ('" + TextBox1.Text + "','" + activationcode + "')", con);

            stock.ExecuteNonQuery();
            con.Close();

            sendcode();
            Session["mail"] = TextBox1.Text;
            Response.Redirect("Fp.aspx");

        }
        else
        {
            div2.Visible = true;
        }
    }
    void sendcode()
    {
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("collegesocialnetwork@gmail.com", "9820519699P");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
        msg.Subject ="OTP";
        msg.Body = activationcode+" is the One Time Password (OTP) to reset your password, expires in 5 minutes.";
        string toaddress = TextBox1.Text;
        msg.To.Add(toaddress);
        string fromaddress = "Sjfashion@gmail.com";
        msg.From = new MailAddress(fromaddress);
        try
        {
            smtp.Send(msg);

        }
        catch (Exception ex)
        {
            Label1.Text = ex.ToString() + "Try again later";
            Label1.ForeColor = System.Drawing.Color.Red;
        }
        
    }
  
  
}