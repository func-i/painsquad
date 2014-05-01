'use strict'

@directiveModule.directive 'validBooleanForm', ->
  link: (scope) ->
    scope.$watch 'currentForm.$valid', (isValid)  ->
      if isValid
        scope.$emit 'currentForm:valid'
      else
        scope.$emit 'currentForm:invalid'
