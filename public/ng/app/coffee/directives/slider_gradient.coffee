'use strict'

@directiveModule.directive 'sliderGradient', ->
  restrict: 'A'
  scope:
    sliderGradient: '=sliderGradient'

  link: (scope, elem, attr) ->
    scope.$watch 'sliderGradient', (value) ->
      value ||= 50
      elem.css('width', "#{parseInt(value)}%")
