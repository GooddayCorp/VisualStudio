<%@ Control Language="C#" %>
<script src="../Script/FadeGrayoutPopup.js" type="text/javascript"></script>
<script src="../Script/PopupFunctions.js" type="text/javascript"></script>

<asp:TreeView ID="TreeView1" Text="FavoritesTreeView" runat="server" DataSourceText="SiteMapDataSource1"
  ExpandDepth="1">
  <Nodes>
    <asp:TreeNode NavigateUrl="" Text="Please Login to Update Task or Delete Task."></asp:TreeNode>
    <asp:TreeNode NavigateUrl="" Text="For demonstration purposes the username/password">
    </asp:TreeNode>
    <asp:TreeNode NavigateUrl="" Text="is guest/@marshall. To Update a Task, click on its">
    </asp:TreeNode>
    <asp:TreeNode NavigateUrl="" Text="underlined link in Details."></asp:TreeNode>
  </Nodes>
</asp:TreeView>
