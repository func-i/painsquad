'use strict'

@UserResource = @resourceModule.factory 'User', ($http, $resource, CONFIG) ->

  $http.defaults.useXDomain = true
  $resource "#{CONFIG.apiUrl}/users/", {},
    query: { method: 'GET', isArray: false }

@UserResource.$inject = [ '$http', '$resource', 'CONFIG' ]