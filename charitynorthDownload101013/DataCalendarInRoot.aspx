<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DataCalendarInRoot.aspx.cs" Inherits="Calendar_DataCalendar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Namespace="DataControls" Assembly="DataCalendar" TagPrefix="dc" %>
<%@ Register Namespace="DataControls" Assembly="DataCalendar" TagPrefix="dc" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/CSS/reset.css" rel="stylesheet" type="text/css" />
    <link href="~/CSS/Form.css" rel="stylesheet" type="text/css" />
    <link href="~/CSS/branding.css" rel="stylesheet" type="text/css" />  
    <link href="~/CSS/style.css" rel="stylesheet" type="text/css" />
    <link href="~/CSS/calendar.css" rel="stylesheet" type="text/css" />
</head>
<body >
	<form id="form1" runat="server" >
		<div >
      <dc:datacalendar id="cal1" runat="server" class="calendar" 
				dayfield="Start" 
        daynameformat="Shortest" 
        selectionmode="Day" 
        showgridlines="False" 
        onselectionchanged="SelectionChange"
        onvisiblemonthchanged="MonthChange" 
        width="100%" height="180px" 
        BorderColor="#0000CC" 
        top="0px">
        
        <SelectedDayStyle BackColor="LightGray" Font-Bold="True" ForeColor="White" />
        <SelectorStyle BackColor="#CCCCCC" />
        <WeekendDayStyle BackColor="#FFFFCC" />
        <TodayDayStyle BackColor="#e6ffe6" ForeColor="Black" />
        <OtherMonthDayStyle ForeColor="#808080" />
        <NextPrevStyle VerticalAlign="Bottom" />
        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="False" height="20px" Font-Size="10pt" />
        <DayStyle Font-Size="10" />
        <%--this is the attribute that creates links on the days--%>    
        <daywitheventsstyle forecolor="#009933" font-bold="False" />                
        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
      </dc:datacalendar>
      <p id="labels" style="Font-weight: bold;">
        Tasks for
        <asp:Label ID="lblDate" runat="server" />
      </p>
      <asp:Label ID="lblNoEvents" runat="server" Text="No tasks for this date." />     
      <asp:Repeater ID="dg" runat="server" >
        <HeaderTemplate>
          <h5>Details:</h5>
        </HeaderTemplate>   
        <ItemTemplate>
          <%# DataBinder.Eval(Container.DataItem, "Start")  %>,
          <a href="Goodday/Calendar/PasswordProtected/ExcelUpdateDeleteTask.aspx?Subject=<%# DataBinder.Eval(Container.DataItem, "Subject") %>">
            <%# DataBinder.Eval(Container.DataItem, "Subject")%></a>,
          <%# DataBinder.Eval(Container.DataItem, "Location")  %>,
          <span class='<%# formatDeletedTask(DataBinder.Eval(Container.DataItem, "Categories")) %> '>
            <%# DataBinder.Eval(Container.DataItem, "Categories")  %></span>,
          
          <%# DataBinder.Eval(Container.DataItem, "Body")  %>,
          <%# DataBinder.Eval(Container.DataItem, "Crew")  %>,
          <%# DataBinder.Eval(Container.DataItem, "Organizer")  %>
          
          <br />
        </ItemTemplate>       
        <FooterTemplate></FooterTemplate>
      </asp:Repeater>
		</div>
	</form>
</body>
</html>
