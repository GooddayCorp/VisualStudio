using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminAllTicketsUnfiltered : System.Web.UI.Page
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
    GridView1.DataBind();
    DetailsView1.DataBind();
  }

  protected void DetailsView_Update(object sender, GridViewUpdatedEventArgs e)
  {
    DetailsView1.DataBind();
  }
  protected void GridView_Update(object sender, DetailsViewUpdatedEventArgs e)
  {
    GridView1.DataBind();
  }
}
