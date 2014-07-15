(function() {
  'use strict';
  this.directiveModule.directive('roundProgress', function($timeout) {
    var easeOutCubic, polarToCartesian, updateState;
    if (!(!!document.createElementNS && !!document.createElementNS("http://www.w3.org/2000/svg", "svg").createSVGRect)) {
      return {
        restrict: "EA",
        template: "<div class=\"round-progress\"></div>",
        replace: true
      };
    }
    (function() {
      var lastTime, vendors, x;
      lastTime = 0;
      vendors = ["webkit", "moz"];
      x = 0;
      while (x < vendors.length && !window.requestAnimationFrame) {
        window.requestAnimationFrame = window[vendors[x] + "RequestAnimationFrame"];
        window.cancelAnimationFrame = window[vendors[x] + "CancelAnimationFrame"] || window[vendors[x] + "CancelRequestAnimationFrame"];
        ++x;
      }
      if (!window.requestAnimationFrame) {
        window.requestAnimationFrame = function(callback, element) {
          var currTime, id, timeToCall;
          currTime = new Date().getTime();
          timeToCall = Math.max(0, 16 - (currTime - lastTime));
          id = window.setTimeout(function() {
            return callback(currTime + timeToCall);
          }, timeToCall);
          lastTime = currTime + timeToCall;
          return id;
        };
      }
      if (!window.cancelAnimationFrame) {
        return window.cancelAnimationFrame = function(id) {
          return clearTimeout(id);
        };
      }
    })();
    polarToCartesian = function(centerX, centerY, radius, angleInDegrees) {
      var angleInRadians;
      angleInRadians = (angleInDegrees - 90) * Math.PI / 180.0;
      return {
        x: centerX + (radius * Math.cos(angleInRadians)),
        y: centerY + (radius * Math.sin(angleInRadians))
      };
    };
    updateState = function(value, total, R, ring, size, isSemicircle) {
      var arcSweep, d, end, perc, start, type, x;
      if (!size) {
        return;
      }
      value = (value >= total ? total - 0.00001 : value);
      type = (isSemicircle ? 180 : 359.9999);
      perc = (value / total) * type;
      x = size / 2;
      start = polarToCartesian(x, x, R, perc);
      end = polarToCartesian(x, x, R, 0);
      arcSweep = (perc <= 180 ? "0" : "1");
      d = ["M", start.x, start.y, "A", R, R, 0, arcSweep, 0, end.x, end.y].join(" ");
      ring.attr("d", d);
    };
    easeOutCubic = function(currentIteration, startValue, changeInValue, totalIterations) {
      return changeInValue * (Math.pow(currentIteration / totalIterations - 1, 3) + 1) + startValue;
    };
    return {
      restrict: "EA",
      scope: {
        current: "=",
        max: "=",
        semi: "=",
        radius: "@",
        color: "@",
        bgcolor: "@",
        stroke: "@"
      },
      link: function(scope, element, attrs) {
        var background, renderCircle, renderState, resetValue, ring, size;
        ring = element.find("path");
        background = element.find("circle");
        size = void 0;
        resetValue = void 0;
        renderCircle = function() {
          return $timeout(function() {
            var isSemicircle, radius, stroke;
            isSemicircle = scope.semi;
            radius = scope.radius;
            stroke = scope.stroke;
            size = radius * 2 + parseInt(stroke) * 2;
            element.attr({
              width: size,
              height: (isSemicircle ? size / 2 : size)
            }).css({
              overflow: "hidden"
            });
            ring.attr({
              stroke: scope.color,
              "stroke-width": stroke,
              transform: (isSemicircle ? "translate(" + 0 + "," + size + ") rotate(-90)" : "")
            });
            background.attr({
              cx: radius,
              cy: radius,
              transform: "translate(" + stroke + ", " + stroke + ")",
              r: radius,
              stroke: scope.bgcolor,
              "stroke-width": stroke
            });
            return renderState(scope.current, scope.current);
          });
        };
        renderState = function(newValue, oldValue) {
          var animation, currentIteration, isSemicircle, max, radius, start, totalIterations, val;
          if (!angular.isDefined(newValue)) {
            return false;
          }
          if (newValue < 0) {
            resetValue = oldValue;
            return scope.current = 0;
          }
          if (newValue > scope.max) {
            resetValue = oldValue;
            return scope.current = scope.max;
          }
          max = scope.max;
          radius = scope.radius;
          isSemicircle = scope.semi;
          start = (oldValue === newValue ? 0 : oldValue || 0);
          val = newValue - start;
          currentIteration = 0;
          totalIterations = 50;
          if (angular.isNumber(resetValue)) {
            start = resetValue;
            val = newValue - resetValue;
            resetValue = null;
          }
          (animation = function() {
            if (currentIteration <= totalIterations) {
              updateState(easeOutCubic(currentIteration, start, val, totalIterations), max, radius, ring, size, isSemicircle);
              requestAnimationFrame(animation);
              currentIteration++;
            }
          })();
        };
        scope.$on("renderCircle", renderCircle);
        scope.$watch("current", renderState);
        return renderCircle();
      },
      replace: true,
      template: "<svg class=\"round-progress\" xmlns=\"http://www.w3.org/2000/svg\">                    <circle fill=\"none\"/>                    <path fill=\"none\" />                </svg>"
    };
  });

}).call(this);
