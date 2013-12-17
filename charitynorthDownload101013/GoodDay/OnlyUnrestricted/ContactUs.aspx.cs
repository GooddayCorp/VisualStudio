using System;
using System.Collections;
//using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
//using System.Data.Linq;
//using System.Data.Linq.Mapping;
using System.Net;
using System.Net.Mail;
//using Contact;

public partial class ContactUs : System.Web.UI.Page
{
  //private static DataContext db;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void submitButton_Click(object sender, EventArgs e)
    {
      string Interests = "";
      ArrayList lst = new ArrayList();
      foreach (ListItem li in cblInterest.Items)
        if (li.Selected)
          lst.Add(li.Value);
      if (lst.Count > 0)
        Interests = string.Join(", ", (string[])lst.ToArray(typeof(string)));
      AddRecordToNewContacts(txtCompany.Text, txtFirstName.Text, txtLastName.Text.Trim(), txtAddress.Text, txtCity.Text, ddlState.SelectedValue, txtZip.Text, txtPhone.Text, txtEmail.Text, txtWebAddress.Text, txtBestTime.Text, ddlTimeZone.SelectedValue, Interests, txtComments.Text.Trim(), DateTime.Now);
    }
    private void AddRecordToNewContacts(string company, string firstname, string lastname, string address, string city, string state, string zip, string phone, string email, string web, string besttime, string timezone, string interests, string comments, DateTime contactdate)
    {
      using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["custom_dbConnectionString"].ConnectionString))
      {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "INSERT INTO NewContacts(Company,FirstName,LastName,Address,City,State,Zip,Phone,Email,Web,BestTime,TimeZone,Interests,Comments,ContactDate) VALUES (@Company,@FirstName,@LastName,@Address,@City,@State,@Zip,@Phone,@Email,@Web,@BestTime,@TimeZone,@Interests,@Comments,@ContactDate)";
        cmd.Connection = con;
        cmd.Parameters.AddWithValue("@Company", company);
        cmd.Parameters.AddWithValue("@FirstName", firstname);
        cmd.Parameters.AddWithValue("@LastName", lastname);
        cmd.Parameters.AddWithValue("@Address", address);
        cmd.Parameters.AddWithValue("@City", city);
        cmd.Parameters.AddWithValue("@State", state);
        cmd.Parameters.AddWithValue("@Zip", zip);
        cmd.Parameters.AddWithValue("@Phone", phone);
        cmd.Parameters.AddWithValue("@Email", email);
        cmd.Parameters.AddWithValue("@Web", web);
        cmd.Parameters.AddWithValue("@BestTime", besttime);
        cmd.Parameters.AddWithValue("@TimeZone", timezone);
        cmd.Parameters.AddWithValue("@Interests", interests);
        cmd.Parameters.AddWithValue("@Comments", comments);
        cmd.Parameters.AddWithValue("@ContactDate", contactdate);
        con.Open();
        cmd.ExecuteNonQuery();
        string subject = "A contact form submission.";
        string msg = "<table><tr><td>Company</td><td>" + company + "</td></tr>";
        msg += "<tr><td>First Name:</td><td>" + firstname + "</td></tr>";
        msg += "<tr><td>Last Name:</td><td>" + lastname + "</td></tr>";
        msg += "<tr><td>Address:</td><td>" + address + "</td></tr>";
        msg += "<tr><td>City:</td><td>" + city + "</td></tr>";
        msg += "<tr><td>State:</td><td>" + state + "</td></tr>";
        msg += "<tr><td>Zip:</td><td>" + zip + "</td></tr>";
        msg += "<tr><td>Phone:</td><td>" + phone + "</td></tr>";
        msg += "<tr><td>Email:</td><td>" + email + "</td></tr>";
        msg += "<tr><td>Web Address:</td><td>" + web + "</td></tr>";
        msg += "<tr><td>Best Time to Call:</td><td>" + besttime + "</td></tr>";
        msg += "<tr><td>Time Zone:</td><td>" + timezone + "</td></tr>";
        msg += "<tr><td>Interests:</td><td>" + interests + "</td></tr>";
        msg += "<tr><td>Comments:</td><td>" + comments + "</td></tr></table>";

        //Utilities.Mail.SendMessage("info@customdesigndb.com", "", "", "info@customdesigndb.com", subject, msg);
        //SoftSysMail(subject, msg);
        formrow1.Visible = true;
        formrow2.Visible = true;
        thanksmsg.Visible = true;
      }
    }    
    public void godaddyMail(string subject, string msg)
    {
      //http://stackoverflow.com/questions/2032860/send-smtp-email-through-godaddy
      System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
      mail.To.Add("m_lanham@hotmail.com");
      mail.From = new MailAddress("mike@gooddaycorp.com");
      //mail.To.Add((string)Session["Email"]);
      //mail.From = new MailAddress("info@customdesigndb.com");
      mail.Subject = subject;
      mail.Body = msg;
      mail.IsBodyHtml = true;

      //Attachment attachment = new Attachment(fileName);
      //mail.Attachments.Add(attachment);    //add the attachment            

      SmtpClient client = new SmtpClient();
      //client.Credentials = new System.Net.NetworkCredential("customdb", "Holy1112!");
      //client.Credentials = CredentialCache.DefaultNetworkCredentials;
      client.Host = "relay-hosting.secureserver.net";
      try
      {
        client.Send(mail);
      }
      catch (Exception ex)
      {
        //the exception
      }
    }
    public void SoftSysMail(string subject, string msg)
    {
      SmtpClient smtpClient = new SmtpClient();
      MailMessage message = new MailMessage();

      MailAddress fromAddress = new MailAddress("admin@gooddaycorp.com", "Mike Lanham");

      // You can specify the host name or ipaddress of your server
      smtpClient.Host = "mail.gooddaycorp.com"; //you can also specify mail server IP address here

      //Default port will be 25
      smtpClient.Port = 25;

      NetworkCredential info = new NetworkCredential("admin@gooddaycorp.com", "WQ2121qq$$");
      smtpClient.UseDefaultCredentials = false;
      smtpClient.Credentials = info;

      //From address will be given as a MailAddress Object
      message.From = fromAddress;

      // To address collection of MailAddress
      message.To.Add("m_lanham@hotmail.com");
      message.Subject = subject;

      // CC and BCC optional
      // MailAddressCollection class is used to send the email to various users
      // You can specify Address as new MailAddress("admin1@yoursite.com")
      message.Bcc.Add("mike@gooddaycorp.com");

      //Body can be Html or text format
      //Specify true if it is html message
      message.IsBodyHtml = true;

      // Message body content
      string ss_body = msg;
      message.Body = ss_body;

      // Send SMTP mail
      smtpClient.Send(message);
    }
}
