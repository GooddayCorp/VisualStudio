<%@ Page Title="Screen Scraper, VB Code Demo" Language="VB" MasterPageFile="~/MasterInRoot.master" AutoEventWireup="false" CodeFile="stockScreenScraper.aspx.vb" Inherits="GoodDay_PublicContent_stockScreenScraper" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headCodeBlock" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headercontent" Runat="Server">

	<script type="text/javascript">
		 function slideCode(elementId, headerElement) {

		 	var element = document.getElementById(elementId);

		 	//     	if (element.up == null || element.down == true) {
		 	if (element.up == null || element.down == true) {
		 		animate(
          elementID = elementId,
          newLeft = 0,
          newTop = 15,
          newWidth = 400,
          newHeight = 800,
          time = 500,
          callback = null);
		 		element.up = true;
		 		element.down = false;
		 		headerElement.innerHTML = '&lt;&lt;<br />&nbsp;<br />' +
        'V<br />i<br />e<br />w<br /> <br />C<br />o<br />d<br />e';
		 	}
		 	else {
		 		animate(
          elementID = elementId,
          newLeft = -426,
          newTop = 15,
          newWidth = 400,
          newHeight = 800,
          time = 500,
          callback = null);
		 		element.up = false;
		 		element.down = true;
		 		headerElement.innerHTML = '&gt;&gt;<br />&nbsp;<br />' +
        'V<br />i<br />e<br />w<br /> <br />C<br />o<br />d<br />e';
		 	}
		 }
//		function assignLiteral() { 		
//		var contentPath = Server.MapPath("Content")
//		codeDiv.innerHTML = "test"
//	}

</script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" Runat="Server">
 
 
	 <asp:Label ID="inputLabel" runat="server" Text="Stock: "></asp:Label>
	 <asp:TextBox ID="inputTextBox" runat="server"></asp:TextBox>
	 <asp:Button ID="inputButton" runat="server" Text="Submit" style="background:#CCCC98" />
	 <br />
	 <asp:Label ID="lblError" runat="server" style="color: red;"></asp:Label>
	 <br />
	 <table id="stockTable" runat="server"
		 style="empty-cells:hide; text-align: center; border:solid 1px teal; padding:4px;" >
		<tr style="font-weight:bold; ">
			<td>Stocks</td>
		</tr>			
		<tr>
			<td>C</td>
		</tr>		
		<tr>
			<td>S</td>
		</tr>		
		<tr>
			<td>AAPL</td>
		</tr>		
		<tr>
			<td>MSFT</td>
		</tr>
	 </table>
	 <br />
	 &nbsp;
	 <br />
		<div style="position:relative; top:-105px; left:60px;">
			<table id="resultsTable" runat="server" 
			 style="empty-cells:hide; text-align: center; border:solid 1px teal; " border="1" align="left" >
				<tr style="font-weight:bold; ">
					<td width="70px">Symbol</td>
					<td width="70px">Price</td>
					<td width="90px">Change ($)</td>
					<td width="90px">Change (%)</td>
					<td width="90px">Volume</td>			 
					<td width="90px">Avg Vol</td>
					<td>Vol Index</td>
				</tr>   
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>				
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>

			</table>
		</div>
<%--		<div 			onclick="slideCode('codeDiv', this);"
style="position:absolute; top:0px; left:0px; width: 125px; border:solid 1px black; background:#DDDDDD;">
			<asp:Button ID="codeButton" runat="server" Text="Review Code" style="background:tan" />	
			<br />
		</div>--%>
		<div id="codeContainerButton" class="sliderButton"	style="left:-25px; top:0px;"	
			onclick="slideCode('codeDiv', this);" >
			&gt;&gt;<br /> <br />V<br />i<br />e<br />w<br /> <br />C<br />o<br />d<br />e
		</div>	
		<div id="codeContainer" 
			style="
			position:absolute; 
			width:auto; height:auto; 
			top: 0px; left:0px;">
			<%--width and height must be set to a value in the sliding Div, otherwise slider get stuck in a loop--%>
			<div id="codeDiv"  
				style="
				position:inherit;
				width:230px; height:1px;	
				top:266px; left:-280px;
				padding: 10px;
				background:#CCCC98;
				border: solid 2px teal;
				overflow:auto;
				">
				<asp:Label ID="codeLabel" runat="server" ></asp:Label>			
			</div>				
		</div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footercontent" Runat="Server">
</asp:Content>

