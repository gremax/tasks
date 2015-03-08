$(function() {
  $('#all_projects').sortable({
    axis: 'y',
    handle: '.handle',
    update: function() {
      return $.post($(this).data('update-url'), $(this).sortable('serialize'));
    }
  });
});