'use strict'

@directiveModule.directive 'scriptInjector', ->
  restrict: "E"
  scope:
    src: "="
  template: '<script src="{{src}}"></script>'