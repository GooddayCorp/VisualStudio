<%@ Control Language="VB" AutoEventWireup="false" CodeFile="AddTask.ascx.vb" Inherits="AddTask" %>

   <%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
    <link href="~/CSS/reset.css" rel="stylesheet" type="text/css" />
<link href="../CSS/calendar.css" rel="stylesheet" type="text/css" />
<%--    <link href="~/CSS/Form.css" rel="stylesheet" type="text/css" />
    <link href="~/CSS/branding.css" rel="stylesheet" type="text/css" />  
    <link href="~/CSS/style.css" rel="stylesheet" type="text/css" />--%>

    <div>
         
        <table class="tableBody">
            <tr>
                <td colspan="2">
                </td>

            </tr>
            <tr>
                <td valign="top">
                    Task:
                </td>
                <td>
                    <asp:TextBox Width="150px" ID="SubjectTextBox" runat="server">13-0-0xxx Job Category</asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_Subject" ControlToValidate="SubjectTextBox" runat="server">* This is a required field</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    Start:
                </td>
                <td valign="top">
                    <asp:TextBox ID="StartDateTextBox" runat="server" Width="80px">mm/dd/yyyy</asp:TextBox>
                    <asp:CalendarExtender ID="StartDateTextBox_CalendarExtender" runat="server" Enabled="True"
                        TargetControlID="StartDateTextBox">
                    </asp:CalendarExtender>
                    <asp:TextBox ID="StartTimeTextBox" runat="server" Width="60px">8:00</asp:TextBox>
                    <%--          <asp:Calendar ID="StartCalendar" runat="server" Height="77px" Width="200px" Font-Size="7pt" />
--%>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    Span:
                </td>
                <td valign="top">
                    <asp:TextBox ID="DurationTextBox" runat="server" Width="40px">60</asp:TextBox>
                    &nbsp;minutes
                </td>
            </tr>
            <tr>
                <td valign="top">
                    Cats:                 </td>
                <td valign="top">
                    <asp:DropDownList ID="CategoriesListBox" runat="server" Width="150px" >
                    </asp:DropDownList>
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
                    <asp:TextBox ID="BodyTextBox" runat="server" Height="58px" TextMode="MultiLine" Width="150px" />
                    <br />
                </td>
            </tr>
            <tr>
                <td valign="top">
                    Crew:
                </td>
                <td valign="top">
                    <asp:TextBox ID="CrewTextBox" runat="server" Height="58px" TextMode="MultiLine" Width="150px" />
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
                    <asp:Button ID="Submit" Text="Submit" OnClick="Do_Insert" runat="server" />
                    <br />
                </td>
            </tr>
        </table>
    </div>    

