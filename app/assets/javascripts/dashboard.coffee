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
      label: "Red"
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
    animation: true
    animationEasing: "easeOutQuart"
    showScale: true
    scaleOverride: false
    responsive: false
    maintainAspectRatio: true
    showTooltips: true

  if @context
    @pieChart = new Chart(@context).Pie(@data, @options)
