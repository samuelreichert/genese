$ ->
  $('.reminder_active').on 'change', ->
    $('.reminder_days_before').prop "disabled", !@.checked

  select2_options =
    theme: 'bootstrap'
    placeholder: 'Selecione os usuários'
    maximumSelectionLength: 7

  $('.select_users').select2 select2_options

  $('.js-account').click (e)->
    path = '/main_account.json'
    account_id = $(@).data('account-id')

    $.getJSON(path, { account_id: account_id })
      .done (data)->
        console.log data
