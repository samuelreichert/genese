class @BarChart
  constructor: (data, element) ->
    @data = @formatBarData(data)
    # @data =
    #   labels: ["January", "February", "March", "April", "May", "June", "July"]
    #   datasets: [
    #     {
    #       label: "My First dataset"
    #       fillColor: "rgba(220,220,220,0.5)"
    #       strokeColor: "rgba(220,220,220,0.8)"
    #       highlightFill: "rgba(220,220,220,0.75)"
    #       highlightStroke: "rgba(220,220,220,1)"
    #       data: [65, 59, 80, 81, 56, 55, 40]
    #     },
    #     {
    #       label: "My Second dataset"
    #       fillColor: "rgba(151,187,205,0.5)"
    #       strokeColor: "rgba(151,187,205,0.8)"
    #       highlightFill: "rgba(151,187,205,0.75)"
    #       highlightStroke: "rgba(151,187,205,1)"
    #       data: [28, 48, 40, 19, 86, 27, 90]
    #     }
    #   ]

    @options =
      scaleBeginAtZero : true
      scaleShowGridLines : false
      scaleShowHorizontalLines: false
      scaleShowVerticalLines: false
      barShowStroke : false
      barValueSpacing : 5
      barDatasetSpacing : 1
      legendTemplate : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].fillColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"
      segmentShowStroke : false
      responsive: true

    if element.length > 0
      @context = element
        .get(0)
        .getContext("2d")

  render: ->
    if @context
      @barChart = new Chart(@context).Bar(@data, @options)

  formatBarData: (data) ->
    for dataset, i in data.datasets
      for value, j in dataset.data
        dataset.data[j] = parseFloat(value)
    data
