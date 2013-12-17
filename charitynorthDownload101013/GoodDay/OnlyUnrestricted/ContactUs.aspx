<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Goodday/MasterAdmin.master" AutoEventWireup="true" 
CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="headercontent" Runat="Server">
  <script src="http://maps.google.com/maps?file=api&v=1&key=AIzaSyC5SH0cJlvP543lhfRnnheRB_kD6GyAFAc" 
  type="text/javascript"></script>   
  <style type="text/css">
    html, body {width: 100%; height: 100%}
    body {margin-top: 0px; margin-right: 0px; margin-left: 0px; margin-bottom: 0px}
  </style>
  <script type="text/javascript">
    // <!CDATA[
    // toggle style display parameter
    function toggle(obj) {
      var el = document.getElementById(obj);
      if (el.style.display != 'block') {
        el.style.display = 'block';
      }
      else {
        el.style.display = 'none';
      }
    }
    // ]]>
  </script>  

  <style type="text/css">
    .style6
    {
      width: 97px;
    }
  </style>
  
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" Runat="Server">
    
      <p>We are located in beautiful Bellingham, Washington, and would enjoy hearing from you.<br />
    Please complete the form below, or call 509-240-4213.</p><br />
    <table id="contacttable" >
        <tr runat="server" id="formrow1">
            <td valign="top" >
                <table class="formtable">
                    <tr>
                        <td >
                            &nbsp;</td>
                        <td class="style6" >
                            <asp:Label ID="Label1" runat="server" Text="Company:" 
                              AssociatedControlID="txtCompany" CssClass="contactLabel" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtCompany" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td >
                            &nbsp;</td>
                        <td c class="style6">
                            <asp:Label ID="Label2" runat="server" Text="First Name:" AssociatedControlID="txtFirstName" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtFirstName" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td >
                            &nbsp;</td>
                        <td class="style6" >
                            <asp:Label ID="Label3" runat="server" Text="Last Name:" AssociatedControlID="txtLastName" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtLastName" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td >
                            &nbsp;</td>
                        <td class="style6" >
                            <asp:Label ID="Label4" runat="server" Text="Address:" AssociatedControlID="txtAddress" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddress" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td >
                            &nbsp;</td>
                        <td class="style6" >
                            <asp:Label ID="Label5" runat="server" Text="City:" AssociatedControlID="txtCity" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtCity" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td >
                            &nbsp;</td>
                        <td class="style6">
                            <asp:Label ID="Label6" runat="server" Text="State/Zip:" AssociatedControlID="ddlState" />
                        </td>
                        <td>
                              <asp:DropDownList ID="ddlState" runat="server" 
                                DataSourceID="XmlDataSource1"                           
                                DataTextField="name" 
                                DataValueField="abbr" 
                                AppendDataBoundItems="true">
                              <asp:ListItem Text="" Value="" />
                            </asp:DropDownList>       
                            <asp:TextBox ID="txtZip" runat="server" Width="100px" />                     
                        </td>
                    </tr>
                    <tr>
                        <td >
                            &nbsp;</td>
                        <td class="style6" >
                            <asp:Label ID="Label7" runat="server" Text="Phone #:" AssociatedControlID="txtPhone" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtPhone" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td >
                            &nbsp;</td>
                        <td class="style6" >
                            <asp:Label ID="Label8" runat="server" Text="Email:" AssociatedControlID="txtEmail" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td >
                            &nbsp;</td>
                        <td class="style6">
                            <asp:Label ID="Label9" runat="server" Text="Website:" AssociatedControlID="txtWebAddress" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtWebAddress" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td >
                            &nbsp;</td>
                        <td class="style6" >
                            <asp:Label ID="Label10" runat="server" Text="Best Time:" AssociatedControlID="txtBestTime" />
                        </td>
                        <td>
                            <asp:TextBox ID="txtBestTime" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td >
                            &nbsp;</td>
                        <td ">
                            <asp:Label ID="Label11" runat="server" Text="Time Zone:" 
                          AssociatedControlID="ddlTimeZone" class="style6" />
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlTimeZone" runat="server">
                                <asp:ListItem Text="" Value="" />
                                <asp:ListItem Value="Eastern" />
                                <asp:ListItem Value="Central" />
                                <asp:ListItem Value="Mountain" />
                                <asp:ListItem Value="Pacific" />
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </td>
            <td valign="top">
                &nbsp;</td>
            <td width="45%" valign="top">
                <table class="formtable">
                    <tr>
                        <td>
                            <asp:Label ID="Label12" runat="server" Text="Choose Interest Areas:" AssociatedControlID="cblInterest" /><br />
                            <asp:CheckBoxList ID="cblInterest" runat="server" CssClass="listtable" RepeatColumns="1" RepeatDirection="Horizontal">
                                <asp:ListItem Value="Project Management" />
                                <asp:ListItem Value="Financial Analysis" />
                                <asp:ListItem Value="VBA Programming" />
                                <asp:ListItem Value="C# Asp.Net Websites" />
                                <asp:ListItem Value="Other" />
                            </asp:CheckBoxList>
                        </td>
                        <td >
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label13" runat="server" Text="Enter Comments and other information here:" AssociatedControlID="txtComments" /><br />
                            <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Width="400px" Height="100px" />
                        </td>
                        <td />
                    </tr>
                </table>
            </td>            
        </tr>
        <tr runat="server" id="formrow2">
            <td colspan="3" align="center">
                <asp:Button ID="submitButton" runat="server" Text="Submit" 
                  onclick="submitButton_Click" style="width: 61px" />
            </td>
        </tr>
        <tr runat="server" id="thanksmsg" visible="false">
            <td colspan="3" align="center">
                <h3>Thank You, I'll be in touch soon!</h3><br/>
            </td>
        </tr>
    </table>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/Goodday/App_Data/States.xml" />
<div id="map" style="left: 700px; top: -360px; width: 200px; height: 50px;"> 
    <script type="text/javascript">
      //<![CDATA[        
      var map;
      map = new GMap(document.getElementById("map"));
      map.centerAndZoom(new GPoint(-122.417, 48.667), 5);
      //]]>
    </script>
  </div>
                   
</asp:Content>
