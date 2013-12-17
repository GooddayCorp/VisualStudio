<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DataCalendar.ascx.cs" Inherits="Calendar_DataCalendar" %>
<%@ Register Namespace="DataControls" Assembly="DataCalendar" TagPrefix="dc" %>
<%@ Register TagPrefix="MY" TagName="popup" src="../Calendar/Help/HelpControl.ascx" %>
<%@ Register Namespace="DataControls" Assembly="DataCalendar" TagPrefix="dc" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

    <link href="~/CSS/reset.css" rel="stylesheet" type="text/css" />
    <link href="~/CSS/Form.css" rel="stylesheet" type="text/css" />
    <link href="~/CSS/branding.css" rel="stylesheet" type="text/css" />  
    <link href="~/CSS/style.css" rel="stylesheet" type="text/css" />
    
      <dc:datacalendar id="cal1" runat="server" class="calendar" dayfield="Start" 
        daynameformat="Shortest" selectionmode="Day" showgridlines="False" onselectionchanged="SelectionChange"
        onvisiblemonthchanged="MonthChange" width="100%" height="220px" 
        BorderColor="#0000CC" CssClass="left" BackColor="White">
        
        <SelectedDayStyle BackColor="LightGray" Font-Bold="True" ForeColor="White" />
        <SelectorStyle BackColor="#CCCCCC" />
        <WeekendDayStyle BackColor="#FFFFCC" />
        <TodayDayStyle BackColor="#e6ffe6" ForeColor="Black" />
        <OtherMonthDayStyle ForeColor="#808080" />
        <NextPrevStyle VerticalAlign="Bottom" />
        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="False" Font-Size="14pt" />
        <DayStyle Font-Size="10" />
        <%--this is the attribute that creates links on the days--%>    
        <daywitheventsstyle forecolor="#009933" font-bold="False" />                
        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
      </dc:datacalendar>
      <h5 id="hyperlinks">
      &nbsp;&nbsp;&nbsp;&nbsp;
          
      </h5>
      <h4 id="labels">
        Tasks for
        <asp:Label ID="lblDate" runat="server" />
      </h4>
      <asp:Label ID="lblNoEvents" runat="server" Text="No tasks for this date." />
     
      <asp:Repeater ID="dg" runat="server" >
        <HeaderTemplate>
          <h5>Details:</h5>
        </HeaderTemplate>   
        <ItemTemplate>
          <%# DataBinder.Eval(Container.DataItem, "Start")  %>,
            <a href="Calendar/PasswordProtected/ExcelUpdateDeleteTask.aspx?Subject=<%# DataBinder.Eval(Container.DataItem, "Subject") %>">
          <%# DataBinder.Eval(Container.DataItem, "Subject")%></a>,
          <%# DataBinder.Eval(Container.DataItem, "Location")  %>,
            <span class='<%# formatDeletedTask(DataBinder.Eval(Container.DataItem, "Categories")) %> '>
          <%# DataBinder.Eval(Container.DataItem, "Categories")  %></span>,          
          <%# DataBinder.Eval(Container.DataItem, "Body")  %>,
          <%# DataBinder.Eval(Container.DataItem, "Crew")  %>,
          <%# DataBinder.Eval(Container.DataItem, "Organizer")  %>          
          <hr />
        </ItemTemplate>        
        <FooterTemplate></FooterTemplate>
      </asp:Repeater>