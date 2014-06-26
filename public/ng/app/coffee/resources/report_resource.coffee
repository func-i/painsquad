'use strict'

@ReportResource = @resourceModule.factory 'Report', ($http, $resource, CONFIG) ->

  $http.defaults.useXDomain = true
  $resource "#{CONFIG.apiUrl}/reports/", {}

@ReportResource.$inject = [ '$http', '$resource', 'CONFIG' ]