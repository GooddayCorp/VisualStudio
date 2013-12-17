<%@ Page Language="VB" %>

<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Register Assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
  Namespace="System.Web.UI.WebControls" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javascript">
  //window.resizeTo(391, 660)
</script>

<script runat="server">

  Public connectionString As String
  Public queryString As String
  Public updateQueryString As String
  Public taskID As String
  Public Created As Date
  Public Updated As Date
  Public Test As String
  Public taskSubject As String
 
  Sub Page_Load(ByVal Sender As Object, ByVal e As EventArgs)
    taskSubject = Trim(Request.QueryString("Subject"))
    If taskSubject = "" Then GoTo ErrorHandler
    
    If Not Page.IsPostBack Then
      'Add the items to the TaskCategories DropDownList Web Control
      CategoriesListBox.Items.Add(New ListItem("Meet Client"))
      CategoriesListBox.Items.Add(New ListItem("Survey"))
      CategoriesListBox.Items.Add(New ListItem("First Call"))
      CategoriesListBox.Items.Add(New ListItem("Road Ban/Permits"))
      CategoriesListBox.Items.Add(New ListItem("Excavate"))
      CategoriesListBox.Items.Add(New ListItem("Footing Stand"))
      CategoriesListBox.Items.Add(New ListItem("Footing Pour"))
      CategoriesListBox.Items.Add(New ListItem("Footing Strip"))
      CategoriesListBox.Items.Add(New ListItem("Wall Stand"))
      CategoriesListBox.Items.Add(New ListItem("Wall Pour"))
      CategoriesListBox.Items.Add(New ListItem("Wall Strip"))
      CategoriesListBox.Items.Add(New ListItem("Water Proofing"))
      CategoriesListBox.Items.Add(New ListItem("Backfill"))
      CategoriesListBox.Items.Add(New ListItem("Cleanup"))
      CategoriesListBox.Items.Add(New ListItem("Repair"))
      CategoriesListBox.Items.Add(New ListItem("Call Back"))
      CategoriesListBox.Items.Add(New ListItem("Clearing/Hauling"))
      CategoriesListBox.Items.Add(New ListItem("Planning"))
      CategoriesListBox.Items.Add(New ListItem("Personal"))
      CategoriesListBox.Items.Add(New ListItem("Testing"))
      CategoriesListBox.Items.Add(New ListItem("Deleted"))
       
      'StartCalendar.SelectedDates.Clear     ' = StartCalendar.TodaysDate
      
    End If
  
    connectionString = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=|DataDirectory|calendar.xls;Extended Properties=Excel 8.0;"
    On Error GoTo ErrorHandler
    queryString = "SELECT * FROM JobSchedule WHERE Subject Like '%" & [taskSubject] & "%'"
    ReadData(connectionString, queryString)
    Exit Sub
    
ErrorHandler:
    MsgBox("Syntax Error, the Task Subject contains an illegal character (apostrophe) or is empty?")
    Response.Redirect("~/default.aspx")
  End Sub
   
  Public Sub ReadData(ByVal connectionString As String, _
    ByVal queryString As String)
    If Not Page.IsPostBack Then

      Using connection As New OleDbConnection(connectionString)
        Dim command As New OleDbCommand(queryString, connection)

        connection.Open()

        Using reader As OleDbDataReader = command.ExecuteReader()
          While reader.Read()
            If reader(6).ToString() <> vbNullString Then      'test Subject not empty
            
              taskIDLabel.Text = reader(0).ToString()
              Updated = CDate(Date.Now)
              CreatedLabel.Text = CDate(reader(2).ToString())
              Dim startHour As String = reader(3).Hour.ToString()
              Dim startMinutes As String = reader(3).Minute.ToString()
              StartTimeTextBox.Text = CDate(startHour & ":" & startMinutes)
              'StartCalendar.VisibleDate = reader.Item("Start")
              'StartCalendar.SelectedDate = reader.Item("Start")
              Dim startMonth As String = reader(3).Month.ToString()
              Dim startDay As String = reader(3).Day.ToString()
              Dim startYear As String = reader(3).Year.ToString()
              'StartCalendar.SelectedDate = CDate(startMonth & "/" & startDay & "/" & startYear)
              startDateTextBox.Text = CDate(startMonth & "/" & startDay & "/" & startYear)
          
              Dim EndDate As Date = CDate(reader(4).ToString())
           
              DurationTextBox.Text = reader(5).ToString()
              SubjectTextBox.Text = reader(6).ToString()
              LocationTextBox.Text = reader(7).ToString()
              CategoriesListBox.Text = reader(8).ToString()
              BodyTextBox.Text = reader(9).ToString()
              CrewTextBox.Text = reader(10).ToString()
              OrganizerTextBox.Text = reader(11).ToString()
            End If
          End While
              
        End Using
        'reader.Close()
      End Using
    End If 'is not postback
  End Sub
  
  Sub Do_Update(ByVal Sender As Object, ByVal e As EventArgs)
    Dim selectedDay As Date
    Dim parameterEndDate As Date
    Dim parameterStart As Date
    'Dim parameterDuration As Integer
    'Make sure the user has entered valid values...
    If Not Page.IsValid Then Exit Sub
   			
    Dim SqlString As String = String.Empty
    taskID = taskIDLabel.Text

    SqlString = "Update JobSchedule Set [ID]=@taskID, [Updated]=@Updated, [Created]=@Created, [Start]=@Start, [EndDate] = @EndDate, [Duration] = @Duration, [Subject] = @Subject, [Location] = @Location, [Categories] = @Categories, [Body] = @Body, [Crew] = @Crew, [Organizer] = @Organizer  WHERE Subject Like '%" & [taskSubject] & "%';"
    
    Dim defaultValue As String = "defaultString"
    
    Using myConnection As New Data.OleDb.OleDbConnection(connectionString)
      Using myCommand As New Data.OleDb.OleDbCommand(SqlString, myConnection)
        With myCommand
          .CommandType = CommandType.Text
          Dim Parameter As OleDbParameter
          
          '.Parameters.AddWithValue("@taskID", taskID)
          Parameter = .Parameters.Add("taskID", OleDbType.VarChar, 50)
          'Parameter.Value = defaultValue                   
          Parameter.Value = taskID
                    
          '.Parameters.AddWithValue("Updated", Updated)
          Parameter = .Parameters.Add("@Updated", OleDbType.Date)
          Parameter.Value = CDate(Date.Now)
                     
          '.Parameters.AddWithValue("Created", Created)
          Parameter = .Parameters.Add("@Created", OleDbType.Date)
          Parameter.Value = CreatedLabel.Text
          
          'StartCalendar.VisibleDate=StartCalendar.SelectedDate
          'selectedDay = StartCalendar.SelectedDate
          selectedDay = CDate(startDateTextBox.Text)
          
          Dim datetimeString As String
          datetimeString = CStr(selectedDay) & " " & StartTimeTextBox.Text
          parameterStart = CDate(datetimeString)
          .Parameters.AddWithValue("@Start", parameterStart)
                             
          'add duration to Start to calculate EndDate
          'CSng converts string to Single number
          parameterEndDate = DateAdd("n", CSng(DurationTextBox.Text), parameterStart)
          .Parameters.AddWithValue("@EndDate", parameterEndDate)

          '.Parameters.AddWithValue("Duration", DurationTextBox.Text)
          Parameter = .Parameters.Add("@Duration", OleDbType.Integer)
          Parameter.Value = Val(DurationTextBox.Text) / 1
                    
          .Parameters.AddWithValue("@Subject", SubjectTextBox.Text)
          .Parameters.AddWithValue("@Location", LocationTextBox.Text)
          .Parameters.AddWithValue("@Categories", CategoriesListBox.SelectedItem.Value)
          .Parameters.AddWithValue("@Body", BodyTextBox.Text)
          .Parameters.AddWithValue("@Crew", CrewTextBox.Text)
          .Parameters.AddWithValue("@Organizer", OrganizerTextBox.Text)
        End With
   
        myConnection.Open()
        myCommand.ExecuteNonQuery()
      End Using
    End Using    'enclosing the database connection in a "Using - End Using" blocking closes automatically
		Response.Redirect("~/DataCalendarInRoot.aspx")
		Exit Sub
    
ErrorHandler:
    MsgBox("Syntax Error, the Task Subject contains an illegal character (apostrophe)?")
    Response.Redirect("~/default.aspx")
  End Sub
  
  'it turns out that with Excel, Delete Record is not allowed, http://social.msdn.microsoft.com/Forums/en-US/transactsql/thread/7f79cfde-2f1f-4cad-94f8-07397b998296/
  'the work around is to use Update with Null values
  Sub Do_Delete(ByVal Sender As Object, ByVal e As EventArgs)
    Dim selectedDay As Date
    Dim parameterEndDate As Date
    Dim parameterStart As Date
    'Dim parameterDuration As Integer
    'Make sure the user has entered valid values...
    If Not Page.IsValid Then Exit Sub
   			
    Dim SqlString As String = String.Empty
    taskID = taskIDLabel.Text

    SqlString = "Update JobSchedule Set [ID]=@taskID, [Updated]=@Updated, [Created]=@Created, [Start]=@Start, [EndDate] = @EndDate, [Duration] = @Duration, [Subject] = @Subject, [Location] = @Location, [Categories] = 'Deleted', [Body] = @Body, [Crew] = @Crew, [Organizer] = @Organizer  WHERE Subject Like '%" & [taskSubject] & "%';"
    
    Dim defaultValue As String = "defaultString"
    
    Using myConnection As New Data.OleDb.OleDbConnection(connectionString)
      Using myCommand As New Data.OleDb.OleDbCommand(SqlString, myConnection)
        With myCommand
          .CommandType = CommandType.Text
          Dim Parameter As OleDbParameter
          
          '.Parameters.AddWithValue("@taskID", taskID)
          Parameter = .Parameters.Add("taskID", OleDbType.VarChar, 50)
          'Parameter.Value = defaultValue                   
          Parameter.Value = taskID
                    
          '.Parameters.AddWithValue("Updated", Updated)
          Parameter = .Parameters.Add("@Updated", OleDbType.Date)
          Parameter.Value = CDate(Date.Now)
                     
          '.Parameters.AddWithValue("Created", Created)
          Parameter = .Parameters.Add("@Created", OleDbType.Date)
          Parameter.Value = CreatedLabel.Text
          
          'StartCalendar.VisibleDate=StartCalendar.SelectedDate
          'selectedDay = StartCalendar.SelectedDate
          selectedDay = CDate(startDateTextBox.Text)
          
          Dim datetimeString As String
          datetimeString = CStr(selectedDay) & " " & StartTimeTextBox.Text
          parameterStart = CDate(datetimeString)
          .Parameters.AddWithValue("@Start", parameterStart)
                             
          'add duration to Start to calculate EndDate
          'CSng converts string to Single number
          parameterEndDate = DateAdd("n", CSng(DurationTextBox.Text), parameterStart)
          .Parameters.AddWithValue("@EndDate", parameterEndDate)

          '.Parameters.AddWithValue("Duration", DurationTextBox.Text)
          Parameter = .Parameters.Add("@Duration", OleDbType.Integer)
          Parameter.Value = Val(DurationTextBox.Text) / 1
                    
          .Parameters.AddWithValue("@Subject", SubjectTextBox.Text)
          .Parameters.AddWithValue("@Location", LocationTextBox.Text)
          .Parameters.AddWithValue("@Categories", "Deleted")
          .Parameters.AddWithValue("@Body", BodyTextBox.Text)
          .Parameters.AddWithValue("@Crew", CrewTextBox.Text)
          .Parameters.AddWithValue("@Organizer", OrganizerTextBox.Text)
        End With
   
        myConnection.Open()
        myCommand.ExecuteNonQuery()
      End Using
    End Using
    
		Response.Redirect("~/Calendar/DataCalendar.aspx")
  End Sub
</script>

<%--<script type="text/javascript">
<!--
  // This will resize the window when it is opened or
  // refresh/reload is clicked to a width and height of 400 x 600
  // with is placed first, height is placed second
  //http://www.codeave.com/javascript/code.asp?u_log=7065
//  window.resizeTo(370, 650)
//  function resize_2_local_settings()
//  {
//    window.resizeTo(screen.width, screen.height)
//  }
-->
</script>--%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
  <title>Update Tasks</title>
  <link href="~/CSS/reset.css" rel="stylesheet" type="text/css" />
  <link href="~/CSS/calendar.css" rel="stylesheet" type="text/css" />
<%--  <link href="~/CSS/Form.css" rel="stylesheet" type="text/css" />
  <link href="~/CSS/style.css" rel="stylesheet" type="text/css" />
  <link href="~/CSS/branding.css" rel="stylesheet" type="text/css" />--%>
</head>
<body>
  <form id="updateForm" class="form" runat="server">
  <div>
<%--    <table class="tableHead">
      <tr class="toprow">
            <td valign="top" colspan="2">
              <asp:Image ID="Image1" runat="server" cssclass="logoImage"
                ImageUrl="~/Calendar/Images/marshallLogoCropped.JPG" ImageAlign="Middle" 
                Width="100%" />
            </td>
      </tr>
      <tr >
        <td colspan="2" class="nav2">
          <asp:HyperLink ID="scheduleHyperLink" runat="server" 
            NavigateUrl="~/default.aspx" >Job Schedule
          </asp:HyperLink>
          &nbsp;&nbsp;&nbsp;
          <asp:HyperLink ID="insertHyperLink" runat="server" NavigateUrl="~/Calendar/ExcelInsertTask.aspx">Add Task
          </asp:HyperLink>
        </td>
      </tr>
      </table >
--%>
   <table class="tableBody" >
      <tr style="height:22px;">
        <td colspan="2" >
          <input id="Button1" 
            type="button" 
            value="" 
            class="backbutton"
            onmousedown="javascript:history.go(-1)"
            />
           Update/Delete Task
        </td>
      </tr>
      <tr>
        <td />          
        <td height="5px">
          <asp:Label ID="taskIDLabel" runat="server" Visible="False"></asp:Label>
          <asp:Label ID="CreatedLabel" runat="server" Visible="False"></asp:Label>
        </td>
      </tr>
      <tr>
        <td valign="top">
          Task:
        </td>
        <td>
          <asp:TextBox Width="150px" ID="SubjectTextBox" runat="server">13-0-xxxx Job Category</asp:TextBox>
          <asp:RequiredFieldValidator ID="rfv_Subject" ControlToValidate="SubjectTextBox" runat="server">* This is a required field</asp:RequiredFieldValidator>
        </td>
      </tr>
      <tr>
        <td valign="top">
          Start:
        </td>
        <td valign="top" height="5px">
          <asp:TextBox ID="startDateTextBox" runat="server" ToolTip="click to see calendar"
            Width="65px">mm/dd/yyyy</asp:TextBox>
          <asp:CalendarExtender ID="startDateTextBox_CalendarExtender" runat="server" Enabled="True"
            TargetControlID="startDateTextBox">
          </asp:CalendarExtender>
          &nbsp;<asp:TextBox ID="StartTimeTextBox" runat="server" Width="70px" Text="8:00"></asp:TextBox>
        </td>
      </tr>
      <tr>
        <td valign="top">
          Span:
        </td>
        <td valign="top">
          <asp:TextBox ID="DurationTextBox" runat="server" Width="40px">1</asp:TextBox>
          &nbsp;
        </td>
      </tr>
      <tr>
        <td valign="top">
          Cats:
        </td>
        <td valign="top">
          <asp:DropDownList ID="CategoriesListBox" runat="server" Width="150px" />
          <br />
        </td>
      </tr>
      <tr>
        <td valign="top">
          Site:
        </td>
        <td valign="top">
          <asp:TextBox ID="LocationTextBox" runat="server" Width="150px" />
          <br />
        </td>
      </tr>
      <tr>
        <td valign="top">
          Notes:
        </td>
        <td valign="top">
          <asp:TextBox ID="BodyTextBox" runat="server" Height="38px" TextMode="MultiLine" Width="150px" />
          <br />
        </td>
      </tr>
      <tr>
        <td valign="top">
          Crew:
        </td>
        <td valign="top">
          <asp:TextBox ID="CrewTextBox" runat="server" Height="38px" TextMode="MultiLine" Width="150px" />
          <br />
        </td>
      </tr>
      <tr>
        <td valign="top">
          Lead:
        </td>
        <td valign="top">
          <asp:TextBox ID="OrganizerTextBox" runat="server" Width="150px" />
          <br />
        </td>
      </tr>
      <tr>
        <td valign="top">
        </td>
        <td align="center">
          <asp:Button ID="updateButton" Text="Update" OnClick="do_update" runat="server" />
          &nbsp;<asp:Button ID="deleteButton" Text="Delete" OnClick="do_delete" runat="server" />
          <br />
        </td>
      </tr>
    </table>
  </div>
  <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
  </asp:ToolkitScriptManager>
  </form>
</body>
</html>
