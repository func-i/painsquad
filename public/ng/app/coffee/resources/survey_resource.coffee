@SurveyResource = @resourceModule.factory 'Survey', ($http, $resource, CONFIG) ->

  $http.defaults.useXDomain = true
  $resource "#{CONFIG.apiUrl}/surveys/:type", {},
    query:
      method: 'GET'
      isArray: false

@SurveyResource.$inject = ['$http', '$resource', 'CONFIG']