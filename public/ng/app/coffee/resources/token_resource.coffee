'use strict'

@TokenResource = @resourceModule.factory 'TokenResource', ($http, $resource, CONFIG) ->

  $http.defaults.useXDomain = true
  $resource "#{CONFIG.apiUrl}/device_token/", {},
    update: { method: 'put', isArray: false }

@TokenResource.$inject = [ '$http', '$resource', 'CONFIG' ]