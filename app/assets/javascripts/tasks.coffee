$( document ).on('turbolinks:load', ->
  $( '.sortable' ).sortable()
  $( '.sortable' ).disableSelection()

  $( '.task' ).on('mouseenter mouseleave', ->
    $( this ).find('.lurk').toggle()
  )
)
