(function() {
  this.AdviceResource = this.resourceModule.factory('Advice', function($http, $resource, CONFIG) {
    $http.defaults.useXDomain = true;
    return $resource("" + CONFIG.apiUrl + "/advices", {}, {
      query: {
        method: 'GET',
        isArray: false
      }
    });
  });

  this.AdviceResource.$inject = ['$http', '$resource', 'CONFIG'];

}).call(this);
