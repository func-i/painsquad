'use strict'

# taken from https://github.com/crisbeto/angular-svg-round-progressbar/ for customization
@directiveModule.directive 'roundProgress', ($timeout) ->

    #credits to http://modernizr.com/ for the feature test
    unless !!document.createElementNS and !!document.createElementNS("http://www.w3.org/2000/svg", "svg").createSVGRect
      return (

        #placeholder element to keep the structure
        restrict: "EA"
        template: "<div class=\"round-progress\"></div>"
        replace: true
      )

    # shim layer with setTimeout fallback
    # credit Erik Möller and http://www.paulirish.com/2011/requestanimationframe-for-smart-animating/
    (->
      lastTime = 0
      vendors = [
        "webkit"
        "moz"
      ]
      x = 0

      while x < vendors.length and not window.requestAnimationFrame
        window.requestAnimationFrame = window[vendors[x] + "RequestAnimationFrame"]
        window.cancelAnimationFrame = window[vendors[x] + "CancelAnimationFrame"] or window[vendors[x] + "CancelRequestAnimationFrame"]
        ++x
      unless window.requestAnimationFrame
        window.requestAnimationFrame = (callback, element) ->
          currTime = new Date().getTime()
          timeToCall = Math.max(0, 16 - (currTime - lastTime))
          id = window.setTimeout(->
            callback currTime + timeToCall
          , timeToCall)
          lastTime = currTime + timeToCall
          id
      unless window.cancelAnimationFrame
        window.cancelAnimationFrame = (id) ->
          clearTimeout id
    )()
    polarToCartesian = (centerX, centerY, radius, angleInDegrees) ->
      angleInRadians = (angleInDegrees - 90) * Math.PI / 180.0
      x: centerX + (radius * Math.cos(angleInRadians))
      y: centerY + (radius * Math.sin(angleInRadians))

    updateState = (value, total, R, ring, size, isSemicircle) ->
      return unless size

      # credit to http://stackoverflow.com/questions/5736398/how-to-calculate-the-svg-path-for-an-arc-of-a-circle
      value = (if value >= total then total - 0.00001 else value)
      type = (if isSemicircle then 180 else 359.9999)
      perc = (value / total) * type
      x = size / 2
      start = polarToCartesian(x, x, R, perc) # in this case x and y are the same
      end = polarToCartesian(x, x, R, 0)

      # arcSweep = endAngle - startAngle <= 180 ? "0" : "1",
      arcSweep = ((if perc <= 180 then "0" else "1"))
      d = [
        "M"
        start.x
        start.y
        "A"
        R
        R
        0
        arcSweep
        0
        end.x
        end.y
      ].join(" ")
      ring.attr "d", d
      return

    easeOutCubic = (currentIteration, startValue, changeInValue, totalIterations) ->

      # credits to http://www.kirupa.com/forum/showthread.php?378287-Robert-Penner-s-Easing-Equations-in-Pure-JS-(no-jQuery)
      changeInValue * (Math.pow(currentIteration / totalIterations - 1, 3) + 1) + startValue

    return (
      restrict: "EA"
      scope:
        current: "="
        max: "="
        semi: "="
        radius: "@"
        color: "@"
        bgcolor: "@"
        stroke: "@"

      link: (scope, element, attrs) ->
        ring = element.find("path")
        background = element.find("circle")
        size = undefined
        resetValue = undefined
        renderCircle = ->
          $timeout ->
            isSemicircle = scope.semi
            radius = scope.radius
            stroke = scope.stroke
            size = radius * 2 + parseInt(stroke) * 2
            element.attr(
              width: size
              height: (if isSemicircle then size / 2 else size)
            ).css overflow: "hidden" # on some browsers the background overflows, if in semicircle mode
            ring.attr
              stroke: scope.color
              "stroke-width": stroke
              transform: (if isSemicircle then ("translate(" + 0 + "," + size + ") rotate(-90)") else "")

            background.attr
              cx: radius
              cy: radius
              transform: "translate(" + stroke + ", " + stroke + ")"
              r: radius
              stroke: scope.bgcolor
              "stroke-width": stroke

            renderState scope.current, scope.current

        renderState = (newValue, oldValue) ->
          return false  unless angular.isDefined(newValue)
          if newValue < 0
            resetValue = oldValue
            return scope.current = 0
          if newValue > scope.max
            resetValue = oldValue
            return scope.current = scope.max
          max = scope.max
          radius = scope.radius
          isSemicircle = scope.semi
          start = (if oldValue is newValue then 0 else (oldValue or 0)) # fixes the initial animation
          val = newValue - start
          currentIteration = 0
          totalIterations = 50
          if angular.isNumber(resetValue)

            # the reset value fixes problems with animation, caused when limiting the scope.current
            start = resetValue
            val = newValue - resetValue
            resetValue = null
          (animation = ->
            if currentIteration <= totalIterations
              updateState easeOutCubic(currentIteration, start, val, totalIterations), max, radius, ring, size, isSemicircle
              requestAnimationFrame animation
              currentIteration++
            return
          )()
          return

        scope.$on "renderCircle", renderCircle
        scope.$watch "current", renderState
        renderCircle()

      replace: true
      template: "<svg class=\"round-progress\" xmlns=\"http://www.w3.org/2000/svg\">                    <circle fill=\"none\"/>                    <path fill=\"none\" />                </svg>"
    )
