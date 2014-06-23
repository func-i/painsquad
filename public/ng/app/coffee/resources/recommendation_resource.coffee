@RecommendationResource = @resourceModule.factory 'Recommendation', ($http, $resource, CONFIG) ->

  $http.defaults.useXDomain = true
  $resource "#{CONFIG.apiUrl}/recommendations", {},
    query:
      method: 'GET'
      isArray: true

@RecommendationResource.$inject = ['$http', '$resource', 'CONFIG']
