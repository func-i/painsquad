@SurveyResultsResource = @resourceModule.factory 'SurveyResults', ($http, $resource, CONFIG) ->

  $http.defaults.useXDomain = true
  $resource "#{CONFIG.apiUrl}/survey_results", {},
    query:
      method: 'GET'
      isArray: false

@SurveyResultsResource.$inject = ['$http', '$resource', 'CONFIG']