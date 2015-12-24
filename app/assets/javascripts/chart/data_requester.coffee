class @DataRequester
  constructor: (path) ->
    @path = path
    @categories = null

  request: ->
    $.getJSON @path, (data) =>
      debugger
      @categories = data

      @format()

  format: ->
    data = []

    for expense in @categories
      object =
        value: expense.value
        color: "#46BFBD"
        highlight: "#5AD3D1"
        label: "Green"
      console.log expense
