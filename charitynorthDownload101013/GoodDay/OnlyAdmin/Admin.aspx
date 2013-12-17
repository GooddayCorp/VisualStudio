<%@ Page Title="" Language="C#" MasterPageFile="~/Goodday/MasterAdmin.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="True" CodeFile="Admin.aspx.cs" Inherits="AdminwithListBoxes" %>
<%@ MasterType virtualpath="~/Goodday/MasterAdmin.master" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajax" %>


<%--http://msdn.microsoft.com/en-us/library/ms178294(v=vs.90).aspx--%>
<asp:Content ID="Content1" ContentPlaceHolderID="headercontent" Runat="Server">

  <script type="text/javascript">
  window.resizeTo(screen.width, screen.height);
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" Runat="Server">
  <table style="width:100%;">
    <tr>
      <td valign="top" >Review Tickets by Company (select a company from the combobox below)
      <br />
      </td>
      <td ></td>
      <td valign="top" align="left"></td>
    </tr>
    <tr>
      <td >
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
        <div>
      <ajax:ComboBox class="listBox" ID="ComboBox1" runat="server" AutoCompleteMode="SuggestAppend" 
        DataSourceID="SqlDataSource2" DataTextField="Company" DataValueField="Id" 
        MaxLength="0" style="display: inline;" BackColor="#CCFFCC"  
                Width="280px" AppendDataBoundItems="True" >
        <asp:ListItem Value="ID">Company</asp:ListItem>
      </ajax:ComboBox>&nbsp;&nbsp; &nbsp;
      <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                PostBackUrl="./Admin.aspx" Text="Rebind Data" TabIndex="5" />
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>
        <br />
      </td>
    </tr>
    <tr>
      <td class="newTicket" valign="top">
        
        <asp:Label ID="Label12" CssClass="labels" runat="server" 
          Text="Summary- All Tickets"></asp:Label>
        <br />
        
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
          DataKeyNames="ID" DataSourceID="SqlDataSource1" CellPadding="4" 
          ForeColor="#333333" GridLines="None" Width="550px" 
            onrowupdated="DetailsView_Update" onprerender="GridView1_PreRender" 
            TabIndex="1" ondatabinding="GridView1_DataBinding" 
            onrowupdating="GridView1_RowUpdating" BackColor="#66FFCC">
          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="Smaller" />
          <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
              ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Company" HeaderText="Company" 
              SortExpression="Company" />
            <asp:BoundField DataField="DateIssue" HeaderText="Date " HtmlEncode="False" DataFormatString = "{0:g}"   
              SortExpression="DateIssue" />
            <asp:BoundField DataField="HowLongdays" HeaderText="Days" 
              SortExpression="HowLongdays" />
            <asp:BoundField DataField="HDRequestorFname" HeaderText="HDRequestorFname" 
              SortExpression="HDRequestorFname" Visible="False" />
            <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" 
              Visible="False" />
            <asp:TemplateField HeaderText="Topic" SortExpression="Topic">
              <EditItemTemplate>
                <asp:ListBox ID="ListBox5" runat="server" DataSourceID="XmlDataSource1" 
                  DataTextField="Name" DataValueField="Name" Rows="1" 
                  SelectedValue='<%# Bind("Topic") %>'></asp:ListBox>
              </EditItemTemplate>
              <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Topic") %>'></asp:Label>
              </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status" SortExpression="Status">
              <EditItemTemplate>
                <asp:ListBox ID="ListBox6" runat="server" DataSourceID="XmlDataSource2" 
                  DataTextField="Name" DataValueField="Name" Rows="1" 
                  SelectedValue='<%# Bind("Status") %>'></asp:ListBox>
              </EditItemTemplate>
              <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
              </ItemTemplate>
            </asp:TemplateField>
            <asp:CheckBoxField DataField="EmailSent" HeaderText="EmailSent" 
              SortExpression="EmailSent" Visible="False" />
            <asp:BoundField DataField="Description" HeaderText="Description" 
              SortExpression="Description" Visible="False" />
            <asp:BoundField DataField="Topic" HeaderText="Topic" 
              SortExpression="Topic" Visible="False" />
            <asp:BoundField DataField="Status" HeaderText="Status" 
              SortExpression="Status" Visible="False" />
            <asp:BoundField DataField="HDNote" HeaderText="HDNote" 
              SortExpression="HDNote" Visible="False" />
            <asp:BoundField DataField="HDRequestorLname" HeaderText="Downloads" 
              SortExpression="HDRequestorLname" Visible="False" />
            <asp:BoundField DataField="HDNote" HeaderText="Uploads" 
              SortExpression="HDNote" Visible="False" />
            <asp:BoundField DataField="HDRequestorLname" HeaderText="HDRequestorLname" 
              SortExpression="HDRequestorLname" Visible="False" />
            <asp:CheckBoxField DataField="ScreenshotSent" HeaderText="ScreenshotSent" 
              SortExpression="ScreenshotSent" Visible="False" />
            <asp:BoundField DataField="DateAddressed" HeaderText="DateAddressed" 
              SortExpression="DateAddressed" Visible="False" />
            <asp:BoundField DataField="DateResolved" HeaderText="DateResolved" 
              SortExpression="DateResolved" Visible="False" />
            <asp:CommandField ShowSelectButton="True" />
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
        <br />
        
        <br />
        <br />
        <br />
        <%--<asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" 
          CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource6" 
          ForeColor="#333333" GridLines="None" Height="50px" Width="351px" 
          AllowPaging="True" EmptyDataText="No record selected." Visible="False">
          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
          <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
          <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
          <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
              ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="HDnum" HeaderText="HDnum" SortExpression="HDnum" />
            <asp:BoundField DataField="DateNote" HeaderText="DateNote" 
              SortExpression="DateNote" />
            <asp:BoundField DataField="Initials" HeaderText="Initials" 
              SortExpression="Initials" />
            <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
              ShowInsertButton="True" />
          </Fields>
          <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
          <EditRowStyle BackColor="#999999" />
          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:DetailsView>--%>
        
        <br />
        
      </td>
      <td class="middleColumn"></td>
      <td valign="top" style="font-weight: 700" >
        <asp:Label ID="Label13" runat="server" CssClass="labels" Text="Ticket Details"></asp:Label>
        <br />
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
        <div>
        <asp:DetailsView class="detailsGrid" ID="DetailsView1" runat="server" AllowPaging="True" 
          AutoGenerateRows="False" CellPadding="4" DataKeyNames="ID" 
          DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" 
          Height="50px" Width="411px" 
          EmptyDataText="No data for this record, please select another record." 
          onitemupdated="GridView_Update" TabIndex="2">
          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
          <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
          <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
          <Fields>
            <asp:BoundField DataField="ID" HeaderText="Ticket" InsertVisible="False" 
              ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="Company" HeaderText="Company" 
              SortExpression="Company" />
            <asp:BoundField DataField="DateIssue" HeaderText="Date Issued" 
              SortExpression="DateIssue" />
            <asp:BoundField DataField="HowLongdays" HeaderText="Days" 
              SortExpression="HowLongdays" />
            <asp:BoundField DataField="HDRequestorFname" HeaderText="Name" 
              SortExpression="HDRequestorFname" />
            <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />

            <asp:TemplateField HeaderText="Topic" SortExpression="Topic">
              <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Topic") %>'></asp:Label>
              </ItemTemplate>
              <EditItemTemplate>
                <asp:ListBox ID="ListBox3" runat="server" Rows="1" AppendDataBoundItems = "true" 
                  DataSourceID="XmlDataSource1" 
                  DataTextField="Name" DataValueField="Name" 
                  SelectedValue='<%# Bind("Topic") %>'>
                <asp:ListItem Text="none" Value=""></asp:ListItem></asp:ListBox>
              </EditItemTemplate>
              <InsertItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" 
                Text='<%# Bind("Topic") %>'></asp:TextBox>
              </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Status" SortExpression="Status">
              <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
              </ItemTemplate>
              <EditItemTemplate>
                <asp:ListBox ID="ListBox4" runat="server" Rows="1" AppendDataBoundItems = "true" 
                  DataSourceID="XmlDataSource2" 
                  DataTextField="Name" DataValueField="Name" 
                  SelectedValue='<%# Bind("Status") %>'>
                <asp:ListItem Text="none" Value=""></asp:ListItem></asp:ListBox>
              </EditItemTemplate>
              <InsertItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Status") %>'></asp:TextBox>
              </InsertItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="Description" HeaderText="Description" 
              SortExpression="Description" />
            <asp:CheckBoxField DataField="EmailSent" HeaderText="EmailSent" 
              SortExpression="EmailSent" Visible="false"/>
            <asp:CheckBoxField DataField="ScreenshotSent" HeaderText="ScreenshotSent" 
              SortExpression="ScreenshotSent" Visible="false"/>
            <asp:BoundField DataField="DateAddressed" HeaderText="DateAddressed" 
              SortExpression="DateAddressed" />
            <asp:BoundField DataField="DateResolved" HeaderText="DateResolved" 
              SortExpression="DateResolved" />
            <asp:BoundField DataField="HDNote" HeaderText="Uploads" 
              SortExpression="HDNote" />
            <asp:BoundField DataField="HDRequestorLname" HeaderText="Downloads" 
              SortExpression="HDRequestorLname" />

            <asp:CommandField ShowDeleteButton="False" ShowEditButton="True" />
          </Fields>
          <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
          <EditRowStyle BackColor="#999999" />
          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:DetailsView>
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>
        <br />
        <%--<asp:Label ID="Label16" runat="server" CssClass="labels" 
          Text="Add New Response" 
          ToolTip="Useful for tickets with no current responses."></asp:Label>--%>
       
        <asp:Button ID="newResponseButton" runat="server" 
          onclick="newResponseButton_Click" Text="Toggle Input Form" 
          ToolTip="Use this button when there are no responses for the ticket." />
        
        <br />
      </td>
    </tr>
    <tr>
      <td class="newTicket" valign="top">
        <asp:Label ID="Label14" runat="server" CssClass="labels" 
          Text="Ticket Responses"></asp:Label><br />
        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
        <ContentTemplate>
        <div>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
          CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource5" 
          EmptyDataText="No responses for this ticket." ForeColor="#333333" 
          GridLines="None" TabIndex="3" HorizontalAlign="Left" Width="550px">
          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="Smaller" />
          <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
              ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="HDnum" HeaderText="Ticket" SortExpression="HDnum" />
            <asp:BoundField DataField="DateNote" HeaderText="Date" 
              SortExpression="DateNote" />
            <asp:BoundField DataField="Initials" HeaderText="Initials" 
              SortExpression="Initials" />
            <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" />
            <asp:CommandField 
              ShowSelectButton="True" />
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
      </td>
      <td class="middleColumn"></td>
      <td valign="top" style="font-weight: 700" >
        <asp:Label ID="Label15" runat="server" CssClass="labels" 
          Text="Response Details"></asp:Label>
        &nbsp;&nbsp;
                
        <br />
        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
        <ContentTemplate>
        <div>
        <asp:DetailsView class="detailsGrid" ID="DetailsView3" runat="server" 
                  AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="SqlDataSource6" 
                  Height="50px" Width="411px" CellPadding="4" ForeColor="#333333" 
                  GridLines="None" 
                  oniteminserted="DetailsView3_ItemInserted" 
                  onprerender="ChangeTextBoxWidths" HorizontalAlign="Left" 
                  oniteminserting="DetailsView3_ItemInserting" AllowPaging="True" 
                  onitemupdated="GridView2_Update" TabIndex="4">
                  <FooterStyle cssclass="gridBar" BackColor="#5D7B9D" Font-Bold="True" 
                    ForeColor="White" />
                  <CommandRowStyle cssclass="gridBar" BackColor="#E2DED6" 
                    Font-Bold="True"/>
                  <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                  <FieldHeaderStyle Width="0px" BackColor="#E9ECF1" Font-Bold="True" />
                  <PagerStyle cssclass="gridBar" HorizontalAlign="Center" BackColor="#284775" 
                    ForeColor="White" />
                  <Fields>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                      ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="HDnum" HeaderText="Ticket" SortExpression="HDnum" />
                    <asp:BoundField DataField="DateNote" HeaderText="DateNoted" 
                      SortExpression="DateNote" />
                    <asp:BoundField DataField="Initials" HeaderText="Initials" 
                      SortExpression="Initials" />
                    <asp:BoundField DataField="Note" HeaderText="Note" SortExpression="Note" />
                    <asp:CommandField ShowInsertButton="True" 
                      ShowEditButton="True" />
                  </Fields>
                  <HeaderStyle cssclass="gridBar" BackColor="#5D7B9D" Font-Bold="True" 
                    ForeColor="White"/>
                  <EditRowStyle cssclass="gridBar" BackColor="#999999"/>
                  <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:DetailsView>
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>
      </td>
    </tr>
  </table>
  <%--XML to populate lists--%>
  <asp:XmlDataSource ID="XmlDataSource2" runat="server" 
    DataFile="~/Goodday/App_Data/HelpDeskLists.xml" XPath="lookup/Status">
  </asp:XmlDataSource>
  <asp:XmlDataSource ID="XmlDataSource1" runat="server" 
    DataFile="~/Goodday/App_Data/HelpDeskLists.xml" XPath="lookup/Topic">
  </asp:XmlDataSource>
  <%--Contacts Table to select company--%>
  <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
    ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
    SelectCommand="SELECT [Id], [Company] FROM [Contacts] ORDER BY [Company]">
  </asp:SqlDataSource>
  <%--HelpDesk Table to review tickets--%>
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
    DeleteCommand="DELETE FROM [HelpDesk] WHERE [ID] = @ID" 
    SelectCommand="SELECT * FROM [HelpDesk] WHERE ([Company] = @Company) ORDER BY [DateIssue] DESC"       
    InsertCommand="INSERT INTO [HelpDesk] ([Company], [DateIssue], [HowLongdays], [HDRequestorFname], [Role], [Topic], [Status], [EmailSent], [Description], [HDAdmin], [HDTech], [HDNote], [HDRequestorLname], [ScreenshotSent], [DateAddressed], [DateResolved]) VALUES (@Company, @DateIssue, @HowLongdays, @HDRequestorFname, @Role, @Topic, @Status, @EmailSent, @Description, @HDAdmin, @HDTech, @HDNote, @HDRequestorLname, @ScreenshotSent, @DateAddressed, @DateResolved)" 
    UpdateCommand="UPDATE [HelpDesk] SET [Company] = @Company, [DateIssue] = @DateIssue, [HowLongdays] = @HowLongdays, [HDRequestorFname] = @HDRequestorFname, [Role] = @Role, [Topic] = @Topic, [Status] = @Status, [EmailSent] = @EmailSent, [Description] = @Description, [HDAdmin] = @HDAdmin, [HDTech] = @HDTech, [HDNote] = @HDNote, [HDRequestorLname] = @HDRequestorLname, [ScreenshotSent] = @ScreenshotSent, [DateAddressed] = @DateAddressed, [DateResolved] = @DateResolved WHERE [ID] = @ID">
    <SelectParameters>
      <asp:ControlParameter ControlID="ComboBox1" Name="Company" 
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
  <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
    ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
    DeleteCommand="DELETE FROM [HelpDesk] WHERE [ID] = @ID" 
    InsertCommand="INSERT INTO [HelpDesk] ([Company], [DateIssue], [HDRequestorFname], [Topic], [Status], [Description], [EmailSent], [ScreenshotSent], [DateAddressed], [HDAdmin], [DateResolved], [HDTech], [HDNote], [Role], [HowLongdays], [HDRequestorLname]) VALUES (@Company, @DateIssue, @HDRequestorFname, @Topic, @Status, @Description, @EmailSent, @ScreenshotSent, @DateAddressed, @HDAdmin, @DateResolved, @HDTech, @HDNote, @Role, @HowLongdays, @HDRequestorLname)" 
    SelectCommand="SELECT * FROM [HelpDesk] WHERE ([ID] = @ID)" 
    UpdateCommand="UPDATE [HelpDesk] SET [Company] = @Company, [DateIssue] = @DateIssue, [HDRequestorFname] = @HDRequestorFname, [Topic] = @Topic, [Status] = @Status, [Description] = @Description, [EmailSent] = @EmailSent, [ScreenshotSent] = @ScreenshotSent, [DateAddressed] = @DateAddressed, [HDAdmin] = @HDAdmin, [DateResolved] = @DateResolved, [HDTech] = @HDTech, [HDNote] = @HDNote,  [Role] = @Role, [HowLongdays] = @HowLongdays, [HDRequestorLname] = @HDRequestorLname WHERE [ID] = @ID">
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
    </InsertParameters>
  </asp:SqlDataSource>
  <%--HDNotes Table to review responses--%>
  <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
    ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
    
    SelectCommand="SELECT * FROM [HDNotes] WHERE ([HDnum] = @HDnum) ORDER BY [DateNote] DESC" 
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
      <asp:Parameter Name="Uploads" Type="String" />
      <asp:Parameter Name="Downloads" Type="String" />--%>
    </InsertParameters>
  </asp:SqlDataSource>
  <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
          ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
          DeleteCommand="DELETE FROM [HDNotes] WHERE [ID] = @ID" 
          InsertCommand="INSERT INTO [HDNotes] ([HDnum], [DateNote], [Initials], [Note]) VALUES (@HDnum, @DateNote, @Initials, @Note)" 
          SelectCommand="SELECT [ID], [HDnum], [DateNote], [Initials], [Note] FROM [HDNotes] WHERE ([ID] = @ID)"            
          
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
            <asp:Parameter Name="DateNote" DbType="DateTime2" />
            <asp:Parameter Name="Initials" Type="String" />
<%--                  <asp:Parameter Name="SSMA_TimeStamp" Type="Object" />--%>
             <asp:Parameter Name="Note" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
          </UpdateParameters>
          <InsertParameters>
            <asp:Parameter Name="HDnum" Type="Int32" />
            <asp:Parameter Name="DateNote" DbType="DateTime2" />
<%--                  <asp:Parameter Name="SSMA_TimeStamp" Type="Object" />--%><asp:Parameter 
              Name="Initials" Type="String" />
            <asp:Parameter Name="Note" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footercontent" Runat="Server">
</asp:Content>

