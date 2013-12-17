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

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
    if (!Page.IsPostBack)
    {
    this.DataBind();  //this is needed to work around the header code block issue with '<%='
    //literalScript.Text = "<script src=\"" + ResolveUrl("../JS/Validators.js") * "\" type=\"text/javascript\"></script>";
    }
    string name;
    name = System.Security.Principal.
    WindowsIdentity.GetCurrent().Name.ToString();
    Session["name"] = name;
    if (Page.User.Identity.Name != null)
      {
      Session["Username"] = Page.User.Identity.Name;
      }
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
      
    //  //these lines throws an error on the host server "Cannot use a leading .. to exit about the top directory"     
    //  Page.ClientScript.RegisterForEventValidation(LoginStatus1.Controls[0].UniqueID);    
    //  base.Render(writer);
    //} 
    protected void OnLoggedIn(object sender, EventArgs e)
    {
      FormsAuthentication.SetAuthCookie(Login1.UserName.ToString(), Login1.RememberMeSet);
      Session["Username"] = Login1.UserName.ToString();
      SelectCompany(Login1.UserName.ToString()); 
      SelectEmail(Login1.UserName.ToString());
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
    private void SelectEmail(string username)
    {
      using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["custom_dbConnectionString"].ConnectionString))
      {
        SqlCommand cmd = new SqlCommand();
        Object returnValue;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "Select [Email Address] From [Contacts] Where [Username]= @Username";
        cmd.Connection = con;
        cmd.Parameters.AddWithValue("@Username", username);
        con.Open();
        //cmd.ExecuteNonQuery();
        returnValue = cmd.ExecuteScalar();
        Session["Email"] = returnValue;
      }
    }
    protected void MembersButton_Click(object sender, EventArgs e)
    {
    }
    protected void loginButton_Click(object sender, LoginCancelEventArgs e)
    {
    }
}
