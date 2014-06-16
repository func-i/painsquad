(function() {
  'use strict';
  this.UserResource = this.resourceModule.factory('User', function($http, $resource, CONFIG) {
    $http.defaults.useXDomain = true;
    return $resource("" + CONFIG.apiUrl + "/users/", {}, {
      query: {
        method: 'GET',
        isArray: false
      }
    });
  });

  this.UserResource.$inject = ['$http', '$resource', 'CONFIG'];

}).call(this);
