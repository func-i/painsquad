'use strict'

@UserAgentService = @serviceModule.service 'UserAgentService', ($window) ->
    return ->
      userAgent = $window.navigator.userAgent
      browsers =
        chrome: /chrome/i
        safari: /safari/i
        firefox: /firefox/i
        ie: /internet explorer/i

      for key of browsers
        return key  if browsers[key].test(userAgent)
      "unknown"

@UserAgentService.$inject = [ '$window' ]
