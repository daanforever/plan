//= require rails-ujs
//= require activestorage
# //= require jquery
# require bootstrap.min */
//= require bootstrap
//= require cable
//= require fie
//= require jquery/sortable

ready = ->
  $( ".sortable" ).sortable({
    # group: '.list-group-item'
    # tolerance: 'pointer',
    # revert: 'invalid',
    # placeholder: 'tile',
    placeholder: '<li class="list-group-item">&nbsp;</li>',
    # forceHelperSize: true
  });

$(document).ready(ready)
$(document).on('page:load', ready)
