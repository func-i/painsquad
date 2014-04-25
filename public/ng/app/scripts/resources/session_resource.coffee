@resourceModule.factory 'Session', ['$http', '$resource', 'CONFIG', ($http, $resource, CONFIG) ->

  $http.defaults.useXDomain = true
  $resource "#{CONFIG.apiUrl}/session"

]