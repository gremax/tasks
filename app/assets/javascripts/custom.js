$(document).ready(function() {
    setTimeout(hideFlashes, 1000);
});

var hideFlashes = function() {
  $(".notify").fadeOut(2000);
}