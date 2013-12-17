<%@ Page Title="" Language="C#" MasterPageFile="~/Goodday/MasterAdmin.master" AutoEventWireup="true" CodeFile="locked_users.aspx.cs" Inherits="MenuTabs" %>
<%@ Import Namespace="System.Web.Configuration" %>
<!-- #include file="~/Goodday/OnlyAdmin/Access/register_controls.aspx -->

<asp:Content ID="Content1" ContentPlaceHolderID="headercontent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" Runat="Server">
  <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
    Width="100%">
    <asp:TabPanel ID="TabPanel1" runat="server" HeaderText="Users">
      <ContentTemplate>
        <mike:locked_users runat="server" />
      </ContentTemplate>
    </asp:TabPanel>    
    <asp:TabPanel ID="TabPanel2" runat="server" HeaderText="Rule Mgmt">
      <ContentTemplate>
        <mike:access_rules runat="server" />
      </ContentTemplate>
    </asp:TabPanel>
    <asp:TabPanel ID="TabPanel3" runat="server" HeaderText="Rule Summary" >
      <ContentTemplate>
        <mike:access_rule_summary runat="server" />
      </ContentTemplate>
    </asp:TabPanel>
    <asp:TabPanel ID="TabPanel4" runat="server" HeaderText="Add Users">
      <ContentTemplate>
        <mike:add_user runat="server" />
      </ContentTemplate>
    </asp:TabPanel>    
    <asp:TabPanel ID="TabPanel5" runat="server" HeaderText="Roles">
      <ContentTemplate>
        <mike:roles runat="server" />
      </ContentTemplate>
    </asp:TabPanel>
  </asp:TabContainer>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footercontent" Runat="Server">
</asp:Content>

