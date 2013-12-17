using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GoodDay_pwdRecovery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void PasswordRecovery1_SendingMail(object sender, MailMessageEventArgs e)
    {
      Label lbl = (Label)PasswordRecovery1.SuccessTemplateContainer.FindControl("EmailLabel");
      lbl.Text = e.Message.To[0].Address;
    }
}
