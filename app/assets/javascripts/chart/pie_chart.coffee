class @PieChart
  constructor: (data, element) ->
    @data = @formatValue(data)
    # @data = [
    #   {value: 300, color:"#F7464A", highlight: "#FF5A5E", label: "Red"},
    #   {value: 50, color: "#46BFBD", highlight: "#5AD3D1", label: "Green"},
    #   {value: 100, color: "#FDB45C", highlight: "#FFC870", label: "Yellow"}
    # ]

    @options =
      egmentShowStroke : true
      segmentStrokeColor : "#fff"
      segmentStrokeWidth : 1
      animationSteps : 100
      animationEasing : "easeOutBounce"
      animateRotate : true
      animateScale : false
      maintainAspectRatio: true
      tooltipTemplate: "<%if (label){%><%=label%><%}%>"
      showTooltips: true
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

    console.log data
    data
