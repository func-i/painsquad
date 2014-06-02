@FavoritesResource = @resourceModule.factory 'Favorites', ($http, $resource, CONFIG) ->

  $http.defaults.useXDomain = true
  $resource "#{CONFIG.apiUrl}/favorites/:recommendation_id", {}
  # $resource "#{CONFIG.apiUrl}/favorites/:id", {Id: '@id'}

@FavoritesResource.$inject = ['$http', '$resource', 'CONFIG']