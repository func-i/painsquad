@RecommendationResource = @resourceModule.factory 'Recommendation', ($http, $resource, CONFIG) ->

  $http.defaults.useXDomain = true
  $resource "#{CONFIG.apiUrl}/recommendations/", {},
    query:
      method: 'GET'
      isArray: false

@RecommendationResource.$inject = ['$http', '$resource', 'CONFIG']
