'use strict'

@SessionResource = @resourceModule.factory 'Session', ($http, $resource, CONFIG) ->

  $http.defaults.useXDomain = true
  $resource "#{CONFIG.apiUrl}/session/", {}

@SessionResource.$inject = [ '$http', '$resource', 'CONFIG' ]