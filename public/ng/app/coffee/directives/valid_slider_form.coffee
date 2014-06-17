'use strict'

@directiveModule.directive 'validSliderForm', ->
  link: (scope) ->
    scope.$watch 'currentForm', (form)  ->
      scope.$emit 'currentForm:valid'
