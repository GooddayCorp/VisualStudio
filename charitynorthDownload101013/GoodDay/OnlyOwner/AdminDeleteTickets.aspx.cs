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
using System.Data.Sql;
using System.Security.Principal;
using System.Text;
using System.Net.Mail;

public partial class AdminwithListBoxes : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      //if (GridView2.Rows.Count == 0)
      //{
      //  DetailsView2.ChangeMode(DetailsViewMode.Insert);
      //}
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
    //http://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.gridviewrow.dataitem(v=vs.90).aspx
    protected void GridView1_RowDataBound(Object sender, GridViewRowEventArgs e)
    {
      if (GridView2.Rows.Count == 0)
      {
        DetailsView2.ChangeMode(DetailsViewMode.Insert);
      }
      // Check for a row in edit mode. 
      if (e.Row.RowState == DataControlRowState.Edit)
      {
        // Preselect the DropDownList control with the state value 
        // for the current row. 

        // Retrieve the underlying data item. In this example 
        // the underlying data item is a DataRowView object. 
        DataRowView rowView = (DataRowView)e.Row.DataItem;

        // Retrieve the topic value for the current row. 
        String topic = rowView["Topic"].ToString();

        // Retrieve the DropDownList control from the current row. 
        ListBox list = (ListBox)e.Row.FindControl("ListBox1");

        // Find the ListItem object in the DropDownList control with the  
        // topic value and select the item.
        ListItem item = list.Items.FindByText(topic);
        list.SelectedIndex = list.Items.IndexOf(item);
      }
    }
    protected void GridView1_RowUpdating(Object sender, GridViewUpdateEventArgs e)
    {
      // Retrieve the row being edited.
      GridViewRow row = GridView1.Rows[GridView1.EditIndex];

      // Retrieve the DropDownList control from the row.
      ListBox list = (ListBox)row.FindControl("ListBox1");

      // Add the selected value of the DropDownList control to  
      // the NewValues collection. The NewValues collection is 
      // passed to the data source control, which then updates the  
      // data source.
      e.NewValues["Topic"] = list.SelectedValue;
    }
    protected void DetailsView2_ChangeMode(object sender, GridViewEditEventArgs e)
    {
      // Get the selected row.
      GridViewRow row = GridView2.SelectedRow;
      
      // Check the row state. If the row is not in edit mode and is selected, 
      // exit edit mode. This ensures that the GridView control exits edit mode 
      // when a user selects a different row while the GridView control is in  
      // edit mode. Notice that the DataControlRowState enumeration is a flag 
      // enumeration, which means that you can combine values using bitwise 
      // operations.
      if (row != null)
      {     
        if (row.RowState != (DataControlRowState.Edit | DataControlRowState.Selected))
        {
          GridView2.EditIndex = -1;
          DetailsView2.ChangeMode(DetailsViewMode.ReadOnly);
        } 
        //if (row.RowState == DataControlRowState.Edit)
        //{
        //}
        //else
        //{
        //DetailsView2.ChangeMode(DetailsViewMode.Insert);
        //}
      }
    }
    protected void ChangeTextBoxWidths(object sender, EventArgs e)
    {
      //this procedure sets textbox width in edit mode
      {
        if (DetailsView2.CurrentMode == DetailsViewMode.Edit)
        {
          foreach (DetailsViewRow dvr in DetailsView2.Rows)
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
        if (DetailsView2.CurrentMode == DetailsViewMode.Insert)
        {
          foreach (DetailsViewRow dvr in DetailsView2.Rows)
          {
            if (dvr.Cells.Count.Equals(2) && dvr.Cells[1].HasControls())
            {
              Control ctrl = dvr.Cells[1].Controls[0];
              if (ctrl is TextBox)
              {
                TextBox txt = ctrl as TextBox;
                txt.TextMode = TextBoxMode.MultiLine;
                txt.Width = 370;
                txt.Rows = 2;
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
    protected void DetailsView2_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
      godaddyMail();
    }
    protected void DetailsView2_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
      e.Values["DateNote"] = DateTime.Now;
    }
    protected void ModeSelection(object sender, EventArgs e)
    {
      //if (DetailsView2.DataItemCount == 0)
      //{
      //DetailsView2.ChangeMode(DetailsViewMode.Insert);
      //}
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
      //SqlDataSource2.DataBind();
      //SqlDataSource4.DataBind();
      //SqlDataSource7.DataBind();
      SqlDataSource6.DataBind();
      SqlDataSource5.DataBind();

      //GridView1.DataBind();
      GridView2.DataBind();
      ////DetailsView1.DataBind();
      DetailsView2.DataBind();
      //System.Threading.Thread.Sleep(2000);
      //Response.Redirect("Admin.aspx?companyListBox.SelectedValue=" + companyListBox.SelectedValue);

    }
    protected void newResponseButton_Click(object sender, EventArgs e)
    {
      if (DetailsView2.CurrentMode == DetailsViewMode.Insert)
      {
        DetailsView2.ChangeMode(DetailsViewMode.ReadOnly);
      }
      else
      {
        DetailsView2.ChangeMode(DetailsViewMode.Insert);
      }
    }
    protected void DetailsView_Update(object sender, GridViewUpdatedEventArgs e)
    {
      DetailsView1.DataBind();
    }
    protected void GridView_Update(object sender, DetailsViewUpdatedEventArgs e)
    {
      GridView1.DataBind();
    }
    protected void DetailsView2_Update(object sender, GridViewUpdatedEventArgs e)
    {
      DetailsView2.DataBind();
    }
    protected void GridView2_Update(object sender, DetailsViewUpdatedEventArgs e)
    {
      GridView2.DataBind();
    }
}