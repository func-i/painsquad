(function() {
  this.ActivityResource = this.resourceModule.factory('Activity', function($http, $resource, CONFIG) {
    $http.defaults.useXDomain = true;
    return $resource("" + CONFIG.apiUrl + "/activity", {});
  });

  this.ActivityResource.$inject = ['$http', '$resource', 'CONFIG'];

}).call(this);
