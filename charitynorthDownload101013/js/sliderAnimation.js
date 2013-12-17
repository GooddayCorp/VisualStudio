function slideSearch(elementId, headerElement) {
	var element = document.getElementById(elementId);

	//     	if (element.up == null || element.down == true) {
	if (element.up == null || element.down == true) {
		animate(
          elementID = elementId,
          newLeft =0,
          newTop = 260,
          newWidth = 254,
          newHeight = 340,
          time = 500,
          callback = null);
		element.up = true;
		element.down = false;
		headerElement.innerHTML = '&lt;&lt;<br />&nbsp;<br />' +
        'S<br />e<br />a<br />r<br />c<br />h';
	}
	else {
		animate(
          elementID = elementId,
          newLeft = 0,
          newTop = 260,
          newWidth = 254,
          newHeight = 340,
          time = 500,
          callback = null);
		element.up = false;
		element.down = true;
		headerElement.innerHTML = '&gt;&gt;<br />&nbsp;<br />' +
        'S<br />e<br />a<br />r<br />c<br />h';
	}
}
function slideCalendar(elementId, headerElement) {
	var element = document.getElementById(elementId);

	//     	if (element.up == null || element.down == true) {
	if (element.up == null || element.down == true) {
		animate(
          elementID = elementId,
          newLeft = 233,
          newTop = 260,
          newWidth = 254,
          newHeight = 340,
          time = 500,
          callback = null);
		element.up = true;
		element.down = false;
		headerElement.innerHTML = '&lt;&lt;<br />&nbsp;<br />' +
        'S<br />c<br />h<br />e<br />d<br />u<br />l<br />e<br />r';
	}
	else {
		animate(
          elementID = elementId,
          newLeft = 0,
          newTop = 260,
          newWidth = 254,
          newHeight = 340,
          time = 500,
          callback = null);
		element.up = false;
		element.down = true;
		headerElement.innerHTML = '&gt;&gt;<br />&nbsp;<br />' +
        'S<br />c<br />h<br />e<br />d<br />u<br />l<br />e<br />r';
	}
}