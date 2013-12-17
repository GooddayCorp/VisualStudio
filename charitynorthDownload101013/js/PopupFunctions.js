  // <!CDATA[
    var p;
    function popupOn(p) {
      fade(p, true);
      showPopup(p);
    }
    var p;
    function popupOff(p) {
      setTimeout("hidePopup(p)", 1000);
      fade(p, false);
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
    function popup(mylink, windowname) {
      if (!window.focus) return true;
      var href;
      if (typeof (mylink) == 'string')
        href = mylink;
      else
        href = mylink.href;
      window.open(href, windowname, 'resizable=1,width=600,height=300,scrollbars=yes');
      return false;
    }
// ]]>
