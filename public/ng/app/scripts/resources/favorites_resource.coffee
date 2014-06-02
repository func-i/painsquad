@FavoritesResource = @resourceModule.factory 'Favorites', ($http, $resource, CONFIG) ->

  $http.defaults.useXDomain = true
  $resource "#{CONFIG.apiUrl}/favorites/:recommendation_id", {},
    query: { method: 'GET', isArray: false }

@FavoritesResource.$inject = ['$http', '$resource', 'CONFIG']