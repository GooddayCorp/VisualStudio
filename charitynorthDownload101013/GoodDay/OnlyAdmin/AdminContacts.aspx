<%@ Page Title="" Language="C#" MasterPageFile="~/Goodday/MasterAdmin.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="True" CodeFile="AdminContacts.aspx.cs" Inherits="AdminContacts" %>
<%@ MasterType virtualpath="~/Goodday/MasterAdmin.master" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headercontent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" Runat="Server">
  <asp:Label ID="Label5" runat="server" Text="Find Company:  "></asp:Label>
  <ajax:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
  </ajax:ToolkitScriptManager>
  <br />
  <asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
    <div>
  <ajax:ComboBox ID="ComboBox1" runat="server" AutoCompleteMode="SuggestAppend" 
    DataSourceID="SqlDataSource3" DataTextField="Company" DataValueField="Company" 
    MaxLength="0" style="display: inline;" BackColor="#CCFFCC" Height="26px" 
            Width="280px" AppendDataBoundItems="True" >
    <asp:ListItem Value="ID">Company</asp:ListItem>
  </ajax:ComboBox>&nbsp;&nbsp; &nbsp;
  <asp:Button ID="Button2" runat="server" onclick="Button1_Click" 
            PostBackUrl="./AdminContacts.aspx" Text="Rebind Data" />
    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
    <br />
<%--  <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" 
DataSourceID="SqlDataSource3" DataTextField="Company" DataValueField="Company" 
Rows="1" Width="297px"></asp:ListBox>
&nbsp;&nbsp;
<asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
Text="Rebind Data" />--%>
  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
      <div>  
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
          CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource2" 
          ForeColor="#333333" GridLines="None">
          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
          <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
              ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="Company" HeaderText="Company" 
              SortExpression="Company" />
            <asp:BoundField DataField="First" HeaderText="First" SortExpression="First" />
            <asp:BoundField DataField="Last" HeaderText="Last" SortExpression="Last" />
            <asp:BoundField DataField="Email_Address" HeaderText="Email" 
              SortExpression="Email_Address" />
            <asp:BoundField DataField="Username" HeaderText="Username" 
              SortExpression="Username" />
            <asp:BoundField DataField="Passwordfile" HeaderText="Password" 
              SortExpression="Passwordfile" />
            <asp:BoundField DataField="Usernpwdnotes" HeaderText="Pwd Question" 
              SortExpression="Usernpwdnotes" />
            <asp:BoundField DataField="User_Field_2" HeaderText="Pwd Answer" 
              SortExpression="Usernpwdnotes" />
            <asp:BoundField DataField="File_As" HeaderText="Authorization" 
              SortExpression="File_As" />
            <asp:CommandField ShowEditButton="True" />
          </Columns>
          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
          <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
          <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
          <EditRowStyle BackColor="#999999" />
          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView>
      </div>
    </ContentTemplate>
  </asp:UpdatePanel>
  <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
    DeleteCommand="DELETE FROM [Contacts] WHERE [Id] = @Id" 
    InsertCommand="INSERT INTO [Contacts] ([First], [Last], [Company], [Title], [Email Address], [File As], [User Field 2], [Username], [Passwordfile], [Usernpwdnotes]) VALUES (@First, @Last, @Company, @Title, @Email_Address, @File_As, @User_Field_2, @Username, @Passwordfile, @Usernpwdnotes)" 
    SelectCommand="SELECT [Id], [First], [Last], [Company], [Title], [Email Address] AS Email_Address, [File As] AS File_As, [User Field 2] AS User_Field_2, [Username], [Passwordfile], [Usernpwdnotes] FROM [Contacts] WHERE ([Company] = @Company) ORDER BY [Company]" 
    
    UpdateCommand="UPDATE [Contacts] SET [First] = @First, [Last] = @Last, [Company] = @Company, [Title] = @Title, [Email Address] = @Email_Address, [File As] = @File_As, [User Field 2] = @User_Field_2, [Username] = @Username, [Passwordfile] = @Passwordfile, [Usernpwdnotes] = @Usernpwdnotes WHERE [Id] = @Id">
    <SelectParameters>
      <asp:ControlParameter ControlID="ComboBox1" Name="Company" 
        PropertyName="SelectedValue" Type="String" />
    </SelectParameters>
    <DeleteParameters>
      <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
      <asp:Parameter Name="First" Type="String" />
      <asp:Parameter Name="Last" Type="String" />
      <asp:Parameter Name="Company" Type="String" />
      <asp:Parameter Name="Title" Type="String" />
      <asp:Parameter Name="Email_Address" Type="String" />
      <asp:Parameter Name="File_As" Type="String" />
      <asp:Parameter Name="User_Field_2" Type="String" />
      <asp:Parameter Name="Username" Type="String" />
      <asp:Parameter Name="Passwordfile" Type="String" />
      <asp:Parameter Name="Usernpwdnotes" Type="String" />
      <asp:Parameter Name="Id" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
      <asp:Parameter Name="First" Type="String" />
      <asp:Parameter Name="Last" Type="String" />
      <asp:Parameter Name="Company" Type="String" />
      <asp:Parameter Name="Title" Type="String" />
      <asp:Parameter Name="Email_Address" Type="String" />
      <asp:Parameter Name="File_As" Type="String" />
      <asp:Parameter Name="User_Field_2" Type="String" />
      <asp:Parameter Name="Username" Type="String" />
      <asp:Parameter Name="Passwordfile" Type="String" />
      <asp:Parameter Name="Usernpwdnotes" Type="String" />
    </InsertParameters>
  </asp:SqlDataSource>
  <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
    ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
    SelectCommand="SELECT [Company] FROM [Contacts] ORDER BY [Company]">
  </asp:SqlDataSource>
  
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footercontent" Runat="Server">
</asp:Content>

