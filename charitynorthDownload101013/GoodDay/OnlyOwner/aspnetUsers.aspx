<%@ Page Title="" Language="C#" MasterPageFile="~/GoodDay/MasterAdmin.master" AutoEventWireup="true" CodeFile="aspnetUsers.aspx.cs" Inherits="GoodDay_OnlyAdmin_aspnetUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headCodeBlock" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headercontent" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" Runat="Server">
  <table id="Table1">
  <tr>
    <td>
      AspNet View Applications
      <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ApplicationId" DataSourceID="SqlDataSource6" 
        AllowSorting="True" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" 
        CellPadding="5" CellSpacing="5" 
        onselectedindexchanged="GridView4_SelectedIndexChanged">
        <RowStyle Font-Size="Smaller" />
        <Columns>
          <asp:CommandField ShowSelectButton="True" />
          <asp:BoundField DataField="ApplicationName" HeaderText="ApplicationName" 
            SortExpression="ApplicationName" />
          <asp:BoundField DataField="Description" HeaderText="Description" 
            SortExpression="Description" Visible="False" />
          <asp:BoundField DataField="ApplicationId" HeaderText="ApplicationId" 
            ReadOnly="True" SortExpression="ApplicationId" Visible="False" />
        </Columns>
        <SelectedRowStyle BackColor="#66FFFF" />
        <AlternatingRowStyle BackColor="#99FFCC" />
      </asp:GridView>
    </td>
    <td>
     
      <%--<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>--%>
     
    </td>
  </tr>
  <tr>
    <td>
      <br />    
      <asp:Label ID="deleteUserLabel" runat="server" Text="Delete User"></asp:Label>
      <asp:TextBox ID="deleteUserTextBox" runat="server"></asp:TextBox>
      <asp:Button ID="deleteButton" runat="server" onclick="deleteButton_Click" Text="Delete User" />
      <br /><br />
    </td>
    <td>
      <br />    
      <asp:Label ID="msgLabel" runat="server" ForeColor="Red"></asp:Label>
      <br /><br />
    </td>
  </tr>
  </table>AspNet View MembershipUsers
      <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="UserId" DataSourceID="SqlDataSource5" 
        EmptyDataText="There are no data records to display." Width="967px" 
        AllowSorting="True" CellPadding="5" BorderColor="Black" 
    BorderStyle="Solid" BorderWidth="1px" >
        <RowStyle Font-Size="Smaller" />
        <Columns>
          <asp:BoundField DataField="UserName" HeaderText="UserName" 
            SortExpression="UserName" />
          <asp:BoundField DataField="UserId" HeaderText="UserId" ReadOnly="True" 
            SortExpression="UserId" />
          <asp:BoundField DataField="LastActivityDate" HeaderText="LastActivityDate" 
            SortExpression="LastActivityDate" />
          <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
          <asp:BoundField DataField="PasswordQuestion" HeaderText="PasswordQuestion" 
            SortExpression="PasswordQuestion" />
          <asp:BoundField DataField="PasswordAnswer" HeaderText="PasswordAnswer" 
            SortExpression="PasswordAnswer" Visible="False">
          <ItemStyle BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" 
            Font-Size="Smaller" />
          </asp:BoundField>
        </Columns>
        <AlternatingRowStyle BackColor="#99FFCC" />
      </asp:GridView>      
  
  <table id="Table2">
  <tr>
    <td>
      <br />
     </td>
    <td>    
      </td>
  </tr>
  <tr>
    <td>AspNet View Users
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ApplicationId,LoweredUserName" DataSourceID="SqlDataSource2" 
        EmptyDataText="There are no data records to display." Width="544px" 
        AllowSorting="True" BorderColor="Black" BorderStyle="Solid" 
        BorderWidth="1px">
        <RowStyle Font-Size="Smaller" />
        <Columns>
          <asp:BoundField DataField="UserName" HeaderText="UserName" 
            SortExpression="UserName" />
          <asp:BoundField DataField="ApplicationId" HeaderText="ApplicationId" 
            SortExpression="ApplicationId" Visible="False" ReadOnly="True" />
          <asp:BoundField DataField="UserId" HeaderText="UserId" 
            SortExpression="UserId" />
          <asp:BoundField DataField="LastActivityDate" HeaderText="LastActivityDate" 
            SortExpression="LastActivityDate" />
        </Columns>
        <AlternatingRowStyle BackColor="#99FFCC" />
      </asp:GridView> 
    </td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>
    </td>
    <td></td>
  </tr>
  <tr>
    <td>
      &nbsp;</td>
    <td></td>
  </tr>
  </table>
  <br />
  <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
    ProviderName="<%$ ConnectionStrings:custom_dbConnectionString.ProviderName %>" 
    
    SelectCommand="SELECT * FROM [vw_aspnet_Users] WHERE ([ApplicationId] = @ApplicationId) ORDER BY [UserId]">
    <SelectParameters>
      <asp:ControlParameter ControlID="GridView4" Name="ApplicationId" 
        PropertyName="SelectedValue" Type="Object" />
    </SelectParameters>
  </asp:SqlDataSource>
  <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
    ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
    ProviderName="<%$ ConnectionStrings:custom_dbConnectionString.ProviderName %>"    
    
    SelectCommand="SELECT * FROM [vw_aspnet_UsersInRoles] WHERE ([UserId] = @UserId)">
    <SelectParameters>
      <asp:ControlParameter ControlID="GridView1" Name="UserId" 
        PropertyName="SelectedValue" Type="Object" />
    </SelectParameters>
  </asp:SqlDataSource>
  <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
    ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
    
    SelectCommand="SELECT * FROM [vw_aspnet_UsersInRoles] WHERE ([UserId] = @UserId) ORDER BY [UserId]">
    <SelectParameters>
      <asp:ControlParameter ControlID="GridView1" Name="UserId" 
        PropertyName="SelectedValue" Type="Object" />
    </SelectParameters>
  </asp:SqlDataSource>
  <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
    ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
    
    
    SelectCommand="SELECT [UserId], [Email], [PasswordQuestion], [PasswordAnswer], [UserName], [LastActivityDate] FROM [vw_aspnet_MembershipUsers] WHERE ([ApplicationId] = @ApplicationId) ORDER BY [UserId]">
    <SelectParameters>
      <asp:ControlParameter ControlID="GridView4" Name="ApplicationId" 
        PropertyName="SelectedValue" Type="Object" />
    </SelectParameters>
  </asp:SqlDataSource>
  <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
    ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
    SelectCommand="SELECT [ApplicationName], [ApplicationId], [Description] FROM [vw_aspnet_Applications] ORDER BY [ApplicationName]">
  </asp:SqlDataSource>
  <br />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footercontent" Runat="Server">
</asp:Content>

