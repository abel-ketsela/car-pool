/**
 * RIDE PROVIDE JavaScript
 */

$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
	  e.target // newly activated tab
	//  e.relatedTarget // previous active tab
	  alert(e.target);
	})


var commentDiv;
let postSize;
var commentBlankDiv;

