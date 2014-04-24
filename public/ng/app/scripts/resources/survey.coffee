@resourceModule.factory 'Survey', ['$http', '$resource', 'CONFIG', ($http, $resource, CONFIG) ->

  $http.defaults.useXDomain = true
  $resource "#{CONFIG.apiUrl}/surveys", {},
    query:
      method: 'GET'
      isArray: false
]