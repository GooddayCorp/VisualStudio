<%@ Page Title="Trouble Tickets" Language="C#" MasterPageFile="~/Goodday/MasterAdmin.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="True" CodeFile="Members.aspx.cs" EnableEventValidation="false" Inherits="Members2" %>
<%@ MasterType virtualpath="~/Goodday/MasterAdmin.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headercontent" Runat="Server">   

  <script language="javascript" type="text/javascript"> 
    function LinkClicked(ListBox) {
      var itemClicked = ListBox.options[ListBox.selectedIndex];
        window.open(itemClicked.value, '_blank');
    } 
  </script> 
  <style type="text/css">
    .style6
    {
      width: 403px;
    }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" Runat="Server">
  <table id="mainTable" width="90%">
    <tr>
      <td valign="top" class="style6">
        <asp:Label ID="Label9" class="headlabels" runat="server" Text="Trouble Ticket Home Page" ></asp:Label>
        <br /><br />
      </td>
      <td class="middleColumn"> 
         </td>
      <td>
              <asp:Label ID="Label10" class="headlabels" runat="server" Text="Ticket Summary" 
                Font-Bold="True" ></asp:Label>
         </td>
    </tr>
    <tr>
      <td valign="top" class="style6" >
        <table class="ticketBox" >
          <tr >
            <td class="topRow">Submit a Trouble Ticket</td>
          </tr>
          <tr >
            <td class="ticketRow"><br />
              <asp:Label ID="Label1" class="labels" runat="server" Text="Name" ></asp:Label>
              <asp:TextBox ID="txtName" class="textboxes" runat="server" ></asp:TextBox>
            </td>
          </tr>
          <tr >
            <td class="ticketRow">
              <asp:Label ID="Label3" class="labels" runat="server" Text="Company Role" ></asp:Label>
              <asp:TextBox ID="TextBox2" class="textboxes" runat="server" ></asp:TextBox>&nbsp;
            </td>
          </tr>
          <tr >
            <td class="ticketRow">
              <asp:Label ID="Label4" class="labels" runat="server" Text="Issue Topic" ></asp:Label>
              <asp:ListBox ID="ListBox1" class="textboxes" runat="server" 
             DataSourceID="XmlDataSource1" Rows="1" DataTextField="Name" DataValueField="Name" >
              </asp:ListBox>
            </td>
          </tr>
          <tr >
            <td class="ticketRow">
              <asp:Label ID="Label5" class="labels" runat="server" Text="How many days since the issue began?" ></asp:Label>
              <asp:TextBox ID="TextBox4" class="textboxes" runat="server" Width="50px" ></asp:TextBox>
            </td>
          </tr>
          <tr >
            <td class="ticketRow">

            </td>
          </tr>
          <tr >
            <td class="ticketRow">
              <asp:Label ID="Label6" class="labels" runat="server" Text="Please upload screen shots for the item you need help with, if it is applicable." ></asp:Label>              
            </td>
          </tr>
          <tr >
            <td class="ticketRow">
              <asp:Label ID="Label7" class="labels" runat="server" Text="Upload Here:  " ></asp:Label> <br />
              <asp:FileUpload ID="FileUpload1" runat="server" Height="21px" Width="242px" />
              <asp:Button ID="uploadButton" 
                runat="server" Text="Upload" 
                onclick="uploadButton_Click" Height="22px" />
              <br />
              <asp:Label ID="Label12" runat="server" ForeColor="#009900" ></asp:Label> 
              &nbsp;
              <asp:Label ID="statusLabel" runat="server" ForeColor="#009900" ></asp:Label> 
              <br />
                <asp:Label ID="Label13" class="labels" runat="server" Text="Download Here:   " ></asp:Label><br />
                <asp:ListBox ID="ListBox2" runat="server" AppendDataBoundItems="True" 
                  AutoPostBack="True" DataSourceID="XmlDataSource2" DataTextField="Name" 
                  DataValueField="Value" SelectionMode="Single" 
                onselectedindexchanged="ListBox2_SelectedIndexChanged"></asp:ListBox>
                <br />
                <asp:Label ID="Label14" runat="server" ForeColor="#009900" ></asp:Label> 
                <br />

            </td>
          </tr>
          <tr >
            <td class="ticketRow">
              <asp:Label ID="Label8" class="labels" runat="server" Text="Description" ></asp:Label><br />
              <asp:TextBox ID="TextBox7" class="textboxes" runat="server" Height="100px" 
                Width="310px" ></asp:TextBox>
              <asp:Button ID="submitButton" class="textboxes" 
                runat="server" Text="Submit" 
                onclick="submitButton_Click" Width="75px" 
                ToolTip="Click only once, it takes a moment for the database to update. Refresh the screen, by clicking Members on the Menu, to see the latest tickets." />             
              <br />             
            </td>
          </tr>
          <tr >
            <td class="bottomRow">&nbsp;</td>
          </tr>
        </table>  
      </td>
      <td class="middleColumn">
         &nbsp;</td>
      <td class="ticketSummary">
         <table class="summaryGrid">
          <tr>
            <td >
              &nbsp;</td>
          </tr>
                   <tr>
            <td >
              <asp:Label ID="Label11" class="labels" runat="server" Text="All your tickets are listed here. The Tickets are list, most recent first. For more details, click on the ticket." 
                Font-Bold="False" ></asp:Label>
            </td>
          </tr>
          <tr>
            <td >
              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource2" 
                ForeColor="#333333" GridLines="None" 
                onrowselectedchanged="GridView1_RowSelectedChanged"
                onrowcreated="GridView1_RowCreated" 
                onselectedindexchanged="GridView1_SelectedIndexChanged" 
                onselectedindexchanging="GridView1_SelectedIndexChanging" Width="550px" 
                
                
                ToolTip="Refresh the screen, by clicking Members on the Menu, to see the latest tickets." 
                BackColor="#66FFFF">
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <Columns>
                  <asp:CommandField ShowSelectButton="True" Visible="False" />
                  <asp:BoundField DataField="ID" HeaderText="Ticket" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ID" />
                  <asp:BoundField DataField="Company" HeaderText="Company" 
                    SortExpression="Company" Visible="False" />
                  <asp:BoundField DataField="DateIssue" HeaderText="Date/Time Opened" 
                    SortExpression="DateIssue" />
                  <asp:BoundField DataField="HDRequestorFname" HeaderText="HDRequestorFname" 
                    SortExpression="HDRequestorFname" Visible="False" />
                  <asp:BoundField DataField="HDAdmin" HeaderText="TopicDontUse" 
                    SortExpression="Topic" Visible="False" />
                  <asp:CheckBoxField DataField="EmailSent" HeaderText="EmailSent" 
                    SortExpression="EmailSent" Visible="False" />
                  <asp:BoundField DataField="Description" HeaderText="Description" 
                    SortExpression="Description" Visible="False" />
                  <asp:CheckBoxField DataField="ScreenshotSent" HeaderText="ScreenshotSent" 
                    SortExpression="ScreenshotSent" Visible="False" />
                  <asp:BoundField DataField="HDAdmin" HeaderText="Topic" 
                    SortExpression="HDAdmin" />
                  <asp:BoundField DataField="DateResolved" HeaderText="DateResolved" 
                    SortExpression="DateResolved" Visible="False" />
                  <asp:BoundField DataField="HDTech" HeaderText="Status" 
                    SortExpression="HDTech" />
                  <asp:BoundField DataField="HDNote" HeaderText="HDNote" SortExpression="HDNote" 
                    Visible="False" />
                  <asp:BoundField DataField="Status" HeaderText="StatusDontUse" 
                    SortExpression="Status" Visible="False" />
                  <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" 
                    Visible="False" />
                  <asp:BoundField DataField="HowLongdays" HeaderText="Days" 
                    SortExpression="Days" />
                  <asp:BoundField DataField="HDRequestorLname" HeaderText="HDRequestorLname" 
                    SortExpression="HDRequestorLname" Visible="False" />
                  <asp:BoundField DataField="DateAddressed" HeaderText="Last Response Date" 
                    SortExpression="DateAddressed" Visible="False" />
                </Columns>
                <FooterStyle BackColor="#6AE6D9" Font-Bold="True" ForeColor="#009999" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#6ae6d9" Font-Bold="True" ForeColor="#009999" />
                <EditRowStyle BackColor="#999999" />
                <AlternatingRowStyle BackColor="#CCFFFF" ForeColor="#284775" />
              </asp:GridView>
              
              <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
                AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="SqlDataSource3" 
                Height="50px" Width="320px">
                <Fields>
                  <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                    ReadOnly="True" SortExpression="ID" />
                  <asp:BoundField DataField="HDnum" HeaderText="HDnum" SortExpression="HDnum" />
                  <asp:BoundField DataField="DateNote" HeaderText="DateNote" 
                    SortExpression="DateNote" />
                  <asp:BoundField DataField="Initials" HeaderText="Initials" 
                    SortExpression="Initials" />
                  <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" />
                </Fields>
              </asp:DetailsView>
              <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
                SelectCommand="SELECT * FROM [HDNotes] WHERE ([HDnum] = @HDnum) ORDER BY [DateNote] DESC">
                <SelectParameters>
                  <asp:ControlParameter ControlID="GridView1" Name="HDnum" 
                    PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
              </asp:SqlDataSource>
              
              <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
                
                SelectCommand="SELECT * FROM [HelpDesk] WHERE ([Company] = @Company2) ORDER BY [DateIssue] DESC">
                <SelectParameters>
                  <asp:SessionParameter Name="Company2" SessionField="Id" Type="Int32" />
                </SelectParameters>
              </asp:SqlDataSource>
            </td>
          </tr>
          <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/Goodday/App_Data/HelpDeskLists.xml" XPath="lookup/Topic">  
          </asp:XmlDataSource>
          <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/Goodday/App_Data/HelpDeskLists.xml" XPath="lookup/Downloads">
          </asp:XmlDataSource>
         </table>
      </td>
    </tr>
    <tr>
      <td valign="top" class="style6" >&nbsp;
         </td>
      <td class="middleColumn">
         </td>
      <td>
         </td>
    </tr>
  </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footercontent" Runat="Server">
</asp:Content>

