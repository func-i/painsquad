(function() {
  this.RecommendationResource = this.resourceModule.factory('Recommendation', function($http, $resource, CONFIG) {
    $http.defaults.useXDomain = true;
    return $resource("" + CONFIG.apiUrl + "/recommendations", {}, {
      query: {
        method: 'GET',
        isArray: false
      }
    });
  });

  this.RecommendationResource.$inject = ['$http', '$resource', 'CONFIG'];

}).call(this);
