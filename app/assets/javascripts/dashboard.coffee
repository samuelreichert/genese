$ ->
  element = $('#topCategoriesChart')

  if element.length > 0
    @context = element
      .get(0)
      .getContext("2d")

  @data = [
    {
      value: 300
      color:"#F7464A"
      highlight: "#FF5A5E"
      label: "Alimentação - R$300,00"
    },
    {
      value: 50
      color: "#46BFBD"
      highlight: "#5AD3D1"
      label: "Green"
    },
    {
      value: 100
      color: "#FDB45C"
      highlight: "#FFC870"
      label: "Yellow"
    }
  ]

  @options =
    segmentShowStroke : true
    segmentStrokeColor : "#fff"
    segmentStrokeWidth : 1
    animationSteps : 100
    animationEasing : "easeOutBounce"
    animateRotate : true
    animateScale : false
    legendTemplate : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<segments.length; i++){%><li><span style=\"background-color:<%=segments[i].fillColor%>\"></span><%if(segments[i].label){%><%=segments[i].label%><%}%></li><%}%></ul>"


  if @context
    @pieChart = new Chart(@context).Pie(@data, @options)
