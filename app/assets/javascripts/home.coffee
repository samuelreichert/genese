$ ->
  toggleChevron = (e) ->
    $(e.target)
      .prev('.panel-heading')
      .find("i.indicator")
      .toggleClass('fa-chevron-down fa-chevron-right')

  $accordion = $('#accordion')
  $accordion.on('hidden.bs.collapse', toggleChevron);
  $accordion.on('shown.bs.collapse', toggleChevron);


