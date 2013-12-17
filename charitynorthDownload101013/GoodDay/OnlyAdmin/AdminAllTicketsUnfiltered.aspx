<%@ Page Title="" Language="C#" MasterPageFile="~/Goodday/MasterAdmin.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="True" CodeFile="AdminAllTicketsUnfiltered.aspx.cs" Inherits="AdminAllTicketsUnfiltered" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headercontent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" Runat="Server">
  <asp:Label ID="Label5" runat="server" Text="Find Company:  " Visible="False"></asp:Label>
  <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" 
    DataSourceID="SqlDataSource3" DataTextField="Company" DataValueField="Company" 
    Rows="1" Width="297px" Visible="False"></asp:ListBox>
  &nbsp;&nbsp;
  <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
    Text="Rebind Data" Visible="False" />
    
  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource2" 
    ForeColor="#333333" GridLines="None" 
    onrowupdated="DetailsView_Update">
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="Smaller" 
      BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
    <Columns>
      <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
        ReadOnly="True" SortExpression="ID" />
      <asp:BoundField DataField="Company" HeaderText=" Co" 
        SortExpression="Company" />
      <asp:BoundField DataField="DateIssue" HeaderText=" Issued" 
        SortExpression="DateIssue" />
      <asp:BoundField DataField="HDRequestorFname" HeaderText=" Name" 
        SortExpression="HDRequestorFname" />
      <asp:BoundField DataField="Description" HeaderText=" Description" 
        SortExpression="Description" Visible="False" />

      <asp:TemplateField HeaderText=" Topic" SortExpression="HDAdmin">
        <EditItemTemplate>
          <asp:ListBox ID="ListBox6" runat="server" DataSourceID="XmlDataSource1" 
            DataTextField="Name" DataValueField="Name" Rows="1" 
            SelectedValue='<%# Bind("HDAdmin") %>'></asp:ListBox>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label1" runat="server" Text='<%# Bind("HDAdmin") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:TemplateField HeaderText=" Status" SortExpression="HDTech">
        <EditItemTemplate>
          <asp:ListBox ID="ListBox7" runat="server" DataSourceID="XmlDataSource2" 
            DataTextField="Name" DataValueField="Name" Rows="1" 
            SelectedValue='<%# Bind("HDTech") %>'></asp:ListBox>
        </EditItemTemplate>
        <ItemTemplate>
          <asp:Label ID="Label2" runat="server" Text='<%# Bind("HDTech") %>'></asp:Label>
        </ItemTemplate>
      </asp:TemplateField>
      <asp:BoundField DataField="HDNote" HeaderText=" Uploads" 
        SortExpression="HDNote" >
      </asp:BoundField>
      <asp:BoundField DataField="Role" HeaderText=" Role" 
        SortExpression="Role" Visible="False" />
      <asp:BoundField DataField="HowLongdays" HeaderText=" Days" 
        SortExpression="HowLongdays" />
      <asp:BoundField DataField="HDRequestorLname" HeaderText=" Downloads" 
        SortExpression="HDRequestorLname" />
      <asp:BoundField DataField="DateResolved" HeaderText=" Resolved" 
        SortExpression="DateResolved" Visible="False" />
      <asp:CommandField ShowEditButton="True" />
    </Columns>
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
      HorizontalAlign="Left" BorderColor="Black" BorderStyle="Solid" 
      BorderWidth="1px" />
    <EditRowStyle BackColor="#999999" Font-Size="Smaller" VerticalAlign="Top" 
      Width="600px" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
  </asp:GridView>
  <br />
  <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" 
    AutoGenerateRows="False" CellPadding="4" DataKeyNames="ID" 
    DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" 
    Height="50px" Width="651px" onitemupdated="GridView_Update" Visible="False">
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <Fields>
      <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
        ReadOnly="True" SortExpression="ID" />
      <asp:BoundField DataField="Company" HeaderText="Company" 
        SortExpression="Company" />
      <asp:BoundField DataField="DateIssue" HeaderText="DateIssue" 
        SortExpression="DateIssue" />
      <asp:BoundField DataField="HDRequestorFname" HeaderText="HDRequestorFname" 
        SortExpression="HDRequestorFname" />
      <asp:BoundField DataField="Topic" HeaderText="Topic" 
        SortExpression="Topic" />
      <asp:BoundField DataField="Status" HeaderText="Status" 
        SortExpression="Status" />
      <asp:BoundField DataField="Description" HeaderText="Description" 
        SortExpression="Description" />
      <asp:CheckBoxField DataField="EmailSent" HeaderText="EmailSent" 
        SortExpression="EmailSent" />
      <asp:CheckBoxField DataField="ScreenshotSent" HeaderText="ScreenshotSent" 
        SortExpression="ScreenshotSent" />
      <asp:BoundField DataField="DateAddressed" HeaderText="DateAddressed" 
        SortExpression="DateAddressed" />
<asp:BoundField DataField="HDAdmin" HeaderText="HDAdmin" SortExpression="HDAdmin"></asp:BoundField>
      <asp:BoundField DataField="DateResolved" HeaderText="DateResolved" 
        SortExpression="DateResolved" />
<asp:BoundField DataField="HDTech" HeaderText="HDTech" SortExpression="HDTech"></asp:BoundField>
      <asp:BoundField DataField="HDNote" HeaderText="HDNote" 
        SortExpression="HDNote" />
      <asp:BoundField DataField="Role" HeaderText="Role" 
        SortExpression="Role" />
      <asp:BoundField DataField="HowLongdays" HeaderText="HowLongdays" 
        SortExpression="HowLongdays" />
      <asp:BoundField DataField="HDRequestorLname" HeaderText="HDRequestorLname" 
        SortExpression="HDRequestorLname" />
    </Fields>
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#999999" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
  </asp:DetailsView>
  <asp:XmlDataSource ID="XmlDataSource1" runat="server" 
    DataFile="~/Goodday/App_Data/HelpDeskLists.xml" XPath="lookup/Topic">
  </asp:XmlDataSource>
  <asp:XmlDataSource ID="XmlDataSource2" runat="server" 
    DataFile="~/Goodday/App_Data/HelpDeskLists.xml" XPath="lookup/Status">
  </asp:XmlDataSource>
  <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
      ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
    DeleteCommand="DELETE FROM [HelpDesk] WHERE [ID] = @ID" 
    SelectCommand="SELECT [ID], [Company], [DateIssue], [HDRequestorFname], [Description], [HDAdmin], [DateResolved], [HDTech], [HDNote], [Role], [HowLongdays], [HDRequestorLname] FROM [HelpDesk] ORDER BY [DateIssue] DESC"    
    InsertCommand="INSERT INTO [HelpDesk] ([Company], [DateIssue], [HDRequestorFname], [Description], [HDAdmin], [DateResolved], [HDTech], [HDNote], [Role], [HowLongdays], [HDRequestorLname]) VALUES (@Company, @DateIssue, @HDRequestorFname, @Description, @HDAdmin, @DateResolved, @HDTech, @HDNote, @Role, @HowLongdays, @HDRequestorLname)" 
    
    UpdateCommand="UPDATE [HelpDesk] SET [Company] = @Company, [DateIssue] = @DateIssue, [HDRequestorFname] = @HDRequestorFname, [Description] = @Description, [HDAdmin] = @HDAdmin, [DateResolved] = @DateResolved, [HDTech] = @HDTech, [HDNote] = @HDNote, [Role] = @Role, [HowLongdays] = @HowLongdays, [HDRequestorLname] = @HDRequestorLname WHERE [ID] = @ID">
    <DeleteParameters>
      <asp:Parameter Name="ID" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
      <asp:Parameter Name="Company" Type="Int32" />
      <asp:Parameter DbType="DateTime2" Name="DateIssue" />
      <asp:Parameter Name="HDRequestorFname" Type="String" />
      <asp:Parameter Name="Description" Type="String" />
      <asp:Parameter Name="HDAdmin" Type="String" />
      <asp:Parameter DbType="DateTime2" Name="DateResolved" />
      <asp:Parameter Name="HDTech" Type="String" />
      <asp:Parameter Name="HDNote" Type="String" />
      <asp:Parameter Name="Role" Type="String" />
      <asp:Parameter Name="HowLongdays" Type="String" />
      <asp:Parameter Name="HDRequestorLname" Type="String" />
      <asp:Parameter Name="ID" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
      <asp:Parameter Name="Company" Type="Int32" />
      <asp:Parameter DbType="DateTime2" Name="DateIssue" />
      <asp:Parameter Name="HDRequestorFname" Type="String" />
      <asp:Parameter Name="Description" Type="String" />
      <asp:Parameter Name="HDAdmin" Type="String" />
      <asp:Parameter DbType="DateTime2" Name="DateResolved" />
      <asp:Parameter Name="HDTech" Type="String" />
      <asp:Parameter Name="HDNote" Type="String" />
      <asp:Parameter Name="Role" Type="String" />
      <asp:Parameter Name="HowLongdays" Type="String" />
      <asp:Parameter Name="HDRequestorLname" Type="String" />
    </InsertParameters>
  </asp:SqlDataSource>

<%--  <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
    SelectCommand="SELECT [ID], [Company], [DateIssue], [HDRequestorFname], [Description], [Topic], [Status], [HowLongdays], [HDNote], [HDRequestorLname] FROM [HelpDesk] ORDER BY [DateIssue] DESC" 
    DeleteCommand="DELETE FROM [HelpDesk] WHERE [ID] = @ID" 
    InsertCommand="INSERT INTO [HelpDesk] ([Company], [DateIssue], [HDRequestorFname], [Description], [Topic], [Status], [HowLongdays], [HDNote], [HDRequestorLname]) VALUES (@Company, @DateIssue, @HDRequestorFname, @Description, @Topic, @Status, @HowLongdays, @HDNote, @HDRequestorLname)" 
    UpdateCommand="UPDATE [HelpDesk] SET [Company] = @Company, [DateIssue] = @DateIssue, [HDRequestorFname] = @HDRequestorFname, [Description] = @Description, [Topic] = @Topic, [Status] = @Status, [HowLongdays] = @HowLongdays, [HDNote] = @HDNote, [HDRequestorLname] = @HDRequestorLname WHERE [ID] = @ID">
    <DeleteParameters>
      <asp:Parameter Name="ID" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
      <asp:Parameter Name="Company" Type="Int32" />
      <asp:Parameter DbType="DateTime2" Name="DateIssue" />
      <asp:Parameter Name="HDRequestorFname" Type="String" />
      <asp:Parameter Name="Description" Type="String" />
      <asp:Parameter Name="Topic" Type="String" />
      <asp:Parameter Name="Status" Type="String" />
      <asp:Parameter Name="HDNote" Type="String" />
      <asp:Parameter Name="HowLongdays" Type="String" />
      <asp:Parameter Name="HDRequestorLname" Type="String" />
      <asp:Parameter Name="ID" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
      <asp:Parameter Name="Company" Type="Int32" />
      <asp:Parameter DbType="DateTime2" Name="DateIssue" />
      <asp:Parameter Name="HDRequestorFname" Type="String" />
      <asp:Parameter Name="Description" Type="String" />
      <asp:Parameter Name="Topic" Type="String" />
      <asp:Parameter Name="Status" Type="String" />
      <asp:Parameter Name="HDNote" Type="String" />
      <asp:Parameter Name="HowLongdays" Type="String" />
      <asp:Parameter Name="HDRequestorLname" Type="String" />
    </InsertParameters>
  </asp:SqlDataSource>
--%>

  <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
    ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
    SelectCommand="SELECT [Id], [Company] FROM [Contacts] ORDER BY [Company]" >
  </asp:SqlDataSource>
  <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
    ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
    DeleteCommand="DELETE FROM [HelpDesk] WHERE [ID] = @ID" 
    InsertCommand="INSERT INTO [HelpDesk] ([Company], [DateIssue], [HDRequestorFname], [Topic], [Status], [Description], [EmailSent], [ScreenshotSent], [DateAddressed], [HDAdmin], [DateResolved], [HDTech], [HDNote], [Role], [HowLongdays], [HDRequestorLname], [SSMA_TimeStamp]) VALUES (@Company, @DateIssue, @HDRequestorFname, @Topic, @Status, @Description, @EmailSent, @ScreenshotSent, @DateAddressed, @HDAdmin, @DateResolved, @HDTech, @HDNote, @Role, @HowLongdays, @HDRequestorLname, @SSMA_TimeStamp)" 
    SelectCommand="SELECT * FROM [HelpDesk] WHERE ([ID] = @ID) ORDER BY [DateIssue] DESC"    
    
    UpdateCommand="UPDATE [HelpDesk] SET [Company] = @Company, [DateIssue] = @DateIssue, [HDRequestorFname] = @HDRequestorFname, [Topic] = @Topic, [Status] = @Status, [Description] = @Description, [EmailSent] = @EmailSent, [ScreenshotSent] = @ScreenshotSent, [DateAddressed] = @DateAddressed, [HDAdmin] = @HDAdmin, [DateResolved] = @DateResolved, [HDTech] = @HDTech, [HDNote] = @HDNote, [Role] = @Role, [HowLongdays] = @HowLongdays, [HDRequestorLname] = @HDRequestorLname, [SSMA_TimeStamp] = @SSMA_TimeStamp WHERE [ID] = @ID">
    <SelectParameters>
      <asp:ControlParameter ControlID="GridView1" Name="ID" 
        PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
    <DeleteParameters>
      <asp:Parameter Name="ID" Type="Int32" />
    </DeleteParameters>
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
  </asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footercontent" Runat="Server">
</asp:Content>

