# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
start = ->
  group = $( ".sortable" ).sortable({
    containerSelector: 'table',
    itemPath: '> tbody',
    itemSelector: 'tr',
    placeholder: '<tr class="placeholder"><td>&gt;</td><td></td></tr>',

    onDrop: ($item, container, _super) ->
      data = group.sortable("serialize").get()
      jsonString = JSON.stringify(data[0])
      # console.log(jsonString)
      formData = new FormData();
      formData.append("order", jsonString);
      Rails.ajax({
        url: "/tasks.json",
        type: "PATCH",
        # headers: {
        #   'Content-Type': 'application/json',
        #   'X-CSRF-Token': Rails.csrfToken()
        # },
        dataType: 'json',
        data: formData,
        success: (data) ->
          return
        , error: (data) ->
          return
      })
      _super($item, container)
  });

  $('#new_task').on('ajax:success', (event) ->
    [data, status, xhr] = event.detail
    item = $.parseJSON(xhr.responseText)
    $('ul.tasks').prepend(item.html)
    $('#task_title').val('')
  ).on "ajax:error", '#new_task', (event) ->
    console.log('ERROR: create task')

  $('a.btn-done').on('ajax:success', (event) ->
    $(this).parents('tr').remove()
  ).on "ajax:error", 'a.btn-done', (event) ->
    console.log('ERROR: mark done')

  $('a.btn-restore').on('ajax:success', (event) ->
    $(this).parents('tr').remove()
  ).on "ajax:error", (event) ->
    console.log('ERROR: restore task')

$(document).on('turbolinks:load', ->
  start()
)
