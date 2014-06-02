'use strict'

@directiveModule.directive 'validModalForm', ->
  link: (scope, elem, attr) ->
    scope.$watch 'currentForm.$valid', (isValid)  ->
      if isValid
        scope.$emit 'detailModal:valid'
      else
        scope.$emit 'detailModal:invalid'
