# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  group = $( ".sortable" ).sortable({
    placeholder: '<li class="list-group-item">&nbsp;</li>',
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

  $("#new_task").on("ajax:success", (event) ->
    [data, status, xhr] = event.detail
    item = $.parseJSON(xhr.responseText)
    console.log(item)
    $('ul.tasks').prepend(item.html)
    $('#task_title').val('')
  ).on "ajax:error", (event) ->
    console.log('ERROR')
