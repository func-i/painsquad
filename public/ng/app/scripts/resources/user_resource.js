(function() {
  this.UserResource = this.resourceModule.factory('User', function($http, $resource, CONFIG) {
    $http.defaults.useXDomain = true;
    return $resource("" + CONFIG.apiUrl + "/user", {});
  });

  this.UserResource.$inject = ['$http', '$resource', 'CONFIG'];

}).call(this);
