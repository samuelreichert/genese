class @PieChart
  constructor: (data, element) ->
    @data = @formatValue(data)

    @options =
      segmentShowStroke: false
      animationSteps: 100
      animationEasing: "easeOutBounce"
      animateRotate: true
      animateScale: false
      maintainAspectRatio: true
      tooltipTemplate: "<%if (label){%><%=label%><%}%>"
      showTooltips: true
      tooltipFillColor: "rgba(0,0,0,0.7)"
      tooltipFontColor: "#fff"
      tooltipCaretSize: 0
      tooltipCornerRadius: 2
      tooltipYPadding: 12
      tooltipXPadding: 8
      responsive: true

    if element.length > 0
      @context = element
        .get(0)
        .getContext("2d")

  render: ->
    if @context
      @pieChart = new Chart(@context).Pie(@data, @options)

  formatValue: (data) ->
    for category in data
      category.value = parseFloat(category.value)
    data
