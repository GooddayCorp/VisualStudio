using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Diagnostics;
using System.Net;
using System.Net.Mail;
using System.Threading;
using System.IO;

public partial class Members2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {   
      ListBox2.Attributes.Add("onchange", "LinkClicked(this);return false;"); 
    }
    protected void ListBox2_SelectedIndexChanged(object sender, EventArgs e)
    {
      Label14.Text = ListBox2.SelectedItem.Text + " " + Label14.Text;
    }
    protected void uploadButton_Click(object sender, EventArgs e)
    {
      if (FileUpload1.HasFile)
      {
        try
        {
          string filename = Path.GetFileName(FileUpload1.FileName);
          FileUpload1.SaveAs(Server.MapPath("~/Uploads/") + filename);
          Label12.Text=filename;
          statusLabel.Text = "File uploaded!";
        }
        catch (Exception ex)
        {
          statusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
        }
      }
    }
    //protected void uploadButton_Click(object sender, EventArgs e)
    //{
    //Upload();
    //}
    //public void Upload()
    //{
    //  if (IsPostBack)
    //  {
    //    Boolean fileOK = false;
    //    string path= Path.Combine(Request.PhysicalApplicationPath, "Uploads/");
    //    if (FileUpload1.HasFile)
    //    {
    //      String fileExtension =
    //          System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
    //      String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg", ".pdf", ".txt", ".doc", ".docx" };
    //      for (int i = 0; i < allowedExtensions.Length; i++)
    //      {
    //        if (fileExtension == allowedExtensions[i])
    //        {
    //          fileOK = true;
    //        }
    //      }
    //    }

    //    if (fileOK)
    //    {
    //      try
    //      {
    //        FileUpload1.PostedFile.SaveAs(path
    //            + FileUpload1.FileName);
    //        Label12.Text = Label12.Text + " " + FileUpload1.FileName;
    //      }
    //      catch (Exception ex)
    //      {
    //        Label12.Text = "File could not be uploaded." + ex;
    //      }
    //    }
    //    else
    //    {
    //      Label12.Text = "Cannot accept files of this type.";
    //    }
    //  }
    //}

    protected void submitButton_Click(object sender, EventArgs e)
    {
      AddRecordToHelpDesk(txtName.Text, TextBox2.Text, ListBox1.SelectedValue,  "new", TextBox4.Text, Label12.Text, Label14.Text, TextBox7.Text, (int)Session["Id"], DateTime.Now);
    }
    private void AddRecordToHelpDesk(string firstname, string role, string topic, string status, string days, string uploadfile, string downloadfile, string description, int company, DateTime dateissue)
    {
      using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["custom_dbConnectionString"].ConnectionString))
      {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "INSERT INTO HelpDesk(HDRequestorFname, Role, HDAdmin, HDTech, HowLongDays, HDNote, HDRequestorLname, Description, Company, DateIssue) VALUES (@HDRequestorFname, @Role, @Topic, @Status, @HowLongdays, @HDNote, @HDRequestorLname, @Description, @Company, @DateIssue)";
        cmd.Connection = con;
        cmd.Parameters.AddWithValue("@HDRequestorFname", firstname);
        cmd.Parameters.AddWithValue("@Role", role);
        cmd.Parameters.AddWithValue("@Topic", topic);
        cmd.Parameters.AddWithValue("@Status", status);
        cmd.Parameters.AddWithValue("@HowLongdays", days);
        cmd.Parameters.AddWithValue("@HDNote", uploadfile);
        cmd.Parameters.AddWithValue("@HDRequestorLname", downloadfile);
        cmd.Parameters.AddWithValue("@Description", description);
        cmd.Parameters.AddWithValue("@Company", company);
        cmd.Parameters.AddWithValue("@DateIssue", dateissue);
        con.Open();
        cmd.ExecuteNonQuery();
        //con.Close();
        GridView1.DataBind();
        godaddyMail();
        SoftSysMail("HelpDesk Ticket", "Your HelpDesk ticket was reviewed. Please, login to your account to see the Custom Design DB response.");
      }
    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
      // get the row index, add onclick attribute for javascript:__doPostBack('GridView1','Select$0') 
      if (e.Row.RowType == DataControlRowType.DataRow)
      {
        e.Row.Attributes["onclick"] = ClientScript.GetPostBackClientHyperlink(this.GridView1, "Select$" + e.Row.RowIndex); e.Row.Attributes.Add("onmouseover", "JavaScript:this.style.cursor='pointer';");
      }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    //http://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.gridview.selectedindexchanging.aspx
    {
      GridViewRow row = GridView1.SelectedRow;
      Debug.Write(row.Cells[1].Text);
      Debug.Write(row.Cells[3].Text);
      DateTime convertDate= DateTime.Parse(row.Cells[3].Text);
      string shortDateTime= convertDate.ToString("g");
      Response.Redirect("TicketDetails.aspx?HDnum=" + row.Cells[1].Text + "&DateIssue=" + shortDateTime);
    }

    public void godaddyMail()
    {
      //http://stackoverflow.com/questions/2032860/send-smtp-email-through-godaddy
      System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
      mail.To.Add((string)Session["Email"]);
      mail.From = new MailAddress("info@customdesigndb.com");
      mail.Subject = "HelpDesk Ticket";
      mail.Body = "Your HelpDesk ticket was reviewed; login to your account to see the Custom Design DB response.";
      mail.IsBodyHtml = true;

      //Attachment attachment = new Attachment(fileName);
      //mail.Attachments.Add(attachment);    //add the attachment            

      SmtpClient client = new SmtpClient();
      //client.Credentials = new System.Net.NetworkCredential("customdb", "Holy1112!");
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

      MailAddress fromAddress = new MailAddress("info@customdesigndb.com", "Mike Lanham");

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

    protected void downloadButton_Click(object sender, EventArgs e)
    {
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
    }

}
