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
      //this.DataBind();
      //GridView1.DataBind();
      //GridView2.DataBind();
      ComboBox1.Focus();
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
    protected void GridView1_PreRender(object sender, EventArgs e)
    {
      //if (GridView1.SelectedRow.RowState == DataControlRowState.Edit)
      //{
      //  DataRowView rowView = (DataRowView)GridView1.SelectedRow.DataItem;
      //  String topic = rowView["Topic"].ToString();
      //  if (topic != null)
      //  {
      //    ListBox list = (ListBox)GridView1.SelectedRow.FindControl("ListBox1");
      //    ListItem item = list.Items.FindByText(topic);
      //    list.SelectedIndex = list.Items.IndexOf(item);
      //  }
      //  else
      //  {
      //    ListBox list = (ListBox)GridView1.SelectedRow.FindControl("ListBox1");
      //    ListItem item = list.Items.FindByText("Please Select");
      //    list.SelectedIndex = list.Items.IndexOf(item);
      //  }
      //}
    }
    // Override to create the repeated items from the DataSource.
    //protected override void OnDataBinding(EventArgs e)
    //{
    //  base.OnDataBinding(e);

    //  if (DataSource != null)
    //  {
    //    // Clear any existing child controls.
    //    Controls.Clear();
    //    // Clear any previous view state for the existing child controls.
    //    ClearChildViewState();

    //    // Iterate over the DataSource, creating a new item for each data item.
    //    IEnumerator dataEnum = DataSource.GetEnumerator();
    //    int i = 0;
    //    while (dataEnum.MoveNext())
    //    {

    //      // Create an item.
    //      RepeaterItem item = new RepeaterItem(i, dataEnum.Current);
    //      // Initialize the item from the template.
    //      ItemTemplate.InstantiateIn(item);
    //      // Add the item to the ControlCollection.
    //      Controls.Add(item);

    //      i++;
    //    }

    //    // Prevent child controls from being created again.
    //    ChildControlsCreated = true;
    //    // Store the number of items created in view state for postback scenarios.
    //    ViewState["NumItems"] = i;
    //  }
    //}

    //protected override void OnDataBinding(object sender, EventArgs e)
    //{
    //  try { base.OnDataBinding(e); }

    //  catch (ArgumentOutOfRangeException ex)
    //  {
    //    this.ClearSelection();
    //    ListItem li = new ListItem("Value not exists in valuelist", "-99");
    //    li.Selected = true;
    //    this.Items.Insert(0, li);
    //  }
    //}

    protected void ListBox5_DataBinding(object sender, EventArgs e)
    {
    //this is hit after Select is clicked after GridView1_DataBinding has occured
    //the error pops up after this procedure is run
    //when this procedure runs, try does not goto catch, rather jumps to the end,
    //does that mean that the binding occurs? Then the error occurs? So, maybe a databound procudure is needed?

      
      // Clear any previous view state for the existing child controls.
      //ClearChildViewState();

      //{
      //  //try { base.OnDataBinding(e); }

      //  //catch (ArgumentOutOfRangeException ex)
      //  {
      //    DataRowView rowView = (DataRowView)GridView1.SelectedRow.DataItem;

      //    // Retrieve the topic value for the current row. 
      //    String topic = rowView["Topic"].ToString();

      //    // Retrieve the DropDownList control from the current row. 
      //    ListBox list = (ListBox)GridView1.SelectedRow.FindControl("ListBox5");
      //    list.ClearSelection();
      //    ListItem li = new ListItem("Value not exists in valuelist", "-99");
      //    li.Selected = true;
      //    list.Items.Insert(0, li);
      //  }
      //}
    }
    protected void ListBox5_DataBound(object sender, EventArgs e)
    {
    //this does not fire when error occurs, so the error occurs after databinding but before databound?
    }
    protected void GridView1_DataBinding(object sender, EventArgs e)
    {
    //this is hit on page load and again after Company is selected, and again when Select is clicked
    }

    protected void GridView1_RowDataBound(Object sender, GridViewRowEventArgs e)
    { //does not fire, when error occurs
      //http://msdn.microsoft.com/en-us/library/system.web.ui.webcontrols.gridviewrow.dataitem(v=vs.90).aspx      
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
        ListBox list = (ListBox)e.Row.FindControl("ListBox5");

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
      ListBox list = (ListBox)row.FindControl("ListBox5");

      // Add the selected value of the DropDownList control to  
      // the NewValues collection. The NewValues collection is 
      // passed to the data source control, which then updates the  
      // data source.
      e.NewValues["Topic"] = list.SelectedValue;
    }

    protected void ChangeTextBoxWidths(object sender, EventArgs e)
    {
            //this procedure sets textbox width in edit mode
      //{
      //  if (DetailsView2.CurrentMode == DetailsViewMode.Edit)
      //  {
      //    foreach (DetailsViewRow dvr in DetailsView2.Rows)
      //    {
      //      if (dvr.Cells.Count.Equals(2) && dvr.Cells[1].HasControls())
      //      {
      //        Control ctrl = dvr.Cells[1].Controls[0];
      //        if (ctrl is TextBox)
      //        {
      //          TextBox txt = ctrl as TextBox;
      //          txt.TextMode = TextBoxMode.MultiLine;
      //          txt.Width = 370;
      //          txt.Rows = 4;
      //          //txt.Width = txt.Text.Length * 10;
      //          if (txt.Text.Length < 35)
      //          {
      //            txt.Width = 150;
      //            txt.TextMode = TextBoxMode.SingleLine;
      //          }
      //        }
      //      }
      //    }
      //  }
      //  if (DetailsView2.CurrentMode == DetailsViewMode.Insert)
      //  {
      //    foreach (DetailsViewRow dvr in DetailsView2.Rows)
      //    {
      //      if (dvr.Cells.Count.Equals(2) && dvr.Cells[1].HasControls())
      //      {
      //        Control ctrl = dvr.Cells[1].Controls[0];
      //        if (ctrl is TextBox)
      //        {
      //          TextBox txt = ctrl as TextBox;
      //          txt.TextMode = TextBoxMode.MultiLine;
      //          txt.Width = 370;
      //          txt.Rows = 2;
      //          //txt.Width = txt.Text.Length * 10;
      //          //if (txt.Text.Length < 35)
      //          //{
      //          //  txt.Width = 150;
      //          //  txt.TextMode = TextBoxMode.SingleLine;
      //          //}
      //        }
      //      }
      //    }
      //    //http://forums.asp.net/t/912783.aspx
      //    //hidden value row 1= ID
      //    //DetailsView2.Rows[2].Cells[1].Text = HelpDeskGridView.SelectedRow.Cells[1].Text;
      //    //DetailsView2.Rows[3].Cells[1].Text = DateTime.Today.ToShortDateString();
      //    //if (Session["name"] != null)
      //    //{
      //    //  DetailsView2.Rows[4].Cells[1].Text = (string)Session["name"];
      //    //}
      //  }
      //}
      //this procedure sets textbox width in edit mode
      {
        if (DetailsView3.CurrentMode == DetailsViewMode.Edit)
        {
          foreach (DetailsViewRow dvr in DetailsView3.Rows)
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
        if (DetailsView3.CurrentMode == DetailsViewMode.Insert)
        {
          foreach (DetailsViewRow dvr in DetailsView3.Rows)
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
    protected void DetailsView3_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
      godaddyMail();
    }
    protected void DetailsView3_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
      e.Values["DateNote"] = DateTime.Now;
    }
    //protected void ModeSelection(object sender, EventArgs e)
    //{
    //  if (DetailsView2.DataItemCount != 0)
    //  {
    //    DetailsView3.ChangeMode(DetailsViewMode.ReadOnly);
    //  }
    //  else
    //  {
    //    DetailsView3.ChangeMode(DetailsViewMode.Insert);
    //  }
    //}
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
      //string selectedItem= ComboBox1.SelectedValue;
      //SqlDataSource4.DataBind();
      //SqlDataSource5.DataBind();
      //SqlDataSource1.DataBind();
      GridView1.DataBind();
      GridView2.DataBind();
      DetailsView1.DataBind();
      //DetailsView2.DataBind();
      DetailsView3.DataBind(); 
      //System.Threading.Thread.Sleep(2000);
      //Response.Redirect("Admin.aspx?companyListBox.SelectedValue=" + companyListBox.SelectedValue);

    }
    protected void newResponseButton_Click(object sender, EventArgs e)
    {
      if (DetailsView3.CurrentMode == DetailsViewMode.Insert)
      {
        DetailsView3.ChangeMode(DetailsViewMode.ReadOnly);
      }
      else
      {
        DetailsView3.ChangeMode(DetailsViewMode.Insert);
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
    protected void GridView2_Update(object sender, DetailsViewUpdatedEventArgs e)
    {
      GridView2.DataBind();
    }


}