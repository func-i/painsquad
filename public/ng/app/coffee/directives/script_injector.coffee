'use strict'

@directiveModule.directive 'scriptInjector', ->
  updateScripts = (element) ->
    (scripts) ->
      element.empty()
      angular.forEach scripts, (source, key) ->
        console.log source, key
        # scriptTag = angular.element(document.createElement("script"))
        # source = "//@ sourceURL=" + key + "\n" + source
        # scriptTag.text(source)
        # element.append(scriptTag)

  restrict: "EA"
  scope:
    scripts: "="

  link: (scope, element) ->
    scope.$watch "scripts", updateScripts(element)
