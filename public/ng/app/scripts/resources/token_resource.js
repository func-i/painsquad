(function() {
  'use strict';
  this.TokenResource = this.resourceModule.factory('TokenResource', function($http, $resource, CONFIG) {
    $http.defaults.useXDomain = true;
    return $resource(CONFIG.apiUrl + "/device_token/", {}, {
      update: {
        method: 'put',
        isArray: false
      }
    });
  });

  this.TokenResource.$inject = ['$http', '$resource', 'CONFIG'];

}).call(this);
