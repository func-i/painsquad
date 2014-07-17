'use strict'

@SettingResource = @resourceModule.factory 'Setting', ($http, $resource, CONFIG) ->

  $http.defaults.useXDomain = true
  $resource "#{CONFIG.apiUrl}/settings/", {},
    query: { method: 'GET', isArray: false }


@SettingResource.$inject = [ '$http', '$resource', 'CONFIG' ]