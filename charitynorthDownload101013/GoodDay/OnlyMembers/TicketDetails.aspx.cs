using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

public partial class TicketDetails : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {
    HelpTicketLabel.Text = "Help Ticket#: " + Request.QueryString["HDnum"];
    HelpTicketLabel2.Text = "Date Opened: " + Request.QueryString["DateIssue"];
    try
    {

    Label15.Text = " " + DetailsView2.Rows[1].Cells[1].Text;
    Label16.Text = " " + DetailsView2.Rows[7].Cells[1].Text;
    Label17.Text = " " + DetailsView2.Rows[5].Cells[1].Text;
    Label18.Text = " " + DetailsView2.Rows[2].Cells[1].Text;
    Label19.Text = " " + DetailsView2.Rows[6].Cells[1].Text;
    Label20.Text = " " + DetailsView2.Rows[3].Cells[1].Text;
    Label21.Text = " " + DetailsView2.Rows[4].Cells[1].Text;
    }
    catch (Exception ex)
    {
      //the exception
    }
  }
  protected void uploadButton_Click(object sender, EventArgs e)
  {

  }
  protected void submitButton_Click(object sender, EventArgs e)
  {

  }
  protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
  {

  }

  protected void ChangeTextBoxWidths(object sender, EventArgs e)
  {
    //this procedure sets textbox width in edit mode
    {
      if (DetailsView1.CurrentMode == DetailsViewMode.Edit)
      {
        foreach (DetailsViewRow dvr in DetailsView1.Rows)
        {
          if (dvr.Cells.Count.Equals(2) && dvr.Cells[1].HasControls())
          {
            Control ctrl = dvr.Cells[1].Controls[0];
            if (ctrl is TextBox)
            {
              TextBox txt = ctrl as TextBox;
              txt.TextMode = TextBoxMode.MultiLine;
              txt.Width = 370;
              txt.Rows = 4;
              //txt.Width = txt.Text.Length * 10;
              if (txt.Text.Length < 35)
              {
                txt.Width = 150;
                txt.TextMode = TextBoxMode.SingleLine;
              }
            }
          }
        }
      }
      if (DetailsView1.CurrentMode == DetailsViewMode.Insert)
      {
        foreach (DetailsViewRow dvr in DetailsView1.Rows)
        {
          if (dvr.Cells.Count.Equals(2) && dvr.Cells[1].HasControls())
          {
            Control ctrl = dvr.Cells[1].Controls[0];
            if (ctrl is TextBox)
            {
              TextBox txt = ctrl as TextBox;
              txt.TextMode = TextBoxMode.MultiLine;
              txt.Width = 370;
              txt.Rows = 6;
              //txt.Width = txt.Text.Length * 10;
              //if (txt.Text.Length < 35)
              //{
              //  txt.Width = 150;
              //  txt.TextMode = TextBoxMode.SingleLine;
              //}
            }
          }
        }
        //http://forums.asp.net/t/912783.aspx
        //hidden value row 1= ID
        //DetailsView2.Rows[2].Cells[1].Text = HelpDeskGridView.SelectedRow.Cells[1].Text;
        //DetailsView2.Rows[3].Cells[1].Text = DateTime.Today.ToShortDateString();
        //if (Session["name"] != null)
        //{
        //  DetailsView2.Rows[4].Cells[1].Text = (string)Session["name"];
        //}
      }
    }
  }
  public void godaddyMail()
  {
    //http://stackoverflow.com/questions/2032860/send-smtp-email-through-godaddy
    System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
    mail.To.Add("m_lanham@hotmail.com");
    mail.From = new MailAddress("info@customdesigndb.com");
    mail.Subject = "HelpDesk Response";
    mail.Body = "Your HelpDesk response was recieved.";
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
  protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
  {
    godaddyMail();
    SoftSysMail("HelpDesk Response", "Please, login to your account to see the Custom Design DB response.");
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

  protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
  {
    e.Values["DateNote"]= DateTime.Now;
  }
}