<%@ Page Language="C#" MasterPageFile="MasterInRoot.master" AutoEventWireup="true" 
CodeFile="SlideShow.aspx.cs" Inherits="Training" Title="The Universe is good!" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headercontent" Runat="Server">
    <script type="text/javascript">
        function showNextItem(clickedButton, rotator, direction) {
            rotator.showNext(direction);
        }    
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" Runat="Server">
    <h2>A child-like wonder is good.</h2>
    <h3>
      <a href="Goodday/OnlyUnrestricted/ContactUs.aspx">Contact Us!</a>
    </h3>
    <center> 
      <telerik:RadRotator ID="RadRotator1" runat="server" 
        BorderStyle="None" 
        Width="500px" 
        RotatorType="FromCode" 
        ItemHeight="250px" Class="rotator" ItemWidth="250px">
        <Items>
            <telerik:RadRotatorItem>
                <ItemTemplate>
                    <img src="Goodday/images/eaglenebulla.jpg" width="250" hspace="5" alt="" />
                </ItemTemplate>
            </telerik:RadRotatorItem>            
            <telerik:RadRotatorItem>
                <ItemTemplate>
                    <img src="Goodday/images/flamefractasized205p.jpg" width="250" hspace="5" alt="" />
                </ItemTemplate>
            </telerik:RadRotatorItem>                                 
            <telerik:RadRotatorItem>
                <ItemTemplate>
                    <img src="Goodday/images/moonrisingfull4c.jpg" width="250" hspace="5" alt="" />
                </ItemTemplate>
            </telerik:RadRotatorItem>                
            <telerik:RadRotatorItem>
                <ItemTemplate>
                    <img src="Goodday/images/havasu_falls_1a_md.jpg" width="250" hspace="5" alt="" />
                </ItemTemplate>
            </telerik:RadRotatorItem>            
    
            <telerik:RadRotatorItem>
                <ItemTemplate>
                    <img src="Goodday/images/rockclimbing.jpg" width="250" hspace="5" alt="" />
                </ItemTemplate>
            </telerik:RadRotatorItem>          
                   <telerik:RadRotatorItem>
                <ItemTemplate>
                    <img src="Goodday/images/smoke_cropped360.jpg" width="250" hspace="5" alt="" />
                </ItemTemplate>
            </telerik:RadRotatorItem>          
        </Items>
      </telerik:RadRotator>
    </center> 
    <center>
      <div class="rotatorbuttons">
      <a href="#" onclick="showNextItem(this, $find('<%= RadRotator1.ClientID %>'), Telerik.Web.UI.RotatorScrollDirection.Right); return false;"><img src="Goodday/images/left.png" border="0" width="30" hspace="3" alt="<<" /></a>
      <a href="#" onclick="showNextItem(this, $find('<%= RadRotator1.ClientID %>'), Telerik.Web.UI.RotatorScrollDirection.Left); return false;"><img src="Goodday/images/right.png" border="0" width="30" hspace="3" alt=">>" /></a>
    </div>
    </center>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="footercontent" Runat="Server">
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td width="430" valign="top" style="padding-right: 10px">
                <h1></h1>
                <p class="white">
                </p>
                <h1></h1>
                <p class="white">
                </p>
            </td>
            <td width="1" bgcolor="#FFFFFF"></td>
            <td width="430" valign="top" style="padding-left: 10px">
                <h1></h1>
                <p class="white">
                </p>
                <h1></h1>
                <p class="white">
                </p>
            </td>
        </tr>
    </table>
</asp:Content>