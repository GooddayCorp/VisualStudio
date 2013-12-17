<%@ Page Title="" Language="C#" MasterPageFile="~/Goodday/MasterAdmin.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="True" Debug="true" CodeFile="AdminContacts.aspx.cs" Inherits="AdminwithListBoxes" %>
<%@ MasterType virtualpath="~/Goodday/MasterAdmin.master" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajax" %>


<%--http://msdn.microsoft.com/en-us/library/ms178294(v=vs.90).aspx--%>
<asp:Content ID="Content1" ContentPlaceHolderID="headercontent" Runat="Server">

  <script type="text/javascript">
  window.resizeTo(screen.width, screen.height);
</script>
  <style type="text/css">
    .style6
    {
      height: 45px;
    }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" Runat="Server">
  <table style="width:100%;">
    <tr>
      <td valign="top" >Review Company Contact Information (select a company from the combobox below)
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
        MaxLength="0" style="display: inline;" float="top" BackColor="#CCFFCC"  
                Width="280px" AppendDataBoundItems="True" >
        <asp:ListItem Value="ID">Company</asp:ListItem>
      </ajax:ComboBox>&nbsp;&nbsp; &nbsp;
<%--      <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                PostBackUrl="AdminContacts.aspx" Text="Rebind Data" TabIndex="5" 
            Visible="False" />--%>
          &nbsp;&nbsp;<asp:Button ID="Button4" runat="server"  
            onclick="Button4_Click" Text="New Contact" 
            ToolTip="Remember: Add Users to Membership." />
          &nbsp;
          <br />
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>
        <br />
      </td>
    </tr>
    <tr>
      <td class="newTicket" valign="top">
        
        <asp:Label ID="Label12" CssClass="labels" runat="server" 
          Text="Contact Summary"></asp:Label>
        <br />
        
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
          DataKeyNames="Id" DataSourceID="SqlDataSource1" CellPadding="4" 
          ForeColor="#333333" GridLines="Vertical" Width="898px" 
            onrowupdated="DetailsView_Update" onprerender="GridView1_PreRender" 
            TabIndex="1" ondatabinding="GridView1_DataBinding" 
            onrowupdating="GridView1_RowUpdating" BackColor="#66FFCC" 
            BorderColor="Black" BorderStyle="Solid" BorderWidth="1px">
          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="Smaller" 
            Wrap="False" />
          <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" 
              ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="First" HeaderText="First" SortExpression="First" />
            <asp:BoundField DataField="Last" HeaderText="Last" SortExpression="Last" />
            <asp:BoundField DataField="Company" HeaderText="Company" 
              SortExpression="Company" Visible="False" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" 
              Visible="False" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" 
              Visible="False" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" 
              Visible="False" />
            <asp:BoundField DataField="Zip/Postal Code" HeaderText="Zip/Postal Code" 
              SortExpression="Zip/Postal Code" Visible="False" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="Mobile Phone" HeaderText="Mobile Phone" 
              SortExpression="Mobile Phone" Visible="False" />
            <asp:BoundField DataField="Web Page" HeaderText="Web Page" 
              SortExpression="Web Page" Visible="False" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" 
              Visible="False" />
            <asp:BoundField DataField="Email Address" HeaderText="Email" 
              SortExpression="Email Address" />
            <asp:BoundField DataField="File As" HeaderText="File As" 
              SortExpression="File As" Visible="False" />
            <asp:BoundField DataField="Usernpwdnotes" HeaderText="PWD?" 
              SortExpression="Usernpwdnotes" />
            <asp:BoundField DataField="User Field 2" HeaderText="PWD Ans" 
              SortExpression="User Field 2" />
            <asp:BoundField DataField="Username" HeaderText="Username" 
              SortExpression="Username" />
            <asp:BoundField DataField="Passwordfile" HeaderText="Password" 
              SortExpression="Passwordfile" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
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
      </td>
      <td class="middleColumn"></td>
      <td valign="top" style="font-weight: 700" >
        <br />
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
        <div>
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>
        <br />
      </td>
    </tr>
    <tr>
      <td class="newTicket" valign="top">
        <asp:Label ID="Label14" runat="server" CssClass="labels" 
          Text="Contact Details"></asp:Label><br />
        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
        <ContentTemplate>
        <div>
          <asp:DetailsView ID="DetailsView1" runat="server" 
            AutoGenerateRows="False" CellPadding="4" class="detailsGrid" DataKeyNames="Id" 
            DataSourceID="SqlDataSource4" 
            EmptyDataText="No data for this record, please select another record." 
            ForeColor="#333333" GridLines="None" Height="50px" 
            onitemupdated="GridView_Update" TabIndex="2" Width="411px" 
            onprerender="ChangeTextBoxWidths" oniteminserted="DetailsView1_ItemInserted">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" Font-Size="Smaller" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <Fields>
              <asp:BoundField DataField="ContactDate" HeaderText="ContactDate"  HtmlEncode="False" DataFormatString = "{0:g}"  
                SortExpression="ContactDate" />
              <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" 
                InsertVisible="False" ReadOnly="True" />
              <asp:BoundField DataField="First" HeaderText="First" SortExpression="First" />
              <asp:BoundField DataField="Last" HeaderText="Last" 
                SortExpression="Last" />
              <asp:BoundField DataField="Company" HeaderText="Company" 
                SortExpression="Company" />
              <asp:BoundField DataField="Username" HeaderText="Username" 
                SortExpression="Username" />
              <asp:BoundField DataField="Passwordfile" HeaderText="Password" 
                SortExpression="Passwordfile" />
              <asp:BoundField DataField="Usernpwdnotes" HeaderText="PWD Question" 
                SortExpression="Usernpwdnotes" />
              <asp:BoundField DataField="User_Field_2" HeaderText="PWD Answer" 
                SortExpression="User_Field_2" />
              <asp:BoundField DataField="Email_Address" HeaderText="Email" 
                SortExpression="Email_Address" />
              <asp:BoundField DataField="Title" HeaderText="Title" 
                SortExpression="Title" />
              <asp:BoundField DataField="Address" HeaderText="Address" 
                SortExpression="Address" />
              <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
              <asp:BoundField DataField="State" HeaderText="State" 
                SortExpression="State" />
              <asp:BoundField DataField="column1" HeaderText="Zip" SortExpression="column1" />
              <asp:BoundField DataField="Phone" HeaderText="Phone" 
                SortExpression="Phone" />
              <asp:BoundField DataField="Web_Page" HeaderText="Website" 
                SortExpression="Web_Page" />
              <asp:BoundField DataField="Comments" HeaderText="Comments" 
                SortExpression="Comments" />
              <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowInsertButton="True" />
            </Fields>
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
          </asp:DetailsView>
          &nbsp;</div>
        </ContentTemplate>
        </asp:UpdatePanel>
      </td>
      <td class="middleColumn"></td>
      <td valign="top" style="font-weight: 700" >
        &nbsp;&nbsp;
                
        <br />
        <asp:UpdatePanel ID="UpdatePanel5" runat="server">
        <ContentTemplate>
        <div>
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
    DeleteCommand="DELETE FROM [Contacts] WHERE [Id] = @Id" 
    SelectCommand="SELECT * FROM [Contacts] WHERE ([Id] = @Id)"       
    InsertCommand="INSERT INTO [Contacts] ([First], [Last], [Company], [Title], [Department], [Office], [Post Office Box], [Address], [City], [State], [Zip/Postal Code], [Country], [Phone], [Mobile Phone], [Pager Phone], [Home2 Phone], [Assistant Phone Number], [Business Fax], [Web Page], [User_Name], [Password], [MarketRef], [Comments], [TimeStamp], [Type], [PType], [Home Fax], [Other Fax], [Telex Number], [Display name], [Email Type], [Email Address], [Account], [Assistant], [Send Rich Text], [Primary], [File As], [Home Address], [Business Address], [Other Address], [Journal], [Business Address Street], [Business Address City], [Business Address State], [Business Address Postal Code], [Business Address Country], [Business Address PO Box], [User Field 1], [User Field 2], [User Field 3], [User Field 4], [Pyn], [LtrNum], [Project Name], [Project Reference], [Project Amount], [ProspectPhase], [Category], [TimeZone], [AB], [Hrs], [BudgetLo], [BudgetHigh], [Username], [Passwordfile], [Usernpwdnotes], [BudgetTarget], [ContactDate], [S_introsent], [S_intake], [S_NAnalysis], [S_Proposal], [Next Meeting Date], [Next Meeting Type], [Industry], [BTTC], [Refund], [RefundComplete], [Rated], [Rate], [SalesCat], [EstimatedMSale], [EstimatedDateSale], [S_ClearedForDemo], [2SalesPerson], [2Developer], [2Designer], [2ProjManager], [2Administrator], [2SalesPersonAmt], [2ProjManagerAmt], [2DeveloperAmt], [2DesignerAmt], [2AdministratorAmt], [SalesPerson], [Developer], [Designer], [ProjManager], [Administrator], [PercentageofSale], [ProspectDate], [ProspNotes], [SalesPersonAmt], [ProjManagerAmt], [DeveloperAmt], [DesignerAmt], [AdministratorAmt], [RefReqDate], [LeadNum], [RefundReason], [Refinitials], [TaxAmt1], [TaxAmt2], [Phnotes], [PhInitials], [Phdate], [SSMA_TimeStamp]) VALUES (@First, @Last, @Company, @Title, @Department, @Office, @Post_Office_Box, @Address, @City, @State, @column1, @Country, @Phone, @Mobile_Phone, @Pager_Phone, @Home2_Phone, @Assistant_Phone_Number, @Business_Fax, @Web_Page, @User_Name, @Password, @MarketRef, @Comments, @TimeStamp, @Type, @PType, @Home_Fax, @Other_Fax, @Telex_Number, @Display_name, @Email_Type, @Email_Address, @Account, @Assistant, @Send_Rich_Text, @Primary, @File_As, @Home_Address, @Business_Address, @Other_Address, @Journal, @Business_Address_Street, @Business_Address_City, @Business_Address_State, @Business_Address_Postal_Code, @Business_Address_Country, @Business_Address_PO_Box, @User_Field_1, @User_Field_2, @User_Field_3, @User_Field_4, @Pyn, @LtrNum, @Project_Name, @Project_Reference, @Project_Amount, @ProspectPhase, @Category, @TimeZone, @AB, @Hrs, @BudgetLo, @BudgetHigh, @Username, @Passwordfile, @Usernpwdnotes, @BudgetTarget, @ContactDate, @S_introsent, @S_intake, @S_NAnalysis, @S_Proposal, @Next_Meeting_Date, @Next_Meeting_Type, @Industry, @BTTC, @Refund, @RefundComplete, @Rated, @Rate, @SalesCat, @EstimatedMSale, @EstimatedDateSale, @S_ClearedForDemo, @column2, @column3, @column4, @column5, @column6, @column7, @column8, @column9, @column10, @column11, @SalesPerson, @Developer, @Designer, @ProjManager, @Administrator, @PercentageofSale, @ProspectDate, @ProspNotes, @SalesPersonAmt, @ProjManagerAmt, @DeveloperAmt, @DesignerAmt, @AdministratorAmt, @RefReqDate, @LeadNum, @RefundReason, @Refinitials, @TaxAmt1, @TaxAmt2, @Phnotes, @PhInitials, @Phdate, @SSMA_TimeStamp)" 
    
    UpdateCommand="UPDATE [Contacts] SET [First] = @First, [Last] = @Last, [Company] = @Company, [Title] = @Title, [Department] = @Department, [Office] = @Office, [Post Office Box] = @Post_Office_Box, [Address] = @Address, [City] = @City, [State] = @State, [Zip/Postal Code] = @column1, [Country] = @Country, [Phone] = @Phone, [Mobile Phone] = @Mobile_Phone, [Pager Phone] = @Pager_Phone, [Home2 Phone] = @Home2_Phone, [Assistant Phone Number] = @Assistant_Phone_Number, [Business Fax] = @Business_Fax, [Web Page] = @Web_Page, [User_Name] = @User_Name, [Password] = @Password, [MarketRef] = @MarketRef, [Comments] = @Comments, [TimeStamp] = @TimeStamp, [Type] = @Type, [PType] = @PType, [Home Fax] = @Home_Fax, [Other Fax] = @Other_Fax, [Telex Number] = @Telex_Number, [Display name] = @Display_name, [Email Type] = @Email_Type, [Email Address] = @Email_Address, [Account] = @Account, [Assistant] = @Assistant, [Send Rich Text] = @Send_Rich_Text, [Primary] = @Primary, [File As] = @File_As, [Home Address] = @Home_Address, [Business Address] = @Business_Address, [Other Address] = @Other_Address, [Journal] = @Journal, [Business Address Street] = @Business_Address_Street, [Business Address City] = @Business_Address_City, [Business Address State] = @Business_Address_State, [Business Address Postal Code] = @Business_Address_Postal_Code, [Business Address Country] = @Business_Address_Country, [Business Address PO Box] = @Business_Address_PO_Box, [User Field 1] = @User_Field_1, [User Field 2] = @User_Field_2, [User Field 3] = @User_Field_3, [User Field 4] = @User_Field_4, [Pyn] = @Pyn, [LtrNum] = @LtrNum, [Project Name] = @Project_Name, [Project Reference] = @Project_Reference, [Project Amount] = @Project_Amount, [ProspectPhase] = @ProspectPhase, [Category] = @Category, [TimeZone] = @TimeZone, [AB] = @AB, [Hrs] = @Hrs, [BudgetLo] = @BudgetLo, [BudgetHigh] = @BudgetHigh, [Username] = @Username, [Passwordfile] = @Passwordfile, [Usernpwdnotes] = @Usernpwdnotes, [BudgetTarget] = @BudgetTarget, [ContactDate] = @ContactDate, [S_introsent] = @S_introsent, [S_intake] = @S_intake, [S_NAnalysis] = @S_NAnalysis, [S_Proposal] = @S_Proposal, [Next Meeting Date] = @Next_Meeting_Date, [Next Meeting Type] = @Next_Meeting_Type, [Industry] = @Industry, [BTTC] = @BTTC, [Refund] = @Refund, [RefundComplete] = @RefundComplete, [Rated] = @Rated, [Rate] = @Rate, [SalesCat] = @SalesCat, [EstimatedMSale] = @EstimatedMSale, [EstimatedDateSale] = @EstimatedDateSale, [S_ClearedForDemo] = @S_ClearedForDemo, [2SalesPerson] = @column2, [2Developer] = @column3, [2Designer] = @column4, [2ProjManager] = @column5, [2Administrator] = @column6, [2SalesPersonAmt] = @column7, [2ProjManagerAmt] = @column8, [2DeveloperAmt] = @column9, [2DesignerAmt] = @column10, [2AdministratorAmt] = @column11, [SalesPerson] = @SalesPerson, [Developer] = @Developer, [Designer] = @Designer, [ProjManager] = @ProjManager, [Administrator] = @Administrator, [PercentageofSale] = @PercentageofSale, [ProspectDate] = @ProspectDate, [ProspNotes] = @ProspNotes, [SalesPersonAmt] = @SalesPersonAmt, [ProjManagerAmt] = @ProjManagerAmt, [DeveloperAmt] = @DeveloperAmt, [DesignerAmt] = @DesignerAmt, [AdministratorAmt] = @AdministratorAmt, [RefReqDate] = @RefReqDate, [LeadNum] = @LeadNum, [RefundReason] = @RefundReason, [Refinitials] = @Refinitials, [TaxAmt1] = @TaxAmt1, [TaxAmt2] = @TaxAmt2, [Phnotes] = @Phnotes, [PhInitials] = @PhInitials, [Phdate] = @Phdate, [SSMA_TimeStamp] = @SSMA_TimeStamp WHERE [Id] = @Id">
    <SelectParameters>
      <asp:ControlParameter ControlID="ComboBox1" Name="Id" 
        PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
    <DeleteParameters>
      <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
      <asp:Parameter Name="First" Type="String" />
      <asp:Parameter Name="Last" Type="String" />
      <asp:Parameter Name="Company" Type="String" />
      <asp:Parameter Name="Title" Type="String" />
      <asp:Parameter Name="Department" Type="String" />
      <asp:Parameter Name="Office" Type="String" />
      <asp:Parameter Name="Post_Office_Box" Type="String" />
      <asp:Parameter Name="Address" Type="String" />
      <asp:Parameter Name="City" Type="String" />
      <asp:Parameter Name="State" Type="String" />
      <asp:Parameter Name="column1" Type="String" />
      <asp:Parameter Name="Country" Type="String" />
      <asp:Parameter Name="Phone" Type="String" />
      <asp:Parameter Name="Mobile_Phone" Type="String" />
      <asp:Parameter Name="Pager_Phone" Type="String" />
      <asp:Parameter Name="Home2_Phone" Type="String" />
      <asp:Parameter Name="Assistant_Phone_Number" Type="String" />
      <asp:Parameter Name="Business_Fax" Type="String" />
      <asp:Parameter Name="Web_Page" Type="String" />
      <asp:Parameter Name="User_Name" Type="String" />
      <asp:Parameter Name="Password" Type="String" />
      <asp:Parameter Name="MarketRef" Type="String" />
      <asp:Parameter Name="Comments" Type="String" />
      <asp:Parameter DbType="DateTime2" Name="TimeStamp" />
      <asp:Parameter Name="Type" Type="String" />
      <asp:Parameter Name="PType" Type="String" />
      <asp:Parameter Name="Home_Fax" Type="String" />
      <asp:Parameter Name="Other_Fax" Type="String" />
      <asp:Parameter Name="Telex_Number" Type="String" />
      <asp:Parameter Name="Display_name" Type="String" />
      <asp:Parameter Name="Email_Type" Type="String" />
      <asp:Parameter Name="Email_Address" Type="String" />
      <asp:Parameter Name="Account" Type="String" />
      <asp:Parameter Name="Assistant" Type="String" />
      <asp:Parameter Name="Send_Rich_Text" Type="Boolean" />
      <asp:Parameter Name="Primary" Type="String" />
      <asp:Parameter Name="File_As" Type="String" />
      <asp:Parameter Name="Home_Address" Type="String" />
      <asp:Parameter Name="Business_Address" Type="String" />
      <asp:Parameter Name="Other_Address" Type="String" />
      <asp:Parameter Name="Journal" Type="Boolean" />
      <asp:Parameter Name="Business_Address_Street" Type="String" />
      <asp:Parameter Name="Business_Address_City" Type="String" />
      <asp:Parameter Name="Business_Address_State" Type="String" />
      <asp:Parameter Name="Business_Address_Postal_Code" Type="String" />
      <asp:Parameter Name="Business_Address_Country" Type="String" />
      <asp:Parameter Name="Business_Address_PO_Box" Type="String" />
      <asp:Parameter Name="User_Field_1" Type="String" />
      <asp:Parameter Name="User_Field_2" Type="String" />
      <asp:Parameter Name="User_Field_3" Type="String" />
      <asp:Parameter Name="User_Field_4" Type="String" />
      <asp:Parameter Name="Pyn" Type="Boolean" />
      <asp:Parameter Name="LtrNum" Type="Double" />
      <asp:Parameter Name="Project_Name" Type="String" />
      <asp:Parameter Name="Project_Reference" Type="String" />
      <asp:Parameter Name="Project_Amount" Type="String" />
      <asp:Parameter Name="ProspectPhase" Type="String" />
      <asp:Parameter Name="Category" Type="String" />
      <asp:Parameter Name="TimeZone" Type="String" />
      <asp:Parameter Name="AB" Type="String" />
      <asp:Parameter Name="Hrs" Type="Int32" />
      <asp:Parameter Name="BudgetLo" Type="Decimal" />
      <asp:Parameter Name="BudgetHigh" Type="Decimal" />
      <asp:Parameter Name="Username" Type="String" />
      <asp:Parameter Name="Passwordfile" Type="String" />
      <asp:Parameter Name="Usernpwdnotes" Type="String" />
      <asp:Parameter Name="BudgetTarget" Type="Decimal" />
      <asp:Parameter DbType="DateTime2" Name="ContactDate" />
      <asp:Parameter Name="S_introsent" Type="Boolean" />
      <asp:Parameter Name="S_intake" Type="Boolean" />
      <asp:Parameter Name="S_NAnalysis" Type="Boolean" />
      <asp:Parameter Name="S_Proposal" Type="Boolean" />
      <asp:Parameter DbType="DateTime2" Name="Next_Meeting_Date" />
      <asp:Parameter Name="Next_Meeting_Type" Type="String" />
      <asp:Parameter Name="Industry" Type="String" />
      <asp:Parameter Name="BTTC" Type="String" />
      <asp:Parameter Name="Refund" Type="Boolean" />
      <asp:Parameter Name="RefundComplete" Type="Boolean" />
      <asp:Parameter Name="Rated" Type="Boolean" />
      <asp:Parameter Name="Rate" Type="String" />
      <asp:Parameter Name="SalesCat" Type="String" />
      <asp:Parameter Name="EstimatedMSale" Type="String" />
      <asp:Parameter DbType="DateTime2" Name="EstimatedDateSale" />
      <asp:Parameter Name="S_ClearedForDemo" Type="Boolean" />
      <asp:Parameter Name="column2" Type="String" />
      <asp:Parameter Name="column3" Type="String" />
      <asp:Parameter Name="column4" Type="String" />
      <asp:Parameter Name="column5" Type="String" />
      <asp:Parameter Name="column6" Type="String" />
      <asp:Parameter Name="column7" Type="String" />
      <asp:Parameter Name="column8" Type="String" />
      <asp:Parameter Name="column9" Type="String" />
      <asp:Parameter Name="column10" Type="String" />
      <asp:Parameter Name="column11" Type="String" />
      <asp:Parameter Name="SalesPerson" Type="String" />
      <asp:Parameter Name="Developer" Type="String" />
      <asp:Parameter Name="Designer" Type="String" />
      <asp:Parameter Name="ProjManager" Type="String" />
      <asp:Parameter Name="Administrator" Type="String" />
      <asp:Parameter Name="PercentageofSale" Type="String" />
      <asp:Parameter DbType="DateTime2" Name="ProspectDate" />
      <asp:Parameter Name="ProspNotes" Type="String" />
      <asp:Parameter Name="SalesPersonAmt" Type="String" />
      <asp:Parameter Name="ProjManagerAmt" Type="String" />
      <asp:Parameter Name="DeveloperAmt" Type="String" />
      <asp:Parameter Name="DesignerAmt" Type="String" />
      <asp:Parameter Name="AdministratorAmt" Type="String" />
      <asp:Parameter DbType="DateTime2" Name="RefReqDate" />
      <asp:Parameter Name="LeadNum" Type="String" />
      <asp:Parameter Name="RefundReason" Type="String" />
      <asp:Parameter Name="Refinitials" Type="String" />
      <asp:Parameter Name="TaxAmt1" Type="String" />
      <asp:Parameter Name="TaxAmt2" Type="String" />
      <asp:Parameter Name="Phnotes" Type="String" />
      <asp:Parameter Name="PhInitials" Type="String" />
      <asp:Parameter DbType="DateTime2" Name="Phdate" />
      <asp:Parameter Name="SSMA_TimeStamp" Type="Object" />
      <asp:Parameter Name="Id" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
      <asp:Parameter Name="First" Type="String" />
      <asp:Parameter Name="Last" Type="String" />
      <asp:Parameter Name="Company" Type="String" />
      <asp:Parameter Name="Title" Type="String" />
      <asp:Parameter Name="Department" Type="String" />
      <asp:Parameter Name="Office" Type="String" />
      <asp:Parameter Name="Post_Office_Box" Type="String" />
      <asp:Parameter Name="Address" Type="String" />
      <asp:Parameter Name="City" Type="String" />
      <asp:Parameter Name="State" Type="String" />
      <asp:Parameter Name="column1" Type="String" />
      <asp:Parameter Name="Country" Type="String" />
      <asp:Parameter Name="Phone" Type="String" />
      <asp:Parameter Name="Mobile_Phone" Type="String" />
      <asp:Parameter Name="Pager_Phone" Type="String" />
      <asp:Parameter Name="Home2_Phone" Type="String" />
      <asp:Parameter Name="Assistant_Phone_Number" Type="String" />
      <asp:Parameter Name="Business_Fax" Type="String" />
      <asp:Parameter Name="Web_Page" Type="String" />
      <asp:Parameter Name="User_Name" Type="String" />
      <asp:Parameter Name="Password" Type="String" />
      <asp:Parameter Name="MarketRef" Type="String" />
      <asp:Parameter Name="Comments" Type="String" />
      <asp:Parameter DbType="DateTime2" Name="TimeStamp" />
      <asp:Parameter Name="Type" Type="String" />
      <asp:Parameter Name="PType" Type="String" />
      <asp:Parameter Name="Home_Fax" Type="String" />
      <asp:Parameter Name="Other_Fax" Type="String" />
      <asp:Parameter Name="Telex_Number" Type="String" />
      <asp:Parameter Name="Display_name" Type="String" />
      <asp:Parameter Name="Email_Type" Type="String" />
      <asp:Parameter Name="Email_Address" Type="String" />
      <asp:Parameter Name="Account" Type="String" />
      <asp:Parameter Name="Assistant" Type="String" />
      <asp:Parameter Name="Send_Rich_Text" Type="Boolean" />
      <asp:Parameter Name="Primary" Type="String" />
      <asp:Parameter Name="File_As" Type="String" />
      <asp:Parameter Name="Home_Address" Type="String" />
      <asp:Parameter Name="Business_Address" Type="String" />
      <asp:Parameter Name="Other_Address" Type="String" />
      <asp:Parameter Name="Journal" Type="Boolean" />
      <asp:Parameter Name="Business_Address_Street" Type="String" />
      <asp:Parameter Name="Business_Address_City" Type="String" />
      <asp:Parameter Name="Business_Address_State" Type="String" />
      <asp:Parameter Name="Business_Address_Postal_Code" Type="String" />
      <asp:Parameter Name="Business_Address_Country" Type="String" />
      <asp:Parameter Name="Business_Address_PO_Box" Type="String" />
      <asp:Parameter Name="User_Field_1" Type="String" />
      <asp:Parameter Name="User_Field_2" Type="String" />
      <asp:Parameter Name="User_Field_3" Type="String" />
      <asp:Parameter Name="User_Field_4" Type="String" />
      <asp:Parameter Name="Pyn" Type="Boolean" />
      <asp:Parameter Name="LtrNum" Type="Double" />
      <asp:Parameter Name="Project_Name" Type="String" />
      <asp:Parameter Name="Project_Reference" Type="String" />
      <asp:Parameter Name="Project_Amount" Type="String" />
      <asp:Parameter Name="ProspectPhase" Type="String" />
      <asp:Parameter Name="Category" Type="String" />
      <asp:Parameter Name="TimeZone" Type="String" />
      <asp:Parameter Name="AB" Type="String" />
      <asp:Parameter Name="Hrs" Type="Int32" />
      <asp:Parameter Name="BudgetLo" Type="Decimal" />
      <asp:Parameter Name="BudgetHigh" Type="Decimal" />
      <asp:Parameter Name="Username" Type="String" />
      <asp:Parameter Name="Passwordfile" Type="String" />
      <asp:Parameter Name="Usernpwdnotes" Type="String" />
      <asp:Parameter Name="BudgetTarget" Type="Decimal" />
      <asp:Parameter DbType="DateTime2" Name="ContactDate" />
      <asp:Parameter Name="S_introsent" Type="Boolean" />
      <asp:Parameter Name="S_intake" Type="Boolean" />
      <asp:Parameter Name="S_NAnalysis" Type="Boolean" />
      <asp:Parameter Name="S_Proposal" Type="Boolean" />
      <asp:Parameter DbType="DateTime2" Name="Next_Meeting_Date" />
      <asp:Parameter Name="Next_Meeting_Type" Type="String" />
      <asp:Parameter Name="Industry" Type="String" />
      <asp:Parameter Name="BTTC" Type="String" />
      <asp:Parameter Name="Refund" Type="Boolean" />
      <asp:Parameter Name="RefundComplete" Type="Boolean" />
      <asp:Parameter Name="Rated" Type="Boolean" />
      <asp:Parameter Name="Rate" Type="String" />
      <asp:Parameter Name="SalesCat" Type="String" />
      <asp:Parameter Name="EstimatedMSale" Type="String" />
      <asp:Parameter DbType="DateTime2" Name="EstimatedDateSale" />
      <asp:Parameter Name="S_ClearedForDemo" Type="Boolean" />
      <asp:Parameter Name="column2" Type="String" />
      <asp:Parameter Name="column3" Type="String" />
      <asp:Parameter Name="column4" Type="String" />
      <asp:Parameter Name="column5" Type="String" />
      <asp:Parameter Name="column6" Type="String" />
      <asp:Parameter Name="column7" Type="String" />
      <asp:Parameter Name="column8" Type="String" />
      <asp:Parameter Name="column9" Type="String" />
      <asp:Parameter Name="column10" Type="String" />
      <asp:Parameter Name="column11" Type="String" />
      <asp:Parameter Name="SalesPerson" Type="String" />
      <asp:Parameter Name="Developer" Type="String" />
      <asp:Parameter Name="Designer" Type="String" />
      <asp:Parameter Name="ProjManager" Type="String" />
      <asp:Parameter Name="Administrator" Type="String" />
      <asp:Parameter Name="PercentageofSale" Type="String" />
      <asp:Parameter DbType="DateTime2" Name="ProspectDate" />
      <asp:Parameter Name="ProspNotes" Type="String" />
      <asp:Parameter Name="SalesPersonAmt" Type="String" />
      <asp:Parameter Name="ProjManagerAmt" Type="String" />
      <asp:Parameter Name="DeveloperAmt" Type="String" />
      <asp:Parameter Name="DesignerAmt" Type="String" />
      <asp:Parameter Name="AdministratorAmt" Type="String" />
      <asp:Parameter DbType="DateTime2" Name="RefReqDate" />
      <asp:Parameter Name="LeadNum" Type="String" />
      <asp:Parameter Name="RefundReason" Type="String" />
      <asp:Parameter Name="Refinitials" Type="String" />
      <asp:Parameter Name="TaxAmt1" Type="String" />
      <asp:Parameter Name="TaxAmt2" Type="String" />
      <asp:Parameter Name="Phnotes" Type="String" />
      <asp:Parameter Name="PhInitials" Type="String" />
      <asp:Parameter DbType="DateTime2" Name="Phdate" />
      <asp:Parameter Name="SSMA_TimeStamp" Type="Object" />
    </InsertParameters>
</asp:SqlDataSource>
  <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
    ConnectionString="<%$ ConnectionStrings:custom_dbConnectionString %>" 
    
    SelectCommand="SELECT [Id], [First], [Last], [Company], [Title], [Address], [City], [State], [Zip/Postal Code] AS column1, [Phone], [Web Page] AS Web_Page, [Comments], [Email Address] AS Email_Address, [User Field 2] AS User_Field_2, [Username], [Passwordfile], [Usernpwdnotes], [ContactDate] FROM [Contacts] WHERE ([Id] = @Id2)" 
    DeleteCommand="DELETE FROM [Contacts] WHERE [Id] = @Id" 
    InsertCommand="INSERT INTO [Contacts] ([First], [Last], [Company], [Title], [Address], [City], [State], [Zip/Postal Code], [Phone], [Web Page], [Comments], [Email Address], [User Field 2], [Username], [Passwordfile], [Usernpwdnotes], [ContactDate]) VALUES (@First, @Last, @Company, @Title, @Address, @City, @State, @column1, @Phone, @Web_Page, @Comments, @Email_Address, @User_Field_2, @Username, @Passwordfile, @Usernpwdnotes, @ContactDate)" 
    UpdateCommand="UPDATE [Contacts] SET [First] = @First, [Last] = @Last, [Company] = @Company, [Title] = @Title, [Address] = @Address, [City] = @City, [State] = @State, [Zip/Postal Code] = @column1, [Phone] = @Phone, [Web Page] = @Web_Page, [Comments] = @Comments, [Email Address] = @Email_Address, [User Field 2] = @User_Field_2, [Username] = @Username, [Passwordfile] = @Passwordfile, [Usernpwdnotes] = @Usernpwdnotes, [ContactDate] = @ContactDate WHERE [Id] = @Id">
    <SelectParameters>
      <asp:ControlParameter ControlID="ComboBox1" Name="Id2" 
        PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
    <DeleteParameters>
      <asp:Parameter Name="Id" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
      <asp:Parameter Name="First" Type="String" />
      <asp:Parameter Name="Last" Type="String" />
      <asp:Parameter Name="Company" Type="String" />
      <asp:Parameter Name="Title" Type="String" />
      <asp:Parameter Name="Address" Type="String" />
      <asp:Parameter Name="City" Type="String" />
      <asp:Parameter Name="State" Type="String" />
      <asp:Parameter Name="column1" Type="String" />
      <asp:Parameter Name="Phone" Type="String" />
      <asp:Parameter Name="Web_Page" Type="String" />
      <asp:Parameter Name="Comments" Type="String" />
      <asp:Parameter Name="Email_Address" Type="String" />
      <asp:Parameter Name="User_Field_2" Type="String" />
      <asp:Parameter Name="Username" Type="String" />
      <asp:Parameter Name="Passwordfile" Type="String" />
      <asp:Parameter Name="Usernpwdnotes" Type="String" />
      <asp:Parameter DbType="DateTime2" Name="ContactDate" />
      <asp:Parameter Name="Id" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
      <asp:Parameter Name="First" Type="String" />
      <asp:Parameter Name="Last" Type="String" />
      <asp:Parameter Name="Company" Type="String" />
      <asp:Parameter Name="Title" Type="String" />
      <asp:Parameter Name="Address" Type="String" />
      <asp:Parameter Name="City" Type="String" />
      <asp:Parameter Name="State" Type="String" />
      <asp:Parameter Name="column1" Type="String" />
      <asp:Parameter Name="Phone" Type="String" />
      <asp:Parameter Name="Web_Page" Type="String" />
      <asp:Parameter Name="Comments" Type="String" />
      <asp:Parameter Name="Email_Address" Type="String" />
      <asp:Parameter Name="User_Field_2" Type="String" />
      <asp:Parameter Name="Username" Type="String" />
      <asp:Parameter Name="Passwordfile" Type="String" />
      <asp:Parameter Name="Usernpwdnotes" Type="String" />
      <asp:Parameter DbType="DateTime2" Name="ContactDate" />
    </InsertParameters>
  </asp:SqlDataSource>
  <%--HDNotes Table to review responses--%>
  </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footercontent" Runat="Server">
</asp:Content>

