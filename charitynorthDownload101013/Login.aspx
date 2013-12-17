<%@ Page Title="Cover Letter" Language="C#" 
MasterPageFile="MasterInRoot.master" AutoEventWireup="true"
CodeFile="Login.aspx.cs" Inherits="_Home" %>

<%@ MasterType virtualpath="~/MasterInRoot.master" %>
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
 <script type="text/JavaScript">
<!--
   window.onload = function() {
     var p;
     p = 'login'
     fade(p, true);
     showPopup(p);
   };
// -->
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" Runat="Server">
  <p>
  Michael Lanham, PhD, PMP 
  <img class="floatright" src="Goodday/Images/MikeatSchmitts.jpg" alt="Dr. Lanham" /><br />
  (509) 240-4213<br />
  <a href="mailto:mike@gooddaycorp.com">mike@gooddaycorp.com</a></p>
  <div class="clinks" >
    <p>&nbsp;</p>
    <p>Dear Sirs;</p>
    <p>I enjoy learning new technologies to better fulfill project requirements.&nbsp; Please review my portfolio, on the menu at left. A quick scan of my resume shows that I have delivered projects in several industries and in a variety of roles. Be it as a developer, analyst or project manager,&nbsp; I have the experience to be immediately productive.</p>
    
    <p >Flexibility is key. Today’s markets are fast changing. To thrive in an environment of change an organization must be ready to respond. One must be ready to capitalize on changing conditions by executing planned responses. I am a certified project manager (PMP), with experience in a variety of environments, as well as, taught all knowledge areas of project management at the college level. </p>

    <p>Use me to code or to manage your projects as needed.</p>
    <p>Mike Lanham, PhD, PMP</p>
    <p>&nbsp;</p>
    <p>
    &nbsp;</p>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footercontent" Runat="Server">
</asp:Content>

