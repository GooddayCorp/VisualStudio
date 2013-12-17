<%@ Page Language="C#" MasterPageFile="MasterInRoot.master" AutoEventWireup="true" 
CodeFile="Home.aspx.cs" Inherits="_Home" Title="Good Day" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headercontent" Runat="Server">

  <script type="JavaScript">
  top.window.moveTo(0, 0);
  if (document.all) {
    top.window.resizeTo(screen.availWidth, screen.availHeight);
  }
  else if (document.layers || document.getElementById) {
    if (top.window.outerHeight < screen.availHeight || top.window.outerWidth < screen.availWidth) {
      top.window.outerHeight = screen.availHeight;
      top.window.outerWidth = screen.availWidth;
    }
  }
 </script>
 <script type="text/javascript" src="js/AC_RunActiveContent.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" Runat="Server">
  <div class="flash">
    <center>
    <script type="text/javascript">
        AC_FL_RunContent('codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0',
        'width', '490', 'height', '330', 'src', 'Movie1', 'quality', 'high', 'pluginspage',
        'http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash','movie','Videos/Lake' );
    </script>
    <noscript>
        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" 
        codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="790" height="330">
          <param name="movie" value="Movie1.swf" />
          <param name="quality" value="high" />
          <embed src="Movie1.swf" quality="high" 
          pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" 
          type="application/x-shockwave-flash" width="790" height="330"></embed>
        </object>
    </noscript>
    </center>
  </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footercontent" Runat="Server">
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td width="387" valign="top" style="padding-Right: 10px">
            </td>
            <td width="1" bgcolor="#FFFFFF"></td>
            <td width="387" valign="top" style="padding-left: 10px">
            </td>
        </tr>
    </table>
</asp:Content>