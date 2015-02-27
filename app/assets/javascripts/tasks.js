jQuery.fn.submitOnCheck = function() {
  this.find('input[type=submit]').remove();
  this.find('input[type=checkbox]').click(function() {
    $(this).closest('form').submit();
  });
  return this;
}

$(function() {
  $('.edit_task').submitOnCheck();
});