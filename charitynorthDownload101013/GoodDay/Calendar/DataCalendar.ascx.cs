using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.OleDb;

public partial class Calendar_DataCalendar : System.Web.UI.UserControl
{
    void Page_Load(Object o, EventArgs e)
    {
    String rootPath = Server.MapPath("~");
        if (!IsPostBack) {
            cal1.VisibleDate = DateTime.Now;
            cal1.SelectedDate = DateTime.Now;
            BindEventListing();   
        }    
        DateTime Start = new DateTime(cal1.VisibleDate.Year, cal1.VisibleDate.Month, 1).AddDays(-7);
        DateTime EndDate = new DateTime(cal1.VisibleDate.Date.AddMonths(1).Year, cal1.VisibleDate.Date.AddMonths(1).Month, 1).AddDays(7);
        cal1.DataSource = GetEventData(Start, EndDate);
    }   
    OleDbConnection GetConnection()
    {
        OleDbConnection con = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;
          Data Source=|DataDirectory|calendar.xls;Extended Properties=Excel 8.0;");
         
        return con;
    }
    DataSet GetEventData(DateTime Start, DateTime EndDate)
    {
        //we're only loading events for the
        // currently displayed month (plus the week before and week after)
        
        // read data from an Excel query
        OleDbConnection con = GetConnection();
        OleDbCommand cmd = new OleDbCommand();
        cmd.Connection = con;
        cmd.CommandText = String.Format("Select Start, Count(*) From JobSchedule Where Start >= #{0}# And Start <= #{1}# Group By Start", 
                                        Start, EndDate);
        DataSet ds = new DataSet();
        OleDbDataAdapter da = new OleDbDataAdapter(cmd);
        da.Fill(ds);
        con.Close();
        
        return ds;
    }  
     //format Categories
    public string formatDeletedTask(object Categories)
    {
      //return Deleted Category in red
      if (Categories.ToString() == "Deleted")
        return "deletedTask";
      else
        return "normalTask";
    }
    DataTable GetEventListing(DateTime selectedDay)
    {
        // read event listing for the given day from an Excel query
        OleDbConnection con = GetConnection();
        OleDbCommand cmd = new OleDbCommand();
        cmd.Connection = con;
        cmd.CommandText = String.Format("Select * from JobSchedule Where Start >= #{0}# and Start < #{1}# ", 
                                        selectedDay.ToString("MM/dd/yyyy"),
                                        selectedDay.AddDays(1).ToString("MM/dd/yyyy"));
        DataSet ds = new DataSet();
        OleDbDataAdapter da = new OleDbDataAdapter(cmd);
        da.Fill(ds);
        con.Close();
        
        return ds.Tables[0];
    }
    void BindEventListing()
    {
        DataTable dt = GetEventListing(cal1.SelectedDate);
        dg.DataSource = dt;
        dg.DataBind();
        lblDate.Text = cal1.SelectedDate.ToString("d");
        lblNoEvents.Visible = (dt.Rows.Count == 0);
    }
    public void MonthChange(Object o, MonthChangedEventArgs e)
    {
        // triggered when the month in the calendar changes;
        // requery the database for the new month's events
        DateTime Start = e.NewDate.AddDays(-7);
        DateTime EndDate = e.NewDate.AddMonths(1).AddDays(7);
        cal1.DataSource = GetEventData(Start, EndDate);
    }   
    public void SelectionChange(Object sender, EventArgs e) 
    {
        BindEventListing();
    }
}

