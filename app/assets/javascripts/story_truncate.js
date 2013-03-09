var len = 300;
var p = document.getElementById('_story');
if (p) {

  var trunc = p.innerHTML;
  if (trunc.length > len) {

    trunc = trunc.substring(0, len);

    /* Add an ellipses to the end and make it a link that expands
       the paragraph back to its original size */
    trunc += '<a href="#" ' +
      'onclick="this.parentNode.innerHTML=' +
      'unescape(\''+escape(p.innerHTML)+'\');return false;">' +
      '...<\/a>';
    p.innerHTML = trunc;
  }
}