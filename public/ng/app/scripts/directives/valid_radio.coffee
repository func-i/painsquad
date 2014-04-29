'use strict'

@directiveModule.directive 'validRadio', ->
  link: (scope) ->
    scope.$watch 'currentForm.$dirty', (isDirty)  ->
      if isDirty
        scope.$emit 'currentForm:valid'
      else
        scope.$emit 'currentForm:invalid'
