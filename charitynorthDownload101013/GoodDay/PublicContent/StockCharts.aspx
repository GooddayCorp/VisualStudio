<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="stockcharts.aspx.cs" Inherits="sample._Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

  protected void Button1_Click(object sender, EventArgs e)
  {
    {
      string str = StockEngine.Execute(txtSymbol.Value).Value.ToString();
      if (str == "0")
      {
        quoteLabel.Text = "";
        realtimeQuoteLabel.Text = txtSymbol.Value.ToUpper() + " was not found.";
      }
      else
      {
        quoteLabel.Text = str;
        realtimeQuoteLabel.Text = DateTime.Now.ToString();
      }
    }
  }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
  <title>Stock quote and chart from Yahoo in C#</title>
  <link href="../../CSS/reset.css" rel="stylesheet" type="text/css" />
  <link href="../../css/style.css" rel="stylesheet" type="text/css" />
  <link href="../../css/popup.css" rel="stylesheet" type="text/css" />
  <link href="../../css/branding.css" rel="stylesheet" type="text/css" />  
  <link href="../../css/admin.css" rel="stylesheet" type="text/css" />
  <link href="../../css/ajax.css" rel="stylesheet" type="text/css" />
  <script src="../../js/sitesearch.js" type="text/javascript"></script>
  <script src="../../js/PopupFunctions.js" type="text/javascript"></script>
  <script src="../../js/FadeGrayoutPopup.js" type="text/javascript"></script> 
  <script type="text/javascript">
  // <!CDATA[
    function validate() {
      alert("Click on the Members Menu to see your tickets.");
    }
    function showLogin() {
      try {
        popupOn('login')
      }
      catch (e) {
        alert('Login failed, please try again.')
      }
    }
    function cancelButton_onmousedown() {
      popupOff('login');
      window.open(URL = "./Home.aspx", name = "_self", fullscreen = "yes", replace = false);
    }
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
  <script  type="text/javascript" language="JavaScript">
    /// <summary>
    /// This function will be called when user clicks the Get Quotes button.
    /// </summary>
    /// <returns>Always return false.</returns>
    function SendRequest() {
      var txtSymbol = document.getElementById("txtSymbol");
      // Refresh the page.
      window.location = "stockcharts.aspx?s=" + txtSymbol.value;
      return false;
    }

    /// <summary>
    /// The functyion will be called when a keyboard key is pressed in the textbox.
    /// </summary>
    /// <param name="e">Onkeypress event.</param>
    /// <returns>Return true if user presses Enter key; otherwise false.</returns>        
    function CheckEnter(e) {
      if ((e.keyCode && e.keyCode == 13) || (e.which && e.which == 13))
      // Enter is pressed in the textbox.
        return SendRequest();
      return true;
    }

    /// <summary>
    /// The function will be called when user changes the chart type to another type.
    /// </summary>
    /// <param name="type">Chart type.</param>
    /// <param name="num">Stock number.</param>
    /// <param name="symbol">Stock symobl.</param>
    function changeChart(type, num, symbol) {
      // All the DIVs are inside the main DIV and defined in the code-behind class.
      var div1d = document.getElementById("div1d_" + num);
      var div5d = document.getElementById("div5d_" + num);
      var div3m = document.getElementById("div3m_" + num);
      var div6m = document.getElementById("div6m_" + num);
      var div1y = document.getElementById("div1y_" + num);
      var div2y = document.getElementById("div2y_" + num);
      var div5y = document.getElementById("div5y_" + num);
      var divMax = document.getElementById("divMax_" + num);
      var divChart = document.getElementById("imgChart_" + num);
      // Set innerHTML property.
      div1d.innerHTML = "1d";
      div5d.innerHTML = "5d";
      div3m.innerHTML = "3m";
      div6m.innerHTML = "6m";
      div1y.innerHTML = "1y";
      div2y.innerHTML = "2y";
      div5y.innerHTML = "5y";
      divMax.innerHTML = "Max";
      // Use a random number to defeat cache.
      var rand_no = Math.random();
      rand_no = rand_no * 100000000;
      // Display the stock chart.
      switch (type) {
        case 1: // 5 days
          div5d.innerHTML = "<b>5d</b>";
          divChart.src = "http://ichart.finance.yahoo.com/z?p=m180,v&q=c&t=5d&z=l&a=r14&s=" + symbol + "&" + rand_no;
          break;
        case 2: // 3 months 
          div3m.innerHTML = "<b>3m</b>";
          divChart.src = "http://ichart.finance.yahoo.com/z?p=m20,m200,b,v&q=c&t=3m&z=l&a=r14,m26-12-9&s=" + symbol + "&" + rand_no;
          break;
        case 3: // 6 months 
          div6m.innerHTML = "<b>6m</b>";
          divChart.src = "http://ichart.finance.yahoo.com/z?p=m20,m200,b,v&q=c&t=6m&z=l&a=r14,m26-12-9&s=" + symbol + "&" + rand_no;
          break;
        case 4: // 1 year
          div1y.innerHTML = "<b>1y</b>";
          divChart.src = "http://ichart.finance.yahoo.com/z?p=m20,m200,b,v&q=c&t=1y&z=l&a=r14,m26-12-9&s=" + symbol + "&" + rand_no;
          break;
        case 5: // 2 years 
          div2y.innerHTML = "<b>2y</b>";
          divChart.src = "http://ichart.finance.yahoo.com/z?p=m20,m200,b,v&q=c&t=2y&z=l&a=r14,m26-12-9&s=" + symbol + "&" + rand_no;
          break;
        case 6: // 5 years
          div5y.innerHTML = "<b>5y</b>";
          divChart.src = "http://ichart.finance.yahoo.com/z?p=m200,v&q=c&t=5y&z=l&a=r14,m26-12-9&s=" + symbol + "&" + rand_no;
          break;
        case 7: // Max
          divMax.innerHTML = "<b>msx</b>";
          divChart.src = "http://ichart.finance.yahoo.com/z?p=v&q=c&t=my&z=l&s=" + symbol + "&" + rand_no;
          break;
        case 0: // 1 day
        default:
          div1d.innerHTML = "<b>1d</b>";
          divChart.src = "http://ichart.finance.yahoo.com/z?p=m60,v&q=c&t=1d&z=l&a=r14&s=" + symbol + "&" + rand_no;
          break;
      }
    }
  </script>    
</head>
<body class="gooddaycorp">
  <form id="ClientForm" method="get" 
    action="" 
    onsubmit="javascript:void(0); search(this); return false;" >
    <div id="div1"></div>
    <div id="div2"></div>	
    <table id="Table1" class="header">
      <tr class="toprow" >
          <td class="toprowleft">
          </td>
          <td class="toprowmiddle">
              
          </td>
          <td class="alignright">
          </td>
        </tr>
      <tr >
        <td class="imageheader">
        </td>
        <td class="banner">
          GoodDay Corp</td>
        <td >
        </td>
      </tr>      
  </table>  
</form> 
  <form id="form1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>  
    <div>     
      <table class="body">
        <tr class="nav2" valign="top">                                            
           <td >
              <input id="Button2" 
                type="button" 
                value="" 
                class="backbutton"
                onmousedown="javascript:history.go(-1)" />
              <asp:UpdatePanel ID="UpdatePanel2" runat="server" RenderMode="Inline">
                 <ContentTemplate>
                  <input type="text" value="YHOO" id="txtSymbol" runat="server" 
                    onkeypress="return CheckEnter(event);" />
                  <input id="inputButton" type="button" value="Chart" 
                    onclick="return SendRequest();" />  
                 </ContentTemplate>
              </asp:UpdatePanel>
              <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline">  
                <ContentTemplate>
                  <asp:Button ID="Button1" 
                  runat="server" onclick="Button1_Click" Text="Quote" />
                  <asp:Label ID="quoteLabel" runat="server"></asp:Label>&nbsp;
                  <asp:Label ID="realtimeQuoteLabel" runat="server"></asp:Label>
                </ContentTemplate>
              </asp:UpdatePanel>
            </td>
        </tr>
        </table>
      <p>
      </p>
      <table class="body">
        <tr class="title">
          <td class="imagebutton">
          <asp:HyperLink ID="linkhome" runat="server" 
            NavigateUrl="~/Default.aspx" 
            ToolTip="Resume Home">Home 
          </asp:HyperLink>
        </td>
          <td class="stocks">
          <asp:Label ID="Label1" runat="server">
            <script type="text/javascript">
              document.write(document.title);
            </script> </asp:Label>
        </td>
        </tr>
        <tr>
          <td class="gray">
            &nbsp;</td>
          <td class="stocks">            
            <%if (m_symbol != "") {%>                        
              <div id="divService" runat="server">
                <!-- Main DIV: this DIV contains contains text and DIVs that displays stock quotes and chart. -->
              </div>
            <%}%>  
          </td>
        </tr>
      </table>    
    </div>
  </form>
</body>
</html>
