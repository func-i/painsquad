@FavoritesResource = @resourceModule.factory 'Favorites', ($http, $resource, CONFIG) ->

  $http.defaults.useXDomain = true
  $resource "#{CONFIG.apiUrl}/favorites/:recommendation_id", {}

@FavoritesResource.$inject = ['$http', '$resource', 'CONFIG']