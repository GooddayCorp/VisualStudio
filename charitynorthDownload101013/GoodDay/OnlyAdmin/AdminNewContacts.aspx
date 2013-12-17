<%@ Page Title="" Language="C#" MasterPageFile="~/Goodday/MasterAdmin.master" AutoEventWireup="true" CodeFile="AdminNewContacts.aspx.cs" Inherits="AdminNewContacts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headercontent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" Runat="Server">
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
    SelectCommand="SELECT * FROM [NewContacts]" 
    DeleteCommand="DELETE FROM [NewContacts] WHERE [Id] = @Id" 
    InsertCommand="INSERT INTO [NewContacts] ([Company], [FirstName], [LastName], [Address], [City], [State], [Zip], [Phone], [Email], [Web], [BestTime], [TimeZone], [Interests], [Comments], [ContactDate]) VALUES (@Company, @FirstName, @LastName, @Address, @City, @State, @Zip, @Phone, @Email, @Web, @BestTime, @TimeZone, @Interests, @Comments, @ContactDate)" 
    UpdateCommand="UPDATE [NewContacts] SET [Company] = @Company, [FirstName] = @FirstName, [LastName] = @LastName, [Address] = @Address, [City] = @City, [State] = @State, [Zip] = @Zip, [Phone] = @Phone, [Email] = @Email, [Web] = @Web, [BestTime] = @BestTime, [TimeZone] = @TimeZone, [Interests] = @Interests, [Comments] = @Comments, [ContactDate] = @ContactDate WHERE [Id] = @Id">
    <DeleteParameters>
      <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
      <asp:Parameter Name="Company" Type="String" />
      <asp:Parameter Name="FirstName" Type="String" />
      <asp:Parameter Name="LastName" Type="String" />
      <asp:Parameter Name="Address" Type="String" />
      <asp:Parameter Name="City" Type="String" />
      <asp:Parameter Name="State" Type="String" />
      <asp:Parameter Name="Zip" Type="String" />
      <asp:Parameter Name="Phone" Type="String" />
      <asp:Parameter Name="Email" Type="String" />
      <asp:Parameter Name="Web" Type="String" />
      <asp:Parameter Name="BestTime" Type="String" />
      <asp:Parameter Name="TimeZone" Type="String" />
      <asp:Parameter Name="Interests" Type="String" />
      <asp:Parameter Name="Comments" Type="String" />
      <asp:Parameter Name="ContactDate" Type="DateTime" />
      <asp:Parameter Name="Id" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
      <asp:Parameter Name="Company" Type="String" />
      <asp:Parameter Name="FirstName" Type="String" />
      <asp:Parameter Name="LastName" Type="String" />
      <asp:Parameter Name="Address" Type="String" />
      <asp:Parameter Name="City" Type="String" />
      <asp:Parameter Name="State" Type="String" />
      <asp:Parameter Name="Zip" Type="String" />
      <asp:Parameter Name="Phone" Type="String" />
      <asp:Parameter Name="Email" Type="String" />
      <asp:Parameter Name="Web" Type="String" />
      <asp:Parameter Name="BestTime" Type="String" />
      <asp:Parameter Name="TimeZone" Type="String" />
      <asp:Parameter Name="Interests" Type="String" />
      <asp:Parameter Name="Comments" Type="String" />
      <asp:Parameter Name="ContactDate" Type="DateTime" />
    </InsertParameters>
  </asp:SqlDataSource>
  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataSourceID="SqlDataSource1" CellPadding="4" DataKeyNames="Id" 
    ForeColor="#333333" GridLines="None">
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="Small" />
    <Columns>
      <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
        ReadOnly="True" SortExpression="Id" Visible="False" />
      <asp:BoundField DataField="Company" HeaderText="Company" 
        SortExpression="Company" />
      <asp:BoundField DataField="FirstName" HeaderText="First" 
        SortExpression="FirstName" />
      <asp:BoundField DataField="LastName" HeaderText="Last" 
        SortExpression="LastName" />
      <asp:BoundField DataField="Address" HeaderText="Address" 
        SortExpression="Address" Visible="False" />
      <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
      <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" 
        Visible="False" />
      <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" 
        Visible="False" />
      <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
      <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
      <asp:BoundField DataField="Web" HeaderText="Web" SortExpression="Web" 
        Visible="False" />
      <asp:BoundField DataField="BestTime" HeaderText="Best Time" 
        SortExpression="BestTime" />
      <asp:BoundField DataField="TimeZone" HeaderText="TimeZone" 
        SortExpression="TimeZone" Visible="False" />
      <asp:BoundField DataField="Interests" HeaderText="Interests" 
        SortExpression="Interests" />
      <asp:BoundField DataField="Comments" HeaderText="Comments" 
        SortExpression="Comments" Visible="False" />
      <asp:BoundField DataField="ContactDate" HeaderText="Contact Date" 
        SortExpression="ContactDate" />
      <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
    </Columns>
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#999999" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
  </asp:GridView>
  <br />
  <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="601px" 
    AllowPaging="True" AutoGenerateRows="False" CellPadding="4" DataKeyNames="Id" 
    DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="Small" />
    <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <Fields>
      <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
        ReadOnly="True" SortExpression="Id" />
      <asp:BoundField DataField="Company" HeaderText="Company" 
        SortExpression="Company" />
      <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
        SortExpression="FirstName" />
      <asp:BoundField DataField="LastName" HeaderText="LastName" 
        SortExpression="LastName" />
      <asp:BoundField DataField="Address" HeaderText="Address" 
        SortExpression="Address" />
      <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
      <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
      <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
      <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
      <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
      <asp:BoundField DataField="Web" HeaderText="Web" SortExpression="Web" />
      <asp:BoundField DataField="BestTime" HeaderText="BestTime" 
        SortExpression="BestTime" />
      <asp:BoundField DataField="TimeZone" HeaderText="TimeZone" 
        SortExpression="TimeZone" />
      <asp:BoundField DataField="Interests" HeaderText="Interests" 
        SortExpression="Interests" />
      <asp:BoundField DataField="Comments" HeaderText="Comments" 
        SortExpression="Comments" />
      <asp:BoundField DataField="ContactDate" HeaderText="ContactDate" 
        SortExpression="ContactDate" />
    </Fields>
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#999999" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
  </asp:DetailsView>
  <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
    SelectCommand="SELECT * FROM [NewContacts] WHERE ([Id] = @Id)">
    <SelectParameters>
      <asp:ControlParameter ControlID="GridView1" Name="Id" 
        PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
  </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footercontent" Runat="Server">
</asp:Content>

