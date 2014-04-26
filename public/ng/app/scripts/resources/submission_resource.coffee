@resourceModule.factory 'SubmissionResource', ['$http', '$resource', 'CONFIG', ($http, $resource, CONFIG) ->

  $http.defaults.useXDomain = true
  $resource "#{CONFIG.apiUrl}/submissions", {}

]