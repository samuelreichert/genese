$ ->
  $('.repeat').on 'change', ->
    $('#entry_repeat_times').prop "disabled", !@.checked
    $('#entry_repeat_frequency').prop "disabled", !@.checked

  $('[data-toggle="tooltip"]').tooltip()
