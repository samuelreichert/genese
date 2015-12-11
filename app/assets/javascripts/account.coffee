$ ->
  $('.reminder_active').on 'change', ->
    $('.reminder_days_before').prop "disabled", !@.checked
