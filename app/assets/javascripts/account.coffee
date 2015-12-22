$ ->
  $('.reminder_active').on 'change', ->
    $('.reminder_days_before').prop "disabled", !@.checked

  select2_options =
    theme: 'bootstrap'
    placeholder: 'Selecione os usuários'
    maximumSelectionLength: 8

  $('.select_users').select2 select2_options
