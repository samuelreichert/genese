class @BarChart
  constructor: (data, element) ->
    @data = @formatBarData(data)

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
