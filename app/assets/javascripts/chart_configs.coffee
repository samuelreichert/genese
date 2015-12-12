$ ->
  Chart.defaults.global =
    # Boolean - Whether to animate the chart
    animation: true

    # String - Animation easing effect
    # Possible effects are:
    # [easeInOutQuart, linear, easeOutBounce, easeInBack, easeInOutQuad,
    # easeOutQuart, easeOutQuad, easeInOutBounce, easeOutSine, easeInOutCubic,
    # easeInExpo, easeInOutBack, easeInCirc, easeInOutElastic, easeOutBack,
    # easeInQuad, easeInOutExpo, easeInQuart, easeOutQuint, easeInOutCirc,
    # easeInSine, easeOutExpo, easeOutCirc, easeOutCubic, easeInQuint,
    # easeInElastic, easeInOutSine, easeInOutQuint, easeInBounce,
    # easeOutElastic, easeInCubic]
    animationEasing: "easeInBounce"

    # Boolean - If we should show the scale at all
    showScale: true

    # Boolean - If we want to override with a hard coded scale
    scaleOverride: false

    # Boolean - whether or not the chart should be responsive and resize when the browser does.
    responsive: false

    # Boolean - whether to maintain the starting aspect ratio or not when responsive, if set to false, will take up entire container
    maintainAspectRatio: true

    # Boolean - Determines whether to draw tooltips on the canvas or not
    showTooltips: true
