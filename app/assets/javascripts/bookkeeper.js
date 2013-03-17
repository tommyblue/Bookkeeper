//= require_tree './bookkeeper'

$(document).ready(function(){
  $('a[data-toggle=tooltip]').tooltip();

  $('input.datepicker').datepicker({ weekStart: 1 });

  $('form .add-on.calendar').click(function(){
    var el = this.parentNode;
    $(el).find('input').focus();
  });
})
