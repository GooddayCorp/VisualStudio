using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Diagnostics;
using System.Security.Principal;
using System.Threading;

using System.Collections.Generic;

using System.Data.Sql;
using System.Data.SqlClient;
using System.Text;
using System.IO;

using System.Data.OleDb;

using System.Net;
using System.Net.Mail;

public partial class MasterPage : System.Web.UI.MasterPage
{
  protected void Page_Load(object sender, EventArgs e)
  {
  
  }
   
    /// <summary> 
    /// Adds last menu item with logout link. 
    /// Main menu is configured to use SiteMapDataSource. 
    /// </summary> 
    /// <param name="sender"></param> 
    /// <param name="e"></param> 
    protected void mainMenu_DataBound(object sender, EventArgs e)
    {
      //MenuItem loginMenuItem =
      //    new MenuItem(
      //        LoginStatus1.LoginText,
      //        "logout",
      //        LoginStatus1.LogoutImageUrl,
      //        Page.ClientScript.GetPostBackClientHyperlink(LoginStatus1.Controls[0], null));
      //MainMenu.Items.Add(loginMenuItem);
    }
    //protected override void Render(System.Web.UI.HtmlTextWriter writer)
    //{
    //  // required by ASP.NET to pass EnableEventValidation on page as our composed link 
    //  // will postback from other control not original LoginStatus 
    //  Page.ClientScript.RegisterForEventValidation(LoginStatus1.Controls[0].UniqueID);

    //  base.Render(writer);
    //} 
    protected void OnLoggedIn(object sender, EventArgs e)
    {
      FormsAuthentication.SetAuthCookie(Login1.UserName.ToString(), Login1.RememberMeSet);
      Session["Username"] = Login1.UserName.ToString();
      SelectCompany(Login1.UserName.ToString());
      SelectEmail(Login1.UserName.ToString());
      SelectUserId(Login1.UserName.ToString());
      //var useridstring = "SelectUserId(Login1.UserName.ToString())";
      //SelectEmail(useridstring);
}
    private void SelectCompany(string username)
    {
      using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["custom_dbConnectionString"].ConnectionString))
      {
        SqlCommand cmd = new SqlCommand();
        Object returnValue;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "Select [Id] From [Contacts] Where [Username]= @Username";
        cmd.Connection = con;
        cmd.Parameters.AddWithValue("@Username", username);
        con.Open();
        //cmd.ExecuteNonQuery();
        returnValue = cmd.ExecuteScalar();
        Session["Id"]=returnValue;
      }
    }
    private void SelectUserId(string username)
    {
      using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["custom_dbConnectionString"].ConnectionString))
      {
        SqlCommand cmd = new SqlCommand();
        Object returnValue;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "Select [UserId] From [aspnet_Users] Where [Username]= @Username";
        cmd.Connection = con;
        cmd.Parameters.AddWithValue("@Username", username);
        con.Open();
        //cmd.ExecuteNonQuery();
        returnValue = cmd.ExecuteScalar();
        Session["UserId"] = returnValue;
      }
    }
    private void SelectEmail(string username)
    {
      using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["custom_dbConnectionString"].ConnectionString))
      {
        SqlCommand cmd = new SqlCommand();
        Object returnValue;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "Select [Email Address] From [Contacts] Where [Username]= @Username";
        cmd.Connection = con;
        cmd.Parameters.AddWithValue("@UserName", username);
        con.Open();
        //cmd.ExecuteNonQuery();
        returnValue = cmd.ExecuteScalar();
        Session["Email"] = returnValue;
      }
    }
    protected void PasswordRecovery1_SendingMail(object sender, MailMessageEventArgs e)
    {
      Label lbl = (Label)PasswordRecovery1.SuccessTemplateContainer.FindControl("EmailLabel");
      lbl.Text = e.Message.To[0].Address;
    }
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
      try {
      AddUser(CreateUserWizard1.UserName, "member", CreateUserWizard1.UserName, CreateUserWizard1.Password, CreateUserWizard1.Email, CreateUserWizard1.Question, CreateUserWizard1.Answer, DateTime.Now);
      CreateUser();
      SoftSysMail("Goodday Registration", "Thank you for registering at GooddayCorp.com.");
      }
      catch (SqlException ex){
        Msg.Text= ex.Message;
      }
    }
    private void AddUser(string company, string role, string username, string password, string email, string question, string answer, DateTime contactdate)
    {
      using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["custom_dbConnectionString"].ConnectionString))
      {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "INSERT INTO Contacts(Company, Title, Username, Passwordfile, [Email Address], Usernpwdnotes, [User Field 2], ContactDate) VALUES (@Company, @Title, @Username, @Password, @Email, @Question, @Answer, @ContactDate)";
        cmd.Connection = con;
        cmd.Parameters.AddWithValue("@Company", username);
        cmd.Parameters.AddWithValue("@Title", role);
        cmd.Parameters.AddWithValue("@Username", username);
        cmd.Parameters.AddWithValue("@Password", password);
        cmd.Parameters.AddWithValue("@Email", email);
        cmd.Parameters.AddWithValue("@Question", question);
        cmd.Parameters.AddWithValue("@Answer", answer);
        cmd.Parameters.AddWithValue("@ContactDate", contactdate);

        con.Open();
        cmd.ExecuteNonQuery();
        //con.Close();
      }
    }
    protected void CreateUser()
    {
      MembershipCreateStatus result;
      try
      {
        // Create new user.
        MembershipUser newUser = Membership.CreateUser(
          CreateUserWizard1.UserName,
          CreateUserWizard1.Password,
          CreateUserWizard1.Email,
          CreateUserWizard1.Question,
          CreateUserWizard1.Answer,
          false,
          out result);

        // Check IsUserInRole, then add User to Role, member.
        try
        {
          if (Roles.IsUserInRole(CreateUserWizard1.UserName, "guest"))
          {
            Roles.AddUserToRole(CreateUserWizard1.UserName, "member");
          }
        }
        catch (Exception e)
        {
          Msg.Text = e.Message;
          //Msg.Text = "The guest user, " + CreateUserWizard1.UserName + " is already registered. Please enter a different username.";
        }
      }
      catch (MembershipCreateUserException e)
      {
        Msg.Text = GetErrorMessage(e.StatusCode);
      }
      catch (HttpException e)
      {
        Msg.Text = e.Message;
      }
    }
    public string GetErrorMessage(MembershipCreateStatus status)
    {
      switch (status)
      {
        case MembershipCreateStatus.DuplicateUserName:
          return "Username already exists. Please enter a different user name.";

        case MembershipCreateStatus.DuplicateEmail:
          return "A username for that e-mail address already exists. Please enter a different e-mail address.";

        case MembershipCreateStatus.InvalidPassword:
          return "The password provided is invalid. Please enter a valid password value.";

        case MembershipCreateStatus.InvalidEmail:
          return "The e-mail address provided is invalid. Please check the value and try again.";

        case MembershipCreateStatus.InvalidAnswer:
          return "The password retrieval answer provided is invalid. Please check the value and try again.";

        case MembershipCreateStatus.InvalidQuestion:
          return "The password retrieval question provided is invalid. Please check the value and try again.";

        case MembershipCreateStatus.InvalidUserName:
          return "The user name provided is invalid. Please check the value and try again.";

        case MembershipCreateStatus.ProviderError:
          return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

        case MembershipCreateStatus.UserRejected:
          return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.";

        default:
          return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.";
      }
    }
    public void SoftSysMail(string subject, string msg)
    {
      SmtpClient smtpClient = new SmtpClient();
      MailMessage message = new MailMessage();

      MailAddress fromAddress = new MailAddress("m_lanham@hotmail.com", "Mike Lanham");

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
    //private void SelectEmail(string userid)
    //{
    //  using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["custom_dbConnectionString"].ConnectionString))
    //  {
    //    SqlCommand cmd = new SqlCommand();
    //    Object returnValue;
    //    cmd.CommandType = CommandType.Text;
    //    //cmd.CommandText = "Select [Email Address] From [Contacts] Where [Username]= @Username";
    //    cmd.CommandText = "Select [Email] From [aspnet_Membership] Where [UserId]= @UserId";
    //    cmd.Connection = con;
    //    cmd.Parameters.AddWithValue("@UserId", userid);
    //    con.Open();
    //    //cmd.ExecuteNonQuery();
    //    returnValue = cmd.ExecuteScalar();
    //    Session["Email"] = returnValue;
    //  }
    //}   
}

