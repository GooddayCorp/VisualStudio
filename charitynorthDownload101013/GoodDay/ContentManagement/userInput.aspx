<%@ Page Title="Content Management" validateRequest="false" Language="C#" MasterPageFile="~/Goodday/MasterPage.master" AutoEventWireup="true" CodeFile="userInput.aspx.cs" Inherits="userInput" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headCodeBlock" Runat="Server">
	<script type="text/javascript" src="Script/resize.js" ></script>
	<script type="text/javascript" src="tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
	<script type="text/javascript" src="Script/tiny_mceSetup.js"></script>
	<script type="text/javascript" src="Script/jwplayer.js"></script>
	<script type="text/javascript" src="Script/Ranks.js"></script>

	<script src="../../js/PopupFunctions.js" type="text/javascript"></script>
	<script src="../../js/SOTCAnimator.js" type="text/javascript"></script>
	<script src="../../js/sliderAnimation.js" type="text/javascript"></script>
	<script src="../../js/FadeGrayoutPopup.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headercontent" Runat="Server">
	<link href="Style/popup.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="bodycontent" Runat="Server">
	<div id="container">
	  <asp:Literal runat="server" id="section1"/>
  </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footercontent" Runat="Server">

  <div id="controlpanel" class="popup">
    <div class="popuptitle">
      Content Management
    </div>
    <div class="popupbody">
			<form id="form3" action="" >
				<div id="RichTextBoxDiv">
					<asp:TextBox ID="RichTextBox" runat="server" TextMode = "MultiLine" 
						Height="400px" Width="600px" onload="populateTextBox" ></asp:TextBox>
					<asp:Button ID="updateButton" runat="server" 
						onclick="updateButton_Click" Text=" Update Content" />
					<asp:Button ID="BackButton" runat="server"
						onclick="BackButton_Click" Text="Cancel" />
					<p>      
						<asp:FileUpload ID="FileUpload1" runat="server" />
						<asp:Button id="UploadButton" 
							 Text="Upload file"
							 OnClick="UploadButton_Click"
							 runat="server" Height="22px">
						</asp:Button>    
						<asp:Label id="UploadStatusLabel"
							 runat="server">
						</asp:Label>
					</p>        
				</div>
			</form> 
    </div>
  </div>
   <input id="contentButton" type="button" runat="server" class="" value="Edit Content" 
		onmouseup="popupOn('controlpanel')" style="background:transparent; position:absolute;top: 267px; left:253px; " /> 
</asp:Content>

