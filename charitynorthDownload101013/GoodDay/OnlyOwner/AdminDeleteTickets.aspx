<%@ Page Title="" Language="C#" MasterPageFile="~/Goodday/MasterAdmin.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="True" CodeFile="AdminDeleteTickets.aspx.cs" Inherits="AdminwithListBoxes" %>
<%--http://msdn.microsoft.com/en-us/library/ms178294(v=vs.90).aspx--%>
<asp:Content ID="Content1" ContentPlaceHolderID="headercontent" Runat="Server">

<script type="text/javascript">
  window.resizeTo(screen.width, screen.height);
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" Runat="Server">
  <table class="adminTable" style="width:100%;">
    <tr>
      <td valign="top" >
              Review Tickets and Responses
              <br />
              <br />
      </td>
      <td ></td>
      <td valign="top">
          &nbsp;</td>
    </tr>
    <tr>
      <td class="newTicket" valign="top">
        
        <asp:Label ID="Label12" CssClass="labels" runat="server" 
          Text="Summary- All Tickets"></asp:Label>
        &nbsp;&nbsp; <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
          Text="Rebind Data" />
        <br />
        
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
          DataKeyNames="ID" DataSourceID="SqlDataSource6" CellPadding="4" 
          ForeColor="#333333" GridLines="None" Width="550px" AllowSorting="True" 
          onrowediting="ChangeTextBoxWidths" onselectedindexchanged="ModeSelection" 
          onrowupdated="DetailsView_Update">
          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="Smaller" />
          <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID " InsertVisible="False" 
              ReadOnly="True" SortExpression="ID" >
            <HeaderStyle Width="30px" />
            </asp:BoundField>
            <asp:BoundField DataField="Company" HeaderText="Company" 
              SortExpression="Company" Visible="False" />
            <asp:BoundField DataField="DateIssue" HeaderText="Issued" 
              SortExpression="DateIssue" />
            <asp:BoundField DataField="HDRequestorFname" HeaderText="Requestor" 
              SortExpression="HDRequestorFname" Visible="False" />
            <asp:TemplateField HeaderText="Topic" SortExpression="HDAdmin">
              <EditItemTemplate>
                <asp:ListBox ID="ListBox5" runat="server" DataSourceID="XmlDataSource1" 
                  DataTextField="Name" DataValueField="Name" Rows="1" AppendDataBoundItems = "true"
                  SelectedValue='<%# Bind("HDAdmin") %>'>
                  <asp:ListItem Text="none" Value=""></asp:ListItem></asp:ListBox>
              </EditItemTemplate>
              <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("HDAdmin") %>'></asp:Label>
              </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status" SortExpression="HDTech">
              <EditItemTemplate>
                <asp:ListBox ID="ListBox6" runat="server" DataSourceID="XmlDataSource2" 
                  DataTextField="Name" DataValueField="Name" Rows="1" AppendDataBoundItems = "true"
                  SelectedValue='<%# Bind("HDTech") %>'>
                  <asp:ListItem Text="none" Value=""></asp:ListItem></asp:ListBox>
              </EditItemTemplate>
              <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("HDTech") %>'></asp:Label>
              </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Topic" HeaderText="TopicDontUse" 
              SortExpression="Topic" Visible="False" />
            <asp:BoundField DataField="Status" HeaderText="StatusDontUse" 
              SortExpression="Status" Visible="False" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
              SortExpression="Description" Visible="False" />
            <asp:CheckBoxField DataField="EmailSent" HeaderText="EmailSent" 
              SortExpression="EmailSent" Visible="False" />
            <asp:CheckBoxField DataField="ScreenshotSent" HeaderText="ScreenshotSent" 
              SortExpression="ScreenshotSent" Visible="False" />
            <asp:BoundField DataField="DateAddressed" HeaderText="Response " 
              SortExpression="DateAddressed" />
            <asp:BoundField DataField="DateResolved" HeaderText="DateResolved" 
              SortExpression="DateResolved" Visible="False" />
            <asp:BoundField DataField="HDNote" HeaderText="HDNote" 
              SortExpression="HDNote" Visible="False" />
            <asp:BoundField DataField="Role" HeaderText="Role" 
              SortExpression="Role" Visible="False" />
            <asp:BoundField DataField="HowLongdays" HeaderText="Days" 
              SortExpression="HowLongdays" />
            <asp:BoundField DataField="HDRequestorLname" HeaderText="HDRequestorLname" SortExpression="HDRequestorLname" 
              Visible="False" />
            <asp:CommandField 
              ShowSelectButton="True" ShowDeleteButton="True" ShowEditButton="True" />
          </Columns>
          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
          <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
          <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
            HorizontalAlign="Left" />
          <EditRowStyle BackColor="#999999" />
          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        <br />
        
      </td>
      <td class="middleColumn"></td>
      <td valign="top" >
        <asp:Label ID="Label13" runat="server" CssClass="labels" Text="Ticket Details"></asp:Label>
        <br />
        <asp:DetailsView class="detailsGrid" ID="DetailsView1" runat="server" AllowPaging="True" 
          AutoGenerateRows="False" CellPadding="4" DataKeyNames="ID" 
          DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" 
          Height="50px" Width="421px" 
          
          EmptyDataText="No data for the current selection, please selected another record." 
          onitemupdated="GridView_Update">
          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
          <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="Smaller" />
          <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
          <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
              ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Company" HeaderText="Company" 
              SortExpression="Company" />
            <asp:BoundField DataField="DateIssue" HeaderText="Date Issued" 
              SortExpression="DateIssue" />
            <asp:BoundField DataField="HowLongdays" HeaderText="Days" 
              SortExpression="HowLongdays" />
            <asp:BoundField DataField="HDRequestorFname" HeaderText="Name" 
              SortExpression="HDRequestorFname" />
            <asp:BoundField DataField="Role" HeaderText="Role" 
              SortExpression="Role" />
            <asp:TemplateField HeaderText="Topic" SortExpression="HDAdmin">
              <EditItemTemplate>
                <asp:ListBox ID="ListBox7" runat="server" DataSourceID="XmlDataSource1" 
                  DataTextField="Name" DataValueField="Name" Rows="1" AppendDataBoundItems = "true"
                  SelectedValue='<%# Bind("HDAdmin") %>'></asp:ListBox>
              </EditItemTemplate>
              <InsertItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HDAdmin") %>'></asp:TextBox>
              </InsertItemTemplate>
              <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("HDAdmin") %>'></asp:Label>
              </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status" SortExpression="HDTech">
              <EditItemTemplate>
                <asp:ListBox ID="ListBox8" runat="server" DataSourceID="XmlDataSource2" 
                  DataTextField="Name" DataValueField="Name" Rows="1" AppendDataBoundItems = "true"
                  SelectedValue='<%# Bind("HDTech") %>'></asp:ListBox>
              </EditItemTemplate>
              <InsertItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("HDTech") %>'></asp:TextBox>
              </InsertItemTemplate>
              <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("HDTech") %>'></asp:Label>
              </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Description" HeaderText="Description" 
              SortExpression="Description" />
            <asp:CheckBoxField DataField="EmailSent" HeaderText="EmailSent" 
              SortExpression="EmailSent" />
            <asp:CheckBoxField DataField="ScreenshotSent" HeaderText="ScreenshotSent" 
              SortExpression="ScreenshotSent" />
            <asp:BoundField DataField="DateAddressed" HeaderText="DateAddressed" 
              SortExpression="DateAddressed" />
            <asp:BoundField DataField="DateResolved" HeaderText="DateResolved" 
              SortExpression="DateResolved" />
            <asp:BoundField DataField="HDNote" HeaderText="Uploads" 
              SortExpression="HDNote" />
            <asp:BoundField DataField="HDRequestorLname" HeaderText="Downloads" 
              SortExpression="HDRequestorLname" />
            <asp:CommandField ShowEditButton="True" />
          </Fields>
          <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
          <EditRowStyle BackColor="#999999" />
          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:DetailsView>
        <br />
        
      </td>
    </tr>
    <tr>
      <td class="newTicket" valign="top">
        
        <asp:Label ID="Label14" runat="server" CssClass="labels" 
          Text="Ticket Responses"></asp:Label>
        <br />
        
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
          CellPadding="4" DataSourceID="SqlDataSource5" ForeColor="#333333" 
          GridLines="None" AllowSorting="True" DataKeyNames="ID" 
          EmptyDataText="No responses for this ticket." 
          onrowediting="DetailsView2_ChangeMode" 
          onselectedindexchanged="ModeSelection" onrowupdated="DetailsView2_Update" 
          Width="550px">
          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="Smaller" />
          <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" 
              SortExpression="ID" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="HDnum" HeaderText="Ticket" 
              SortExpression="HDnum" />
            <asp:BoundField DataField="DateNote" HeaderText="DateNote" 
              SortExpression="DateNote" />
            <asp:BoundField DataField="Initials" HeaderText="Initials" 
              SortExpression="Initials" />
            <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" />
            <asp:CommandField ShowEditButton="True" 
              ShowSelectButton="True" />
          </Columns>
          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
          <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
          <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
          <EditRowStyle BackColor="#999999" />
          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
        
      </td>
      <td class="middleColumn"></td>
      <td class="columnRight" valign="top" >
        <asp:Label ID="Label15" runat="server" CssClass="labels" 
          Text="Response Details"></asp:Label>
        &nbsp;&nbsp;
        <asp:Button ID="newResponseButton" runat="server" 
          onclick="newResponseButton_Click" Text="Toggle Input Form" />
        <br />
        <asp:DetailsView class="detailsGrid" ID="DetailsView2" runat="server" AutoGenerateRows="False" 
          CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource7" 
          ForeColor="#333333" GridLines="None" Height="50px" Width="351px" 
          AllowPaging="True" EmptyDataText="Please select a record." 
          oninit="ModeSelection" oniteminserted="DetailsView2_ItemInserted" 
          oniteminserting="DetailsView2_ItemInserting" 
          onprerender="ChangeTextBoxWidths" onitemupdated="GridView2_Update">
          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
          <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="Smaller" />
          <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
          <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
              ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="HDnum" HeaderText="Ticket" SortExpression="HDnum" />
            <asp:BoundField DataField="DateNote" HeaderText="DateNote" 
              SortExpression="DateNote" />
            <asp:BoundField DataField="Initials" HeaderText="Initials" 
              SortExpression="Initials" />
            <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" />
            <asp:CommandField 
              ShowInsertButton="True" ShowEditButton="True" />
          </Fields>
          <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
          <EditRowStyle BackColor="#999999" />
          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:DetailsView>
        
      </td>
    </tr>
  </table>
  <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
SelectCommand="SELECT [ID] FROM [HelpDesk] ORDER BY [DateIssue] DESC">  </asp:SqlDataSource>
  <asp:XmlDataSource ID="XmlDataSource2" runat="server" 
    DataFile="~/Goodday/App_Data/HelpDeskLists.xml" XPath="lookup/Status">
  </asp:XmlDataSource>
  <asp:XmlDataSource ID="XmlDataSource1" runat="server" 
    DataFile="~/Goodday/App_Data/HelpDeskLists.xml" XPath="lookup/Topic">
  </asp:XmlDataSource>
  <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
    ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
    DeleteCommand="DELETE FROM [HelpDesk] WHERE [ID] = @ID" 
    SelectCommand="SELECT * FROM [HelpDesk] WHERE ([ID] = @ID)" 
    InsertCommand="INSERT INTO [HelpDesk] ([Company], [DateIssue], [HowLongdays], [HDRequestorFname], [Role], [Topic], [Status], [EmailSent], [Description], [HDAdmin], [HDTech], [HDNote], [HDRequestorLname], [ScreenshotSent], [DateAddressed], [DateResolved]) VALUES (@Company, @DateIssue, @HowLongdays, @HDRequestorFname, @Role, @Topic, @Status, @EmailSent, @Description, @HDAdmin, @HDTech, @HDNote, @HDRequestorLname, @ScreenshotSent, @DateAddressed, @DateResolved)" 
    UpdateCommand="UPDATE [HelpDesk] SET [Company] = @Company, [DateIssue] = @DateIssue, [HowLongdays] = @HowLongdays, [HDRequestorFname] = @HDRequestorFname, [Role] = @Role, [Topic] = @Topic, [Status] = @Status, [EmailSent] = @EmailSent, [Description] = @Description, [HDAdmin] = @HDAdmin, [HDTech] = @HDTech, [HDNote] = @HDNote, [HDRequestorLname] = @HDRequestorLname, [ScreenshotSent] = @ScreenshotSent, [DateAddressed] = @DateAddressed, [DateResolved] = @DateResolved WHERE [ID] = @ID">
    <SelectParameters>
      <asp:ControlParameter ControlID="GridView1" Name="ID" 
        PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
    <DeleteParameters>
      <asp:Parameter Name="ID" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
      <asp:Parameter Name="Company" Type="Int32" />
      <asp:Parameter Name="DateIssue" Type="DateTime" />
      <asp:Parameter Name="HowLongdays" Type="String" />
      <asp:Parameter Name="HDRequestorFname" Type="String" />
      <asp:Parameter Name="Role" Type="String" />
      <asp:Parameter Name="Topic" Type="String" />
      <asp:Parameter Name="Status" Type="String" />
      <asp:Parameter Name="EmailSent" Type="Boolean" />
      <asp:Parameter Name="Description" Type="String" />
      <asp:Parameter Name="HDAdmin" Type="String" />
      <asp:Parameter Name="HDTech" Type="String" />
      <asp:Parameter Name="HDNote" Type="String" />
      <asp:Parameter Name="HDRequestorLname" Type="String" />
      <asp:Parameter Name="ScreenshotSent" Type="Boolean" />
      <asp:Parameter Name="DateAddressed" Type="DateTime" />
      <asp:Parameter Name="DateResolved" Type="DateTime" />
      <asp:Parameter Name="ID" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
      <asp:Parameter Name="Company" Type="Int32" />
      <asp:Parameter Name="DateIssue" Type="DateTime" />
      <asp:Parameter Name="HowLongdays" Type="String" />
      <asp:Parameter Name="HDRequestorFname" Type="String" />
      <asp:Parameter Name="Role" Type="String" />
      <asp:Parameter Name="Topic" Type="String" />
      <asp:Parameter Name="Status" Type="String" />
      <asp:Parameter Name="EmailSent" Type="Boolean" />
      <asp:Parameter Name="Description" Type="String" />
      <asp:Parameter Name="HDAdmin" Type="String" />
      <asp:Parameter Name="HDTech" Type="String" />
      <asp:Parameter Name="HDNote" Type="String" />
      <asp:Parameter Name="HDRequestorLname" Type="String" />
      <asp:Parameter Name="ScreenshotSent" Type="Boolean" />
      <asp:Parameter Name="DateAddressed" Type="DateTime" />
      <asp:Parameter Name="DateResolved" Type="DateTime" />
    </InsertParameters>
  </asp:SqlDataSource>
  <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
    ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
    
    SelectCommand="SELECT ID, HDnum, DateNote, Initials, Note FROM HDNotes WHERE (HDnum = @HDnum) ORDER BY DateNote DESC" 
    DeleteCommand="DELETE FROM [HDNotes] WHERE [ID] = @ID" 
    InsertCommand="INSERT INTO [HDNotes] ([HDnum], [DateNote], [Initials], [Note]) VALUES (@HDnum, @DateNote, @Initials, @Note)" 
    
    
    UpdateCommand="UPDATE [HDNotes] SET [HDnum] = @HDnum, [DateNote] = @DateNote, [Initials] = @Initials, [Note] = @Note WHERE [ID] = @ID">
    <SelectParameters>
      <asp:ControlParameter ControlID="GridView1" Name="HDnum" 
        PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
    <DeleteParameters>
      <asp:Parameter Name="ID" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
      <asp:Parameter Name="HDnum" Type="Int32" />
      <asp:Parameter DbType="DateTime2" Name="DateNote" />
      <asp:Parameter Name="Initials" Type="String" />
      <asp:Parameter Name="Note" Type="String" />
<%--      <asp:Parameter Name="SSMA_TimeStamp" Type="Object" />      
      <asp:Parameter Name="SSMA_TimeStamp" Type="Object" />
      <asp:Parameter Name="Uploads" Type="String" />
      <asp:Parameter Name="Downloads" Type="String" />--%>
      <asp:Parameter Name="ID" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
      <asp:Parameter Name="HDnum" Type="Int32" />
      <asp:Parameter DbType="DateTime2" Name="DateNote" />
      <asp:Parameter Name="Initials" Type="String" />
      <asp:Parameter Name="Note" Type="String" />
<%--      <asp:Parameter Name="SSMA_TimeStamp" Type="Object" />      
      <asp:Parameter Name="SSMA_TimeStamp" Type="Object" />
      <asp:Parameter Name="Uploads" Type="String" />
      <asp:Parameter Name="Downloads" Type="String" />--%>
    </InsertParameters>
  </asp:SqlDataSource>
  
  <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
    ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
    DeleteCommand="DELETE FROM [HelpDesk] WHERE [ID] = @ID" 
    SelectCommand="SELECT * FROM [HelpDesk] ORDER BY [DateIssue] DESC"    
    InsertCommand="INSERT INTO [HelpDesk] ([Company], [DateIssue], [HowLongdays], [HDRequestorFname], [Role], [Topic], [Status], [EmailSent], [Description], [HDAdmin], [HDTech], [HDNote], [HDRequestorLname], [ScreenshotSent], [DateAddressed], [DateResolved]) VALUES (@Company, @DateIssue, @HowLongdays, @HDRequestorFname, @Role, @Topic, @Status, @EmailSent, @Description, @HDAdmin, @HDTech, @HDNote, @HDRequestorLname, @ScreenshotSent, @DateAddressed, @DateResolved)" 
    UpdateCommand="UPDATE [HelpDesk] SET [Company] = @Company, [DateIssue] = @DateIssue, [HowLongdays] = @HowLongdays, [HDRequestorFname] = @HDRequestorFname, [Role] = @Role, [Topic] = @Topic, [Status] = @Status, [EmailSent] = @EmailSent, [Description] = @Description, [HDAdmin] = @HDAdmin, [HDTech] = @HDTech, [HDNote] = @HDNote, [HDRequestorLname] = @HDRequestorLname, [ScreenshotSent] = @ScreenshotSent, [DateAddressed] = @DateAddressed, [DateResolved] = @DateResolved WHERE [ID] = @ID">    
    <DeleteParameters>
      <asp:Parameter Name="ID" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
      <asp:Parameter Name="Company" Type="Int32" />
      <asp:Parameter Name="DateIssue" Type="DateTime" />
      <asp:Parameter Name="HowLongdays" Type="String" />
      <asp:Parameter Name="HDRequestorFname" Type="String" />
      <asp:Parameter Name="Role" Type="String" />
      <asp:Parameter Name="Topic" Type="String" />
      <asp:Parameter Name="Status" Type="String" />
      <asp:Parameter Name="EmailSent" Type="Boolean" />
      <asp:Parameter Name="Description" Type="String" />
      <asp:Parameter Name="HDAdmin" Type="String" />
      <asp:Parameter Name="HDTech" Type="String" />
      <asp:Parameter Name="HDNote" Type="String" />
      <asp:Parameter Name="HDRequestorLname" Type="String" />
      <asp:Parameter Name="ScreenshotSent" Type="Boolean" />
      <asp:Parameter Name="DateAddressed" Type="DateTime" />
      <asp:Parameter Name="DateResolved" Type="DateTime" />
      <asp:Parameter Name="ID" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
      <asp:Parameter Name="Company" Type="Int32" />
      <asp:Parameter Name="DateIssue" Type="DateTime" />
      <asp:Parameter Name="HowLongdays" Type="String" />
      <asp:Parameter Name="HDRequestorFname" Type="String" />
      <asp:Parameter Name="Role" Type="String" />
      <asp:Parameter Name="Topic" Type="String" />
      <asp:Parameter Name="Status" Type="String" />
      <asp:Parameter Name="EmailSent" Type="Boolean" />
      <asp:Parameter Name="Description" Type="String" />
      <asp:Parameter Name="HDAdmin" Type="String" />
      <asp:Parameter Name="HDTech" Type="String" />
      <asp:Parameter Name="HDNote" Type="String" />
      <asp:Parameter Name="HDRequestorLname" Type="String" />
      <asp:Parameter Name="ScreenshotSent" Type="Boolean" />
      <asp:Parameter Name="DateAddressed" Type="DateTime" />
      <asp:Parameter Name="DateResolved" Type="DateTime" />
    </InsertParameters>
  </asp:SqlDataSource>
  
  <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
    ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
    DeleteCommand="DELETE FROM [HDNotes] WHERE [ID] = @ID" 
    InsertCommand="INSERT INTO [HDNotes] ([HDnum], [DateNote], [Initials], [Note]) VALUES (@HDnum, @DateNote, @Initials, @Note)" 
    SelectCommand="SELECT * FROM [HDNotes] WHERE ([ID] = @ID)" 
    
    UpdateCommand="UPDATE [HDNotes] SET [HDnum] = @HDnum, [DateNote] = @DateNote, [Initials] = @Initials, [Note] = @Note WHERE [ID] = @ID">
    <SelectParameters>
      <asp:ControlParameter ControlID="GridView2" Name="ID" 
        PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
    <DeleteParameters>
      <asp:Parameter Name="ID" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
      <asp:Parameter Name="HDnum" Type="Int32" />
      <asp:Parameter DbType="DateTime2" Name="DateNote" />
      <asp:Parameter Name="Initials" Type="String" />
      <asp:Parameter Name="Note" Type="String" />

      <asp:Parameter Name="ID" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
      <asp:Parameter Name="HDnum" Type="Int32" />
      <asp:Parameter DbType="DateTime2" Name="DateNote" />
      <asp:Parameter Name="Initials" Type="String" />
      <asp:Parameter Name="Note" Type="String" />

    </InsertParameters>
  </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footercontent" Runat="Server">
</asp:Content>
<%--WHERE (([Description] IS NOT NULL) OR ([HDTech] IS NOT NULL))--%>
<%--    InsertCommand="INSERT INTO [HelpDesk] ([Company], [DateIssue], [HDRequestorFname], [Topic], [Status], [Description], [EmailSent], [ScreenshotSent], [DateAddressed], [HDAdmin], [DateResolved], [HDTech], [HDNote], [Role], [HowLongdays], [HDRequestorLname]) VALUES (@Company, @DateIssue, @HDRequestorFname, @Topic, @Status, @Description, @EmailSent, @ScreenshotSent, @DateAddressed, @HDAdmin, @DateResolved, @HDTech, @HDNote, @Role, @HowLongdays, @HDRequestorLname)" 
    UpdateCommand="UPDATE [HelpDesk] SET [Company] = @Company, [DateIssue] = @DateIssue, [HDRequestorFname] = @HDRequestorFname, [Topic] = @Topic, [Status] = @Status, [Description] = @Description, [EmailSent] = @EmailSent, [ScreenshotSent] = @ScreenshotSent, [DateAddressed] = @DateAddressed, [HDAdmin] = @HDAdmin, [DateResolved] = @DateResolved, [HDTech] = @HDTech, [HDNote] = @HDNote, [Role] = @Role, [HowLongdays] = @HowLongdays, [HDRequestorLname] = @HDRequestorLname WHERE [ID] = @ID">
    <UpdateParameters>
      <asp:Parameter Name="Company" Type="Int32" />
      <asp:Parameter DbType="DateTime2" Name="DateIssue" />
      <asp:Parameter Name="HDRequestorFname" Type="String" />
      <asp:Parameter Name="Topic" Type="String" />
      <asp:Parameter Name="Status" Type="String" />
      <asp:Parameter Name="Description" Type="String" />
      <asp:Parameter Name="EmailSent" Type="Boolean" />
      <asp:Parameter Name="ScreenshotSent" Type="Boolean" />
      <asp:Parameter DbType="DateTime2" Name="DateAddressed" />
      <asp:Parameter Name="HDAdmin" Type="String" />
      <asp:Parameter DbType="DateTime2" Name="DateResolved" />
      <asp:Parameter Name="HDTech" Type="String" />
      <asp:Parameter Name="HDNote" Type="String" />
      <asp:Parameter Name="Role" Type="String" />
      <asp:Parameter Name="HowLongdays" Type="String" />
      <asp:Parameter Name="HDRequestorLname" Type="String" />
      <asp:Parameter Name="ID" Type="Int32" />
    </UpdateParameters>    
    
    --%>
<%--    InsertCommand="INSERT INTO [HelpDesk] ([Company], [DateIssue], [HDRequestorFname], [Topic], [Status], [Description], [EmailSent], [ScreenshotSent], [DateAddressed], [HDAdmin], [DateResolved], [HDTech], [HDNote], [Role], [HowLongdays], [HDRequestorLname]) VALUES (@Company, @DateIssue, @HDRequestorFname, @Topic, @Status, @Description, @EmailSent, @ScreenshotSent, @DateAddressed, @HDAdmin, @DateResolved, @HDTech, @HDNote, @Role, @HowLongdays, @HDRequestorLname)" 
    UpdateCommand="UPDATE [HelpDesk] SET [Company] = @Company, [DateIssue] = @DateIssue, [HDRequestorFname] = @HDRequestorFname, [Topic] = @Topic, [Status] = @Status, [Description] = @Description, [EmailSent] = @EmailSent, [ScreenshotSent] = @ScreenshotSent, [DateAddressed] = @DateAddressed, [HDAdmin] = @HDAdmin, [DateResolved] = @DateResolved, [HDTech] = @HDTech, [HDNote] = @HDNote, [Role] = @Role, [HowLongdays] = @HowLongdays, [HDRequestorLname] = @HDRequestorLname WHERE [ID] = @ID">
    
    <UpdateParameters>
      <asp:Parameter Name="Company" Type="Int32" />
      <asp:Parameter DbType="DateTime2" Name="DateIssue" />
      <asp:Parameter Name="HDRequestorFname" Type="String" />
      <asp:Parameter Name="Topic" Type="String" />
      <asp:Parameter Name="Status" Type="String" />
      <asp:Parameter Name="Description" Type="String" />
      <asp:Parameter Name="EmailSent" Type="Boolean" />
      <asp:Parameter Name="ScreenshotSent" Type="Boolean" />
      <asp:Parameter DbType="DateTime2" Name="DateAddressed" />
      <asp:Parameter Name="HDAdmin" Type="String" />
      <asp:Parameter DbType="DateTime2" Name="DateResolved" />
      <asp:Parameter Name="HDTech" Type="String" />
      <asp:Parameter Name="HDNote" Type="String" />
      <asp:Parameter Name="Role" Type="String" />
      <asp:Parameter Name="HowLongdays" Type="String" />
      <asp:Parameter Name="HDRequestorLname" Type="String" />
      <asp:Parameter Name="SSMA_TimeStamp" Type="Object" />

      <asp:Parameter Name="ID" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
      <asp:Parameter Name="Company" Type="Int32" />
      <asp:Parameter DbType="DateTime2" Name="DateIssue" />
      <asp:Parameter Name="HDRequestorFname" Type="String" />
      <asp:Parameter Name="Topic" Type="String" />
      <asp:Parameter Name="Status" Type="String" />
      <asp:Parameter Name="Description" Type="String" />
      <asp:Parameter Name="EmailSent" Type="Boolean" />
      <asp:Parameter Name="ScreenshotSent" Type="Boolean" />
      <asp:Parameter DbType="DateTime2" Name="DateAddressed" />
      <asp:Parameter Name="HDAdmin" Type="String" />
      <asp:Parameter DbType="DateTime2" Name="DateResolved" />
      <asp:Parameter Name="HDTech" Type="String" />
      <asp:Parameter Name="HDNote" Type="String" />
      <asp:Parameter Name="Role" Type="String" />
      <asp:Parameter Name="HowLongdays" Type="String" />
      <asp:Parameter Name="HDRequestorLname" Type="String" />
      <asp:Parameter Name="SSMA_TimeStamp" Type="Object" />
     
    </InsertParameters>    
    --%>