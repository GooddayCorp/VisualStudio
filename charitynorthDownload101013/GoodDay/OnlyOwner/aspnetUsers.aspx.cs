using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class GoodDay_OnlyAdmin_aspnetUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //public override string ApplicationName { 
    //  //get; 
    //  set {ApplicationName="/";} 
    //}
    protected void deleteButton_Click(object sender, EventArgs e)
    {
      bool IsDeleted=Membership.DeleteUser(deleteUserTextBox.Text,true);
      if (IsDeleted)
      {
      msgLabel.Text=deleteUserTextBox.Text + " was deleted.";
      deleteUserTextBox.Text = "";
      }
      else{
        msgLabel.Text = "No users were deleted.";
        deleteUserTextBox.Text = "";
      }
    }
    protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
    {
      //MembershipProvider membershipProvider= set MembershipProvider();
      //membershipProvider.ApplicationName="/";
    }
}
