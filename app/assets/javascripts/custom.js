$(document).ready(function() {
  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();
});

$(document).ready(function() {
    setTimeout(hideFlashes, 1000);
});

var hideFlashes = function() {
  $(".notify").fadeOut(2000);
}