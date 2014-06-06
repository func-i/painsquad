@SurveyResource = @resourceModule.factory 'Survey', ($http, $resource, CONFIG) ->

  $http.defaults.useXDomain = true
  $resource "#{CONFIG.apiUrl}/surveys", {},
    query:
      method: 'GET'
      isArray: false

@SurveyResource.$inject = ['$http', '$resource', 'CONFIG']