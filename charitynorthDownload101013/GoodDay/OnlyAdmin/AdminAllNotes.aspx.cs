using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminAllNotes : System.Web.UI.Page
{
  protected void Page_Load(object sender, EventArgs e)
  {


    string name;
    name = System.Security.Principal.
    WindowsIdentity.GetCurrent().Name.ToString();
    Session["name"] = name;
    string sessionPassword = (string)Session["Password"];
    //if (sessionPassword != "Holy1112!")
    //{
    //  Response.Redirect("ErrorPage.aspx");
    //}
  }
  protected void Button1_Click(object sender, EventArgs e)
  {
    SqlDataSource2.DataBind();
    GridView1.DataBind();
  }
}
