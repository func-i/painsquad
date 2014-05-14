'use strict'

@directiveModule.directive 'sliderGradient', ->
  restrict: 'A'
  link: (scope, elem, attr) ->
    scope.$watch 'question.choices[0].value', (value) ->
      elem.css('width', "#{parseInt(value)}%")

