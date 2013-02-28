//= require_tree './bookkeeper'

$(document).ready(function(){
  $('a[data-toggle=tooltip]').tooltip();

  $('input.datepicker').datepicker({ yearRange: "1920:2020", changeMonth: true, changeYear: true });

  $('form .add-on.calendar').click(function(){
    var el = this.parentNode;
    $(el).find('input').focus();
  });
})
