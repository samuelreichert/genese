$ ->
  $('.repeat').on 'change', ->
    $('#entry_repeat_times').prop "disabled", !@.checked
    $('#entry_repeat_frequency').prop "disabled", !@.checked

  $('[data-toggle="tooltip"]').tooltip()

  $("#category").on 'change', (e)->
    $form = $(e.target).closest('form')
    $form.submit()
