'use strict'

@SettingResource = @resourceModule.factory 'SettingResource', ($http, $resource, CONFIG) ->

  $http.defaults.useXDomain = true
  $resource "#{CONFIG.apiUrl}/settings/", {},
    query: { method: 'GET', isArray: false },
    update: { method: 'PUT' }

@SettingResource.$inject = [ '$http', '$resource', 'CONFIG' ]