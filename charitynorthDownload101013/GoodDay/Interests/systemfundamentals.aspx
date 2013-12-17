<%@ Page Title="System Basics" Language="C#" MasterPageFile="~/Goodday/MasterPage.Master" %>

<script runat="server">

  protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>

<%--<script runat="server" src="~/script/permission.aspx.cs"></script>
--%>

<asp:Content ID="Content1" ContentPlaceHolderID="headercontent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" Runat="Server">
<div class="clink">
    <p><img class="picture" src="../Images/flamefractaSized205p.jpg" align="right" alt="Chaos visualized, a fractal patern." width="205" height="205"/></p>
    <p></p>
    <h4 class="heading" >Basic Principles.</h4>
    <p>
    There are a few basic principles 
    that individually and in combination make systems interesting: feedback, 
    chaos, energy minimization, energy conservation, energy conversion and energy 
    dissipation (<a href="systemexample.aspx?<%=Request.QueryString%>">as the example system</a> shows).</p>
    
    <ul>
      <li>
      Feedback (part of a process influencing an earlier part of the same 
      process)
      </li>
      <li>
      <a href="http://www.imho.com/grae/chaos/chaos.html">
      Chaos</a> (the system is sensitivity to initial conditions, not predicable with real 
      world precision)
      </li>
      <li>
      Energy Conservation (energy remains in the system, possibly converted, but not 
      destroyed or lost)
      </li>
      <li>
      Energy Minimization (the system flows down to lowest energy state)
      </li>
      <li>
      Energy Conversion (energy transformed from one type to another, such as a 
      ball picking up speed as it rolls down a hill, the conversion can lead to 
      heat that dissipates, not conserved in the system)
      </li>
      <li>
      Energy Dissipation (energy is not conserved, buy lost to the system by friction, 
      deformation and heat)
      </li>
    </ul>

    <p>The 
    interaction of the parts of a system can create amazing phenomenon. 
    Generally, the parts of a system feed each other, often feedback occurs. 
    Feedback is where the output of a process feeds back to an earlier stage 
    of the same process. This loop can cause unexpected and chaotic results. 
    </p>
    <p>
    Chaotic systems by definition are sensitive to the initial conditions. While 
    ideally deterministic, chaotic systems are predictable only when exact 
    information is available. In the real world, infinite precision is not 
    feasible; therefore, in the real world chaotic systems are not 
    predictable. This sensitivity to the starting point is the result of small 
    difference being reinforced often by feedback.</p>
    
    <img class="pictureleft" src="../Images/Havasu_Falls_1a_md.jpg" width="205" height="307" align="left" alt="Havasu Falls"/>Another basic principle of systems is the tendency toward energy minimization. A system whether chemical, gravitational or any conservative force will roll 
    along its energy surfaces following the path of least resistance.
    <a href="http://cmm.info.nih.gov/modeling/guide_documents/conformation_document.html">
    An energy surface resembles a mountain range, complete with peaks (energy 
    barriers), valleys (energy minima), and passes (saddle points).</a> The 
    result is a system flows down toward a low energy configuration. This 
    produces many of the most interesting phenomena in nature and technology.<p>The delicate balance of the basic forces of natures creates the Universe we 
    know. Understanding these principles is a great joy. Learning is what I 
    am all about.</p>
    
    <p>(<a href="interestsspecific.aspx?<%=Request.QueryString%>">more special 
    interests</a>)</p>

</div>


</asp:Content>

