<%@ Page Title="Specific Interests" Language="C#" MasterPageFile="~/Goodday/MasterPage.Master" %>

<%--<script runat="server" src="~/script/permission.aspx.cs"></script>--%>

<%@ Register TagPrefix="MY" TagName="socialsciencefavoritespopup" src="~/Goodday/Favorites/socialsciencefavorites.ascx" %>

<script runat="server">

  protected void Page_Load(object sender, EventArgs e)
    {

    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="headercontent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" Runat="Server">
    <div id="socialsciencefavorites" class="popup" style="left:100px">
      <div class="popupbody">
        <my:socialsciencefavoritespopup runat="server" id="socialsciencefavoritespopup"/>       
        <input 
            type="button"
            class="buttonpopup"
            value="Close"
            onload="popupOn('socialsciencefavorites')" 
            onclick="toggle('socialsciencefavorites')" />
      </div>
    </div>

    <div class="clinks">
    <img  src="../Images/EagleNebulla.jpg" align="right" width="205" height="414" alt="Eagle Nebula- a dust cloud, where stars are born." />
      
    <p></p>
    <h4 class="heading">Interests.</h4>
      <p>The world is full of interesting things. There is not enough time to 
      learn about them all. However, as a life long learner, I make learning about 
      this Universe part of my daily life. The following is a list of some of the 
      areas that I have been&nbsp;fortunate enough to make an acquaintance 
      with: fitness, science, technology, social issues, spirituality, creativity, 
      financial management and a few vices (Let's me be honest, few humans are 
      without carnal indulgences.)</p>
      <p>Fitness: healthy living, <a href="http://www.calorierestriction.org/">
      calorie restriction</a>, 
      <a href="http://www.lef.org/magazine/mag95/fitness.htm">endurance fitness</a>, 
      trail running, mountain biking, whitewater kayaking, weight training, snowboarding, 
      boardsailing, swimming, free-diving, most outdoor activities, especial those involving water</p>
      <p>
Science: empirical method, potential energy, balance of forces,
<a href="http://en.wikipedia.org/wiki/System">systems</a>,
<a href="http://helios.gsfc.nasa.gov/nucleo.html">nucleo-synthesis</a>, 
cosmology, chemistry, <a href="http://pespmc1.vub.ac.be/SELFORG.html">
self-organization</a>, chaos, interfaces, boundaries, human physiology, 
longevity, 
superconductivity, <a href="http://ws5.com/spacetime/">structure of space/time 
continuum</a>, defects in materials, pinning, color, diffusion, 
entropy, <a href="http://en.wikipedia.org/wiki/Many-worlds_interpretation">many 
worlds interpretation</a>, quantum physics</p>
      <p>
Technology: portable power, <a href="http://www.batteryuniversity.com/">batteries</a>, 
<a href="http://www.howstuffworks.com/fuel-cell.htm">fuel cells</a>, gene therapy, electronics, 
communication, computer hardware, software,
<a href="http://en.wikipedia.org/wiki/Wetware">wetware</a> (electronic 
interfaces with the brain), trans-humanism</p>    
     <a >  
      <input 
        id="socialsciencefavoritesButton" 
        type="button" 
        value="Social Science:"
        class="socialsciencebutton"
        onmousedown="toggle('socialsciencefavorites')" 
       />
     </a>
caring, discrimination, stigma, bias, human rights, social conformity, politically correct, herd mentality, individualism, lone wolf, creativity, punishment, penal system, justice, judging others, accepting others, overcoming prejudice, personality conflicts, therapeutic communication, empathy, fiduciary responsibility, language
      <p>
Spirituality: purpose of existence/life, goodness, caring, self-control, happiness, 
feeling good, being good, humanism, 
<a href="http://en.wikipedia.org/wiki/Epicureanism">Epicureanism</a>, freethinking, extropy, 
empiricisms,
<a href="http://plato.stanford.edu/entries/rationalism-empiricism/">rationalism</a>, 
freewill, consciousness, judgment, wisdom, can a person change, body vs. 
mind (carnal impulses vs. freewill), happiness, minimalism</p>
      <p>
Creativity: fiction, music, painting, reading, language, imagination, psuedo-science, alternatives, 
scientific exploration</p>
      <p>
Financial Management: financial accounting, profitability, productivity, stock 
trading, currency trading</p>
      <p>
<img  src="../Images/smoke_cropped360.jpg" alt="Smoke, the purpose of life?" width="205" height="182" align="left" />Vices: dark beer, 
<a href="http://en.wikipedia.org/wiki/Texas_hold_'em">No Limit Texas Hold'em</a>, irritability, 
judgementality</p>
      <p>

      <br />
      </p>
</div>

</asp:Content>

