(function() {
  this.SurveyResource = this.resourceModule.factory('Survey', function($http, $resource, CONFIG) {
    $http.defaults.useXDomain = true;
    return $resource("" + CONFIG.apiUrl + "/surveys/:type", {}, {
      query: {
        method: 'GET',
        isArray: false
      }
    });
  });

  this.SurveyResource.$inject = ['$http', '$resource', 'CONFIG'];

}).call(this);
