jQuery.fn.submitOnCheck = function() {
  this.find('input[type=submit]').remove();
  this.find('input[type=checkbox]').click(function() {
    $(this).parents('form').submit();
  });
  return this;
};

$(function() {
  $('.edit_task').submitOnCheck();
});

$(function() {
  $('.incomplete_tasks').sortable({
    axis: 'y',
    handle: '.handle',
    update: function() {
      return $.post($(this).data('update-url'), $(this).sortable('serialize'));
    }
  });
});

$.datepicker.setDefaults(jQuery.extend(
    $.datepicker.regional['nl'],
    {
      dateFormat: 'yy-mm-dd',
      firstDay: 1
    }
));