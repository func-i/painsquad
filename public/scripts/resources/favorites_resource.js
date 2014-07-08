(function() {
  this.FavoritesResource = this.resourceModule.factory('Favorites', function($http, $resource, CONFIG) {
    $http.defaults.useXDomain = true;
    return $resource("" + CONFIG.apiUrl + "/favorites/:recommendation_id", {}, {
      query: {
        method: 'GET',
        isArray: false
      }
    });
  });

  this.FavoritesResource.$inject = ['$http', '$resource', 'CONFIG'];

}).call(this);
