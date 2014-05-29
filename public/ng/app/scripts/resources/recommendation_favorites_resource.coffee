@RecommendationFavoritesResource = @resourceModule.factory 'RecommendationFavorites', ($http, $resource, CONFIG) ->

  $http.defaults.useXDomain = true
  $resource "#{CONFIG.apiUrl}/recommendation_favorites", {}

@RecommendationFavoritesResource.$inject = ['$http', '$resource', 'CONFIG']