'use strict'

@directiveModule.directive 'sliderDisplay', ->
  restrict: 'E'
  template: '<div class="wedge"><div class="top"></div><div class="bottom"></div></div>'

  link: (scope, elem, attr) ->
    console.log

