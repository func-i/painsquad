'use strict'

@ReportResource = @resourceModule.factory 'Report', ($http, $resource, CONFIG) ->

  $http.defaults.useXDomain = true
  $resource "#{CONFIG.apiUrl}/reports/:report_id", {},

@ReportResource.$inject = [ '$http', '$resource', 'CONFIG' ]