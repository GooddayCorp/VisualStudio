<%@ Page Title="" Language="C#" MasterPageFile="~/Goodday/MasterAdmin.master" AutoEventWireup="true" CodeFile="TicketDetails.aspx.cs" 
EnableEventValidation="false" Inherits="TicketDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headercontent" Runat="Server">
  <style type="text/css">
    .style5
    {
      padding-left: 10px;
      color: #4B8EB8;
    }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" Runat="Server">
  <table id="mainTable" >
    <tr>
      <td valign="top" >
        <asp:Label ID="Label9" class="headlabels" runat="server" 
          Text="Trouble Ticket Details" ></asp:Label>
        <br /><br />
        <asp:Label ID="Label12" class="headlabels" runat="server" 
          Text="Original Ticket Information" ></asp:Label>
        <br />
      </td>
            <td class="middleColumn">
      </td>
      <td valign="top">
        &nbsp;<asp:Label ID="Label10" class="headlabels" runat="server" Text="Ticket Responses" margin-left="20px"></asp:Label>
        &nbsp;&nbsp;&nbsp;</td>
    </tr>
    <tr>
      <td valign="top" >
        <table class="ticketBox">
          <tr >
            <td class="topRow" > 
              <asp:Label ID="HelpTicketLabel" class="labels" runat="server" Width="110px" >Ticket #:</asp:Label>
              <asp:Label ID="HelpTicketLabel2" class="labels" runat="server" Width="250px" ></asp:Label>
              <br />
&nbsp;</td>
          </tr>
          <tr >
            <td class="ticketRow">
              <asp:Label ID="Label1" class="labels" runat="server" Text="Name:" ></asp:Label>
              &nbsp;<asp:Label ID="Label15" class="" runat="server" Text="Label"></asp:Label>
            </td>
          </tr>
          <tr >
            <td class="ticketRow">
              <asp:Label ID="Label3" class="labels" runat="server" Text="Company Role:" ></asp:Label>
              &nbsp; <asp:Label ID="Label17" class="" runat="server" Text="Label"></asp:Label>
            </td>
          </tr>
          <tr >
            <td class="ticketRow">
              &nbsp;</td>
          </tr>
          <tr >
            <td class="ticketRow">
              <asp:Label ID="Label4" class="labels" runat="server" Text="Issue Topic:" ></asp:Label>
              &nbsp;<asp:Label ID="Label18" class="" runat="server" Text="Label"></asp:Label>
            </td>
          </tr>
          <tr >
            <td class="ticketRow">
              <asp:Label ID="Label5" class="labels" runat="server" Text="How many days since the issue began?" ></asp:Label>
              &nbsp;<asp:Label ID="Label19" class="" runat="server" Text="Label"></asp:Label>
            </td>
          </tr>
          <tr >
            <td class="ticketRow">
              <asp:Label ID="Label8" class="labels" runat="server" Text="Description:" ></asp:Label>&nbsp;
              <asp:Label ID="Label21" runat="server" Text="Label"></asp:Label>
              
            </td>
          </tr>
          <tr >
            <td class="ticketRow">
              &nbsp;&nbsp;&nbsp;
                            
            </td>
          </tr>
          <tr >
            <td class="style5">
              <br />
              
            </td>
          </tr>
          <tr >
            <td class="style5">
            <br />
              <asp:Label ID="Label7" class="labels" runat="server" Text="Uploads:" ></asp:Label>
              &nbsp;
              <asp:Label ID="Label20" runat="server" Text="Label"></asp:Label>
              
            </td>
          </tr>
          <tr >
            <td class="style5">
            <br />
              <asp:Label ID="Label2" class="labels" runat="server" Text="Downloads:" ></asp:Label>
              &nbsp; <asp:Label ID="Label16" runat="server" Text="Label"></asp:Label>
              
            </td>
          </tr>
          <tr >
            <td class="bottomRow">
              <br />
&nbsp;</td>
          </tr>
        </table>  
      </td>
      <td class="middleColumn">
      </td>
      <td class="ticketSummary" valign="top">
         <table class="summaryGrid">
            <tr>
              <td >
                <asp:Label ID="Label11" class="labels" runat="server" 
                  Text="Ticket responses currently in the database are listed; to add a new response use the add new response form below.">
                </asp:Label>
              </td>
            </tr>
            <tr>
              <td  >              
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
                  AutoGenerateColumns="False" BorderColor="#009999" 
                  BorderStyle="Solid" BorderWidth="1px" DataKeyNames="ID" 
                  DataSourceID="SqlDataSource4" ForeColor="#009999" Width="400px" 
                  onselectedindexchanged="GridView2_SelectedIndexChanged" 
                  EmptyDataText="There are no responses in the database for this ticket." 
                  BackColor="White">
                  <RowStyle Font-Size="Smaller" />
                  <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                      ReadOnly="True" SortExpression="ID" Visible="False" />
                    <asp:BoundField DataField="HDnum" HeaderText="HDnum" SortExpression="HDnum" 
                      Visible="False" />
                    <asp:BoundField DataField="DateNote" HeaderText="Date" 
                      SortExpression="DateNote" />
                    <asp:BoundField DataField="Initials" HeaderText="Responder" 
                      SortExpression="Initials" />
                    <asp:BoundField DataField="Note" HeaderText="Response" SortExpression="Note" />
                  </Columns>
                  <PagerStyle BackColor="#6AE6D9" />
                  <HeaderStyle BackColor="#6AE6D9" BorderColor="#009999" BorderStyle="Solid" 
                    BorderWidth="1px" ForeColor="#009999" />
                  <AlternatingRowStyle BackColor="#CCFFFF" />
                </asp:GridView>              
              </td>
            </tr>
            <tr>
              <td ><br />
                <asp:Label ID="Label13" class="labels" runat="server" 
                 Text="Date and Name are auto-filled for you.">
                </asp:Label>
                <br />
                <br />
                <asp:Label ID="Label14" class="labels" runat="server" 
                  style="text-align:left;vertical-align:bottom;"
                  Text="Add A New Response Here:" BackColor="#6AE6D9" Height="30px"
                  Width="400px"></asp:Label>
                <br />
                <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
                  AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="SqlDataSource4" 
                  Height="50px" Width="400px" CellPadding="4" ForeColor="#333333" 
                  GridLines="None" DefaultMode="Insert" 
                  oniteminserted="DetailsView1_ItemInserted" 
                  onprerender="ChangeTextBoxWidths" BorderColor="#009999" BorderStyle="Solid" 
                  BorderWidth="1px" HorizontalAlign="Left" 
                  oniteminserting="DetailsView1_ItemInserting">
                  <FooterStyle cssclass="gridBar" />
                  <CommandRowStyle cssclass="gridBar" BackColor="#6AE6D9" ForeColor="#009999" 
                    Font-Bold="True"/>
                  <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                  <FieldHeaderStyle Width="0px" />
                  <PagerStyle cssclass="gridBar" HorizontalAlign="Center" />
                  <Fields>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                      ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="HDnum" HeaderText="HDnum" SortExpression="HDnum" 
                      Visible="False" />
                    <asp:BoundField DataField="DateNote" HeaderText="DateNote " 
                      SortExpression="DateNote" Visible="False" />
                    <asp:BoundField DataField="Initials" HeaderText="Initials" 
                      SortExpression="Initials" Visible="False" />
                    <asp:BoundField DataField="Note" SortExpression="Note" />
                    <asp:CommandField ShowInsertButton="True" HeaderText="Add A New Response Here:" 
                      InsertText="Submit" >
                    <FooterStyle CssClass="gridBar" />
                    <HeaderStyle CssClass="gridBar" />
                    </asp:CommandField>
                  </Fields>
                  <HeaderStyle cssclass="gridBar"/>
                  <EditRowStyle cssclass="gridBar"/>
                  <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:DetailsView>               
              </td>
            </tr>
         </table>
      </td>
    </tr>     
  </table>
       <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
          ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
          DeleteCommand="DELETE FROM [HDNotes] WHERE [ID] = @ID" 
          InsertCommand="INSERT INTO [HDNotes] ([HDnum], [DateNote], [Initials], [Note]) VALUES (@HDnum, @DateNote, @Initials, @Note)" 
          SelectCommand="SELECT * FROM [HDNotes] WHERE ([HDnum] = @HDnum) ORDER BY [DateNote] DESC"            
          UpdateCommand="UPDATE [HDNotes] SET [HDnum] = @HDnum, [DateNote] = @DateNote, [Initials] = @Initials, [Note] = @Note WHERE [ID] = @ID">
          <SelectParameters>
            <asp:QueryStringParameter Name="HDnum" QueryStringField="HDnum" Type="Int32" />
          </SelectParameters>
          <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
          </DeleteParameters>
          <UpdateParameters>
            <asp:Parameter Name="HDnum" Type="Int32" />
            <asp:Parameter Name="DateNote" DbType="DateTime2" />
            <asp:SessionParameter Name="Initials" SessionField="Username" Type="String" />
            <asp:Parameter Name="Note" Type="String" />
<%--                  <asp:Parameter Name="SSMA_TimeStamp" Type="Object" />--%>
                  <asp:Parameter Name="ID" Type="Int32" />
          </UpdateParameters>
          <InsertParameters>
            <asp:QueryStringParameter Name="HDnum" QueryStringField="HDnum" Type="Int32" />
            <asp:Parameter Name="DateNote"  DbType="DateTime2" />
            <asp:SessionParameter Name="Initials" SessionField="Username" Type="String" />
            <asp:Parameter Name="Note" Type="String" />
<%--                  <asp:Parameter Name="SSMA_TimeStamp" Type="Object" />--%>
                </InsertParameters>
        </asp:SqlDataSource>

  <br />
  <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
    DataSourceID="SqlDataSource5" Height="50px" Visible="False">
    <Fields>
      <asp:BoundField DataField="DateIssue" HeaderText="DateIssue" 
        SortExpression="DateIssue" />
      <asp:BoundField DataField="HDRequestorFname" HeaderText="HDRequestorFname" 
        SortExpression="HDRequestorFname" />
      <asp:BoundField DataField="HDAdmin" HeaderText="HDAdmin" 
        SortExpression="HDAdmin" />
      <asp:BoundField DataField="HDNote" HeaderText="HDNote" 
        SortExpression="HDNote" />
      <asp:BoundField DataField="Description" HeaderText="Description" 
        SortExpression="Description" />
      <asp:BoundField DataField="Role" HeaderText="Role" 
        SortExpression="Role" />
      <asp:BoundField DataField="HowLongdays" HeaderText="HowLongdays" 
        SortExpression="HowLongdays" />
      <asp:BoundField DataField="HDRequestorLname" HeaderText="HDRequestorLname" 
        SortExpression="HDRequestorLname" />
    </Fields>
  </asp:DetailsView>
  <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
    ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
    SelectCommand="SELECT [DateIssue], [HDRequestorFname], [HDAdmin], [HDNote], [Description], [Role], [HowLongdays], [HDRequestorLname] FROM [HelpDesk] WHERE ([ID] = @ID)">
    <SelectParameters>
      <asp:QueryStringParameter Name="ID" QueryStringField="HDnum" Type="Int32" />
    </SelectParameters>
  </asp:SqlDataSource>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footercontent" Runat="Server">
</asp:Content>

