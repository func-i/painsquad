@FavoritesResource = @resourceModule.factory 'Favorites', ($http, $resource, CONFIG) ->

  $http.defaults.useXDomain = true
  $resource "#{CONFIG.apiUrl}/favorites", {}

@FavoritesResource.$inject = ['$http', '$resource', 'CONFIG']