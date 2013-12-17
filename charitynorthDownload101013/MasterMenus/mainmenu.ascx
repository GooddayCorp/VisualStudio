<%@ control language="C#" autoeventwireup="true" inherits="GoodDay_Favorites_mainmenu, App_Web_ivoe05rn" %>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<link href="../css/popup.css" rel="stylesheet" type="text/css" />
<script runat="server">
</script>
<asp:TreeView ID="MainMenuTreeView" runat="server" 
      DataSourceID="XmlDataSource1" ExpandDepth="1" CssClass="clinks" >
      <ParentNodeStyle HorizontalPadding="5px" />
      <SelectedNodeStyle HorizontalPadding="5px" />
      <DataBindings>
        <asp:TreeNodeBinding DataMember="siteMapNode" NavigateUrlField="url" 
          TextField="title" ToolTipField="description" />
      </DataBindings>
      <Nodes>
          <asp:TreeNode 
            NavigateUrl="/default.aspx" 
            Text="New Node" 
            Value="New Node">
            <asp:TreeNode 
              NavigateUrl="/interests/interestsgeneral.aspx" 
              Text="New Node" 
              Value="New Node">
                <asp:TreeNode 
                  NavigateUrl="/interests/interestsspecific.aspx" 
                  Text="New Node" 
                  Value="New Node">
                </asp:TreeNode>
            </asp:TreeNode>
            <asp:TreeNode 
              NavigateUrl="/resume/resumehighlights.aspx" 
              Text="New Node" 
              Value="New Node">
                <asp:TreeNode 
                  NavigateUrl="/resume/resumedetailed.aspx" 
                  Text="New Node" 
                  Value="New Node">
                </asp:TreeNode>
             </asp:TreeNode>
          </asp:TreeNode>
      </Nodes>
      <RootNodeStyle HorizontalPadding="5px" />
      <NodeStyle HorizontalPadding="5px" />
      <LeafNodeStyle HorizontalPadding="5px" />
  </asp:TreeView>
<asp:XmlDataSource ID="XmlDataSource1" runat="server" 
  DataFile="MenuSide.xml"></asp:XmlDataSource>

