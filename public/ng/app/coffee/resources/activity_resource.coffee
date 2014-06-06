@ActivityResource = @resourceModule.factory 'Activity', ($http, $resource, CONFIG) ->

  $http.defaults.useXDomain = true
  $resource "#{CONFIG.apiUrl}/activity", {}

@ActivityResource.$inject = ['$http', '$resource', 'CONFIG']