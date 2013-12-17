<%@ Page Title="" Language="C#" MasterPageFile="~/Goodday/MasterAdmin.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="True" CodeFile="AdminAllNotes.aspx.cs" Inherits="AdminAllNotes" %>

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
    ForeColor="#333333" GridLines="None">
    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" BorderColor="Black" 
      BorderStyle="Solid" BorderWidth="1px" Font-Size="Smaller" />
    <Columns>
      <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
        ReadOnly="True" SortExpression="ID" />
      <asp:BoundField DataField="HDnum" HeaderText="HDnum" 
        SortExpression="HDnum" />
      <asp:BoundField DataField="DateNote" HeaderText="Date"  HtmlEncode="False" DataFormatString = "{0:g}"  
        SortExpression="DateNote" />
      <asp:BoundField DataField="Initials" HeaderText="Initials" 
        SortExpression="Initials" />
      <asp:BoundField DataField="Note" HeaderText="Note" 
        SortExpression="Note" />
      <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
    </Columns>
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
      BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
    <EditRowStyle BackColor="#999999" />
    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
  </asp:GridView>
  <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
    
    
    SelectCommand="SELECT [ID], [HDnum], [DateNote], [Initials], [Note] FROM [HDNotes] ORDER BY [HDnum] DESC" 
    DeleteCommand="DELETE FROM [HDNotes] WHERE [ID] = @ID" 
    InsertCommand="INSERT INTO [HDNotes] ([HDnum], [DateNote], [Initials], [Note]) VALUES (@HDnum, @DateNote, @Initials, @Note)" 
    UpdateCommand="UPDATE [HDNotes] SET [HDnum] = @HDnum, [DateNote] = @DateNote, [Initials] = @Initials, [Note] = @Note WHERE [ID] = @ID">
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
  <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
    ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
    SelectCommand="SELECT [Id], [Company] FROM [Contacts] ORDER BY [Company]">
  </asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footercontent" Runat="Server">
</asp:Content>

