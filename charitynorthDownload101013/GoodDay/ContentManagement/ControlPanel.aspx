<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ControlPanel.aspx.cs" Inherits="ControlPanel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
  <script src="Script/PopupFunctions.js" type="text/javascript"></script>
  <script src="Script/FadeGrayoutPopup.js" type="text/javascript"></script>
  <script src="Script/resize.js" type="text/javascript"></script>

  <link href="Style/popup.css" rel="stylesheet" type="text/css" />
  <link href="Style/visionofvets.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
  <div id="controlpanel" >
    <div class="popuptitle">
      Control Panel</div>
    <div class="popupbody">
      <form id="form3" runat="server" >
    <div id="RichTextBoxDiv">
      <asp:TextBox ID="RichTextBox" runat="server" TextMode = "MultiLine" 
        Height="300px" Width="400px" ></asp:TextBox><br />
      <asp:Button ID="ContentButton" runat="server" 
        onclick="ContentButton_Click" Text=" Save Text Content" />
      <asp:Button ID="SponsorsButton" runat="server"
        onclick="SponsorsButton_Click" Text="Save Sponsors Content" />
      <asp:Button ID="ImageButton" runat="server"
        onclick="ImageButton_Click" Text="Save Vets Image" />
      <asp:Button ID="VideoButton" runat="server"
        onclick="VideoButton_Click" Text="Save Vets Video" />
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
</body>
</html>
