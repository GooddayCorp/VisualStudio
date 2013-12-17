<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="dynamicHTML" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Site Search Javascript</title>
	<script src="js/sitesearch2.js" type="text/javascript"></script>
	<link href="css/reset.css" rel="stylesheet" type="text/css" />
	<link href="css/style.css" rel="stylesheet" type="text/css" />
	<link href="css/popup.css" rel="stylesheet" type="text/css" />
	
  <script language="javascript" type="text/javascript">  
		function pageLoad(sender, args) {
			smoothAnimation();
		}
		function smoothAnimation() {
			var collPanel = $find("CollapsiblePanelExtender");
			collPanel._animation._fps = 45;
			collPanel._animation._duration = .90;
		}	 
	</script> 
</head>

<body>
<form id="form1" runat="server" >
<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
		</asp:ToolkitScriptManager>
	<div id="toggleDiv" 
		style="position:absolute; top: 300px; left:0px; background-color:teal; Color:#FFCC00; font-size:8pt; border: solid 1px black; vertical-align:middle; text-align:center; width:33px; height: 90px; padding:2px 0 2px 0">
		<asp:Label ID="lblMessage" runat="server" Text="Label" />
		<br /><br />S<br />e<br />a<br />r<br />c<br />h
	</div>	
	<div id="searchDiv" style="position:absolute; top: 320px; left:0px; " >
		<asp:Panel ID="searchPanel" runat="server" 
			style="
			height:auto;
			padding: 10px 10px 10px 10px;
			overflow: hidden;
			background-color:#DDDDDD; border: solid 1px black; " >		
			<div id="resultsPane" >
				<input type="text" id="srchval" value="" />
				<input id="searchButton" type="button" value="Search" 
					onclick="search(srchval.value)"/> 		
			</div>
		</asp:Panel>		  								
	</div>
	<asp:CollapsiblePanelExtender ID="CollapsiblePanelExtender" 
		runat="server" Enabled="True" TargetControlID="searchPanel" 
		CollapseControlID="toggleDiv" ExpandControlID="toggleDiv" Collapsed="True" 
			TextLabelID="lblMessage"
			CollapsedText=">>"
			ExpandedText="<<"
			SuppressPostBack="True"  
			ExpandDirection="Horizontal">
	</asp:CollapsiblePanelExtender>
</form>
</body>
</html>